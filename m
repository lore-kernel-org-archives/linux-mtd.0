Return-Path: <SRS0=R5zI=V5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=DATE_IN_PAST_96_XX,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22566C19759
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Aug 2019 10:26:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DBB652087E
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Aug 2019 10:26:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Syj/vMaM";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="UMoaZXt/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DBB652087E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=samsung.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8h6XVfNOVIap8wdABCDvm2Kte4fbSNs2kSciQOMtViE=; b=Syj/vMaMQSS0Xg
	wBnezIqocrj0C2iHAFwIrAH/S8Xs/keU0LkSXgY/OUHC9A/VMZtDt/zr13nUO6spoLmprBYmrV6vS
	XhYJCZdBeQrlq01dmhi/cEnaTJb7X9Sh1M7bdUCvKnpfHRms0VhygJ45C3B3Mp9qUnYNmCmnKvCQW
	PQvauCY4KZqKaUyZegyOFMtqkeMIxwvcotBlrI9BTBcf6IHPoDK+KpruFuAUBUaomh2AG6hM3JFDA
	gkTX0zQ+AonqC0UYKkyDO71KUTHKrui0jSlT8wq1EGuztJ0wM33QhaQsbP08yp0ucRN/HiD8/DH4A
	VRNP3MsOcRc3tr9dwedA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1ht8Hh-0001qW-6S; Thu, 01 Aug 2019 10:26:09 +0000
Received: from mailout3.samsung.com ([203.254.224.33])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1ht8HP-0001Sy-Sx
 for linux-mtd@lists.infradead.org; Thu, 01 Aug 2019 10:25:54 +0000
Received: from epcas1p3.samsung.com (unknown [182.195.41.47])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20190801102549epoutp033c57e1da7182e33f7a8cef541668d92c~2xZF1JVia1112411124epoutp03C
 for <linux-mtd@lists.infradead.org>; Thu,  1 Aug 2019 10:25:49 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20190801102549epoutp033c57e1da7182e33f7a8cef541668d92c~2xZF1JVia1112411124epoutp03C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1564655149;
 bh=IrM+QBTPhBBdOCPiKyE/k+WdBKhp/99OPoV4v/DlOac=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=UMoaZXt/lqIHGv/ZWrYcb1VifuHYvMvJhzietlejXKWGx4Hz5nOL0LX9gRdy3F73e
 xLECLMFehTuezIPR+CKFf7EtKvXBgPqXeMM1eCcOUSeSiVitTithDmioP77Eu1N/F1
 DyQX1H7ox981f0fObnqWd1T9rw0rZ47xrL90m9+8=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTP id
 20190801102547epcas1p409f180ba7821c59b4d3d73b4fcab51df~2xZEjenOx0933609336epcas1p4p;
 Thu,  1 Aug 2019 10:25:47 +0000 (GMT)
Received: from epsmges1p1.samsung.com (unknown [182.195.40.162]) by
 epsnrtp4.localdomain (Postfix) with ESMTP id 45zmf2392DzMqYkZ; Thu,  1 Aug
 2019 10:25:46 +0000 (GMT)
Received: from epcas1p1.samsung.com ( [182.195.41.45]) by
 epsmges1p1.samsung.com (Symantec Messaging Gateway) with SMTP id
 78.CC.04088.A2EB24D5; Thu,  1 Aug 2019 19:25:46 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTPA id
 20190801102545epcas1p46bf16362a9a2dbf39e2caff85813807c~2xZCxHwJs2675026750epcas1p47;
 Thu,  1 Aug 2019 10:25:45 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20190801102545epsmtrp2604bde5650db7506b0ec445bc71ee8fa~2xZCwb6Ao0916509165epsmtrp2I;
 Thu,  1 Aug 2019 10:25:45 +0000 (GMT)
