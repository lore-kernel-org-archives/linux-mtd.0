Received: from natsmtp01.webmailer.de ([192.67.198.81] helo=post.webmailer.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18ZZgp-0000tT-00
	for <linux-mtd@lists.infradead.org>; Fri, 17 Jan 2003 16:49:56 +0000
Received: from lenor (p50863BD6.dip.t-dialin.net [80.134.59.214])
	by post.webmailer.de (8.9.3/8.8.7) with ESMTP id SAA20651
	for <linux-mtd@lists.infradead.org>; Fri, 17 Jan 2003 18:20:47 +0100 (MET)
Message-ID: <002501c2be4c$bd32a500$152ea8c0@lenor>
From: "Thomas Wehrspann" <thomas@wehrspann.de>
To: <linux-mtd@lists.infradead.org>
Subject: unable to detect NFTL partition with kernel 2.5.59
Date: Fri, 17 Jan 2003 18:20:04 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Hallo list

I am trying to use a DoC Millenium with LinuxBIOS and a developer kernel
2.5.5x but ended in a kernel panic because of a missing root device.
Then i tried it without LinuxBIOS an MTD as modules.
I did a (modules-init-tools-0.9.7)
    insmod docecc.ko
    insmod mtdcore.ko
    insmod doc2001.ko
    insmod doprobe.ko
and the chips seems to be recognized correctly, then
    insmod nftl

NFLT driver: nftlcore.c $Revision: 1.82 $, nftlmount.c $Revision: 1.25 $
Cannot calculate an NFTL geometry to match size of 0x2fb0.
Using C:1017 H:12 S:1 (== 0x2fac sects)

and nothing else wether i uses DEBUG or not. With kernel 2.4.19 there is
also a
nftla: p1
and it works perfectly (I want to use the 2.5.5x cause of the build in DVB
driver).
I tried the CVS driver, but had no luck compiling it (seems a bit outdated
for a 2.5.5x IMHO).

Thanks
Thomas Wehrspann
