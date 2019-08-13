Return-Path: <SRS0=fen1=WJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56500C433FF
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Aug 2019 00:51:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 20CE6206A2
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Aug 2019 00:51:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Mgsm9nv5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 20CE6206A2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0+1UeQI5PhtJJD/n7xzo/uQpFFl53cFsjDPgcZ1WMak=; b=Mgsm9nv5aaYWJ1Dw70gBHNCbM
	Z9TtGOgwPJY3OAY0a45pamA3xu5CIMvUWCW1r4/X78c538/9BiWHEjUsGHDRgoSafcDKehAqav4ju
	TllVDqlitNE9VWXT3NvasDeOmJABHEo2AC3EY8IHG9nlf6wSW6cOEeStoKpO388/ziMLaBubihNEh
	zTKwFIQ7Uq3F9LLxjhqlEuCIfst7s+64deq0O+Ae8BBGaCnI8FebCsicF7IvWeMFpHxN6n2ElkBQJ
	V3Q3IvDbXbRCCFH5PAnzPGBnQuUmTPoMKWs9bWs0XW9DKhHK9fMVSmqoMswKD6/GglFHe+qKtcdnl
	YDAvmA5/w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hxL1b-0008VH-El; Tue, 13 Aug 2019 00:50:55 +0000
Received: from icp-osb-irony-out7.external.iinet.net.au ([203.59.1.107])
 by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
 id 1hxL1X-0008Ur-5u
 for linux-mtd@lists.infradead.org; Tue, 13 Aug 2019 00:50:54 +0000
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2AmAABJCFJd/zXSMGcNWRkBAQEBAQE?=
 =?us-ascii?q?BAQEBAQEHAQEBAQEBgWeIUY9zAQEBAQEBBoERJYNohgKRIQkBAQEBAQEBAQE?=
 =?us-ascii?q?3AQGEPwKDETgTAQQBAQEEAQEDAQkBhVKGGQEBAQMjBBFBEAsNCwICJgICVwY?=
 =?us-ascii?q?NCAEBgx6Bd6t4c38zGoUvgySBSYEMKIFjihh4gQeBEScMgl8+h0+CWASMTYh?=
 =?us-ascii?q?Mli4Jgh+ULAYbjWIDilinZ4F5MxoIKAiDKJEYkDMBAQ?=
X-IPAS-Result: =?us-ascii?q?A2AmAABJCFJd/zXSMGcNWRkBAQEBAQEBAQEBAQEHAQEBA?=
 =?us-ascii?q?QEBgWeIUY9zAQEBAQEBBoERJYNohgKRIQkBAQEBAQEBAQE3AQGEPwKDETgTA?=
 =?us-ascii?q?QQBAQEEAQEDAQkBhVKGGQEBAQMjBBFBEAsNCwICJgICVwYNCAEBgx6Bd6t4c?=
 =?us-ascii?q?38zGoUvgySBSYEMKIFjihh4gQeBEScMgl8+h0+CWASMTYhMli4Jgh+ULAYbj?=
 =?us-ascii?q?WIDilinZ4F5MxoIKAiDKJEYkDMBAQ?=
X-IronPort-AV: E=Sophos;i="5.64,379,1559491200"; d="scan'208";a="196430975"
Received: from unknown (HELO [10.44.0.22]) ([103.48.210.53])
 by icp-osb-irony-out7.iinet.net.au with ESMTP; 13 Aug 2019 08:50:41 +0800
