Received: from c135.h203149222.is.net.tw
	([203.149.222.135] helo=ms.gv.com.tw ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17cf2m-0003kj-00
	for <linux-mtd@lists.infradead.org>; Thu, 08 Aug 2002 05:37:04 +0100
Received: from jmt (IDENT:root@h250-192-72-4.seed.net.tw [192.72.4.250] (may be forged))
	by ms.gv.com.tw (8.11.2/8.11.2) with SMTP id g784hxK20290
	for <linux-mtd@lists.infradead.org>; Thu, 8 Aug 2002 12:43:59 +0800
Message-ID: <000d01c23e95$4c679060$1b0448c0@gv.com.tw>
From: "??" <kevin@gv.com.tw>
To: <linux-mtd@lists.infradead.org>
Subject: will jffs2 write to device when doing "read-only" operation like "ls"?
Date: Thu, 8 Aug 2002 12:37:26 +0800
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

dear all,

will jffs2 write to device when doing "read-only" operation like "ls"?

for example, if you do a "ls -lR" then a fs like ext2/minix will write stuff
to block device
(because of put_inode operation),thus might reduce life of nand flash.......

if the answer is yes, is it possible to impore/modify it?

thanks in advanced!:)
