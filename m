Received: from h-66-134-95-69.snvacaid.covad.net ([66.134.95.69]
	helo=mail.plexio.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19B1AV-0004kH-P5
	for <linux-mtd@lists.infradead.org>; Thu, 01 May 2003 00:39:20 +0100
Received: from [24.78.211.48] (helo=ralph.plexio.private)
	by mail.plexio.com with esmtp (TLSv1:RC4-MD5:128)
	(Exim 3.34 #4)
	id 19B1Ae-0005Eq-00
	for linux-mtd@lists.infradead.org; Wed, 30 Apr 2003 16:39:28 -0700
From: Stephen Lee <splee@plexio.com>
To: mtd <linux-mtd@lists.infradead.org>
Message-Id: <1051745960.27756.15.camel@ralph.plexio.private>
Mime-Version: 1.0
Date: 30 Apr 2003 16:39:20 -0700
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Subject: Which version of M-SYS DFORMAT?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I'm following the instructions at
http://lakeshoremicro.com/diskonchip-grub-howto.html
on installing Grub on to a DOC2000 chip. With M-Sys' v5.14 DFORMAT, I
get the "Sorry, we don't support UnitSizeFactor of != 1 yet." message
during bootup. The kernel (2.4.20) was patched with
mtd-snapshot-20030423.tar.bz2. According to the instructions, patching
with the latest mtd patches should take care of the problem. This leads
me to wonder if I should have used the V4.2 DFORMAT instead?

Thanks,
Stephen
