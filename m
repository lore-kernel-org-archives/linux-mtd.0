Received: from wsgw1.atc.army.mil ([134.194.13.55])
	by canuck.infradead.org with smtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BbItR-0007yr-Fy
	for linux-mtd@lists.infradead.org; Fri, 18 Jun 2004 08:54:54 -0400
Received: from atc-smtp1.atc.army.mil ([134.194.25.160])
	by wsgw1.atc.army.mil (SMSSMTP 4.0.0.59) with SMTP id
	M2004061809052402827
	for <linux-mtd@lists.infradead.org>; Fri, 18 Jun 2004 09:05:24 -0400
Message-ID: <EFF9A3506F74924AB5CC77BDC66E79351812BB@atcml01.atc.army.mil>
From: "Carlos, John J USAATC" <john.carlos@atc.army.mil>
To: linux-mtd@lists.infradead.org
Date: Fri, 18 Jun 2004 08:56:29 -0400
MIME-Version: 1.0
Content-Type: text/plain
Subject: DoC MilPlus32 try to get working???
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

  I have been trying to get diskonchip to work with the MilPlus chip.  I
have merged the drivers in the devices directory in diskonchip.c  I still
have to see if the bad block table is working/implemented.  This is the
error message I get the first time after a boot up that I insmod diskonchip.
Subsequent insmods of diskonchip just report no valid boot record.

  Could anyone tell me what the cause is.  I guess I need to get the bad
block checking working first before anything else?

mtd: Giving out device 4 to DiskOnChip Millennium Plus
in inftl_add_mtd
INFTL: add_mtd for DiskOnChip Millennium Plus
INFTL: INFTL_mount(inftl=0xc1cc6600)
INFTL: find_boot_record(inftl=0xc1cc6600)
INFTL: block read at 0x0 of mtd4 failed: -22
INFTL: block read at 0x8000 of mtd4 failed: -22
INFTL: block read at 0x10000 of mtd4 failed: -22
INFTL: block read at 0x18000 of mtd4 failed: -22
INFTL: block read at 0x20000 of mtd4 failed: -22
INFTL: further failures for this block will not be printed
INFTL: could not find valid boot record?
INFTL: could not mount device
NFTL: add_mtd for DiskOnChip Millennium Plus
Block read at 0x0 of mtd4 failed: -22
Block read at 0x8000 of mtd4 failed: -22
Block read at 0x10000 of mtd4 failed: -22
Block read at 0x18000 of mtd4 failed: -22
Block read at 0x20000 of mtd4 failed: -22
Further failures for this block will not be printed
Could not find valid boot record
NFTL: could not mount device
#

Thanks to all who have been answering my calls for help!!!!
John 
