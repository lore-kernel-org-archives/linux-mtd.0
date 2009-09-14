Received: from astoria.ccjclearline.com ([64.235.106.9])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MnF1R-0000Lf-Ad
	for linux-mtd@lists.infradead.org; Mon, 14 Sep 2009 17:07:29 +0000
Date: Mon, 14 Sep 2009 13:07:17 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH] MTD: Correct misspelled Kconfig var
	CONFIG_MTD_DATAFLASH_VERIFY_WRITE
In-Reply-To: <1252940831.5060.104.camel@localhost>
Message-ID: <alpine.LFD.2.00.0909141306050.9507@localhost>
References: <alpine.LFD.2.00.0909110543410.11692@localhost>
	<1252940831.5060.104.camel@localhost>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: MTD mailing list <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 14 Sep 2009, Artem Bityutskiy wrote:

> On Fri, 2009-09-11 at 05:44 -0400, Robert P. J. Day wrote:
> > Make the source file correction CONFIG_MTD_DATAFLASH_VERIFY_WRITE ->
> > CONFIG_MTD_DATAFLASH_WRITE_VERIFY to match the Kconfig variable in
> > drivers/mtd/devices/Kconfig.
> >
> > Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
>
> Actually, a patch you sent earlier is already in the mtd-2.6.git tree:
> http://git.infradead.org/mtd-2.6.git/commit/05dd180709fca14fbae617c0dab1bed56be334fc

  i submitted a different one based on the recommendation of what
should be changed for those two bits of text to match up.  either one
of those two patches will work just fine, they just resolve the issue
in opposite ways.  whatever people on this list prefer is fine with
me.

rday
--

========================================================================
Robert P. J. Day                               Waterloo, Ontario, CANADA

        Linux Consulting, Training and Annoying Kernel Pedantry.

Web page:                                          http://crashcourse.ca
Twitter:                                       http://twitter.com/rpjday
========================================================================
