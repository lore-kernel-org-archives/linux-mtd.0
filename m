Return-Path: <SRS0=HQC9=DB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF265C4346E
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Sep 2020 08:36:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2FB092137B
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Sep 2020 08:36:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nyZiEnT9";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=emcraft.com header.i=@emcraft.com header.b="sboRO7cs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2FB092137B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emcraft.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:MIME-Version:Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=d6dDCVZKPa6rhz80iv02owCgeaCMS64kWS8DO1hLKks=; b=nyZiEnT9haD59wBpc3qvCg7b7P
	Jyzx0ZMKjLNAl+cFHfXMfwCPii0f7Fl8B/dBn2T4cfpHmPWPTHGpTCe0oJNglscl5iGui/MztHO1i
	g8sSHf+gsNgXuJJN+ge+jjf5SSvh8kiPp4xmoPMv+zIRBUsipiqKeRayBZTCZ3cLvOGqU3AeX6QpH
	Pk8dvGek9e61MgGHAdfr798pgfVbACx9/77K43UetI2DLZi6fHcpBDN3dYmf8VKXBiBrPaX35JQKN
	9iadF+FfNGboflQj9ZVnMRZx/HU7BnkEbU1vR+kcFIhx9RTrfg8wnuAx1AiraLRuse+dGQ1R4SyLa
	qTtupJpA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLMiy-00059n-On; Thu, 24 Sep 2020 08:35:32 +0000
Received: from mail.emcraft.com ([142.93.143.113])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLMiv-000596-Di
 for linux-mtd@lists.infradead.org; Thu, 24 Sep 2020 08:35:30 +0000
Received: from sergmir (unknown [95.165.7.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.emcraft.com (Postfix) with ESMTPSA id 1A2093F01C;
 Thu, 24 Sep 2020 08:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=emcraft.com;
 s=default; t=1600936520;
 bh=AD3uILEppyqwx+zwehwJiegf+l8Qi9x8B56HRc9oIzQ=;
 h=Date:From:To:Subject:From;
 b=sboRO7csXZGh5bRM4DdLytQYlOq/tZZYKYB5YBGWlQMor134dyBB1S2y5FQpP9weM
 ehBeq+hpOjL3z9qg8HDTswoeOnOi01GXVWVIi5WNEr1Yzlm+f+2r5liVXdwf0sS2AO
 6lnvk/mXlbxvYejttP8Lp5ic8TADiPHyfp9dyXhs=
Date: Thu, 24 Sep 2020 11:35:18 +0300
From: Sergei Poselenov <sposelenov@emcraft.com>
To: linux-mtd@lists.infradead.org
Subject: Help with UBI failure analysis
Message-ID: <20200924113518.7c6dda33@sergmir>
Organization: Emcraft Systems
X-Mailer: Claws Mail 3.15.1-dirty (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200924_043529_768899_94A9D159 
X-CRM114-Status: GOOD (  14.39  )
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

Hello,

i.MX SoloX ARM SoC, running Linux 4.5 with the root filesystem on UBI on 512MB NAND chip. A customer is complaining on the following UBI error (excerpts from the boot log below):
...
nand: device found, Manufacturer ID: 0x01, Chip ID: 0xdc
nand: AMD/Spansion S34ML04G1
nand: 512 MiB, SLC, erase size: 128 KiB, page size: 2048, OOB size: 64
gpmi-nand 1806000.gpmi-nand: mode:4 ,failed in set feature.
Bad block table found at page 262080, version 0x01
Bad block table found at page 262016, version 0x01
nand_read_bbt: bad block at 0x00001d0a0000
6 ofpart partitions found on MTD device gpmi-nand
Creating 6 MTD partitions on "gpmi-nand":
0x000000000000-0x000000400000 : "nand_uboot_env"
0x000000400000-0x000000e00000 : "nand_splash_image"
0x000000e00000-0x000000e20000 : "nand_dtb_image"
0x000000e20000-0x000001a20000 : "nand_linux_image"
0x000001a20000-0x00000ba20000 : "nand_rootfs_image"
0x00000ba20000-0x000040000000 : "nand_ubifs"
mtd: partition "nand_ubifs" extends beyond the end of device "gpmi-nand" -- size truncated to 0x145e0000
...
ubi0: default fastmap pool size: 60
ubi0: default fastmap WL pool size: 30
ubi0: attaching mtd4
ubi0: attached by fastmap
ubi0: fastmap pool size: 60
ubi0: fastmap WL pool size: 30
ubi0: attached mtd4 (name "nand_rootfs_image", size 160 MiB)
ubi0: PEB size: 131072 bytes (128 KiB), LEB size: 126976 bytes
ubi0: min./max. I/O unit sizes: 2048/2048, sub-page size 2048
ubi0: VID header offset: 2048 (aligned 2048), data offset: 4096
ubi0: good PEBs: 1280, bad PEBs: 0, corrupted PEBs: 0
ubi0: user volume: 1, internal volumes: 1, max. volumes count: 128
ubi0: max/mean erase counter: 3/0, WL threshold: 4096, image sequence number: 244395915
ubi0: available PEBs: 0, total reserved PEBs: 1280, PEBs reserved for bad PEB handling: 80
ubi0: background thread "ubi_bgt0d" started, PID 140
input: gpio-keys as /devices/soc0/gpio-keys/input/input2
hctosys: unable to open rtc device (rtc0)
ALSA device list:
  No soundcards found.
UBIFS (ubi0:0): background thread "ubifs_bgt0_0" started, PID 141
UBIFS (ubi0:0): recovery needed
UBIFS (ubi0:0): recovery completed
UBIFS (ubi0:0): UBIFS: mounted UBI device 0, volume 0, name "rootfs"
UBIFS (ubi0:0): LEB size: 126976 bytes (124 KiB), min./max. I/O unit sizes: 2048 bytes/2048 bytes
UBIFS (ubi0:0): FS size: 74788864 bytes (71 MiB, 589 LEBs), journal size 9023488 bytes (8 MiB, 72 LEBs)
UBIFS (ubi0:0): reserved for root: 0 bytes (0 KiB)
UBIFS (ubi0:0): media format: w4/r0 (latest is w4/r0), UUID 09F04725-4F95-492E-B899-800AFEC97FB9, small LPT model
VFS: Mounted root (ubifs filesystem) on device 0:13.
devtmpfs: mounted
Freeing unused kernel memory: 280K (80898000 - 808de000)
UBIFS error (ubi0:0 pid 1): ubifs_read_node: bad node type (0 but expected 9)
UBIFS error (ubi0:0 pid 1): ubifs_read_node: bad node at LEB 12:100352, LEB mapping status 1
Not a node, first 24 bytes:
00000000: 55 42 49 23 01 00 00 00 00 00 00 00 00 00 00 02 00 00 08 00 00 00 10 00                          UBI#....................
CPU: 0 PID: 1 Comm: swapper/0 Not tainted 4.5.0 #4
Hardware name: Freescale i.MX6 SoloX (Device Tree)
[<800160f4>] (unwind_backtrace) from [<80013400>] (show_stack+0x10/0x14)
[<80013400>] (show_stack) from [<8029c6ec>] (dump_stack+0x88/0x9c)
...
UBIFS error (ubi0:0 pid 142): ubifs_iget: failed to read inode 438, error -22
UBIFS error (ubi0:0 pid 142): ubifs_lookup: dead directory entry 'etc', error -22
can't run '/etc/init.d/rcS': Invalid argument
...

I see that NAND has a badblock at 0x00001d0a0000, but it's not on the "rootfs" partition.

What could cause such error? Any thoughts will be much appreciated.

Regards,
Sergei

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
