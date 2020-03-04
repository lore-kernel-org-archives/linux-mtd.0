Return-Path: <SRS0=wBEz=4V=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9424C3F2D1
	for <linux-mtd@archiver.kernel.org>; Wed,  4 Mar 2020 11:09:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA93120705
	for <linux-mtd@archiver.kernel.org>; Wed,  4 Mar 2020 11:09:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LtC1BMcV";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="CFpKb/li"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AA93120705
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=samsung.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6MuG3YEVwSI3zTnpTKidsetq4N41nnL0CrV4YKmiIqc=; b=LtC1BMcV/jn2yR
	+9KmKdOdyz/XFWuGSwBxup1yNIBOO6eiQyJD6DuTqs4TPfUGZ54jEePxcBX1D/RPTI8wo9t2nBJzT
	g4xnZuCtME1r3fdPjLxhHMcP14XURUj8FpHg5Q46hYMCtkkD65il7cETsdcACVpNVSeiTrzMcJZky
	8a7rhFO3a4jc55eVCrXggcu2rentWKukSnndRi1yatcC4iLxdRlCwMKUYUBl93IliZGPyjj5xqv6N
	WrrJMlkb1kg64CgFhNeL3acjODS0CJb05XSQ8Q2I7N3x0SONKQgSh1PbT+5Bi+OJeaQWIEUjfNE2l
	49StVkr6Ylct9NUoYrCA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j9Rtm-0002Bj-3I; Wed, 04 Mar 2020 11:09:10 +0000
Received: from mailout4.samsung.com ([203.254.224.34])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j9RtL-0001ap-G8
 for linux-mtd@lists.infradead.org; Wed, 04 Mar 2020 11:08:45 +0000
Received: from epcas1p2.samsung.com (unknown [182.195.41.46])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20200304110837epoutp04a38f8c4d57b13692ef1831bc3b21ee31~5FUIM4JUp2032920329epoutp04_
 for <linux-mtd@lists.infradead.org>; Wed,  4 Mar 2020 11:08:37 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20200304110837epoutp04a38f8c4d57b13692ef1831bc3b21ee31~5FUIM4JUp2032920329epoutp04_
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1583320117;
 bh=NZdiiFoAvejXyFhjUiB0y9KVlE57c/lFJ4nBZmrBKng=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=CFpKb/liOwZ0lwrSbVoVnDy59oeifbWiBJMEYVf8qujw2MBwo9e+aazJquzt6uChW
 OXJakiqHWwe28VLiNzJyBDK99Gu3Gnr7gpQTyX9MMGfR+pPOzxRcT3ibNPq6LeEXT9
 LcRPT1epCM3r3D25VH8jv6pmBqanvW6HP9luKWk4=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
 epcas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200304110837epcas1p2515f8fc25079d678b6648a9831c04d5e~5FUH1phQv2028020280epcas1p2I;
 Wed,  4 Mar 2020 11:08:37 +0000 (GMT)
Received: from epsmges1p4.samsung.com (unknown [182.195.40.161]) by
 epsnrtp4.localdomain (Postfix) with ESMTP id 48XWMl5ZRFzMqYkd; Wed,  4 Mar
 2020 11:08:35 +0000 (GMT)
Received: from epcas1p4.samsung.com ( [182.195.41.48]) by
 epsmges1p4.samsung.com (Symantec Messaging Gateway) with SMTP id
 03.06.48019.33C8F5E5; Wed,  4 Mar 2020 20:08:35 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas1p3.samsung.com (KnoxPortal) with ESMTPA id
 20200304110835epcas1p3a9daac6383c7ae2fa57a084d4992d5a9~5FUGc_Dek0245402454epcas1p3u;
 Wed,  4 Mar 2020 11:08:35 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200304110835epsmtrp20cef9bfe18cfe429c27da2017bee8df5~5FUGcTo_d2028720287epsmtrp2z;
 Wed,  4 Mar 2020 11:08:35 +0000 (GMT)
