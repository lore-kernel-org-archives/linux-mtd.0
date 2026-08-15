Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C54EC5AD5A
	for <linux-mtd@archiver.kernel.org>; Sat, 15 Aug 2026 10:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=rW0yTH4xj36lykTdCSECoDZzgKZ4JSTFfDGPWRHTItI=; b=mrq
	7lyieWEWiq60QXYSanNTARBXe0SLmvGrIZStA0vV71QZiubE10+lKFgIA5yN2ubIhSnwiXpg31Sje
	0eBCWZsZoCTB5fCOXq2ipOs4+czfN195H1aCAj3pOsRRcGKujZ4NCkuobxYLtAhW2XisC6LmTSafr
	ioEzapt+U+5oqQEYRTf715kTbp47pZCuS476bm4jyCMtVSgQtBDXuKPgbvWarhS6ACmTW9KWjrPXa
	woteCUwNM1OZK2UM0aet8ontFIg60pyIF0I9GDMxE84nbUbg3vLdrWM51iD4fYPqWPt36OcmbZvNN
	Nuq0JNxrfyX7Sz8KwcwMTqGKi/5PoSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvBw5-00000003lBa-07pc;
	Sat, 15 Aug 2026 10:48:21 +0000
Received: from mail-qv1-xf32.google.com ([2607:f8b0:4864:20::f32])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvBvz-00000003lBB-3iWq
	for linux-mtd@lists.infradead.org;
	Sat, 15 Aug 2026 10:48:20 +0000
Received: by mail-qv1-xf32.google.com with SMTP id 6a1803df08f44-8efbafa1bacso10126106d6.1
        for <linux-mtd@lists.infradead.org>; Sat, 15 Aug 2026 03:48:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786790894; cv=none;
        d=google.com; s=arc-20260327;
        b=FT+LgiXmuFwc/5xcCu4OdO3k/Z9K3fd8FFyZQjLTKlBLZrOwkPwswCCn47aCSDLhNw
         JGTRSUSrqBCVgtBnE/rgMpNKP6g+p+vSRjOB35tsp9Yomk0MaK0PGIfALBfc+r3GiiwX
         OAWgrEO7NMpaaE1UmWrsCReIVzmxpgXaW62Jjm4e6UrDF7YsmDlySFHyw7Pkajo3QskE
         9sOqG9tEbG9CRkv84uF4zWk6K/f4sNV+gsayTYXPFldv9md4PioyJ9ZWTagWEgt73Qnb
         FFkFOZCJvJ+R3TgzDwy+15CB+36I33UNx3orjpTkxWrbGoK+YvKFv779tGAhWP00TKx0
         LCJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=8S2S9ZihBbRikQyq9YljByMIzuIobbfXFBRM+b3mynI=;
        fh=Gd4kRfoyr9WvSS9M3j9+RFhdcaNG97fzsqYHZ6IIOZI=;
        b=PAGmdVf085JjujD1mn76MtLsf11WZ33aPfPuJysV2i790LY94vafdk6ATsJ2HjDalT
         bvnNMMcs8iqDxA/Uum5YvI+4ezTGHTVas85RI/v3538EwCOfH0RP2lit8ZEcrqwV/VKz
         k2W+6lCINT5G9QS0Z/FauyYAx9Jv3XEV5OCcb4jYxrAoHos9lb2UgVhrQsaEJASlTaFj
         pWzNdvIwSwBwow8SToKd08OtgEmFb9VS2RBxbWho1J2rALMWoc8lo2m14rLOSWHXgqWQ
         OcCNPIH1yJBXjwWNkmsNqpLaGe0Npwz6YtTwnlr+cmhc50Qc7vBBiG8PItZxmzq614Qi
         f0OA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=personaltelco-net.20251104.gappssmtp.com; s=20251104; t=1786790894; x=1787395694; darn=lists.infradead.org;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=8S2S9ZihBbRikQyq9YljByMIzuIobbfXFBRM+b3mynI=;
        b=m4veI0ycD53ZmTQUTeIKfWU8tmzt+x6KW3zMaqkZ/rprGY5x+VAFFHUD1ilQ3ccIaM
         P0+wzWjjKtLoqbxZsQ/k/pVDZDrk2T/BYJQcWo57xNUBDxsmBHCCMZYKn9A1n2ArLoBY
         KTbJMGPLGS58/UBd/6jM0fBlglk77DKiKev1It3pBXMZu3q3aQ3Dh9abLv1v/cGnLA5e
         2s9oQIjXqw027lsUeDAFBATYP5tDrleUx1QOEUyvK4HhGPDqk5xWZJJKTpQz/p7QkFqf
         mnCHnoPu8vC/5bR6jIWw0RQIs99zcXHySIfhNQx+EFG9eTKBXcF+yDF4Oh5jiZazEgqy
         kJgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786790894; x=1787395694;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8S2S9ZihBbRikQyq9YljByMIzuIobbfXFBRM+b3mynI=;
        b=NBjYHly9/tDZ9BYXo8nqRoVzOovW1TZPJ7elhfbxelyO30i7VxJVTYLAvRi+VpEG44
         DpbhyOGXikMEm/CsYZ3bD+pUMeXtf0la1DmHceF0c//id8hAU32OS4hisyvMcqvyd2Pg
         tZJwLRDKWevftIOKTHv2FJEtO3Q2Q9hufouMtqlte5rvsU37z+NUb2Xwdntfp1R7E0tr
         JEDVF6jPY4+7IKsHwxgGm9gvb7WPr+anH8rpcXuOhQSH/z9hw96UJYxXS0vlyAqFVtVG
         /PY5b8+HUBCnUvN+HRiPaF1UsVkZqYFXovhPfh/lTrXA8kTGvNIyziGQdMwX0x0ewPsL
         NIXA==
