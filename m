Received: from www.osadl.org ([213.239.205.134] helo=mail.tglx.de)
	by pentafluge.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GSjWT-0003QH-7w
	for linux-mtd@lists.infradead.org; Thu, 28 Sep 2006 01:13:05 +0100
Subject: Re: OOB Location
From: Thomas Gleixner <tglx@linutronix.de>
To: ajain@neomagic.com
In-Reply-To: <077501c6d993$ae99e920$561fa8c0@pcajain>
References: <077501c6d993$ae99e920$561fa8c0@pcajain>
Content-Type: text/plain
Date: Thu, 28 Sep 2006 02:14:19 +0200
Message-Id: <1159402459.9326.610.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2006-09-16 at 18:56 +0530, Ajay Jain wrote:
> I have one question regarding JFFS2 on NAND flash. My hardware has a
> NAND flash controller, which does automatic error correction. It needs
> 10 bytes for this, which it stores in the OOB area of each page. JFFS2
> also stores some information in this area, from locations 8-15 for a 512
> page-size NAND flash. Now the issue is that the storage locations as
> used by our hardware and JFFS2 clash. My first hunch is that its a
> quirky hardware. My questions is:

That's supported. JFFS2 puts the cleanmarker into the bytes which are
not used by ECC.

static struct nand_ecclayout rtc_from4_nand_oobinfo = {
	.eccbytes = 32,
	.eccpos = {
		   0, 1, 2, 3, 4, 5, 6, 7,
		   8, 9, 10, 11, 12, 13, 14, 15,
		   16, 17, 18, 19, 20, 21, 22, 23,
		   24, 25, 26, 27, 28, 29, 30, 31},
	.oobfree = {{32, 32}}
};

JFFS2 puts the cleanmarker at offset 32 in OOB.

> Is it possible to use some other location for storing file-system
> information. Is there an option, so that JFFS2 can store this
> information in some other area? If yes, how to use this. I saw the
> 'mkfs.jffs2' help, it does not expose any such option. 

mkfs.jffs2 does not know anything about the OOB usage scheme at all.

	tglx