X-AuditID: b6c32a38-23fff7000001bb93-bc-5e5f8c33d245
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 50.46.10238.33C8F5E5; Wed,  4 Mar 2020 20:08:35 +0900 (KST)
Received: from localhost.localdomain (unknown [10.88.100.192]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200304110835epsmtip18ec578abef94d3dead724bdc2f5ea853~5FUGSWYx63147331473epsmtip1T;
 Wed,  4 Mar 2020 11:08:35 +0000 (GMT)
From: Jungseung Lee <js07.lee@samsung.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>, Vignesh Raghavendra
 <vigneshr@ti.com>, linux-mtd@lists.infradead.org, js07.lee@gmail.com,
 js07.lee@samsung.com, chenxiang <chenxiang66@hisilicon.com>, Michael Walle
 <michael@walle.cc>
Subject: [PATCH 3/3] mtd: spi-nor: support lock/unlock for a few Micron chips
Date: Wed,  4 Mar 2020 20:08:00 +0900
Message-Id: <20200304110800.20658-3-js07.lee@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200304110800.20658-1-js07.lee@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA02Se0hTYRjG+Xa2nZmtDtPqRbrY6QKal625eTQtw4hTGQlRYNDWyR2ctFs7
 W1nR1TXCNJWoPyRFaBkadjFLzUtmiZEZFpEWCamZ4WVU4rCW2Y6nqP9+3/s9z/t8vN8rwxRD
 kjBZtsXB2i2MiZTOEd9/HKGMVufrdcrhnhiq581rRE1f8Yqogbd+CdV4pgKnxjtv49RXTwo1
 0/UFT8HphpI+nB4svYPTdz0n6fdT1xB9obYK0R29dSK6tdklTcf3mJKMLGNg7eGsJdNqyLZk
 JZPbdupT9RqtUhWtSqDiyXALY2aTyU1p6dGbs02B95DhhxiTM1BKZziOjF2fZLc6HWy40co5
 kknWZjDZVEpbDMeYOaclKybTak5UKZVrNQHlPpOx716/xOaen5Pf2C09hYaC81CQDIg46O0s
 x3lWEPUIfD2peWhOgL8hKCvsEQkXPgTvxox/DYXVQ2JB1IzA+3BYJBwmENxxN806pEQk9Ppr
 JDyHEl4ELxtTeA4hdkDR+I+ARiYTE6ug/ZOKL8uJBHhV9VEqBCyDG7dbMZ6DiERw5T7G+P5A
 eKQw8KEb471AbAJvJyPoQ2CkoxYXOAwmvM1/+nDQUFmMC14XgoHrnj8iNXjHq2f7YEQE3HoQ
 K5SXQ4O/FPGMEfPAO5kvEaLkcM6tECQkjH1wiQUG6B4skAhMg6eKj+XHUIDgyVSRpAgtKfmX
 UI5QFVrI2jhzFsupbHH//1ENml2xSKoeNb1Ia0OEDJFz5bBFp1NImEPcEXMbAhlGhspDNHqd
 Qm5gjhxl7Va93WliuTakCQyyGAtbkGkNLKzFoVdp1qrVaipOG6/VqMlF8v6MCJ2CyGIc7AGW
 tbH2vz6RLCjsFMpI8u3+udFP1fsWpxKDa8RcrHX/zN6L20fj9x1veZAX1d5e+ahu3XS79l6t
 21R8IvjqL/8xEW7rm0y9fP/pwZvVHvfPS8/LSnc2t9b0fy6zGG5EFTLnW+y+DXUX01aMTOfu
 HaXPdrmcJUtHse6t2uTVuzKs3wtyYF7Ls4rDoacLVpJizsioIjE7x/wGap4gEHgDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprPLMWRmVeSWpSXmKPExsWy7bCSnK5xT3ycwdlf0hbXr11htPg75x2T
 xaObv1ktdjctY7d4e3oDu8XHJQ4W/89+YHdg99g56y67x+O5G9k9Ni+p97jzYymjR9+WVYwe
 x29sZ/I4sLeFLYA9issmJTUnsyy1SN8ugSvj7taHrAVt/BU9uy+wNTA+5e5i5OSQEDCR6F/7
 lKWLkYtDSGA3o8SmI28YIRISEo92fgFKcADZwhKHDxeDhIUEPjJK/FzmBmKzCWhJ3Pi9iRWk
 V0TgC6PE5c0HWUESwgK+Eg8uXGEH6WURUJU4+swQJMwrYClxadUTNojx8hKrNxxgBrE5Bawk
 WpoPM0PMt5T4u/Uq8wRG3gWMDKsYJVMLinPTc4sNCwzzUsv1ihNzi0vz0vWS83M3MYKDTUtz
 B+PlJfGHGAU4GJV4eKU84+KEWBPLiitzDzFKcDArifAKm8bHCfGmJFZWpRblxxeV5qQWH2KU
 5mBREud9mncsUkggPbEkNTs1tSC1CCbLxMEp1cDoyxA+w20n75T0+A3z8yoVf55gPNnS/TFC
 oWh5/W2r7KuRuvfZn+6s0L514m12pf8Zq3Djie9nbg2U7+SvzfONfdIrbv9PJ5khVPx5a+5z
 pRM+u3KW3TVZmNUz4eOa74cFevqeBrGskPedeiLQkW1awN/NKQUH5DvOzLuf3BV2M+NjcnPl
 2aVKLMUZiYZazEXFiQDxAbESMgIAAA==
X-CMS-MailID: 20200304110835epcas1p3a9daac6383c7ae2fa57a084d4992d5a9
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200304110835epcas1p3a9daac6383c7ae2fa57a084d4992d5a9
References: <20200304110800.20658-1-js07.lee@samsung.com>
 <CGME20200304110835epcas1p3a9daac6383c7ae2fa57a084d4992d5a9@epcas1p3.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200304_030843_736297_E38702E6 
X-CRM114-Status: GOOD (  13.83  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Some Micron models are known to have lock/unlock support,
and that also support 4bit block protection (bp0-3).

This patch support lock/unlock feature on the flashes.
Tested on n25q512ax3. The other is modified following the datasheet.

Signed-off-by: Jungseung Lee <js07.lee@samsung.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 31a2106e529a..e8d1fbe4062f 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -2607,12 +2607,17 @@ static const struct flash_info spi_nor_ids[] = {
 	{ "mt25ql512a",  INFO6(0x20ba20, 0x104400, 64 * 1024, 1024,
 			       SECT_4K | USE_FSR | SPI_NOR_DUAL_READ |
 			       SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES) },
-	{ "n25q512ax3",  INFO(0x20ba20, 0, 64 * 1024, 1024, SECT_4K | USE_FSR | SPI_NOR_QUAD_READ) },
+	{ "n25q512ax3",  INFO(0x20ba20, 0, 64 * 1024, 1024,
+			       SECT_4K | USE_FSR | SPI_NOR_DUAL_READ |
+			       SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB |
+			       SPI_NOR_4BIT_BP | SPI_NOR_BP3_SR_BIT6) },
 	{ "mt25qu512a",  INFO6(0x20bb20, 0x104400, 64 * 1024, 1024,
 			       SECT_4K | USE_FSR | SPI_NOR_DUAL_READ |
 			       SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES) },
-	{ "n25q512a",    INFO(0x20bb20, 0, 64 * 1024, 1024, SECT_4K |
-			      USE_FSR | SPI_NOR_QUAD_READ) },
+	{ "n25q512a",    INFO(0x20bb20, 0, 64 * 1024, 1024,
+			       SECT_4K | USE_FSR | SPI_NOR_QUAD_READ |
+			       SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB |
+			       SPI_NOR_4BIT_BP | SPI_NOR_BP3_SR_BIT6) },
 	{ "n25q00",      INFO(0x20ba21, 0, 64 * 1024, 2048, SECT_4K | USE_FSR | SPI_NOR_QUAD_READ | NO_CHIP_ERASE) },
 	{ "n25q00a",     INFO(0x20bb21, 0, 64 * 1024, 2048, SECT_4K | USE_FSR | SPI_NOR_QUAD_READ | NO_CHIP_ERASE) },
 	{ "mt25ql02g",   INFO(0x20ba22, 0, 64 * 1024, 4096,
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
