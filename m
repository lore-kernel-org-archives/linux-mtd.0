Received: from mx.vmgattei.com ([77.223.18.35])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W1ZFY-0005b5-2N
 for linux-mtd@lists.infradead.org; Fri, 10 Jan 2014 10:23:37 +0000
Received: from localhost (mx.vmgattei.com [127.0.0.1])
 by mx.vmgattei.com (Postfix) with ESMTP id 50F6E22717
 for <linux-mtd@lists.infradead.org>; Fri, 10 Jan 2014 11:15:15 +0100 (CET)
Received: from mx.vmgattei.com ([127.0.0.1])
 by localhost (mx.vmgattei.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KFrIDIR9Ouiq for <linux-mtd@lists.infradead.org>;
 Fri, 10 Jan 2014 11:15:14 +0100 (CET)
Received: from [192.168.1.11] (108.pool85-49-202.dynamic.orange.es
 [85.49.202.108])
 by mx.vmgattei.com (Postfix) with ESMTPSA id 550E11FD55
 for <linux-mtd@lists.infradead.org>; Fri, 10 Jan 2014 11:15:14 +0100 (CET)
Message-ID: <52CFC831.9050102@sirius-es.it>
Date: Fri, 10 Jan 2014 11:15:13 +0100
From: Matteo Facchinetti <matteo.facchinetti@sirius-es.it>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: bad-block skipping
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

I'm porting a MTD nand controller driver from kernel 3.9.4 to 3.13.0-rc2.
I need help because when I try to erase my nand flash partition in 
version 3.13, I have errors that never seen before (in version 3.9.4).

In detail, with flash_erase command:
# flash_erase /dev/mtd1 0 0
I'm expecting this output when it encounters a bad block:
...
     Skipping bad block at <block number>
...

But, in my porting, I have the following output: [see at the end]

Where the first is a bad block and the last 4 blocks are reserved for BBT.

Why it occurs?

Best regards,
Matteo


# flash_erase /dev/mtd1 0 0
Erasing 10[  150.438406] 00000 -- 78 % complete
[  150.438406]  nand_isbad_bbt(): bbt info for offs 0xd9900000: (block 
3481) 0x03
24 Kibyte @ 97300[  150.448181] nand_erase_nand: attempt to erase a bad 
block at page 0x000d9900
Erasing 1024 Kibyte @ 99900000 -- 79 % complete libmtd: error!: 
MEMERASE64 ioctl failed for eraseblock 2457 (mtd1)
         error 5 (Input/output error)
flash_erase: error!: /dev/mtd1: MTD Erase failure
              error 5 (Input/output error)
Erasing 1024 Kibyte @ bce00000 -- 98 % comple[  153.088655]
[  153.088655]  nand_isbad_bbt(): bbt info for offs 0xffc00000: (block 
4092) 0x02
Erasing 1024
[  153.098015] nand_erase_nand: attempt to erase a bad block at page 
0x000ffc00
  Kibyte @ bcf0000[  153.107567]
[  153.107567]  nand_isbad_bbt(): bbt info for offs 0xffd00000: (block 
4093) 0x02
0 -- 98 % comple
[  153.117023] nand_erase_nand: attempt to erase a bad block at page 
0x000ffd00
Erasing 1024 Kibyte @ bd000[  153.126848]
[  153.126848]  nand_isbad_bbt(): bbt info for offs 0xffe00000: (block 
4094) 0x02
000 -- 98 % comp
[  153.137194] nand_erase_nand: attempt to erase a bad block at page 
0x000ffe00
Erasing 10[  153.146438]
[  153.146438]  nand_isbad_bbt(): bbt info for offs 0xfff00000: (block 
4095) 0x02
24 Kibyte @ bd10
[  153.156029] nand_erase_nand: attempt to erase a bad block at page 
0x000fff00
Erasing 1024 Kibyte @ bfc00000 -- 99 % complete libmtd: error!: 
MEMERASE64 ioctl failed for eraseblock 3068 (mtd1)
         error 5 (Input/output error)
flash_erase: error!: /dev/mtd1: MTD Erase failure
              error 5 (Input/output error)
Erasing 1024 Kibyte @ bfd00000 -- 99 % complete libmtd: error!: 
MEMERASE64 ioctl failed for eraseblock 3069 (mtd1)
         error 5 (Input/output error)
flash_erase: error!: /dev/mtd1: MTD Erase failure
              error 5 (Input/output error)
Erasing 1024 Kibyte @ bfe00000 -- 99 % complete libmtd: error!: 
MEMERASE64 ioctl failed for eraseblock 3070 (mtd1)
         error 5 (Input/output error)
flash_erase: error!: /dev/mtd1: MTD Erase failure
              error 5 (Input/output error)
Erasing 1024 Kibyte @ bff00000 -- 99 % complete libmtd: error!: 
MEMERASE64 ioctl failed for eraseblock 3071 (mtd1)
         error 5 (Input/output error)
flash_erase: error!: /dev/mtd1: MTD Erase failure
              error 5 (Input/output error)
Erasing 1024 Kibyte @ bff00000 -- 100 % complete
