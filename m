Received: from imladris.infradead.org
	([194.205.184.45] helo=infradead.org ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15AqoL-0005fH-00
	for <linux-mtd@lists.infradead.org>; Fri, 15 Jun 2001 11:26:41 +0100
Received: from cad2.me.ccu.edu.tw ([140.123.121.3])
	by infradead.org with esmtp (Exim 3.20 #2)
	id 15AqtX-0002UC-00
	for linux-mtd@lists.infradead.org; Fri, 15 Jun 2001 11:32:04 +0100
Received: from cs.ccu.edu.tw (home.acronexus.com [211.23.94.162]) by cad2.me.ccu.edu.tw (8.7.5/8.7.5) with ESMTP id GAA16444 for <mtd@infradead.org>; Fri, 15 Jun 2001 06:40:55 +0800 (CST)
Message-ID: <3B29E6B9.527B10E4@cs.ccu.edu.tw>
Date: Fri, 15 Jun 2001 18:43:05 +0800
From: lmc83 <lmc83@cs.ccu.edu.tw>
MIME-Version: 1.0
To: mtd <linux-mtd@lists.infradead.org>
Subject: error when mounting jffs
Content-Type: text/plain; charset=us-ascii
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

hi,
    my board have a nand flash,
    I use mtd's nand driver to create a mtd device.
    It pass the nandtest's check:
        nandtest ==> ok
    but when I mount -t jffs /dev/mtdblock0 /flash
    the mount is success, but will show following message:
        jffs_scan_flash : Found a JFFS node
        with dsize (0x15cc) > max_chunk_size (0x1000)
        .....
    although it can copy or delete the file on the file system,
    but what's the means of the message?
    Does it have any side effect?
    
    Thanks.

    Liang Ming-Chung
