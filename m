From: dzuy@infinity-studios.com (Dzuy Nguyen)
Date: Fri, 07 Mar 2003 22:56:13 -0600
Subject: nftl_format 72MB DoC Seg fault
Message-ID: <3E6977ED.4060706@infinity-studios.com>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

Everytime I nftl_format a 72MB DoC2000, it core dumps:

# ./nftl_format /dev/mtd0 114688

$Id: nftl_format.c,v 1.19 2002/05/01 10:59:04 dwmw2 Exp $
Phase 1. Checking and erasing Erase Zones from 0x0001c000 to 0x03c1c000
         Checking Zone #7682 @ 0x3c04000: Block not 0xff after erase
Skipping bad zone (RWE test failed) #7682 @ 0x3c04000
         Checking Zone #7683 @ 0x3c06000Segmentation fault


So far, I've wasted 2 72MB DoC2000.  Has anyone seen this behavior or
successfully nftl_format a large DoC2000 such as 72MB?  I formatted the 48MB
with the same nftl_format program and it worked fine.  This is mtd 20030307.

Dzuy




>From gvb  Sat Mar  8 09:01:15 2003
From: gvb (gvb)
Date: 8 Mar 2003 14:01:15 -0000
Subject: (no subject)
Message-ID: <20030308140115.27593.qmail@mailweb33.rediffmail.com>

Hi,

   I have been using my M-Sys DOC 2000 using DOS sine 1987, over 
ICOP 386 board with 4 MB RAM. I
am planning to switch to Linux now. Please help me out in booting 
linux from DOC 2000 with 4 MB
RAM. I am having redhat 7.0 bootable with 2.2.16-22smp kernel.

please help me out

best regards,
prasad


Gottimukkala.V.B.Prasad
pgp key 2048 0x0E3C516011A9 finger print 1029 23AE D43A 0809  767F 
48A3 3E25 0E3C 5160
