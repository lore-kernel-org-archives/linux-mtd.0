Received: from [61.135.145.13] (helo=websmtp03.sohu.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16yP2Y-0006cW-00
	for <linux-mtd@lists.infradead.org>; Fri, 19 Apr 2002 04:26:29 +0100
Received: from mail.sohu.com (unknown [192.168.41.208])
	by websmtp03.sohu.com (Postfix) with ESMTP id 0E904685B0
	for <linux-mtd@lists.infradead.org>; Fri, 19 Apr 2002 11:23:14 +0800 (CST)
Message-ID: <367575.1019186593883.JavaMail.postfix@srv23.mail.sohu.com>
Date: Fri, 19 Apr 2002 11:23:13 +0800 (CST)
From: <swimming_fisher@sohu.com>
To: <linux-mtd@lists.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Subject: (no subject)
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

Hi,
I make a image using mkfs.jffs2 v1.17 for i386,and burn it into my Assabet under redboot.But I fail to mount it using  "mount -t jffs2 /dev/mtdblock3 /mnt".It suggests:
 "jffs2_scan_empty():Empty block at 0xxxxxxx"
 "jffs2_scan_eraseblock():Magic bitmask not found at 0xxxxxxx"

Why?Please give me some advice!
