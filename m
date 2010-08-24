Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Onoif-0000Ks-UB
	for linux-mtd@lists.infradead.org; Tue, 24 Aug 2010 08:18:58 +0000
Received: by fxm12 with SMTP id 12so4417455fxm.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 24 Aug 2010 01:18:56 -0700 (PDT)
Subject: Re: [PATCH] drivers/mtd: remove makefile subdirectory processing
	redundancies
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Kyle Spaans <kspaans@uwaterloo.ca>
In-Reply-To: <20100804005804.GA11770@taurine.csclub.uwaterloo.ca>
References: <20100714042509.GA7775@caffeine.csclub.uwaterloo.ca>
	<1279471590.16247.57.camel@localhost.localdomain>
	<20100720021718.GA32479@caffeine.csclub.uwaterloo.ca>
	<1279706975.2306.4.camel@localhost>
	<20100804005804.GA11770@taurine.csclub.uwaterloo.ca>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 24 Aug 2010 11:17:27 +0300
Message-ID: <1282637847.24044.136.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org,
	David Woodhouse <dwmw2@infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2010-08-03 at 20:58 -0400, Kyle Spaans wrote:
> Remove redundant config checks when the subdirectory's Makefile is already
> conditionally processed. Add more conditional processing when the subdirectory
> can be selected/deselected as a whole.
> 
> Signed-off-by: Kyle Spaans <kspaans@uwaterloo.ca>

Sorry, bad luck. I get the following with your patch, but without your
patch my compilation is fine. Forgot to compile-test? :-)

[dedekind@eru l2-mtd-2.6]$ make
  CHK     include/linux/version.h
  CHK     include/generated/utsrelease.h
  CALL    scripts/checksyscalls.sh
  CHK     include/generated/compile.h
  CHK     include/linux/version.h
make[2]: `scripts/unifdef' is up to date.
Kernel: arch/x86/boot/bzImage is ready  (#7)
  Building modules, stage 2.
  MODPOST 251 modules
ERROR: "ubi_open_volume" [fs/ubifs/ubifs.ko] undefined!
ERROR: "ubi_leb_map" [fs/ubifs/ubifs.ko] undefined!
ERROR: "ubi_open_volume_nm" [fs/ubifs/ubifs.ko] undefined!
ERROR: "ubi_leb_change" [fs/ubifs/ubifs.ko] undefined!
ERROR: "ubi_leb_write" [fs/ubifs/ubifs.ko] undefined!
ERROR: "ubi_get_device_info" [fs/ubifs/ubifs.ko] undefined!
ERROR: "ubi_leb_read" [fs/ubifs/ubifs.ko] undefined!
ERROR: "ubi_leb_unmap" [fs/ubifs/ubifs.ko] undefined!
ERROR: "ubi_close_volume" [fs/ubifs/ubifs.ko] undefined!
ERROR: "ubi_get_volume_info" [fs/ubifs/ubifs.ko] undefined!
ERROR: "ubi_open_volume_path" [fs/ubifs/ubifs.ko] undefined!
ERROR: "ubi_sync" [fs/ubifs/ubifs.ko] undefined!
ERROR: "ubi_is_mapped" [fs/ubifs/ubifs.ko] undefined!
ERROR: "ubi_register_volume_notifier" [drivers/mtd/ubi/gluebi.ko]
undefined!
ERROR: "ubi_leb_read" [drivers/mtd/ubi/gluebi.ko] undefined!
ERROR: "ubi_leb_write" [drivers/mtd/ubi/gluebi.ko] undefined!
ERROR: "ubi_leb_erase" [drivers/mtd/ubi/gluebi.ko] undefined!
ERROR: "ubi_leb_unmap" [drivers/mtd/ubi/gluebi.ko] undefined!
ERROR: "ubi_open_volume" [drivers/mtd/ubi/gluebi.ko] undefined!
ERROR: "ubi_close_volume" [drivers/mtd/ubi/gluebi.ko] undefined!
ERROR: "ubi_unregister_volume_notifier" [drivers/mtd/ubi/gluebi.ko]
undefined!
ERROR: "onenand_scan" [drivers/mtd/onenand/onenand_sim.ko] undefined!
ERROR: "flexonenand_region" [drivers/mtd/onenand/onenand_sim.ko]
undefined!
ERROR: "onenand_addr" [drivers/mtd/onenand/onenand_sim.ko] undefined!
ERROR: "onenand_release" [drivers/mtd/onenand/onenand_sim.ko] undefined!
ERROR: "onenand_scan" [drivers/mtd/onenand/generic.ko] undefined!
ERROR: "onenand_release" [drivers/mtd/onenand/generic.ko] undefined!
ERROR: "nand_scan_tail" [drivers/mtd/nand/sm_common.ko] undefined!
ERROR: "nand_scan_ident" [drivers/mtd/nand/sm_common.ko] undefined!
ERROR: "nand_release" [drivers/mtd/nand/r852.ko] undefined!
ERROR: "nand_scan" [drivers/mtd/nand/plat_nand.ko] undefined!
ERROR: "nand_release" [drivers/mtd/nand/plat_nand.ko] undefined!
ERROR: "nand_default_bbt" [drivers/mtd/nand/nandsim.ko] undefined!
ERROR: "nand_scan" [drivers/mtd/nand/nandsim.ko] undefined!
ERROR: "nand_release" [drivers/mtd/nand/nandsim.ko] undefined!
ERROR: "nand_scan" [drivers/mtd/nand/diskonchip.ko] undefined!
ERROR: "nand_scan_bbt" [drivers/mtd/nand/diskonchip.ko] undefined!
ERROR: "nand_release" [drivers/mtd/nand/diskonchip.ko] undefined!
ERROR: "nand_release" [drivers/mtd/nand/denali.ko] undefined!
ERROR: "nand_scan_tail" [drivers/mtd/nand/denali.ko] undefined!
ERROR: "nand_scan_ident" [drivers/mtd/nand/denali.ko] undefined!
ERROR: "nand_release" [drivers/mtd/nand/cafe_nand.ko] undefined!
ERROR: "nand_scan_tail" [drivers/mtd/nand/cafe_nand.ko] undefined!
ERROR: "nand_scan_ident" [drivers/mtd/nand/cafe_nand.ko] undefined!
ERROR: "nand_wait_ready" [drivers/mtd/nand/cafe_nand.ko] undefined!
ERROR: "lpddr_cmdset" [drivers/mtd/lpddr/qinfo_probe.ko] undefined!
make[1]: *** [__modpost] Error 1
make: *** [modules] Error 2

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