X-Gm-Message-State: AOJu0YzyBsBiE3JuJ3a4uNBH2Wy4/IYQBBxJ1XQPzgbTPAQ5aWWoZYrM
	9lNqarGgcCCVQjceURNz2bHDAAaL971uK+WOEgP5zlqHoojxZBFGrzu3122ivOS1JEQt87aYshN
	EFGE9UKwAqecufCRrirvxDib0HNCLWn6yXdj0x0nicOrHyyBoXtrHETLZ
X-Gm-Gg: AR+sD12wOLCxT5xmiQnkQyS1gRHjMLm0JpapNgyXgcYgNXcvUwRP1v+7U0kZviqIPog
	rzTcdLoEL/JgW1GtZMqrdm9Jr8Zv/4CzuL1h6x2YBAmADXZLx+l1W5DBYaCv0mzlQqQS3PO+UB1
	X8L2HENVn3njHyLc1c6lx8maSMo/7LbYTwebD8c+xEFipEJiszjoxPzyr0JMw7VprbzbiW0vsvO
	S0JtoG2PtHf19+qwoJDVwDmO2sXV6tgv4aJSZPQqbgSSJ9VGbGts/k4U7p0EZU/xucCsg1kEgbF
	A6qlcdK1wfZ1SmlZ3vqG+UplU8HQNXm9/on5TDooVn1ELoLGVClKGt1+Z5fQxxpsILKyPSYz0u7
	8TENd/hp/GXlJl38oPVMCHGPoPB9wEVp4bWuMN7EbQYer+5S/MAXoRzPNdZZMzxWRBtbcILFq
X-Received: by 2002:a05:620a:398f:b0:92e:d7c7:7de9 with SMTP id
 af79cd13be357-936d1fddc37mr811582285a.8.1786790893719; Sat, 15 Aug 2026
 03:48:13 -0700 (PDT)
