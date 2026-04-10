Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19604EBFD0F
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Apr 2026 07:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:MIME-Version:References:
	In-Reply-To:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=CRmXShV8dsH1u69QQVNCll3ZMu7UN5gcubQgK99aBVc=; b=cGnufM3gGuuIDbTNhJ3Mq+FYr2
	9mUiTTR+G03pO9juEJlmPhljdz3KACK1gqeGpv/PponjroRGanISzAcAHu+Ff6t0olI6aEcJ+yosx
	bl2xNafKb45f8XmZX+Vifc4SfEVNmkiCKjk0W7CZoZjFuyBVqJxRJV0X33WCSg4o1ps4cXeGi/j/6
	7grYVxq4kT7gOHCmAHO2Adn3JSB+VaOKAwPPnGsV8ocJ/9RChZuisn+Pt9YIP/hdyDaxJNg+9DOHr
	f6blE7L6lZrwWPggtFDRAC3vzAOAHePi1A9uvCuXvMkBuSi353lhLgSa7DLSKUx4YwajUI2dXBBuL
	EHk+cWhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCBwq-0000000FAZj-0JjI;
	Mon, 13 Apr 2026 07:43:08 +0000
Received: from forward502b.mail.yandex.net ([178.154.239.146])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCBwm-0000000FAYh-0Jzi
	for linux-mtd@lists.infradead.org;
	Mon, 13 Apr 2026 07:43:06 +0000
Received: from mail-nwsmtp-smtp-production-main-89.sas.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-89.sas.yp-c.yandex.net [IPv6:2a02:6b8:c11:2281:0:640:870e:0])
	by forward502b.mail.yandex.net (Yandex) with ESMTPS id BD7AF81041;
	Mon, 13 Apr 2026 10:42:56 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-89.sas.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id tgEA7hxRqW20-wbEI3tYp;
	Mon, 13 Apr 2026 10:42:56 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1776066176; bh=U3f8nmO2QXRnCSjIan32SJ+Ij7HjpuM5kHSLGiuMsEY=;
	h=References:Date:Cc:In-Reply-To:To:From:Subject:Message-ID;
	b=N5DtlJcD59YNC1FfO//Y7b8zuPR6uErsK+uLYd8Dwn3M5ljQB3qpU8GL3SG8sqqzD
	 0DxcuRNuqElUwvzXw2fsRT9q1yXNyujvkakFcuRFLBt/1RLVKnU/RAkrWdWeTUHEaW
	 DwHu0P6awlblh2p4xCsew/nHeGTtmWO+Tg2v/TGs=
Authentication-Results: mail-nwsmtp-smtp-production-main-89.sas.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
Message-ID: <dad152431baf62dc853f2c0f26d21935592be862.camel@yandex.ru>
Subject: Re: [PATCH v4 2/2] ubifs: use strscpy() and kmemdup_nul() where
 appropriate
From: Dmitry Antipov <dmantipov@yandex.ru>
To: Richard Weinberger <richard@nod.at>, chengzhihao1
 <chengzhihao1@huawei.com>
Cc: linux-mtd <linux-mtd@lists.infradead.org>
In-Reply-To: <2056092139.32098.1775800654235.JavaMail.zimbra@nod.at>
References: <5deffdfa-6a99-8205-1f71-ff1f07ce28d1@huawei.com>
	 <20260409045629.527019-1-dmantipov@yandex.ru>
	 <20260409045629.527019-2-dmantipov@yandex.ru>
	 <a8d991e7-7c66-2049-41e1-0a3f07114333@huawei.com>
	 <2056092139.32098.1775800654235.JavaMail.zimbra@nod.at>
