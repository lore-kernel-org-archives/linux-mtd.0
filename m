Received: from mail.newlogic.at ([194.208.88.201])
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 19zYfb-00039R-1a
	for <linux-mtd@lists.infradead.org>; Wed, 17 Sep 2003 10:32:20 +0100
Message-Id: <200309170930.h8H9UwZS028813@enterprise2.newlogic.at>
MIME-Version: 1.0
In-Reply-To: <AF34F8F089D16B4FABE02B5F375228E0022C@serveur21.SYNCHRO2>
Date: Wed, 17 Sep 2003 11:30:58 +0200 (MEST)
Sender: nwaibel@newlogic.com
From: Niki Waibel <niki.waibel@newlogic.com>
To: Yves CLOUSIER <yves.clousier@synchronic.fr>
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
cc: "uclinux-dev@uclinux.org" <uclinux-dev@uclinux.org>
Subject: RE: Problem using DOC with mtd
Reply-To: Niki Waibel <niki.waibel@newlogic.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Doc dump at e0000000 : 55 55 aa aa 10 10 eb eb
Doc dump at e0000008 : 3c 3c 00 00 00 00 28 28
Doc dump at e0000010 : 43 43 29 29 4d 4d 2d 2d
Doc dump at e0000018 : 53 53 79 79 73 73 74 74
Doc dump at e0000020 : 65 65 6d 6d 73 73 31 31

is somehow good, but you should have:
Doc dump at e0000000 : 55 aa 10 eb 3c 00 00 28
 ...
as well on 
Doc dump at e0001000 : 00 00 00 00 00 00 00 00
there should be
Doc dump at e0001000 : 30 ...

maybe this is at e0002000 in your case and you have mixed up
some address wires...

niki



On 17-Sep-2003 Yves CLOUSIER wrote:
> Hi all, 
> 
> I have 5272 plateform with the 20030305-uclinux-dist. 
> In this plateform I have a disk-on-chip millenium module MD2802-D08. The DOC
> is map at 0xE0000000.
> 
> But during booting, I have the message :
> Possible DiskOnChip with unknown ChipID 00 found at 0xe0000000
> No recognised DiskOnChip devices found
> 
> In the Doc_Check() fonction in probe.c I make a memory dump of the DOC (from
> 0xE0000000 to 0xE0002000), see the attach file.
> I think that the acces of the DOC is correct because I see the DOC bios
> singature at 0xE0000000. But I don't understand why the mtd doesn't
> recognised the DOC. So if you have an idea ......
> 
> 
> Thanks.
> 
> 
> 
> 
> 
> I configure the mtd like this :
> 
>#
># Memory Technology Devices (MTD)
>#
> CONFIG_MTD=y
> CONFIG_MTD_DEBUG=y
> CONFIG_MTD_DEBUG_VERBOSE=3
># CONFIG_MTD_PARTITIONS is not set
># CONFIG_MTD_CONCAT is not set
> 
>#
># User Modules And Translation Layers
>#
> CONFIG_MTD_CHAR=y
> CONFIG_MTD_BLOCK=y
># CONFIG_FTL is not set
># CONFIG_NFTL is not set
> 
>#
># RAM/ROM/Flash chip drivers
>#
># CONFIG_MTD_CFI is not set
># CONFIG_MTD_JEDECPROBE is not set
># CONFIG_MTD_GEN_PROBE is not set
># CONFIG_MTD_RAM is not set
># CONFIG_MTD_ROM is not set
># CONFIG_MTD_ABSENT is not set
># CONFIG_MTD_OBSOLETE_CHIPS is not set
> 
>#
># Mapping drivers for chip access
>#
> 
>#
># Self-contained MTD device drivers
>#
># CONFIG_MTD_SLRAM is not set
># CONFIG_MTD_MTDRAM is not set
># CONFIG_MTD_BLKMTD is not set
> 
>#
># Disk-On-Chip Device Drivers
>#
># CONFIG_MTD_DOC1000 is not set
> CONFIG_MTD_DOC2000=y
># CONFIG_MTD_DOC2001 is not set
> CONFIG_MTD_DOCPROBE=y
> CONFIG_MTD_DOCPROBE_ADVANCED=y
> CONFIG_MTD_DOCPROBE_ADDRESS=e0000000
># CONFIG_MTD_DOCPROBE_HIGH is not set
># CONFIG_MTD_DOCPROBE_55AA is not set
> 
>#
># NAND Flash Device Drivers
>#
># CONFIG_MTD_NAND is not set
> 
> 
> 
>  <<dump.txt>> 

-- 
niki w. waibel - system administrator @ newlogic technologies ag
