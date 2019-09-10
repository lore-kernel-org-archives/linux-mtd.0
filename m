Return-Path: <SRS0=z5Ut=XF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E60CBC3A5A2
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Sep 2019 13:10:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B715D2067B
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Sep 2019 13:10:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LHF9/Bkb";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bve96gsb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B715D2067B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=nI8OPjlDJJrTwjZcionoSa6bv4s48BuynjnYQj2/cWA=; b=LHF
	9/BkbyLtILov9zAxlbTta9cowyMrEBtWtAPkd6CcQLG/tE2UsH9atdSuxIYaeGTZ1Wkc1IDGWfc13
	D6ooPpufo9pkdilHP+mK8UdFBpO9HZKlNEgtxCoTmgVHozR9MRU6KBVSAa5xgYDC3d7UKN8t/j3a0
	5XPLQ101m6CW6gKQsHx2AumWhQGSJ26omo3fFXO1mnDsoyhQYUEPJFv+PUWznNZPaBQWHE6P/iqjv
	vG103sfQscFBgu1w723LmCxD7XUL+ZOnUSy0+JfAcejQUqZpRhQDTziQyE6G8erYCPgqMXkHV1Kir
	z4sgyJOJs94dlYoQR2EHCyr3GmhubYQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i7fv5-0002p8-Tm; Tue, 10 Sep 2019 13:10:55 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i7fuz-0002od-5W
 for linux-mtd@lists.infradead.org; Tue, 10 Sep 2019 13:10:54 +0000
Received: by mail-lf1-x12b.google.com with SMTP id q27so13376243lfo.10
 for <linux-mtd@lists.infradead.org>; Tue, 10 Sep 2019 06:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=Tx6yOSUMBiNiRqxIahD0N7yaRqlKG8d20mLQhx3YwWw=;
 b=Bve96gsbTbGW6hg/f0oaL1xj61B3sliZ+GFAzSkyI+/QZEmp5YMqoUvrLKcX2PgyeX
 hxk+2yB3GM8Dit+Tluyuoz9gu8IoHvSavmcUt0WWxeo82s95f4zNYjg3YfoAdep57Emb
 9giRywwVJWvCuIWbAEt7y9vuVmfJNAEp0zCfOj+kk+jlMh7DOwCl1rVJsaE+ubrRNL7i
 ZK63aVlHIFfDcHzXy2foRUlB3bN+esYhKp15dlQ54q8C9o0Ne51aJ7pRpz4zuMuH6EmJ
 06v5zKNj0PGsF4gW0LUtzWiyupqgqOQa6p+kW8bKM2dyt5ky9pcLzJktpAwreScRucYQ
 0eHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=Tx6yOSUMBiNiRqxIahD0N7yaRqlKG8d20mLQhx3YwWw=;
 b=QkyAa/y7fZXzLVhKBMDY3OTqjWBzA5j85IimSo+e9B+IRTs21yBRu0S9WGChOdkP7U
 MyNdeANI60kGUroGHUtYuMIaeZl/zKRjk//kDDLGXjnUki7tsqcj+zObe0RLr24nv8S9
 mZZ1lXwsrzjq/QZEWDVH7TkvxVamrK4X1g9X4K4NLUxHRtYyqt1efD0fvpalPJRCsRXL
 WSqRwhCZvtIvoj1oMZN7M7tJR97RTH9RSe3T98d9aaQ0in1RhK9eyatKWKVpOk4nU3ti
 /DwI75XdERY500D12S3U2SN67xymUhGhV4PMHdmkvyrLf39Kiu4JFpOkW+TUZC9Ci54b
 TKog==
X-Gm-Message-State: APjAAAU5n9nAZTNyoXgRsu5B/iJ6fr9lWWtqx67tcYOhsjW/Tbxru2YC
 468nd8NUECsAlAi3rj7hfAi0Dspt8sAZo4n4L6Y0BIcT
X-Google-Smtp-Source: APXvYqyCn+vc+L44PaKa1HfWhpmDuzFasdlkODXrjmM8UPnSqdy6+auM0XpCQBRK2F7rMYR0mbLNyNAsZZCpxH6FCVA=
X-Received: by 2002:a19:c649:: with SMTP id w70mr20927470lff.33.1568121045493; 
 Tue, 10 Sep 2019 06:10:45 -0700 (PDT)
