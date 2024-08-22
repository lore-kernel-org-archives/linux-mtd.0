Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D414C3DA4A
	for <linux-mtd@archiver.kernel.org>; Thu, 22 Aug 2024 13:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:From:To:MIME-Version:Date:Message-ID:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KbPMZnn6eDHysgLT1Ft42MXbiTxuTPGYQ9xEL1/F7/c=; b=htkKueCAcdbOS/
	FNqAEA8C0UDc1JBNM3ABf0YpuSPc3JHztSQo6RviCIUnMVmESfSXiaj4PfudzepUFhZN9Q1DydiYW
	72GEiuwucHs0sahiGG9PcMPVtaRq4d6+A59ojgadqF3likaZvRmveZhasbMuVZkyoA7e2TBCZUbP5
	6egWjsDDzaZgzCYCPFnRzGSsJL5bdZ+yR/EP7Fu3HE+S1bekuiqwBqu8XNfF5V5nOAxZh5/AguC0a
	sRLb5bE0C48sqloePJ0yi1/8JNlB0EgaHGciFpePF3hefpdFqRQe2eO4FpyTSuk8t6g4pveTqpjzi
	A68PA7GMPKLJ5nuHTxhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sh7fH-0000000Ct1l-1Xns;
	Thu, 22 Aug 2024 13:15:47 +0000
Received: from smtp125.iad3b.emailsrvr.com ([146.20.161.125])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sh7fD-0000000Ct0l-0VU2
	for linux-mtd@lists.infradead.org;
	Thu, 22 Aug 2024 13:15:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mev.co.uk;
	s=20221208-6x11dpa4; t=1724332539;
	bh=KcwxoegHSkI7dfjDERXRjYzBEJLQ9TG7YVPQa4H4Bek=;
	h=Date:To:From:Subject:From;
	b=AUtIV80rE89A8Fvk/n1j4mAjxBS0rXoX7zEVFC3yzNN2n0sIFwzW8fDsTIjAlwvN0
	 XxUD1IOVbWQF/6EyBxGqT8D90BBK+4WvEFSqnhqfhx/RiRYkSL7pk8Ga0FfbwjlnzX
	 P8GpJKTZmceD2LU+S/nutVfkzGA7DX3mY/nUJ/yY=
X-Auth-ID: abbotti@mev.co.uk
Received: by smtp16.relay.iad3b.emailsrvr.com (Authenticated sender: abbotti-AT-mev.co.uk) with ESMTPSA id CCF4BC0268
	for <linux-mtd@lists.infradead.org>; Thu, 22 Aug 2024 09:15:38 -0400 (EDT)
Message-ID: <dfbf2546-7211-4b4e-a963-ec32e6b3810a@mev.co.uk>
Date: Thu, 22 Aug 2024 14:15:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: linux-mtd@lists.infradead.org
From: Ian Abbott <abbotti@mev.co.uk>
Subject: Problems mounting dirty UBIFS on NOR flash with cadence QSPI
 controller
