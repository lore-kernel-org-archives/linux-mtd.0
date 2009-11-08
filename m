Received: from isilmar.linta.de ([213.133.102.198] helo=linta.de)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1N72sm-0007gf-Eo
	for linux-mtd@lists.infradead.org; Sun, 08 Nov 2009 08:12:28 +0000
Date: Sun, 8 Nov 2009 09:12:14 +0100
From: Dominik Brodowski <linux@dominikbrodowski.net>
To: Kristoffer Ericson <kristoffer.ericson@gmail.com>, gregkh@suse.de
Subject: Re: pcmciamtd -- what's broken, who needs it?
Message-ID: <20091108081214.GA10455@isilmar.linta.de>
References: <1256413386-20501-14-git-send-email-linux@dominikbrodowski.net>
	<1256539331.29885.360.camel@localhost>
	<20091026071352.GA26980@isilmar.linta.de>
	<1256541991.29885.376.camel@localhost>
	<20091026101909.271c109e@lxorguk.ukuu.org.uk>
	<1256552337.29885.419.camel@localhost>
	<1257237433.21596.60.camel@localhost>
	<31862236.11111257593349372.komurojun-mbn@nifty.com>
	<20091107113346.GA9922@isilmar.linta.de>
	<20091107175751.801ee556.kristoffer.ericson@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20091107175751.801ee556.kristoffer.ericson@gmail.com>
Cc: Komuro <komurojun-mbn@nifty.com>, Artem Bityutskiy <dedekind1@gmail.com>,
	Pep Talens <pep.talens@f1-connecting.com>,
	linux-pcmcia@lists.infradead.org,
	linux-mtd <linux-mtd@lists.infradead.org>,
	'David Woodhouse' <dwmw2@infradead.org>,
	Alan Cox <alan@lxorguk.ukuu.org.uk>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hey,

On Sat, Nov 07, 2009 at 05:57:51PM +0100, Kristoffer Ericson wrote:
> On Sat, 7 Nov 2009 12:33:46 +0100
> Dominik Brodowski <linux@dominikbrodowski.net> wrote:
> > On Sat, Nov 07, 2009 at 08:29:09PM +0900, Komuro wrote:
> > > staging directory is not the place for broken driver,
> > > is it?
> > 
> > 
> > It is becoming the place for drivers on their way out of the kernel tree.
> > An indication for drivers being unused is that they have been marked broken
> > or obsolete for a loooong time; and then they'll remain in staging for 3
> > releases or so before being removed (or being moved in again).
> 
> Is the 3 releases a fixed date? Got a couple of drivers in there
> that I "might" want to use in the near future. Just havent had time to
> looking at cleaning them up.

IIRC it's 3 releases of inaction before there's the intention to remove the
drivers. But for the details of these rules (which probably aren't black and
white) you should ask the maintainer of linux-staging :)

Best,
	Dominik