MIME-Version: 1.0
From: Russell Senior <russell@personaltelco.net>
Date: Sat, 15 Aug 2026 03:48:02 -0700
X-Gm-Features: AUfX_mxuz0AD-NptO5yKHtEQSocRiVI8CqcPOecjACy05uzXlTghvmgv1nT0XHw
Message-ID: <CAHP3WfMMK8GU3jpwxv4=C=Pc_9H4ZkmqAJqxZ0gN_rYqPDU3XQ@mail.gmail.com>
Subject: Regression: mx25l12845e stops working on my device after commit 947c86e481a
To: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260815_034816_194495_DB495E25 
X-CRM114-Status: GOOD (  14.41  )
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

I am running OpenWrt (master branch) on a Buffalo WZR600DHP. This
particular instance has MX25L12845E SPI NOR chips (I have another
WZR600DHP with Winbond W25Q128BVFG, but haven't tested there, just to
say they don't all necessarily use the same flash).

I just built a new firmware version last night, and it started
unhappily boot looping. The most recent previous build I had done was
from June. Boot looping messages look like this:

[...]
[    0.752843] printk: legacy bootconsole [early0] disabled
[    0.778756] spi-nor spi0.0: supply vcc not found, using dummy regulator
[    0.785909] spi-nor spi0.0: BFPT parsing failed. Please consider
using SPI_NOR_SKIP_SFDP when declaring the flash
[    0.796238] spi-nor spi0.0: probe with driver spi-nor failed with error -22
[    0.804457] spi-nor spi0.1: supply vcc not found, using dummy regulator
[    0.824085] i2c_dev: i2c /dev entries driver
[    0.830852] NET: Registered PF_INET6 protocol family
[    0.872875] Segment Routing with IPv6
[    0.876671] In-situ OAM (IOAM) with IPv6
[    0.880798] NET: Registered PF_PACKET protocol family
[    0.886278] 8021q: 802.1Q VLAN Support v1.8
[    0.921429] clk: Disabling unused clocks
[    0.925661] check access for rdinit=/init failed: -2, ignoring
[    0.932181] MTD: Couldn't look up '': -22
[    0.936335] /dev/root: Can't open blockdev
[    0.940520] VFS: Cannot open root device "" or unknown-block(0,0): error -6
[    0.947472] Please append a correct "root=" boot option; here are
the available partitions:
[    0.955831] 1f00           16384 mtdblock0
[    0.955843]  (driver?)
[    0.962379] List of all bdev filesystems:
[    0.966374]  squashfs
[    0.966379]
[    0.970139] Kernel panic - not syncing: VFS: Unable to mount root
fs on unknown-block(0,0)
[    0.978392] Rebooting in 1 seconds..

Between June and last night, OpenWrt had switched their kernel from a
6.12.x to a 6.18.x, so I immediately suspected something in that
transition was the culprit and demonstrated that by building the last
commit before the change to the 6.18.x kernel, and it worked. Then
tested the commit of the change to the 6.18.x kernel and it
bootlooped.

Then I started looking through the mtd changes between 6.12.x and
6.18.x and spotted 947c86e481a.

  commit 947c86e481a027ed5948434096e506f307bd7114
  Author: Cheng Ming Lin <chengminglin@mxic.com.tw>
  Date:   Mon Apr 7 15:53:58 2025 +0800

      mtd: spi-nor: macronix: Drop the redundant flash info fields

The following revert of just the part that affected my chip made the
bootloop vanish:

diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
index e97f5cbd9aad2..3524ed08ff85d 100644
--- a/drivers/mtd/spi-nor/macronix.c
+++ b/drivers/mtd/spi-nor/macronix.c
@@ -132,7 +132,10 @@ static const struct flash_info macronix_nor_parts[] = {
        }, {
                /* MX25L12805D */
                .id = SNOR_ID(0xc2, 0x20, 0x18),
+               .name = "mx25l12805d",
+               .size = SZ_16M,
                .flags = SPI_NOR_HAS_LOCK | SPI_NOR_4BIT_BP,
+               .no_sfdp_flags = SECT_4K,
        }, {
                /* MX25L25635E, MX25L25645G */
                .id = SNOR_ID(0xc2, 0x20, 0x19),
-- 
2.55.0


-- 
Russell Senior
russell@personaltelco.net

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
