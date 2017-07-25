Received: from mail.thorsis.com ([213.211.200.15])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dZw7K-0007ME-09
 for linux-mtd@lists.infradead.org; Tue, 25 Jul 2017 09:27:03 +0000
From: Alexander Dahl <ada@thorsis.com>
To: linux-mtd@lists.infradead.org
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>
Subject: mtd: nand: atmel: probe of Spansion S34ML02G1 fails
Date: Tue, 25 Jul 2017 11:26:33 +0200
Message-ID: <5326598.QgYTQxcFMR@ada>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

when testing the recent v4.13-rc2 on our at91sam9g20 based platform I 
discovered one of the NAND flash chips we use can not be setup correctly 
anymore. I guess this may be due to the reworked atmel nand driver after 
v4.9, but it may be another problem.

The board layout is similar to the at91sam9g20ek for the NAND flash part 
and we're using different flash chips. With an hynix HY27UF082G2B 
everything works, the console output on boot is like this:

  nand: Could not find valid ONFI parameter page; aborting
  nand: device found, Manufacturer ID: 0xad, Chip ID: 0xda
  nand: Hynix NAND 256MiB 3,3V 8-bit
  nand: 256 MiB, SLC, erase size: 128 KiB, page size: 2048, OOB size: 64

The same board with another pin compatible flash chip, the Spansion 
S34ML02G100TF100 however fails. I added some debug print statements to a 
otherwise clean 4.13-rc2 kernel and get this:

  nand: device found, Manufacturer ID: 0x01, Chip ID: 0xda
  nand: AMD/Spansion S34ML02G1
  nand: 256 MiB, SLC, erase size: 128 KiB, page size: 2048, OOB size: 64
  nand: onfi_version: 10, onfi_params.opt_cmd: 0x001B
  nand: chip->onfi_set_features() failed: -22
  nand: nand_setup_data_interface() failed: -22
  atmel-nand-controller 10000000.ebi:nand-controller: nand_scan_ident() 
failed: -22
  atmel-nand-controller: probe of 10000000.ebi:nand-controller failed 
with error -22

So in the ONFI parameter page of the flash chip the value for "optional 
commands supported" in the features block is 0x001B which is exactly 
what the datasheet says. This means this flash chip does not support 
"Get Features" and "Set Features".

Now nand_onfi_set_features() correctly fails, because the nand chip can 
not set features. It's called in nand_setup_data_interface() in 
nand_base.c which fails itself because of the return value of the failed 
set features call and so the whole chain of fails starts.

The nand chip actually works fine in U-Boot, and with kernels up to 
v4.9.35, I didn't test v4.10, v4.11, but IIRC the board booted from nand 
flash with v4.12.

Can anyone help me to fix this?

Greets
Alex