Subject: Re: GPMI iMX6ull timeout on DMA
To: Boris Brezillon <boris.brezillon@collabora.com>
References: <89ae32a0-9b19-4735-90eb-4ffa22aad704@kernel.org>
 <20190729103655.095297a2@xps13>
 <18734a1d-17d9-d390-58ef-ad8ca1be925f@kernel.org>
 <20190729144730.4a58de32@xps13>
 <17b49e7d-ff63-315f-cf12-3474f7228c6d@kernel.org>
 <781dd4e6-a694-c3e1-ee13-9c5c51598623@kernel.org>
 <53cb8db7-bcf8-ee7c-84ee-59a14a04aad9@kernel.org>
 <20190730103822.7576645d@xps13>
 <0a6afd79-d5ca-24da-a62c-11146a3522f6@kernel.org>
 <20190731082823.6284f5a9@collabora.com>
 <e47b1de2-501a-9a1f-e980-48d2c396811a@kernel.org>
 <20190802145109.00c4a4eb@collabora.com>
 <b739696d-bb1d-bb04-cd45-3019712e29ad@kernel.org>
 <20190808183651.7c0962e7@collabora.com>
 <694cb2ac-68e6-72b1-3d55-e405b176a17f@kernel.org>
 <20190809082356.0cf60555@collabora.com>
 <ce7157e2-a8d0-7204-4003-8a711acb65b8@kernel.org>
 <20190809093235.09d89e20@collabora.com>
 <c5af9334-f679-6fc9-4d2a-1366a295598a@kernel.org>
 <20190809155934.40c43f29@collabora.com>
 <00b31833-69ba-42c5-57c9-37fa1f70efc5@kernel.org>
 <20190812093129.75888dad@collabora.com>
From: Greg Ungerer <gerg@kernel.org>
Message-ID: <a47792dc-b19f-8af3-8748-5a21fb63271e@kernel.org>
Date: Tue, 13 Aug 2019 10:50:38 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190812093129.75888dad@collabora.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190812_175052_477495_88FC6BED 
X-CRM114-Status: UNSURE (   9.25  )
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
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, s.hauer@pengutronix.de,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 linux-mtd@lists.infradead.org, Boris Brezillon <bbrezillon@kernel.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Boris,

On 12/8/19 5:31 pm, Boris Brezillon wrote:
> On Mon, 12 Aug 2019 12:50:36 +1000
[snip]
> Hm, CTRL1 is identical. Can you dump all regs at the beginning and at
> the end of those funcs?

Here is a more complete dump of registers. Trace points are at
entry and exit of the respective functions in the different
kernel versions. Register dumping code is identical for both.


Linux version 4.16.0 (gerg@goober) (gcc version 4.8.3 (GCC)) #10 Tue Aug 13 10:24:28 AEST 2019
...
drivers/mtd/nand/gpmi-nand/gpmi-lib.c(1073): gpmi_begin(): ENTRY
   HW_GPMI_CTRL0=0x00000000
   HW_GPMI_CTRL1=0x01c4000c
   HW_GPMI_COMPARE=0x00000000
   HW_GPMI_ECCCTRL=0x00000400
   HW_GPMI_ECCCOUNT=0x00000000
   HW_GPMI_PAYLOAD=0x00000000
   HW_GPMI_AUXILIARY=0x00000000
   HW_GPMI_TIMING0=0x00010203
   HW_GPMI_TIMING1=0x00000000
   HW_GPMI_TIMING2=0x23023336
   HW_GPMI_DATA=0x00000000
   HW_GPMI_STAT=0xff000005
   HW_GPMI_DEBUG=0x00000000
   r->clock[0]=22000000
nand: device found, Manufacturer ID: 0x2c, Chip ID: 0xda
nand: Micron MT29F2G08ABAEAWP
nand: 256 MiB, SLC, erase size: 128 KiB, page size: 2048, OOB size: 64
gpmi-nand 1806000.gpmi-nand: enable the asynchronous EDO mode 5
drivers/mtd/nand/gpmi-nand/gpmi-lib.c(1073): gpmi_begin(): ENTRY
   HW_GPMI_CTRL0=0x01800001
   HW_GPMI_CTRL1=0x0104000c
   HW_GPMI_COMPARE=0x00000000
   HW_GPMI_ECCCTRL=0x00000000
   HW_GPMI_ECCCOUNT=0x00000000
   HW_GPMI_PAYLOAD=0x00000000
   HW_GPMI_AUXILIARY=0x00000000
   HW_GPMI_TIMING0=0x00010203
   HW_GPMI_TIMING1=0x05000000
   HW_GPMI_TIMING2=0x23023336
   HW_GPMI_DATA=0x00000000
   HW_GPMI_STAT=0xff000005
   HW_GPMI_DEBUG=0x00000101
   r->clock[0]=99000000
