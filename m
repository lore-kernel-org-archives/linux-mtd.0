Received: from ns.fd-online.de ([212.218.40.1])
	by pentafluge.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1CTd37-0007Gi-Qw
	for linux-mtd@lists.infradead.org; Mon, 15 Nov 2004 09:21:26 +0000
Received: from fd-online.de ([192.168.0.55]) (authenticated bits=0)
	by ns.fd-online.de (8.13.1/8.13.1) with ESMTP id iAF9KsCG022002
	for <linux-mtd@lists.infradead.org>; Mon, 15 Nov 2004 10:20:55 +0100
Message-ID: <419873B0.9020106@fd-online.de>
Date: Mon, 15 Nov 2004 10:15:28 +0100
From: uwe <uwe.walcher@fd-online.de>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Question about AMD elan SC520
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi List,
i have a big problem and searching/trying now for some weeks.

Im trying to access the ELAN SC520 bord from Jumptec/Kontron with mtd 
and the sc520cdp.c driver. I am using Kernel 2.6.8.1. When i look at 
/proc/mtd i see

dev:             size              erasesize      name
mtd0:           01000000   00020000      "SC520CDP Flash Banks #0 and #1"
mtd1:           00080000   00020000      "SC520CDP DIL Flash"

Now my Problem. Every time i want to erase the flash (booting Linux with 
an extra disk on the evulation board (/dev/hdb1)) with flash_erase 
/dev/mtd0 i got the message: /dev/mtd0 Permission denied.
ftl_check /dev/mtd0 shows:
Memory region info:
 Region size=8 mb Erase block size=128 kb

No valid erase unit headers !

When the Kernel is booting, i saw the following Message :

-------- snip -----------
hda: SanDisk SDC1-32, CFA DISK drive
<4>hdb: WDC WD800JB-00CRA1, ATA DISK drive
<4>ide0 at 0x1f0-0x1f7,0x3f6 on irq 14
<4>hda: max request size: 128KiB
<6>hda: 62720 sectors (32 MB) w/1KiB Cache, CHS=490/4/32
<6> hda: hda1
<4>hdb: max request size: 128KiB
<6>hdb: 156301488 sectors (80026 MB) w/8192KiB Cache, CHS=65535/16/63
<6> hdb: hdb1 hdb2 hdb3
<6>$Id: ftl.c,v 1.53 2004/08/09 13:55:43 dwmw2 Exp $
<6>NFTL driver: nftlcore.c $Revision: 1.96 $, nftlmount.c $Revision: 1.37 $
<6>INFTL: inftlcore.c $Revision: 1.17 $, inftlmount.c $Revision: 1.14 $
<5>Could not find PAR responsible for SC520CDP Flash Bank #0
<5>Trying default address 0x8400000
<5>Could not find PAR responsible for SC520CDP Flash Bank #1
<5>Trying default address 0x8c00000
<5>SC520 CDP flash device: 0x800000 at 0x8400000
<7>CFI: Found no SC520CDP Flash Bank #0 device at location zero
<5>SC520 CDP flash device: 0x800000 at 0x8c00000
<7>CFI: Found no SC520CDP Flash Bank #1 device at location zero
<5>SC520 CDP flash device: 0x80000 at 0x9800000
<7>CFI: Found no SC520CDP DIL Flash device at location zero
<5>Concatenating MTD devices:
<5>(0): "SC520CDP Flash Bank #0"
<5>(1): "SC520CDP Flash Bank #1"
<5>into device "SC520CDP Flash Banks #0 and #1"

-----------snip------------

Now my Question: On <5> i read:

Could not find PAR responsible for SC520CDP Flash Bank #0

Must i disable the SanDisk SDC1in bios to give the PAR access to the 
flash, or whats wrong ?

Many thanks for your help

by

Uwe Walcher
