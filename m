Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=mail.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FAjoi-0003m3-D9
	for linux-mtd@lists.infradead.org; Sun, 19 Feb 2006 03:21:19 -0500
From: Thomas Gleixner <tglx@linutronix.de>
To: Vitaly Wool <vwool@ru.mvista.com>
In-Reply-To: <43F74BF1.1080307@ru.mvista.com>
References: <43EB96DC.3030900@eptar.com>
	<35fb2e590602100558s2d868fa3o1752fbf3217439e4@mail.gmail.com>
	<d97046180602151153g23064424x9e1ddf83a1d7ae4f@mail.gmail.com>
	<200602161432.17447.manningc2@actrix.gen.nz>
	<1140253826.2480.651.camel@localhost.localdomain>
	<43F74BF1.1080307@ru.mvista.com>
Content-Type: text/plain
Date: Sun, 19 Feb 2006 09:22:06 +0100
Message-Id: <1140337326.2480.674.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: William Watson <wjw1961@gmail.com>,
	Charles Manning <manningc2@actrix.gen.nz>,
	linux-mtd@lists.infradead.org, yaffs@stoneboat.aleph1.co.uk
Subject: Re: [Yaffs] bit error rates --> a vendor speaks
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Vitaly,

On Sat, 2006-02-18 at 19:31 +0300, Vitaly Wool wrote:
> Hi folks,

Can you please stop top posting ?

> just two small notes from my side.
> First, FWIW, YAFFS2 never writes OOB w/o data and that looks more proper 
> than JFFS2 style which means cleanmarkers for an empty page.
> YAFFS2 just needs means to be agnostic about how OOB bytes are placed 
> within a page.

I'm not too happy about this JFFS2 oddity and I would remove it better
today than tomorrow.

The agnostic thing is fine, but it still is not solving the fundamental
flaw of oob usage at all. The only guarantee of NAND is that you can
store data size, but the size of the "free" bytes in OOB (due to ECC,
bad block markers ...) is non constant and depends on hardware design,
chip types ... So any self restriction of a filesystem, block emulation
layer or whatever user of NAND flash to a small number of bytes it wants
to put into OOB can not cover _all_ possible constellations.

The kernel can only provide generic solutions and it makes absolutely no
sense to rely on nifty tricks which require code bloat and can not cover
every corner case.

> Next, I took a look at rtc_from4.c and I'm not sure how to follow this 
> method if the NAND controller just doesn't have means to give the 
> caclulated ECC back to user. Thomas, could you please elaborate on that?

-ENOPARSE. What does the NAND controller do with the calculated ECC, if
it has no way to let the user read the ECC ?
You mean those controllers which insert the ECC automatically at some
point into the data stream ? A great example why OOB usage is not a good
idea at all. These controllers guarantee data size and nothing else. I
have one on my desk which does not let you use OOB, because it does all
the magic itself.

	tglx
