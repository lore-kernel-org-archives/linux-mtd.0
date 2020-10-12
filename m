Return-Path: <SRS0=FSZL=DT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFBADC433E7
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Oct 2020 07:11:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 50209207FF
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Oct 2020 07:11:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Lkmrwk/f";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Wh5EAKIn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 50209207FF
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ed+BwukmcwikW6U7WoppxXqcMc5/KpCI2tnDy1hVgKo=; b=Lkmrwk/flnkJwghw/HP38ILzPr
	zuKl7UNETnKnAmjAJjIEUztuByjrbOjjOE4nZIN+NZjHLvVgo69tB+e+K7LCGhmpPnhhXj6IFcFvp
	GKMpFV++3UyPV+J9b/KlUw1MhbSJP/EyHYuGZivftLrW+YVECbqdA4Q0t9v2p7RADjsi/jUDSVKiL
	E869HLtxHSyjrSWpRnQg9o4JewVEnG/GOJabQ/QDPwWhhflh1BImMIq5Kwxij5sSdsXrrDvcVLzNK
	r2k1GXHU9Kx80Y+it4jMBkyHZ1CQTWxKcGleyyq6loGzUO9VLekCie+SqxALu2jdBaJSYPjZ/spPG
	WX5TpcWg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kRrz7-0002h3-Tb; Mon, 12 Oct 2020 07:11:05 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kRrz6-0002gU-0c
 for linux-mtd@lists.infradead.org; Mon, 12 Oct 2020 07:11:04 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09C7B0B1122440;
 Mon, 12 Oct 2020 02:11:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1602486660;
 bh=olIcJ+cdar4sP++7ZrYXeWOA+vMGcs0CLq2nJqrcTaY=;
 h=From:To:CC:Subject:Date;
 b=Wh5EAKInp5rx4/Z+9tGoVCl4cEu46Fpfo1CdefxuvICpCetczWwz3U7aV1OGYuXVE
 OlsqZXVcoKxWXhb+3gbaD06g+wfp1c1bPD21CinKQ8SM96rhC4kpqpACmm1nJIxfrZ
 wZLMCvJpDaX19B7yoNDt4nDsuX03DpX1iXdn7HMI=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09C7B0xZ039416
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 12 Oct 2020 02:11:00 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 12
 Oct 2020 02:11:00 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 12 Oct 2020 02:11:00 -0500
Received: from ula0132425.ent.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 09C7Avkj111749;
 Mon, 12 Oct 2020 02:10:58 -0500
From: Vignesh Raghavendra <vigneshr@ti.com>
To: Vignesh Raghavendra <vigneshr@ti.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>
Subject: [PATCH] mtd: hyperbus: Fix build failure when only RPCIF_HYPERBUS is
 enabled
Date: Mon, 12 Oct 2020 12:39:58 +0530
Message-ID: <20201012070958.11083-1-vigneshr@ti.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201012_031104_151998_F537B21C 
X-CRM114-Status: GOOD (  13.25  )
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
Cc: Sergei Shtylyov <sergei.shtylyov@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

commit 5de15b610f78 ("mtd: hyperbus: add Renesas RPC-IF driver") leads
to build failure[1] with COMPILE_TEST and RPCIF_HYPERBUS enabled. This
is because driver needs functions RENESAS_RPCIF which is only buildable
for CONFIG_ARCH_RENESAS.

Fix this by dropping COMPILE_TEST from RPCIF_HYPERBUS Kconfig entry.
This ensures driver can be built only when RENESAS_RPCIF is also
selected.

[1]:
rpc-if.c:(.text+0x20): undefined reference to `rpcif_disable_rpm' ld:
drivers/mtd/hyperbus/rpc-if.o: in function `rpcif_hb_prepare_read':
rpc-if.c:(.text+0xd6): undefined reference to `rpcif_prepare' ld:
drivers/mtd/hyperbus/rpc-if.o: in function `rpcif_hb_read16':
[...]

Fixes: 5de15b610f78 ("mtd: hyperbus: add Renesas RPC-IF driver") leads
Reported-by: Richard Weinberger <richard@nod.at>
Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
---

Based on mtd/next

Richard,

Could you please pull this into mtd/next?

 drivers/mtd/hyperbus/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/hyperbus/Kconfig b/drivers/mtd/hyperbus/Kconfig
index 35b3ab4c8b94..46c7e407e378 100644
--- a/drivers/mtd/hyperbus/Kconfig
+++ b/drivers/mtd/hyperbus/Kconfig
@@ -24,7 +24,7 @@ config HBMC_AM654
 
 config RPCIF_HYPERBUS
 	tristate "Renesas RPC-IF HyperBus driver"
-	depends on RENESAS_RPCIF || COMPILE_TEST
+	depends on RENESAS_RPCIF
 	depends on MTD_CFI_BE_BYTE_SWAP
 	help
 	  This option includes Renesas RPC-IF HyperBus support.
-- 
2.28.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