MIME-Version: 1.0
Date: Fri, 10 Apr 2026 14:55:22 +0300
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_004304_662653_A6A07CF0 
X-CRM114-Status: UNSURE (   7.15  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, 2026-04-10 at 07:57 +0200, Richard Weinberger wrote:

> Dmitry, how are you testing these changes?

Build with:

CONFIG_KASAN=y

CONFIG_MTD_NAND_NANDSIM=m

CONFIG_MTD_UBI=m
CONFIG_MTD_UBI_WL_THRESHOLD=4096
CONFIG_MTD_UBI_BEB_LIMIT=20
CONFIG_UBIFS_FS=m
CONFIG_UBIFS_FS_ADVANCED_COMPR=y
CONFIG_UBIFS_FS_LZO=y
CONFIG_UBIFS_FS_ZLIB=y
CONFIG_UBIFS_FS_ZSTD=y
CONFIG_UBIFS_ATIME_SUPPORT=y
CONFIG_UBIFS_FS_XATTR=y
CONFIG_UBIFS_FS_SECURITY=y
CONFIG_UBIFS_FS_AUTHENTICATION=y

and boot (QEMU VM), then:

# modprobe nandsim second_id_byte=0xdc third_id_byte=0x80 fourth_id_byte=0x1d
[   24.282259] [nandsim] warning: read_byte: unexpected data output cycle, state is STATE_READY return 0x0
[   24.282787] [nandsim] warning: read_byte: unexpected data output cycle, state is STATE_READY return 0x0
[   24.283441] [nandsim] warning: read_byte: unexpected data output cycle, state is STATE_READY return 0x0
[   24.284083] [nandsim] warning: read_byte: unexpected data output cycle, state is STATE_READY return 0x0
[   24.284783] [nandsim] warning: read_byte: unexpected data output cycle, state is STATE_READY return 0x0
[   24.285473] nand: device found, Manufacturer ID: 0x98, Chip ID: 0xdc
[   24.285932] nand: Toshiba NAND 512MiB 3,3V 8-bit
[   24.286275] nand: 512 MiB, SLC, erase size: 128 KiB, page size: 2048, OOB size: 64
[   24.286749] flash size: 512 MiB
[   24.286925] page size: 2048 bytes
[   24.287104] OOB area size: 64 bytes
[   24.287337] sector size: 128 KiB
[   24.287578] pages number: 262144
[   24.287817] pages per sector: 64
[   24.288068] bus width: 8
[   24.288269] bits in sector size: 17
[   24.288527] bits in page size: 11
[   24.288775] bits in OOB size: 6
[   24.289024] flash size with OOB: 540672 KiB
[   24.289334] page address bytes: 5
[   24.289572] sector address bytes: 3
[   24.289837] options: 0x8
[   24.290676] Scanning device for bad blocks
[   24.311973] Creating 1 MTD partitions on "NAND 512MiB 3,3V 8-bit":
[   24.312376] 0x000000000000-0x000020000000 : "NAND simulator partition 0"

# modprobe ubi mtd=0
[   44.884572] ubi0: attaching mtd0
[   44.893002] ubi0: scanning is finished
[   44.893308] ubi0: empty MTD device detected
[   44.947667] ubi0: attached mtd0 (name "NAND 512MiB 3,3V 8-bit", size 512 MiB)
[   44.948231] ubi0: PEB size: 131072 bytes (128 KiB), LEB size: 129024 bytes
[   44.948719] ubi0: min./max. I/O unit sizes: 2048/2048, sub-page size 512
[   44.949206] ubi0: VID header offset: 512 (aligned 512), data offset: 2048
[   44.949686] ubi0: good PEBs: 4096, bad PEBs: 0, corrupted PEBs: 0
[   44.950113] ubi0: user volume: 0, internal volumes: 1, max. volumes count: 128
[   44.950639] ubi0: max/mean erase counter: 0/0, WL threshold: 4096, image sequence number: 3902257690
[   44.951285] ubi0: available PEBs: 4012, total reserved PEBs: 84, PEBs reserved for bad PEB handling: 80
[   44.951946] ubi0: background thread "ubi_bgt0d" started, PID 1022

# ubimkvol /dev/ubi0 -N test -m
Set volume size to 517644288
Volume ID 0, size 4012 LEBs (517644288 bytes, 493.6 MiB), LEB size 129024 bytes (126.0 KiB), dynamic, name "test", alignment 1

# mount -t ubifs ubi0:test /mnt/ubifs
[  122.812026] UBIFS (ubi0:0): default file-system created
[  122.812377] UBIFS (ubi0:0): Mounting in unauthenticated mode
[  122.813415] UBIFS (ubi0:0): background thread "ubifs_bgt0_0" started, PID 1053
[  122.813963] UBIFS (ubi0:0): UBIFS: mounted UBI device 0, volume 0, name "test"
[  122.814334] UBIFS (ubi0:0): LEB size: 129024 bytes (126 KiB), min./max. I/O unit sizes: 2048 bytes/2048 bytes
[  122.814849] UBIFS (ubi0:0): FS size: 515579904 bytes (491 MiB, 3996 LEBs), max 4012 LEBs, journal size 25804800 bytes (24 MiB, 200 LEBs)
[  122.815701] UBIFS (ubi0:0): reserved for root: 4952683 bytes (4836 KiB)
[  122.816225] UBIFS (ubi0:0): media format: w5/r0 (latest is w5/r0), UUID 999464F1-4417-4523-B773-57C6EBD728DC, small LPT model
[  122.817041] UBIFS (ubi0:0): full atime support is enabled.

# cp -a [~390M source tree] /mnt/ubifs
# diff -ur [tree] /mnt/ubifs/[copy of that tree] ; no output hopefully means OK

# umount /mnt/ubifs
[  179.322533] UBIFS (ubi0:0): un-mount UBI device 0
[  179.323801] UBIFS (ubi0:0): background thread "ubifs_bgt0_0" stops

# mount -t ubifs ubi0:test /mnt/ubifs
[  185.313439] UBIFS (ubi0:0): Mounting in unauthenticated mode
...

# diff -ur [tree] /mnt/ubifs/[copy of that tree] ; likewise

etc.

Dmitry

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