drivers/mtd/nand/gpmi-nand/gpmi-lib.c(1136): gpmi_begin(): EXIT
   HW_GPMI_CTRL0=0x01800001
   HW_GPMI_CTRL1=0x01c6800c
   HW_GPMI_COMPARE=0x00000000
   HW_GPMI_ECCCTRL=0x00000000
   HW_GPMI_ECCCOUNT=0x00000000
   HW_GPMI_PAYLOAD=0x00000000
   HW_GPMI_AUXILIARY=0x00000000
   HW_GPMI_TIMING0=0x00010101
   HW_GPMI_TIMING1=0x90000000
   HW_GPMI_TIMING2=0x23023336
   HW_GPMI_DATA=0x00000000
   HW_GPMI_STAT=0xff000005
   HW_GPMI_DEBUG=0x00000101
   r->clock[0]=99000000
Scanning device for bad blocks
5 ofpart partitions found on MTD device gpmi-nand
Creating 5 MTD partitions on "gpmi-nand":
0x000000000000-0x000000500000 : "u-boot"
0x000000500000-0x000000600000 : "u-boot-env"
0x000000600000-0x000000800000 : "log"
0x000000800000-0x000010000000 : "flash"
0x000000000000-0x000010000000 : "all"
gpmi-nand 1806000.gpmi-nand: driver registered.
...

Note that the first ENTRY dump has no matching EXIT dump. From the
code I assume it is returning from gpmi_begin() at the
"if (!hw.sample_delay_factor)" check.


And for the 5.1.14 kernel:

Linux version 5.1.14 (gerg@goober) (gcc version 4.8.3 (GCC)) #27 Tue Aug 13 10:20:32 AEST 2019
...
drivers/mtd/nand/raw/gpmi-nand/gpmi-lib.c(512): gpmi_nfc_apply_timings(): ENTRY
   HW_GPMI_CTRL0=0x00000000
   HW_GPMI_CTRL1=0x01c4000c
   HW_GPMI_COMPARE=0x00000000
   HW_GPMI_ECCCTRL=0x00000400
   HW_GPMI_ECCCOUNT=0x00000000
   HW_GPMI_PAYLOAD=0x00000000
   HW_GPMI_AUXILIARY=0x00000000
   HW_GPMI_TIMING0=0x00010203
   HW_GPMI_TIMING1=0x00000000
   HW_GPMI_TIMING2=0x23023336
   HW_GPMI_DATA=0x00000000
   HW_GPMI_STAT=0xff000005
   HW_GPMI_DEBUG=0x00000000
   r->clock[0]=22000000
drivers/mtd/nand/raw/gpmi-nand/gpmi-lib.c(536): gpmi_nfc_apply_timings(): EXIT
   HW_GPMI_CTRL0=0x00000000
   HW_GPMI_CTRL1=0x0104000c
   HW_GPMI_COMPARE=0x00000000
   HW_GPMI_ECCCTRL=0x00000400
   HW_GPMI_ECCCOUNT=0x00000000
   HW_GPMI_PAYLOAD=0x00000000
   HW_GPMI_AUXILIARY=0x00000000
   HW_GPMI_TIMING0=0x00020101
   HW_GPMI_TIMING1=0x60000000
   HW_GPMI_TIMING2=0x23023336
   HW_GPMI_DATA=0x00000000
   HW_GPMI_STAT=0xff000005
   HW_GPMI_DEBUG=0x00000000
   r->clock[0]=22000000
