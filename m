Received: from oe15.law14.hotmail.com ([64.4.20.119] helo=hotmail.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19IkkP-0006zi-F4
	for <linux-mtd@lists.infradead.org>; Thu, 22 May 2003 08:44:21 +0100
From: "guo_zhenglin" <guo_zl9@hotmail.com>
To: <linux-mtd@lists.infradead.org>
Date: Thu, 22 May 2003 15:44:18 +0800
MIME-Version: 1.0
Message-ID: <Law14-OE152zjyyFKgg0001a05d@hotmail.com>
Content-Type: text/plain;
	charset="gb2312"
Content-Transfer-Encoding: 7bit
Subject: help: Erase failure:Invalid argument
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

when I erase flash ,I get a error, message as following:

bash-2.04# eraseall /dev/mtd/4
Erasing 256 Kibyte @ 2c0000 -- 91 % complete.
eraseall: /dev/mtd/4: MTD Erase failure: Invalid argument

bash-2.04# cat /proc/mtd
dev:    size   erasesize  name
mtd0: 00800000 00040000 "MBX flash"
mtd1: 00040000 00040000 " BOOT partition(mtd/1)"
mtd2: 000c0000 00040000 "KERNEL  partition(mtd/2)"
mtd3: 00400000 00040000 "ROOT  partition(mtd/3)"
mtd4: 00300000 00040000 "APPLICATION partition(mtd/4)"


1)my environments:
  linux kernel 2.4.20, with preempt-kernel-rml-2.4.20-3.patch
  MBX860 board with AM29F016 flash
  
2)when I use linux kernel 2.4.4( download from www.denx.de),
  all is ok.
  but when I use kernel 2.4.20 (download from www.kernel.org),
  get error .
  It is linux kernel problem ,or mtd problem ,or my problem?

 ------------------------------
 guo zhenglin 
 guo_zl9@hotmail.com
 ------------------------------
