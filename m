Received: from isilmar.linta.de ([213.133.102.198] helo=linta.de)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1N2KR8-0006NO-L5
	for linux-mtd@lists.infradead.org; Mon, 26 Oct 2009 07:56:28 +0000
Date: Mon, 26 Oct 2009 08:56:17 +0100
From: Dominik Brodowski <linux@dominikbrodowski.net>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH 14/16] pcmcia: use dynamic debug infrastructure,
	deprecate CS_CHECK (misc drivers)
Message-ID: <20091026075617.GA793@isilmar.linta.de>
References: <20091024194219.GA19546@comet.dominikbrodowski.net>
	<1256413386-20501-14-git-send-email-linux@dominikbrodowski.net>
	<1256539331.29885.360.camel@localhost>
	<20091026071352.GA26980@isilmar.linta.de>
	<1256541991.29885.376.camel@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1256541991.29885.376.camel@localhost>
Cc: linux-pcmcia@lists.infradead.org, linux-mtd@lists.infradead.org,
	linux-usb@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Oct 26, 2009 at 09:26:31AM +0200, Artem Bityutskiy wrote:
> > No, I don't have all that much PCMCIA hardware -- and specifically none for
> > the drivers which were modified in this patch (parport, ixj-telephony,
> > sl811; pcmcia_mtd is marked broken anyway).
> 
> This driver is old and ugly, and it is even possible that no one uses it
> anymore, so I guess getting clean-ups without testing is ok for it.

Which one are you referring to specifically?

> However, in that case the clean-up patches should be reviewable, which I
> wouldn't say about your patch :-)

It are "only" 46 line changes max per driver?

> Could you please split it on several smaller patches, each doing one
> thing only?

Well, I could split up the -- related -- CS_CHECK() and dev_dbg() parts if
_really_ necessary.

Best,
	Dominik
