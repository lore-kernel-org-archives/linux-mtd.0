Received: from mail-pa0-x229.google.com ([2607:f8b0:400e:c03::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZzZA9-0007ce-B4
 for linux-mtd@lists.infradead.org; Fri, 20 Nov 2015 00:02:50 +0000
Received: by pacdm15 with SMTP id dm15so96489736pac.3
 for <linux-mtd@lists.infradead.org>; Thu, 19 Nov 2015 16:02:28 -0800 (PST)
Date: Thu, 19 Nov 2015 16:02:26 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, linux-mtd@lists.infradead.org,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 hramrach@gmail.com, martin@sperl.org
Subject: Re: RfC: Handle SPI controller limitations like maximum message length
Message-ID: <20151120000226.GP64635@google.com>
References: <564CEB61.2000601@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <564CEB61.2000601@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Nov 18, 2015 at 10:19:29PM +0100, Heiner Kallweit wrote:
> There have been few discussions in the past about how to handle SPI controller
> limitations like max message length. However they don't seem to have resulted
> in accepted patches yet.
> I also stumbled across this topic because I own a device using Freescale's
> ESPI which has a 64K message size limitation.
> 
> At least one agreed fact is that silently assembling chunks in protocol
> drivers is not the preferred approach.

Hmm, are you referring to this sort of approach [1], where the
spi_message::acutal_length informs the spi_nor layer that the transfer
was truncated?

[1] [PATCH v4 7/7] mtd: spi-nor: add read loop
    http://lists.infradead.org/pipermail/linux-mtd/2015-August/061062.html

> Maybe a better approach would be to introduce a new member of spi_master
> dealing with controller limitations.
> My issue is just the message size limitation but most likely there are more
> and different limitations in other controllers.
> 
> I'd introduce a struct spi_controller_restrictions and add a member to spi_master
> pointing to such a struct. Then a controller driver could do something like this:
> 
> static const struct spi_controller_restrictions fsl_espi_restrictions = {
> 	.max_msg_size	= 0xffff,
> };
> 
> master->restrictions = &fsl_espi_restrictions;

OK, so I think Mark suggested we not move to a 'restrictions' struct,
but otherwise it doesn't sound like he's opposed to this.

> I also add an example how a protocol driver could use this extension.
> Appreciate any comment.

One question I have: is it necessary to push the handling out into the
protocol driver? I feel like I've seen a partial answer to this: the
'actual_legnth' return field suggests that the protocol driver already
has to deal with shorter-than-desired transfers.

Then I have another one: is the 'actual_length' field really
insufficient? For instance, is it non-kosher for a spi_master to just
cutoff the message at (for instance) 64K, and expect the protocol
driver to handle that (e.g., with Michal's patch from [1])? And if that
is kosher, then is there a good reason for the protocol driver to know
the exact maximum for its spi_master?

[snip example]

Brian