MIME-Version: 1.0
From: Boris Stein <boris.stein@gmail.com>
Date: Tue, 10 Sep 2019 16:10:34 +0300
Message-ID: <CAFkQurKLwUdGSPNPLYLTrV7-fkWaL5RuP9up0nrN62L4pr-ivg@mail.gmail.com>
Subject: cannot ubiupdatevol squashfs image
To: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190910_061052_601486_2E88B3B6 
X-CRM114-Status: UNSURE (   7.90  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,
I am implementing recovery mechanism where i need to flash/update
squashfs volume.
But so far failed

Using the following ubi configuration to create image:

[sysfs_volume]
mode=ubi
image=machine-image.squashfs
vol_id=0
vol_type=dynamic
vol_name=rootfs
vol_size=55MiB
[md_rootfs_volume]
mode=ubi
image=machine-image.squashfs.verity
vol_id=1
vol_type=dynamic
vol_name=md-rootfs
vol_size=1MiB
[sdatafs_volume]
mode=ubi
image=sdata.squashfs
vol_id=2
vol_type=dynamic
vol_name=sdatafs
vol_size=8MiB
[md_sdatafs_volume]
mode=ubi
image=sdata.squashfs.verity
vol_id=3
vol_type=dynamic
vol_name=md-sdatafs
vol_size=1MiB
[cache_volume]
mode=ubi
vol_id=4
vol_type=dynamic
vol_name=cachefs
vol_size=154MiB
[systemrw_volume]
mode=ubi
vol_id=5
vol_type=dynamic
vol_name=systemrw
vol_size=6MiB
[persist_volume]
mode=ubi
vol_id=6
vol_type=dynamic
vol_name=persist
vol_size=6MiB
[usrfs_volume]
mode=ubi
image=usrfs.ubifs
vol_id=7
vol_type=dynamic
vol_name=usrfs
vol_flags = autoresize
========

The failure happens when updating "rootfs" volume 0 using
ubiupdatevol, which is our root file system, using squashfs (fastmap
enabled)

The size of new " machine-image.squashfs " is  43257856.
Using "ubiupdatevol" in recovery mode, no errors observed:

[   10.813659] MTD : Attaching UBI device /dev/mtdblock25 for system @1
[   10.821989] ubi1: attaching mtd25
[   11.933699] ubi1: scanning is finished
[   11.940405] CHRDEV "ubi1" major number 233 goes below the dynamic
allocation range
[   11.977933] ubi1: attached mtd25 (name "system", size 319 MiB)
[   11.977965] ubi1: PEB size: 262144 bytes (256 KiB), LEB size: 253952 bytes
[   12.020256] ubi1: min./max. I/O unit sizes: 4096/4096, sub-page size 4096
[   12.020287] ubi1: VID header offset: 4096 (aligned 4096), data offset: 8192
[   12.034289] ubi1: good PEBs: 1279, bad PEBs: 0, corrupted PEBs: 0
[   12.034320] ubi1: user volume: 8, internal volumes: 1, max. volumes
count: 128
[   12.054275] ubi1: max/mean erase counter: 2/0, WL threshold: 4096,
image sequence number: 796905358
[   12.054308] ubi1: available PEBs: 0, total reserved PEBs: 1279,
PEBs reserved for bad PEB handling: 40
[   12.064001] ubi1: background thread "ubi_bgt1d" started, PID 500
UBI device number 1, total 1279 LEBs (324804608 bytes, 309.7 MiB),
available 0 LEBs (0 bytes), LEB size 253952 bytes (248.0 KiB)
[   12.099084] /dev/ubi1 created
[   12.099353] /dev/ubi1_0 created, proceeding
[   12.104307] /dev/ubi1_1 created, proceeding
[   12.104587] /dev/ubi1_2 created, proceeding
[   12.104772] /dev/ubi1_3 created, proceeding
[   12.105002] /dev/ubi1_4 not yet created, checking again ..
[   12.182398] /dev/ubi1_4 created, proceeding
[   12.182649] /dev/ubi1_5 created, proceeding
[   12.182828] /dev/ubi1_6 created, proceeding
[   12.182995] /dev/ubi1_7 created, proceeding
[   12.433175] MTD : Looking for UBI volume : /cache for cachefs
[   12.617237] Found Volume: cachefs
[   12.640165] UBIFS (ubi1:4): background thread "ubifs_bgt1_4" started, PID 534
[   12.700176] UBIFS (ubi1:4): recovery needed
[   12.818233] UBIFS (ubi1:4): recovery completed
[   12.818413] UBIFS (ubi1:4): UBIFS: mounted UBI device 1, volume 4,
name "cachefs"
[   12.821615] UBIFS (ubi1:4): LEB size: 253952 bytes (248 KiB),
min./max. I/O unit sizes: 4096 bytes/4096 bytes
[   12.829126] UBIFS (ubi1:4): FS size: 158973952 bytes (151 MiB, 626
LEBs), journal size 7872512 bytes (7 MiB, 31 LEBs)
[   12.839034] UBIFS (ubi1:4): reserved for root: 4952683 bytes (4836 KiB)
[   12.849620] UBIFS (ubi1:4): media format: w4/r0 (latest is w4/r0),
UUID AEF335FC-4B15-4588-BDD8-6731D5EFDF11, small LPT model
[   12.859249] MTD : Mounting of /dev/ubi1_4 on /cache done
[   13.325589] Detected block device : /misc for misc
[   13.369449] Mounting of /dev/mtdblock18 on /misc done
mount: mounting /dev/mtdblock18 on /misc failed: No such device
[   13.434608] rc (284) used greatest stack depth: 5164 bytes left

Starting Recovery
Starting recovery on Wed Jan  7 20:59:59 1970
Starting recovery (pid 663) on Wed Jan  7 20:59:59 1970[   14.531474]
fs_mgr: Warning: unknown flag 0
[   14.535375] fs_mgr: Warning: unknown flag 0

recovery filesystem table
=========================
  0 /cache ubifs /dev/ubi1_4 0
  1 /misc mtd /dev/mtdblock18 0
  2 /mnt/fota ramdisk ramdisk 0

mtd: successfully wrote block at 0
I:Set boot command "boot-recovery"
locale is [en_US]
stage is []
reason is [(null)]
Execute command /usr/sbin/ubiupdatevol /dev/ubi1_0 /cache/fota/rootfs.squashfs
invoking reboot
[   24.672514] reboot: Restarting system


But then there is a failure when system boots:


[    0.000000] Linux version 4.9.155 (oe-user@oe-host) (gcc version
6.4.0 (GCC) ) #1 PREEMPT Mon Sep 9 05:35:36 UTC 2019



[    2.483342] msm_nand_parse_smem_ptable: Parsing partition table
info from SMEM
[    2.490265] msm_nand_parse_smem_ptable: SMEM partition table found:
ver: 4 len: 26
[    2.497490] msm_nand_version_check: nand_major:1, nand_minor:5,
qpic_major:1, qpic_minor:5
[    2.505471] msm_nand_flash_onfi_probe: CRC Check failed on param page
[    2.513310] msm_nand_scan: NAND Id: 0x2680ac2c Buswidth: 8Bits
Density: 512 MByte
[    2.519771] msm_nand_scan: pagesize: 4096 Erasesize: 262144
oobsize: 256 (in Bytes)
[    2.527249] msm_nand_scan: BCH ECC: 8 Bit
[    2.534714] msm_nand_scan: CFG0: 0x290409c0,           CFG1: 0x08045d5c
[    2.534714]             RAWCFG0: 0x2b8401c0,        RAWCFG1: 0x0005055d
[    2.534714]           ECCBUFCFG: 0x00000203,      ECCBCHCFG: 0x42040d10
[    2.534714]           RAWECCCFG: 0x42000d11, BAD BLOCK BYTE: 0x00000175
[    2.542870] Creating 26 MTD partitions on "1b00000.nand":
[    2.565106] 0x000000000000-0x000000280000 : "sbl"
[    2.572965] 0x000000280000-0x000000500000 : "mibib"
[    2.577494] 0x000000500000-0x000001000000 : "efs2"
[    2.585217] 0x000001000000-0x0000011c0000 : "tz"
[    2.587075] 0x0000011c0000-0x0000012c0000 : "tz_devcfg"
[    2.591275] 0x0000012c0000-0x000001440000 : "ddr"
[    2.596360] 0x000001440000-0x000001540000 : "apdp"
[    2.601127] 0x000001540000-0x000001640000 : "xbl_config"
[    2.605727] 0x000001640000-0x000001740000 : "multi_image"
[    2.611282] 0x000001740000-0x000001840000 : "aop"
[    2.616490] 0x000001840000-0x000001940000 : "qhee"
[    2.621221] 0x000001940000-0x000001a40000 : "abl"
[    2.625813] 0x000001a40000-0x000001cc0000 : "uefi"
[    2.631250] 0x000001cc0000-0x000001e40000 : "toolsfv"
[    2.635499] 0x000001e40000-0x000001fc0000 : "loader_sti"
[    2.640688] 0x000001fc0000-0x000002f00000 : "boot"
[    2.651010] 0x000002f00000-0x000003000000 : "scrub"
[    2.652636] 0x000003000000-0x000008140000 : "modem"
[    2.685041] 0x000008140000-0x000008300000 : "misc"
[    2.686886] 0x000008300000-0x000008480000 : "devinfo"
[    2.690509] 0x000008480000-0x000009180000 : "recovery"
[    2.699717] 0x000009180000-0x000009340000 : "fota"
[    2.701645] 0x000009340000-0x00000be40000 : "recoveryfs"
[    2.720416] 0x00000be40000-0x00000bf40000 : "sec"
[    2.722076] 0x00000bf40000-0x00000c040000 : "data"
[    2.725631] 0x00000c040000-0x000020000000 : "system"
[    2.844662] msm_nand_probe: NANDc phys addr 0x1b00000, BAM phys
addr 0x1b04000, BAM IRQ 22
[    2.844691] msm_nand_probe: Allocated DMA buffer at virt_addr
0xdec58000, phys_addr 0x9ec58000

[    5.919637] ubi0: attaching mtd25
[    7.038038] ubi0: scanning is finished
[    7.048738] ubi0: attached mtd25 (name "system", size 319 MiB)
[    7.048767] ubi0: PEB size: 262144 bytes (256 KiB), LEB size: 253952 bytes
[    7.053530] ubi0: min./max. I/O unit sizes: 4096/4096, sub-page size 4096
[    7.060333] ubi0: VID header offset: 4096 (aligned 4096), data offset: 8192
[    7.067173] ubi0: good PEBs: 1279, bad PEBs: 0, corrupted PEBs: 0
[    7.073956] ubi0: user volume: 8, internal volumes: 1, max. volumes
count: 128
[    7.080208] ubi0: max/mean erase counter: 2/1, WL threshold: 4096,
image sequence number: 796905358
[    7.087316] ubi0: available PEBs: 0, total reserved PEBs: 1279,
PEBs reserved for bad PEB handling: 40
[    7.096278] ubi0: background thread "ubi_bgt0d" started, PID 207
[    7.105838] cpuidle: enable-method property 'psci' found operations
[    7.106471] lpm_levels_of: Residency < 0 for LPM
[    7.106475] lpm_levels_of: idx 1 420
[    7.106478] lpm_levels_of: Residency < 0 for LPM
[    7.106480] lpm_levels_of: idx 2 500
[    7.106483] lpm_levels_of: idx 2 3040
[    7.106693] lpm_levels: register_cluster_lpm_stats()
[    7.108873] rmnet_ipa3 started initialization
[    7.109878] RNDIS_IPA module is loaded.
[    7.109878] audio_pdr_late_init get_service_location failed ret -19
[    7.110531] msm_bus_late_init: Remove handoff bw requests
[    7.135649] vreg_sd_mmc: disabling
[    7.135656] emac_phy: disabling
[    7.135661] rgmii_io_pads: disabling
[    7.135668] vreg_wlan: disabling
[    7.135672] ALSA devic[    7.193476] Freeing unused kernel memory: 1024K
/etc/mdev/iio.sh: .: line 19: can't open
'/sys/bus/i2c/devices/*-006*/iio:device?*/uevent'
[    7.697004] iio.sh (216) used greatest stack depth: 6288 bytes left
/etc/mdev/iio.sh: .: line 19: can't open
'/sys/bus/i2c/devices/*-006*/iio:device?*/uevent'
[    7.730144] iio.sh (218) used greatest stack depth: 6256 bytes left
mkdir: can't create directory '/mnt/sdcard/': No such file or directory
mount: mounting /dev/mmcblk0p1 on /mnt/sdcard/ failed: No such file or directory
[    8.038745] mdev (214) used greatest stack depth: 6000 bytes left
mdm-init : Detected block device : 25 for system
[    8.051651] ubi: mtd25 is already attached to ubi0ubiattach:
error!: cannot attach mtd25
           error 17 (File exists)
[    8.107261] Waiting for ubinfo for md-rootfs
[    8.107431] Done ubinfo for md-rootfs, volume ID: 1
[    8.111069] Waiting for /dev/ubi0_1
[    8.115328] Done waiting for /dev/ubi0_1
[    8.124406] block ubiblock0_1: created from ubi0:1(md-rootfs)
[    8.125039] Waiting for /dev/ubiblock0_1
[    8.186355] Done waiting for /dev/ubiblock0_1
[    8.216688] Waiting for ubinfo for rootfs
[    8.216872] Done ubinfo for rootfs, volume ID: 0
[    8.219764] Waiting for /dev/ubi0_0
[    8.224833] Done waiting for /dev/ubi0_0
[    8.233326] block ubiblock0_0: created from ubi0:0(rootfs)
[    8.233943] Waiting for /dev/ubiblock0_0
[    8.301729] Done waiting for /dev/ubiblock0_0
[    8.614592] 1911 device_is_secure: #########################
device_is_secure=0
[    8.651724] Waiting for ubinfo for md-sdatafs
[    8.651900] Done ubinfo for md-sdatafs, volume ID: 3
[    8.655158] Waiting for /dev/ubi0_3
[    8.660428] Done waiting for /dev/ubi0_3
[    8.668817] block ubiblock0_3: created from ubi0:3(md-sdatafs)
[    8.669459] Waiting for /dev/ubiblock0_3
[    8.734968] Done waiting for /dev/ubiblock0_3
[    8.766984] Waiting for ubinfo for sdatafs
[    8.767156] Done ubinfo for sdatafs, volume ID: 2
[    8.770369] Waiting for /dev/ubi0_2
[    8.774891] Done waiting for /dev/ubi0_2
[    8.783874] block ubiblock0_2: created from ubi0:2(sdatafs)
[    8.784493] Waiting for /dev/ubiblock0_2
[    8.851409] Done waiting for /dev/ubiblock0_2
[    8.913053] 1911 device_is_secure: #########################
device_is_secure=0
mount: mounting /dev on /system/dev failed: Invalid argument
mount: mounting /dev/pts on /system/dev/pts failed: No such file or directory
[    9.006327] SQUASHFS error: zlib decompression failed, data probably corrupt
[    9.006359] SQUASHFS error: squashfs_read_data failed to read block 0x785a5a
[    9.012677] SQUASHFS error: Unable to read fragment cache entry [785a5a]
[    9.019470] SQUASHFS error: Unable to read page, block 785a5a, size d6b4
[    9.026242] SQUASHFS error: Unable to read fragment cache entry [785a5a]
[    9.032876] SQUASHFS error: Unable to read page, block 785a5a, size d6b4
[    9.039529] SQUASHFS error: Unable to read fragment cache entry [785a5a]
[    9.046225] SQUASHFS error: Unable to read page, block 785a5a, size d6b4
[    9.052910] SQUASHFS error: Unable to read fragment cache entry [785a5a]
[    9.059573] SQUASHFS error: Unable to read page, block 785a5a, size d6b4
[    9.066281] SQUASHFS error: Unable to read fragment cache entry [785a5a]
[    9.072954] SQUASHFS error: Unable to read page, block 785a5a, size d6b4


Please adivse,

Regards,
Boris

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
