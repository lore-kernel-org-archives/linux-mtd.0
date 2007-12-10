Received: from mailrelay.mobilygen.com ([72.166.0.25])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1J1s5K-0000VY-SF
	for linux-mtd@lists.infradead.org; Mon, 10 Dec 2007 23:30:58 +0000
Received: from mailhost.mobilygen.com (localhost [127.0.0.1])
	by mailrelay.mobilygen.com (Spam Firewall) with ESMTP id 561803E87B
	for <linux-mtd@lists.infradead.org>;
	Mon, 10 Dec 2007 15:17:22 -0800 (PST)
Received: from mailhost.mobilygen.com ([72.166.0.2]) by
	mailrelay.mobilygen.com with ESMTP id 9sfRtNiLuH7kcfbB for
	<linux-mtd@lists.infradead.org>;
	Mon, 10 Dec 2007 15:17:22 -0800 (PST)
Received: from qu056.quarc.com (qu056 [192.168.40.198])
	by mailhost.mobilygen.com (8.13.8/8.13.8) with ESMTP id lBANHLOd005185
	for <linux-mtd@lists.infradead.org>; Mon, 10 Dec 2007 15:17:21 -0800
Subject: failure to mount partition after flash_eraseall -j
From: Jeff Hane <jhane@mobilygen.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain
Date: Mon, 10 Dec 2007 15:17:21 -0800
Message-Id: <1197328641.9854.83.camel@qu056.quarc.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


 I've got a nand chip that I've erased using flash_eraseall -j but it
still fails to mount.

 It is failing because of the cleanmarker compare is failing.
flash_eraseall writes a cleanmarker of size 8 or less.  It gets this
length from the *first* oobfree area.  In my case, this is 7.
 However, when trying to mount the chip and the function
jffs2_check_nand_cleanmarker it does this:
cmlen = min_t(int, c->oobavail, OOB_CM_SIZE);

OOB_CM_SIZE is 8 but oobavail is the total of all the available oob not
just the first segment(43 in my case).  So them memcmp fails because it
tries to compare 8 bytes instead of 7.

 Should flash_eraseall try to see if there is a total of 8 free bytes of
oob area.  However, the MEMWRITEOOB ioctl still uses OOB_PLACE and not
OOB_AUTO so this seems like it would still not work?

 If I'm missing something let me know otherwise I'm open for
suggestions.

thanks,
jeff
