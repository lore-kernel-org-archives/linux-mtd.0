Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14bYfB-0004gQ-00
	for mtd-list@infradead.org; Sat, 10 Mar 2001 01:59:21 +0000
Received: from shell9.ba.best.com ([206.184.139.140] ident=root)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14bYf9-0004gK-00
	for mtd@infradead.org; Sat, 10 Mar 2001 01:59:20 +0000
From: Subodh Nijsure <subodh@best.com>
Message-Id: <200103100158.RAA06216@shell9.ba.best.com>
Subject: Re:  AW: JFFS on a powerpc platform.
To: schirmer@taytron.net, mtd@infradead.org
Date: Fri, 9 Mar 2001 17:58:26 -0800 (PST)
Cc: subodh@best.com
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


I still have that problem now its slightly different problem. 

It looks like problem with 'interleaving' 

This is how my mtd memory space looks like -- 

cat /proc/mtd
mtd0: 00400000 00020000 "Physically mapped flash"
mtd1: 00080000 00020000 "Bootrom Area"
mtd2: 00040000 00020000 "Custom Flash Bank #2 2x128KB"
mtd3: 00040000 00020000 "Custom Flash Bank #2 2x128KB"
mtd4: 00300000 00020000 "Custom Flash left overs from 4MB Flash" 

Now the first device /dev/mtd1 contains the bootrom so I copy /dev/mtd1
to file and it looks like this --

cat < /dev/mtd1 > /tmp/bootrom 
'V|~?&tcN |~N MTDSkyStream Bootrom (ver 0.1) (Mar  8 2001 - 10:26:50) 

doc_loadbios /dev/mtd4 bootrom 

Now if I try to dump the /dev/mtd4 I get following output 
cat < /dev/mtd4 | more
'&?~|ct N&| NSDTMtSykmaerooB mortev( .0 r( )1 raM2 9  10061 -:52:)44  


Now if I do eraseall /dev/mtd0 I see data in flash as

FFFF0080 FFFF0080.. 

instead of 
FFFFFFFF FFFFFFFF...

So it looks like for some reason one of the chip is not getting erased?

In my kernel config as interleave '2' as I have two chips giving me 32 bit
access.

CONFIG_MTD_CFI=y
CONFIG_MTD_CFI_GEOMETRY=y
# CONFIG_MTD_CFI_B1 is not set
# CONFIG_MTD_CFI_B2 is not set
CONFIG_MTD_CFI_B4=y
# CONFIG_MTD_CFI_I1 is not set
CONFIG_MTD_CFI_I2=y
# CONFIG_MTD_CFI_I4 is not set
CONFIG_MTD_CFI_INTELEXT=y 

Interleaving factor is '2' as my CPU A1 is connected to A0 of the chip.

Any more hints on why I would be getting this "flipping" of bits?


Thanks!!

/Subodh



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