random: fast init done
nand: device found, Manufacturer ID: 0x2c, Chip ID: 0xda
nand: Micron MT29F2G08ABAEAWP
nand: 256 MiB, SLC, erase size: 128 KiB, page size: 2048, OOB size: 64
drivers/mtd/nand/raw/gpmi-nand/gpmi-lib.c(512): gpmi_nfc_apply_timings(): ENTRY
   HW_GPMI_CTRL0=0x01800001
   HW_GPMI_CTRL1=0x0104000c
   HW_GPMI_COMPARE=0x00000000
   HW_GPMI_ECCCTRL=0x00000000
   HW_GPMI_ECCCOUNT=0x00000000
   HW_GPMI_PAYLOAD=0x00000000
   HW_GPMI_AUXILIARY=0x00000000
   HW_GPMI_TIMING0=0x00020101
   HW_GPMI_TIMING1=0x60000000
   HW_GPMI_TIMING2=0x23023336
   HW_GPMI_DATA=0x0000003f
   HW_GPMI_STAT=0xff000005
   HW_GPMI_DEBUG=0x00000101
   r->clock[0]=22000000
drivers/mtd/nand/raw/gpmi-nand/gpmi-lib.c(536): gpmi_nfc_apply_timings(): EXIT
   HW_GPMI_CTRL0=0x01800001
   HW_GPMI_CTRL1=0x0104000c
   HW_GPMI_COMPARE=0x00000000
   HW_GPMI_ECCCTRL=0x00000000
   HW_GPMI_ECCCOUNT=0x00000000
   HW_GPMI_PAYLOAD=0x00000000
   HW_GPMI_AUXILIARY=0x00000000
   HW_GPMI_TIMING0=0x00020101
   HW_GPMI_TIMING1=0xb0000000
   HW_GPMI_TIMING2=0x23023336
   HW_GPMI_DATA=0x0000003f
   HW_GPMI_STAT=0xff000005
   HW_GPMI_DEBUG=0x00000101
   r->clock[0]=22000000
drivers/mtd/nand/raw/gpmi-nand/gpmi-lib.c(512): gpmi_nfc_apply_timings(): ENTRY
   HW_GPMI_CTRL0=0x01800001
   HW_GPMI_CTRL1=0x0104000c
   HW_GPMI_COMPARE=0x00000000
   HW_GPMI_ECCCTRL=0x00000000
   HW_GPMI_ECCCOUNT=0x00000000
   HW_GPMI_PAYLOAD=0x00000000
   HW_GPMI_AUXILIARY=0x00000000
   HW_GPMI_TIMING0=0x00020101
   HW_GPMI_TIMING1=0xb0000000
   HW_GPMI_TIMING2=0x23023336
   HW_GPMI_DATA=0x000000e0
   HW_GPMI_STAT=0xff000005
   HW_GPMI_DEBUG=0x00000000
   r->clock[0]=22000000
drivers/mtd/nand/raw/gpmi-nand/gpmi-lib.c(536): gpmi_nfc_apply_timings(): EXIT
   HW_GPMI_CTRL0=0x01800001
   HW_GPMI_CTRL1=0x01c6800c
   HW_GPMI_COMPARE=0x00000000
   HW_GPMI_ECCCTRL=0x00000000
   HW_GPMI_ECCCOUNT=0x00000000
   HW_GPMI_PAYLOAD=0x00000000
   HW_GPMI_AUXILIARY=0x00000000
   HW_GPMI_TIMING0=0x00010101
   HW_GPMI_TIMING1=0xe0000000
   HW_GPMI_TIMING2=0x23023336
   HW_GPMI_DATA=0x000000e0
   HW_GPMI_STAT=0xff000005
   HW_GPMI_DEBUG=0x00000000
   r->clock[0]=99000000
Scanning device for bad blocks
5 fixed-partitions partitions found on MTD device gpmi-nand
Creating 5 MTD partitions on "gpmi-nand":
0x000000000000-0x000000500000 : "u-boot"
0x000000500000-0x000000600000 : "u-boot-env"
0x000000600000-0x000000800000 : "log"
0x000000800000-0x000010000000 : "flash"
0x000000000000-0x000010000000 : "all"
gpmi-nand 1806000.gpmi-nand: driver registered.
...


Regards
Greg



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