X-AuditID: b6c32a35-845ff70000000ff8-a5-5d42be2a6144
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 26.0B.03706.92EB24D5; Thu,  1 Aug 2019 19:25:45 +0900 (KST)
Received: from localhost.localdomain (unknown [10.88.100.192]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20190801102545epsmtip1ad8a0e31b6400572e4b55fd6544dd729~2xZCj3-Vh2329623296epsmtip1N;
 Thu,  1 Aug 2019 10:25:45 +0000 (GMT)
From: Jungseung Lee <js07.lee@samsung.com>
To: Marek Vasut <marek.vasut@gmail.com>, Tudor Ambarus
 <tudor.ambarus@microchip.com>, David Woodhouse <dwmw2@infradead.org>, Brian
 Norris <computersforpeace@gmail.com>, Boris Brezillon
 <bbrezillon@kernel.org>, Richard Weinberger <richard@nod.at>,
 u.kleine-koenig@pengutronix.de, linux-mtd@lists.infradead.org,
 js07.lee@gmail.com, js07.lee@samsung.com
Subject: [PATCH v4 5/5] mtd: spi-nor: support lock/unlock for a few Micron
 chips
Date: Sat, 13 Jul 2019 23:59:38 +0900
Message-Id: <20190713145938.19203-5-js07.lee@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190713145938.19203-1-js07.lee@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA01Sa0hTYRjm29nZjpfJYWp+DKp1qB8u1B3n7BSti0UequWwoChlHfSwibu1
 s1VGV5tdVpbDojQvhZq5JYmKaV6zQgkK/1VoIdaPEl22UVkqtHmM+vd87/O87/Pwfi+GSH+h
 MqzA4mDtFsZEiCKFHc8Sk5IUfRm5ypHL8ZTPdQtQz0eaEcrTVI5QC1V+ATXxbg6luovvi6kX
 PR8QqrxrClDf6rdQo55ysCWS7qp8L6bbHijoVu9lEd1Wf4Yem20A9LuaI/T1BSV9rd0LdNhB
 00Yjy+SzdjlrybPmF1gMGmLXXv02vTpdSSaR66l1hNzCmFkNsX23LmlHgSkUkJAfZUzOUEnH
 cByRsmmj3ep0sHKjlXNoCNaWb7KRSlsyx5g5p8WQnGc1byCVylR1SHnYZHRPlYtsQcnxnq93
 RGeBN8oNIjCIp8HzU00iN4jEpHgngBXBV0iYkOIBACffJPPEDwCHvjwU/u14HwwIeaIXwJsd
 bsA/ggDWNnwRh1UiXAHfzrWiYSIO/yyA03130DARi2eHRt0GYSzE18DAzPziWAm+Hj6t6Bbw
 Fiuhr2UglAPDIvANsGxEHp4D8U4RfDz0cinGdthS+3sJx8LJoXYxj2Uw6O8V8ZiDXU0eMd/s
 AnCisX5JpIL+6eZFAwRPhI+epPDlVbBrrnoxG4LHQP/3q2hYAnEJvHRByksIODXuWrKFcORj
 KcpjGs43Fov5RZQC2OkOoGVgeeU/h7sAeMEy1saZDSxH2sj/v6kVLJ6dQt0JbrzePQhwDBDR
 EvnVrblSlDnKFZkHAcQQIk5Sl7A5VyrJZ4pOsHar3u40sdwgUIc26UFk8XnW0BFbHHpSnapS
 qai09HXpahWRILk3S+VKcQPjYAtZ1sba//YJsAjZWSCzDCsWXvcw83FAl/k9q6bk1OypEwvZ
 rtvFmv7VM2V6T8On6jHf2j0DO4/HpHqP1eAFyKXJzZmna3MyqmoHV5xfmWVwFWm1GaUC7dbp
 Eid6sbAk+pxf4zuwry7rVuU4eSHKWDg+Gpj0VFtPSgyH6tjP0RXXNv3M67+yX3tlOKeQEHJG
 hlQgdo75A/mYJFKMAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrILMWRmVeSWpSXmKPExsWy7bCSnK7mPqdYgzO7NC1Wt0xntDhyYS2z
 xcSVk5kt/s55x2Tx6OZvVovdTcvYLY7uucdsMXnnG0aLj0scLG5PnMzowOWxc9Zddo/NK7Q8
 Nq3qZPPYvKTe486PpYweN+cVevT/NfDo27KKMYAjissmJTUnsyy1SN8ugSuj681ktoLPvBV7
 3s9ma2Bcxd3FyMkhIWAicffzJ5YuRi4OIYHdjBIfj35igkhISDza+QUowQFkC0scPlwMUfOR
 UeJfbx87SA2bgJbEjd+bWEESIgIfmCQuTzrFApIQFgiQmNTQAjaIRUBV4tOHP2BxXgFLiYMz
 d0MtkJdYveEAM8gCTgEriQkXFEDCQkAlGw7/YJ7AyLuAkWEVo2RqQXFuem6xYYFhXmq5XnFi
 bnFpXrpecn7uJkZwQGpp7mC8vCT+EKMAB6MSD69Cj2OsEGtiWXFl7iFGCQ5mJRHexeL2sUK8
 KYmVValF+fFFpTmpxYcYpTlYlMR5n+YdixQSSE8sSc1OTS1ILYLJMnFwSjUwFpWXTN8RfHVZ
 /sJ3yjNtLkuku0e+9ilomhZc89iwyZTNp8VjPwfzxv3i0w2eCr4P4jhmbObhx7s//8UsheX2
 K2qlPBvSKtsyuUTvr1OsZAo5lR7AaudioCvrdLxx44o/KW4XLj2UN5Zadm/d1i0/VZ6Yz+/q
 +1H8e/6qD1oebDYnpdPlPyYosRRnJBpqMRcVJwIAwv4KnkQCAAA=
X-CMS-MailID: 20190801102545epcas1p46bf16362a9a2dbf39e2caff85813807c
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20190801102545epcas1p46bf16362a9a2dbf39e2caff85813807c
References: <20190713145938.19203-1-js07.lee@samsung.com>
 <CGME20190801102545epcas1p46bf16362a9a2dbf39e2caff85813807c@epcas1p4.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190801_032552_288208_A712BC5F 
X-CRM114-Status: GOOD (  15.94  )
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
and that also support 4bit block protection bit (bp0-3).

This patch support lock/unlock feature on the flash.

Tested on w25q512ax3. The Other is modified following the datasheet.

Signed-off-by: Jungseung Lee <js07.lee@samsung.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 0fee22068d94..f7d6aad4281e 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -2056,8 +2056,16 @@ static const struct flash_info spi_nor_ids[] = {
 	{ "n25q128a13",  INFO(0x20ba18, 0, 64 * 1024,  256, SECT_4K | SPI_NOR_QUAD_READ) },
 	{ "n25q256a",    INFO(0x20ba19, 0, 64 * 1024,  512, SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
 	{ "n25q256ax1",  INFO(0x20bb19, 0, 64 * 1024,  512, SECT_4K | SPI_NOR_QUAD_READ) },
-	{ "n25q512a",    INFO(0x20bb20, 0, 64 * 1024, 1024, SECT_4K | USE_FSR | SPI_NOR_QUAD_READ) },
-	{ "n25q512ax3",  INFO(0x20ba20, 0, 64 * 1024, 1024, SECT_4K | USE_FSR | SPI_NOR_QUAD_READ) },
+	{
+		"n25q512a",    INFO(0x20bb20, 0, 64 * 1024, 1024,
+			SECT_4K | USE_FSR | SPI_NOR_QUAD_READ |
+			SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_HAS_BP3)
+	},
+	{
+		"n25q512ax3",  INFO(0x20ba20, 0, 64 * 1024, 1024,
+			SECT_4K | USE_FSR | SPI_NOR_QUAD_READ |
+			SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_HAS_BP3)
+	},
 	{ "n25q00",      INFO(0x20ba21, 0, 64 * 1024, 2048, SECT_4K | USE_FSR | SPI_NOR_QUAD_READ | NO_CHIP_ERASE) },
 	{ "n25q00a",     INFO(0x20bb21, 0, 64 * 1024, 2048, SECT_4K | USE_FSR | SPI_NOR_QUAD_READ | NO_CHIP_ERASE) },
 	{ "mt25ql02g",   INFO(0x20ba22, 0, 64 * 1024, 4096,
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
