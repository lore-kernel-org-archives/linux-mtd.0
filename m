Received: from mail-wm0-x234.google.com ([2a00:1450:400c:c09::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZzfgD-0003ZU-RE
 for linux-mtd@lists.infradead.org; Fri, 20 Nov 2015 07:00:22 +0000
Received: by wmec201 with SMTP id c201so58365427wme.0
 for <linux-mtd@lists.infradead.org>; Thu, 19 Nov 2015 23:00:00 -0800 (PST)
Subject: Re: RfC: Handle SPI controller limitations like maximum message length
To: Brian Norris <computersforpeace@gmail.com>
References: <564CEB61.2000601@gmail.com> <20151120000226.GP64635@google.com>
Cc: Mark Brown <broonie@kernel.org>, linux-mtd@lists.infradead.org,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>, hramrach@gmail.com,
 martin@sperl.org
From: Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <564EC4E0.90602@gmail.com>
Date: Fri, 20 Nov 2015 07:59:44 +0100
MIME-Version: 1.0
In-Reply-To: <20151120000226.GP64635@google.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 20.11.2015 um 01:02 schrieb Brian Norris:
> On Wed, Nov 18, 2015 at 10:19:29PM +0100, Heiner Kallweit wrote:
>> There have been few discussions in the past about how to handle SPI controller
>> limitations like max message length. However they don't seem to have resulted
>> in accepted patches yet.
>> I also stumbled across this topic because I own a device using Freescale's
>> ESPI which has a 64K message size limitation.
>>
>> At least one agreed fact is that silently assembling chunks in protocol
>> drivers is not the preferred approach.
> 
> Hmm, are you referring to this sort of approach [1], where the
> spi_message::acutal_length informs the spi_nor layer that the transfer
> was truncated?
> 
> [1] [PATCH v4 7/7] mtd: spi-nor: add read loop
>     http://lists.infradead.org/pipermail/linux-mtd/2015-August/061062.html
> 
>> Maybe a better approach would be to introduce a new member of spi_master
>> dealing with controller limitations.
>> My issue is just the message size limitation but most likely there are more
>> and different limitations in other controllers.
>>
>> I'd introduce a struct spi_controller_restrictions and add a member to spi_master
>> pointing to such a struct. Then a controller driver could do something like this:
>>
>> static const struct spi_controller_restrictions fsl_espi_restrictions = {
>> 	.max_msg_size	= 0xffff,
>> };
>>
>> master->restrictions = &fsl_espi_restrictions;
> 
> OK, so I think Mark suggested we not move to a 'restrictions' struct,
> but otherwise it doesn't sound like he's opposed to this.
> 
That's how I read his comments too.

>> I also add an example how a protocol driver could use this extension.
>> Appreciate any comment.
> 
> One question I have: is it necessary to push the handling out into the
> protocol driver? I feel like I've seen a partial answer to this: the
> 'actual_legnth' return field suggests that the protocol driver already
> has to deal with shorter-than-desired transfers.
> 
> Then I have another one: is the 'actual_length' field really
> insufficient? For instance, is it non-kosher for a spi_master to just
> cutoff the message at (for instance) 64K, and expect the protocol
> driver to handle that (e.g., with Michal's patch from [1])? And if that
> is kosher, then is there a good reason for the protocol driver to know
> the exact maximum for its spi_master?
> 
It would be sufficient if it's a valid case that spi_master returns 0
and an actual_length < requested_length as this is some kind of error
situation.
I could also fully understand if spi_master doesn't return 0 but
-EMSGSIZE in such a case.
And the suggested patch would bail out of the chunk-assembling loop
once it get's an error from the SPI transfer
(after applying patch 2 of the series which introduces checking
the return code of the spi_sync call in m25p80_read).

> [snip example]
> 
> Brian
> 
