Received: from c135.h203149222.is.net.tw
	([203.149.222.135] helo=ms.gv.com.tw ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17ZsWG-0006gI-00
	for <linux-mtd@lists.infradead.org>; Wed, 31 Jul 2002 13:24:01 +0100
Received: from jmt (IDENT:root@h250-192-72-4.seed.net.tw [192.72.4.250] (may be forged))
	by ms.gv.com.tw (8.11.2/8.11.2) with SMTP id g6VCURO28090
	for <linux-mtd@lists.infradead.org>; Wed, 31 Jul 2002 20:30:27 +0800
Message-ID: <011a01c2388d$34e40c60$1b0448c0@gv.com.tw>
From: "=?big5?B?pHCp+g==?=" <kevin@gv.com.tw>
To: <linux-mtd@lists.infradead.org>
Subject: how can i connect /dev/mtd1 with /dev/mtdblock?
Date: Wed, 31 Jul 2002 20:24:24 +0800
MIME-Version: 1.0
Content-Type: text/plain;
	charset="big5"
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

deal all,

i ported nand flash on our board to /dev/mtd and create 2 partition:
/dev/mtd0, /dev/mtd1
how can i connect /dev/mtd1 with /dev/mtdblock?
beacuse i can't do "mount -t jffs2 /dev/mtd1 /mnt"..(after "cp test.img
/dev/mtd1")

thanks in advanced!:)

best regards,
kevin
