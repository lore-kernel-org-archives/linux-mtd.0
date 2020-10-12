Return-Path: <SRS0=FSZL=DT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1454C433E7
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Oct 2020 18:04:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 539EA20725
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Oct 2020 18:04:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Xs2KVYvV";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="fW/0kdqW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 539EA20725
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6MU9E0M5KFRAMn3eM51i4OKmyBJecwThNDyAB5+fe5M=; b=Xs2KVYvVBlve1FxRCT+ZYe8Go
	iCdD5D+l0HpcvkqaWGCEMv+DjN2RNj9GrB5AZCcmMeBH93A0Fq4MTyhGJ8riZxHmeXn1PtyWDw+VG
	dAUipmzn0iljxALf+xjmGGpH9DeVNsFYNPaoOS55pLrseIynS7OJldT+IQfxgpF0C9iFGHgjugGSQ
	t7z88p+e0mNwRiAwdcJbTdxTgsLKFqSvJpJJBT/ejnUn/bD7bGQ4fze+rb9XQ0DuxnC/JNHm55Orl
	uL+nzBOLBn+nA0ksXBy37mms3OzgxEoUGdqoGSd3kM7yRD2xdYesOeBkj065I1BYrOec4Cny3Ad7S
	llxX3ToxQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kS2BH-0001F8-Fz; Mon, 12 Oct 2020 18:04:19 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kS2BC-0001Dr-IS
 for linux-mtd@lists.infradead.org; Mon, 12 Oct 2020 18:04:15 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09CI4BDZ055219;
 Mon, 12 Oct 2020 13:04:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1602525851;
 bh=azEppzwQrP6Fp1xWnR9MjTTXT2K8wTwQGMzH5evrkQw=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=fW/0kdqWG2irn8/SYs1V3aJT/mlvi+npXEAejaS38XZLZTmR4tQfO6sY3BgerhngN
 y9w9h/FwpBi5xdFlqDtmiRV3Ng+HjYIfc/7/j5nllorJSPqI7GnjdlotTKPONIbieu
 6ikVqHixgZikyKmo+TxtfFpfvhH7E3ZCOOx1v7Go=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09CI4BZZ100729
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 12 Oct 2020 13:04:11 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 12
 Oct 2020 13:04:10 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 12 Oct 2020 13:04:10 -0500
Received: from pratyush-OptiPlex-790.dhcp.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 09CI45j3021531;
 Mon, 12 Oct 2020 13:04:08 -0500
From: Pratyush Yadav <p.yadav@ti.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/3] mtd: abi: Introduce MTD_NO_MULTI_PASS_WRITE
Date: Mon, 12 Oct 2020 23:34:02 +0530
Message-ID: <20201012180404.6476-2-p.yadav@ti.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201012180404.6476-1-p.yadav@ti.com>
References: <20201012180404.6476-1-p.yadav@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201012_140414_664328_C590C2F0 
X-CRM114-Status: GOOD (  11.94  )
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
Cc: Pratyush Yadav <p.yadav@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Some flashes like the Semper S28 family do not support multi-pass page
programming. Introduce the flag MTD_NO_MULTI_PASS_WRITE to allow telling
upper layers this information so they can issue write commands with this
limitation in mind.

Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
---
 include/uapi/mtd/mtd-abi.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/uapi/mtd/mtd-abi.h b/include/uapi/mtd/mtd-abi.h
index 65b9db936557..a2cab30adac5 100644
--- a/include/uapi/mtd/mtd-abi.h
+++ b/include/uapi/mtd/mtd-abi.h
@@ -105,6 +105,7 @@ struct mtd_write_req {
 #define MTD_NO_ERASE		0x1000	/* No erase necessary */
 #define MTD_POWERUP_LOCK	0x2000	/* Always locked after reset */
 #define MTD_SLC_ON_MLC_EMULATION 0x4000	/* Emulate SLC behavior on MLC NANDs */
+#define MTD_NO_MULTI_PASS_WRITE	0x8000
 
 /* Some common devices / combinations of capabilities */
 #define MTD_CAP_ROM		0
-- 
2.28.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