Organization: MEV Ltd.
X-Classification-ID: 3ff56e04-b5e3-4fac-95c8-c01370b7be39-1-1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240822_061543_414755_48CE6281 
X-CRM114-Status: GOOD (  11.77  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello,

I'm currently investigating some UBIFS mount failures on an embedded 
system under development.

The system is based on an Altera Cyclone V SoCFPGA (armv7l) platform, 
currently running kernel 6.6.36 (with a few patches for runtime DT 
overlay support and one or two unrelated driver bug fixes).  This uses a 
Cadence QSPI controller (compatible="intel,socfpga-qspi", driver = 
spi-cadence-quadspi, quirks = CQSPI_DISABLE_DAC_MODE | 
CQSPI_NO_SUPPORT_WR_COMPLETION | CQSPI_SLOW_SRAM).  The SPI NOR flash 
device is a Cypress (Spansion) S25FL256S1.  The flash device has been 
partitioned with a single UBI partition filling the device, and contains 
a single UBIFS volume.

% mtdinfo -a
Count of MTD devices:           1
Present MTD devices:            mtd0
Sysfs interface supported:      yes

mtd0
Name:                           ubi
Type:                           nor
Eraseblock size:                65536 bytes, 64.0 KiB
Amount of eraseblocks:          512 (33554432 bytes, 32.0 MiB)
Minimum input/output unit size: 1 byte
Sub-page size:                  1 byte
Character device major/minor:   90:0
Bad blocks are allowed:         false
Device is writable:             true

The UBIFS volume started off mostly empty, but was deliberately dirtied 
by creating a file over and over again with the same name, and 4096 
bytes of random data, and then cutting power to the system.

When the UBIFS volume is in this dirty state, attempts to mount the 
dirty UBIFS volume result in timeouts, and further attempt to access the 
MTD device result in further timeouts, even after removing the 
spi-cadence-quadspi and spi-nor kernel modules and reloading them.  A 
complete reboot gets the controllers back in a sensible state, but the 
problems reoccur when attempting to mount the still dirty UBIFS volume 
again.

Here are some kernel logs with debugging turned on for the ubi, ubifs, 
and spi-nor modules.  I have removed the initial part of the logs until 
the interesting bit where it recovers a corrupted LEB and erases a PEB 
while reading some other LEBs.  In the logs below, pid 430 is the mount 
process, and pid 167 is the background thread for the UBI device:

-------------------------------[8<]----------------------------------
[  317.968185] UBIFS DBG mnt (pid 430): replay bud LEB 13, head 2, offs 
80, is_last 1
[  317.968210] UBIFS DBG rcvry (pid 430): 13:80, jhead 2, grouped 1
[  317.968227] UBIFS DBG scan (pid 430): scan LEB 13:80
[  317.968244] UBI DBG gen (pid 430): read 65328 bytes from LEB 0:13:80
[  317.968263] UBI DBG eba (pid 430): read 65328 bytes from offset 80 of 
LEB 0:13, PEB 149
[  317.968284] UBI DBG io (pid 430): read 65328 bytes from PEB 149:208
[  317.968311] spi-nor spi2.0: from 0x009500d0, len 65328
[  317.979912] UBIFS DBG scan (pid 430): look at LEB 13:80 (65328 bytes 
left)
[  317.979946] UBIFS DBG scan (pid 430): hit empty space at LEB 13:80
[  317.979961] UBIFS DBG rcvry (pid 430): found corruption (-1) at 13:80
[  317.980398] UBIFS DBG rcvry (pid 430): cleaning corruption at 13:80
[  317.980434] UBIFS DBG scan (pid 430): stop scanning LEB 13 at offset 80
[  317.980448] UBIFS DBG rcvry (pid 430): fixing LEB 13 start 80 endpt 80
[  317.980464] UBI DBG gen (pid 430): read 80 bytes from LEB 0:13:0
[  317.980485] UBI DBG eba (pid 430): read 80 bytes from offset 0 of LEB 
0:13, PEB 149
[  317.980503] UBI DBG io (pid 430): read 80 bytes from PEB 149:128
[  317.980528] spi-nor spi2.0: from 0x00950080, len 80
[  317.980702] UBI DBG gen (pid 430): atomically write 80 bytes to LEB 0:13
[  317.980743] UBI DBG eba (pid 430): change LEB 0:13
[  317.980768] UBI DBG wl (pid 430): PEB 150 EC 1
[  317.980782] UBI DBG wl (pid 430): added PEB 150 EC 1 to the 
protection queue
[  317.980797] UBI DBG eba (pid 430): write VID hdr and 80 bytes at 
offset 0 of LEB 0:13, PEB 150
[  317.980814] UBI DBG io (pid 430): write VID header to PEB 150
[  317.980830] UBI DBG io (pid 430): write 64 bytes to PEB 150:64
[  317.980851] spi-nor spi2.0: to 0x00960040, len 64
[  317.981916] UBI DBG io (pid 430): write 80 bytes to PEB 150:128
[  317.981956] spi-nor spi2.0: to 0x00960080, len 80
[  317.983099] UBI DBG wl (pid 430): PEB 149
[  317.983125] UBI DBG wl (pid 430): schedule erasure of PEB 149, EC 1, 
torture 0
[  317.983173] UBIFS DBG mnt (pid 430): bud LEB 13 replied: dirty 0, 
free 65328
[  317.983193] UBIFS DBG mnt (pid 430): replay bud LEB 14, head 1, offs 
0, is_last 0
[  317.983210] UBIFS DBG scan (pid 430): scan LEB 14:0
[  317.983226] UBI DBG gen (pid 430): read 65408 bytes from LEB 0:14:0
[  317.983244] UBI DBG eba (pid 430): read 65408 bytes from offset 0 of 
LEB 0:14, PEB 142
[  317.983263] UBI DBG io (pid 430): read 65408 bytes from PEB 142:128
[  317.983282] spi-nor spi2.0: from 0x008e0080, len 65408
[  317.983437] UBI DBG wl (pid 167): erase PEB 149 EC 1 LEB 0:13
[  317.983461] UBI DBG wl (pid 167): erase PEB 149, old EC 1
[  317.983482] UBI DBG io (pid 167): read EC header from PEB 149
[  317.983496] UBI DBG io (pid 167): read 64 bytes from PEB 149:0
[  317.983515] spi-nor spi2.0: from 0x00950000, len 64
[  318.000130] UBIFS DBG scan (pid 430): look at LEB 14:19872 (45536 
bytes left)
[  318.000143] UBIFS DBG scan (pid 430): scanning inode node at LEB 14:19872
[  318.000159] UBIFS DBG scan (pid 430): look at LEB 14:20032 (45376 
bytes left)
[  318.000172] UBIFS DBG scan (pid 430): scanning truncate node at LEB 
14:20032

etc.

[  318.012452] UBIFS DBG scan (pid 430): look at LEB 14:65176 (232 bytes 
left)
[  318.012468] UBIFS DBG scan (pid 430): scanning truncate node at LEB 
14:65176
[  318.012483] UBIFS DBG scan (pid 430): look at LEB 14:65232 (176 bytes 
left)
[  318.012496] UBIFS DBG scan (pid 430): hit empty space at LEB 14:65232
[  318.012509] UBIFS DBG scan (pid 430): stop scanning LEB 14 at offset 
65232
[  318.012530] UBIFS DBG mnt (pid 430): add LEB 14:0, key (94, inode)
[  318.012550] UBIFS DBG mnt (pid 430): add LEB 14:160, key (94, truncate)
[  318.012566] UBIFS DBG mnt (pid 430): add LEB 14:216, key (94, inode)
[  318.012582] UBIFS DBG mnt (pid 430): add LEB 14:376, key (94, truncate)

etc.

[  318.031260] UBIFS DBG mnt (pid 430): add LEB 14:64960, key (94, truncate)
[  318.031275] UBIFS DBG mnt (pid 430): add LEB 14:65016, key (94, inode)
[  318.031290] UBIFS DBG mnt (pid 430): add LEB 14:65176, key (94, truncate)
[  318.031307] UBIFS DBG mnt (pid 430): bud LEB 14 replied: dirty 16912, 
free 176
[  318.031623] UBI DBG gen (pid 430): read 4 bytes from LEB 0:16:0
[  318.031648] UBI DBG eba (pid 430): read 4 bytes from offset 0 of LEB 
0:16, PEB 144
[  318.031668] UBI DBG io (pid 430): read 4 bytes from PEB 144:128
[  318.031692] spi-nor spi2.0: from 0x00900080, len 4
[  318.097506] UBI DBG wl (pid 167): erased PEB 149, new EC 2
[  318.097539] UBI DBG io (pid 167): write EC header to PEB 149
[  318.097560] UBI DBG io (pid 167): write 64 bytes to PEB 149:0
[  318.097584] spi-nor spi2.0: to 0x00950000, len 64
[  318.598001] cadence-qspi ff705000.spi: Flash command execution timed out.
[  318.604848] spi-nor spi2.0: operation failed with -110
[  318.609990] ubi0 warning: ubi_io_read [ubi]: error -110 while reading 
4 bytes from PEB 144:128, read only 0 bytes, retry
[  318.610305] spi-nor spi2.0: from 0x00900080, len 4
[  319.113362] cadence-qspi ff705000.spi: QSPI is still busy after 500ms 
timeout.
[  319.120596] spi-nor spi2.0: operation failed with -110
[  319.125779] ubi0 warning: ubi_io_read [ubi]: error -110 while reading 
4 bytes from PEB 144:128, read only 0 bytes, retry
[  319.126186] spi-nor spi2.0: from 0x00900080, len 4
[  319.633343] cadence-qspi ff705000.spi: QSPI is still busy after 500ms 
timeout.
[  319.640579] spi-nor spi2.0: operation failed with -110
[  319.645760] ubi0 warning: ubi_io_read [ubi]: error -110 while reading 
4 bytes from PEB 144:128, read only 0 bytes, retry
[  319.646223] spi-nor spi2.0: from 0x00900080, len 4
[  320.153334] cadence-qspi ff705000.spi: QSPI is still busy after 500ms 
timeout.
[  320.160565] spi-nor spi2.0: operation failed with -110
[  320.165756] ubi0 error: ubi_io_read [ubi]: error -110 while reading 4 
bytes from PEB 144:128, read 0 bytes
[  320.175721] CPU: 1 PID: 430 Comm: mount Tainted: G           O 
6.6.36-its-ipt4v3 #1
[  320.175747] Hardware name: Altera SOCFPGA
[  320.175767]  unwind_backtrace from show_stack+0x18/0x1c
[  320.175810]  show_stack from dump_stack_lvl+0x40/0x4c
[  320.175836]  dump_stack_lvl from ubi_io_read+0x160/0x37c [ubi]
[  320.176106]  ubi_io_read [ubi] from ubi_eba_read_leb+0xa4/0x438 [ubi]
[  320.176541]  ubi_eba_read_leb [ubi] from ubi_leb_read+0x88/0xf4 [ubi]
[  320.176986]  ubi_leb_read [ubi] from ubifs_leb_read+0x34/0x80 [ubifs]
[  320.177701]  ubifs_leb_read [ubifs] from 
ubifs_replay_journal+0xda4/0x1644 [ubifs]
[  320.178531]  ubifs_replay_journal [ubifs] from 
ubifs_mount+0x4cc/0x1cc0 [ubifs]
[  320.179370]  ubifs_mount [ubifs] from legacy_get_tree+0x2c/0x54
[  320.179800]  legacy_get_tree from vfs_get_tree+0x2c/0x114
[  320.179835]  vfs_get_tree from vfs_cmd_create+0x64/0xd0
[  320.179865]  vfs_cmd_create from sys_fsconfig+0x474/0x52c
[  320.179895]  sys_fsconfig from ret_fast_syscall+0x0/0x1c
[  320.179920] Exception stack(0xf4761fa8 to 0xf4761ff0)
[  320.179939] 1fa0:                   00000000 00ec9eb0 00000003 
00000006 00000000 00000000
[  320.179957] 1fc0: 00000000 00ec9eb0 00020000 000001af b6f57e3c 
b6f5877c b6f58000 00ec968c
[  320.179971] 1fe0: b6f58384 befc6a50 b6f3887b b6ec559a
[  320.179992] UBIFS error (ubi0:0 pid 430): ubifs_leb_read [ubifs]: 
reading 4 bytes from LEB 16:0 failed, error -110
[  320.190823] CPU: 1 PID: 430 Comm: mount Tainted: G           O 
6.6.36-its-ipt4v3 #1
[  320.190852] Hardware name: Altera SOCFPGA
[  320.190868]  unwind_backtrace from show_stack+0x18/0x1c
[  320.190909]  show_stack from dump_stack_lvl+0x40/0x4c
[  320.190934]  dump_stack_lvl from ubifs_leb_read+0x7c/0x80 [ubifs]
[  320.191397]  ubifs_leb_read [ubifs] from 
ubifs_replay_journal+0xda4/0x1644 [ubifs]
[  320.192210]  ubifs_replay_journal [ubifs] from 
ubifs_mount+0x4cc/0x1cc0 [ubifs]
[  320.193033]  ubifs_mount [ubifs] from legacy_get_tree+0x2c/0x54
[  320.193478]  legacy_get_tree from vfs_get_tree+0x2c/0x114
[  320.193513]  vfs_get_tree from vfs_cmd_create+0x64/0xd0
[  320.193543]  vfs_cmd_create from sys_fsconfig+0x474/0x52c
[  320.193572]  sys_fsconfig from ret_fast_syscall+0x0/0x1c
[  320.193597] Exception stack(0xf4761fa8 to 0xf4761ff0)
[  320.193615] 1fa0:                   00000000 00ec9eb0 00000003 
00000006 00000000 00000000
[  320.193634] 1fc0: 00000000 00ec9eb0 00020000 000001af b6f57e3c 
b6f5877c b6f58000 00ec968c
[  320.193647] 1fe0: b6f58384 befc6a50 b6f3887b b6ec559a
[  320.193749] UBIFS DBG mnt (pid 430): replay bud LEB 17, head 1, offs 
0, is_last 0
[  320.193778] UBIFS DBG scan (pid 430): scan LEB 17:0
[  320.193797] UBI DBG gen (pid 430): read 65408 bytes from LEB 0:17:0
[  320.193817] UBI DBG eba (pid 430): read 65408 bytes from offset 0 of 
LEB 0:17, PEB 143
[  320.193836] UBI DBG io (pid 430): read 65408 bytes from PEB 143:128
[  320.193859] spi-nor spi2.0: from 0x008f0080, len 65408
[  320.703328] cadence-qspi ff705000.spi: QSPI is still busy after 500ms 
timeout.
[  320.710556] spi-nor spi2.0: operation failed with -110
[  320.715761] ubi0 warning: ubi_io_read [ubi]: error -110 while reading 
65408 bytes from PEB 143:128, read only 0 bytes, retry
[  320.718370] spi-nor spi2.0: from 0x008f0080, len 65408
[  321.223330] cadence-qspi ff705000.spi: QSPI is still busy after 500ms 
timeout.
[  321.230573] spi-nor spi2.0: operation failed with -110
[  321.235748] ubi0 warning: ubi_io_read [ubi]: error -110 while reading 
65408 bytes from PEB 143:128, read only 0 bytes, retry
[  321.236289] spi-nor spi2.0: from 0x008f0080, len 65408
[  321.743324] cadence-qspi ff705000.spi: QSPI is still busy after 500ms 
timeout.
[  321.750555] spi-nor spi2.0: operation failed with -110
[  321.755732] ubi0 warning: ubi_io_read [ubi]: error -110 while reading 
65408 bytes from PEB 143:128, read only 0 bytes, retry
[  321.756179] spi-nor spi2.0: from 0x008f0080, len 65408
[  322.263322] cadence-qspi ff705000.spi: QSPI is still busy after 500ms 
timeout.
[  322.270550] spi-nor spi2.0: operation failed with -110
[  322.275720] ubi0 error: ubi_io_read [ubi]: error -110 while reading 
65408 bytes from PEB 143:128, read 0 bytes
[  322.286026] CPU: 1 PID: 430 Comm: mount Tainted: G           O 
6.6.36-its-ipt4v3 #1
[  322.286050] Hardware name: Altera SOCFPGA
[  322.286067]  unwind_backtrace from show_stack+0x18/0x1c
[  322.286111]  show_stack from dump_stack_lvl+0x40/0x4c
[  322.286138]  dump_stack_lvl from ubi_io_read+0x160/0x37c [ubi]
[  322.286409]  ubi_io_read [ubi] from ubi_eba_read_leb+0xa4/0x438 [ubi]
[  322.286846]  ubi_eba_read_leb [ubi] from ubi_leb_read+0x88/0xf4 [ubi]
[  322.287280]  ubi_leb_read [ubi] from ubifs_leb_read+0x34/0x80 [ubifs]
[  322.287975]  ubifs_leb_read [ubifs] from ubifs_start_scan+0x80/0x104 
[ubifs]
[  322.288787]  ubifs_start_scan [ubifs] from ubifs_scan+0x2c/0x2e0 [ubifs]
[  322.289591]  ubifs_scan [ubifs] from 
ubifs_replay_journal+0x3fc/0x1644 [ubifs]
[  322.290395]  ubifs_replay_journal [ubifs] from 
ubifs_mount+0x4cc/0x1cc0 [ubifs]
[  322.291206]  ubifs_mount [ubifs] from legacy_get_tree+0x2c/0x54
[  322.291635]  legacy_get_tree from vfs_get_tree+0x2c/0x114
[  322.291670]  vfs_get_tree from vfs_cmd_create+0x64/0xd0
[  322.291700]  vfs_cmd_create from sys_fsconfig+0x474/0x52c
[  322.291729]  sys_fsconfig from ret_fast_syscall+0x0/0x1c
[  322.291754] Exception stack(0xf4761fa8 to 0xf4761ff0)
[  322.291773] 1fa0:                   00000000 00ec9eb0 00000003 
00000006 00000000 00000000
[  322.291791] 1fc0: 00000000 00ec9eb0 00020000 000001af b6f57e3c 
b6f5877c b6f58000 00ec968c
[  322.291805] 1fe0: b6f58384 befc6a50 b6f3887b b6ec559a
[  322.291825] UBIFS error (ubi0:0 pid 430): ubifs_leb_read [ubifs]: 
reading 65408 bytes from LEB 17:0 failed, error -110
[  322.302953] CPU: 1 PID: 430 Comm: mount Tainted: G           O 
6.6.36-its-ipt4v3 #1
[  322.302977] Hardware name: Altera SOCFPGA
[  322.302990]  unwind_backtrace from show_stack+0x18/0x1c
[  322.303028]  show_stack from dump_stack_lvl+0x40/0x4c
[  322.303053]  dump_stack_lvl from ubifs_leb_read+0x7c/0x80 [ubifs]
[  322.303507]  ubifs_leb_read [ubifs] from ubifs_start_scan+0x80/0x104 
[ubifs]
[  322.304335]  ubifs_start_scan [ubifs] from ubifs_scan+0x2c/0x2e0 [ubifs]
[  322.305156]  ubifs_scan [ubifs] from 
ubifs_replay_journal+0x3fc/0x1644 [ubifs]
[  322.305962]  ubifs_replay_journal [ubifs] from 
ubifs_mount+0x4cc/0x1cc0 [ubifs]
[  322.306765]  ubifs_mount [ubifs] from legacy_get_tree+0x2c/0x54
[  322.307194]  legacy_get_tree from vfs_get_tree+0x2c/0x114
[  322.307229]  vfs_get_tree from vfs_cmd_create+0x64/0xd0
[  322.307258]  vfs_cmd_create from sys_fsconfig+0x474/0x52c
[  322.307287]  sys_fsconfig from ret_fast_syscall+0x0/0x1c
[  322.307313] Exception stack(0xf4761fa8 to 0xf4761ff0)
[  322.307332] 1fa0:                   00000000 00ec9eb0 00000003 
00000006 00000000 00000000
[  322.307350] 1fc0: 00000000 00ec9eb0 00020000 000001af b6f57e3c 
b6f5877c b6f58000 00ec968c
[  322.307364] 1fe0: b6f58384 befc6a50 b6f3887b b6ec559a
[  322.307443] UBIFS error (ubi0:0 pid 430): ubifs_start_scan [ubifs]: 
cannot read 65408 bytes from LEB 17:0, error -110
[  322.319829] UBIFS (ubi0:0): background thread "ubifs_bgt0_0" stops
[  322.320037] UBI DBG gen (pid 430): close device 0, volume 0, mode 2
[  322.320746] UBI DBG gen (pid 430): close device 0, volume 0, mode 1
-------------------------------[8<]----------------------------------

Some interesting points in the log:

* 317.979961 where the mount/scanning process finds corruption in LEB 13 
(PEB 149) is found and LEB 13 is recovered and reassigned to PEB 150, 
and PE 149 is scheduled for erasure;
* 317.983437 where the UBI background thread begins examining PEB 149 
for erasure;
* 318.031623 where the mount/scanning process begins reading LEB 16 (PEB 
144), reading 4 bytes from offset 0x00900080;
* 318.097506 where the UBI background thread has erased PEB 149 and is 
writing a new header;
* 318.598001 where the cadence-qspi controller times out the last Flash 
command and the SPI-NOR read operations start to fail.

My next step is to dig deeper into the spi-cadence-quadspi and spi-nor 
drivers.  I don't really know what's going on, but perhaps there is some 
sort of race condition between the erase and the read or the read and 
the write.

-- 
-=( Ian Abbott <abbotti@mev.co.uk> || MEV Ltd. is a company  )=-
-=( registered in England & Wales.  Regd. number: 02862268.  )=-
-=( Regd. addr.: S11 & 12 Building 67, Europa Business Park, )=-
-=( Bird Hall Lane, STOCKPORT, SK3 0XA, UK. || www.mev.co.uk )=-

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
