Return-Path: <SRS0=Piv4=ZU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD5C3C432C0
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Nov 2019 08:59:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9259C2176D
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Nov 2019 08:59:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QatE9Pd6";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="UIBqIDqY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9259C2176D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=samsung.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:List-Owner; bh=RlXXFrFzrhFkQTIWo1rqVlq7KdTZKsjCuKLqrjxggEA=; b=Qa
	tE9Pd6XSZTxas7zJO4JZiNAAD4XxRTPMQgG3EVnWlEbUDpVvePzAtbmlYXnbQCfmhu+WRcduSCQDg
	P6nPeCzMDgfZ416Oiq+LCVL8izf+MFM2azExgjPMOGsqJa9AMKUeD9Y/r8ZhkcDmOWls8uh3WR9Md
	dxK4oBug3mdelvUUKg2YmaWiBIA+zHjMHMI46Bfp2EsK2auA6FR23VqRj0oa190yATYoSt8+CGHKx
	WPC5AamG2yOPnAjvuqGkeuArtIJOWM+Vt9XkKzSdC79ymIoA2uzRpbOqsQwhb2IT84/2cMZpkmd3U
	cj/DpsC7I4GlGGjc765SXm2htlCsRe5g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iaFdg-0006SL-KW; Thu, 28 Nov 2019 08:59:04 +0000
Received: from mailout4.samsung.com ([203.254.224.34])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iaFdd-0006RU-7Y
 for linux-mtd@lists.infradead.org; Thu, 28 Nov 2019 08:59:02 +0000
Received: from epcas1p4.samsung.com (unknown [182.195.41.48])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20191128085857epoutp0453c0ec0c770c21bf7b2afe2355d56ed1~bR_OOMLnl3111331113epoutp04L
 for <linux-mtd@lists.infradead.org>; Thu, 28 Nov 2019 08:58:57 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20191128085857epoutp0453c0ec0c770c21bf7b2afe2355d56ed1~bR_OOMLnl3111331113epoutp04L
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1574931537;
 bh=6N0DKEwDMEy6KDLZsnPyrZ4by/cmJ53W4OfNeJMw9qM=;
 h=From:To:Cc:Subject:Date:References:From;
 b=UIBqIDqYH8Px2HQIyUD33jHOcOT8gRCPXgQaC4y1kxA03R+Rw/idjuF9OOyDO4toU
 YTnqcRLLhACpRnpRLrYp5j+Pz8z6d0a+7+nK2uKRoMykSXdbBqcpfaphCSFoNVLB44
 RRfY7DW/891urW5hCzG/2MRz0SEY7e67RpcW5lBo=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
 epcas1p2.samsung.com (KnoxPortal) with ESMTP id
 20191128085856epcas1p22a0c8cc7d464a2ad87de6089f9fae604~bR_NjiBEQ2940429404epcas1p29;
 Thu, 28 Nov 2019 08:58:56 +0000 (GMT)
Received: from epsmges1p3.samsung.com (unknown [182.195.40.159]) by
 epsnrtp1.localdomain (Postfix) with ESMTP id 47Ns4v4p2qzMqYm0; Thu, 28 Nov
 2019 08:58:55 +0000 (GMT)
Received: from epcas1p3.samsung.com ( [182.195.41.47]) by
 epsmges1p3.samsung.com (Symantec Messaging Gateway) with SMTP id
 D1.55.52419.F4C8FDD5; Thu, 28 Nov 2019 17:58:55 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTPA id
 20191128085855epcas1p4df769371adf54c302feff687fdb30279~bR_MI_vBy2878228782epcas1p4t;
 Thu, 28 Nov 2019 08:58:55 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20191128085855epsmtrp2f31fcdaedf0006f4f4d7b37edbee5531~bR_MIaTCD1920519205epsmtrp28;
 Thu, 28 Nov 2019 08:58:55 +0000 (GMT)
X-AuditID: b6c32a37-5b7ff7000001ccc3-51-5ddf8c4fce91
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
 B3.37.06569.F4C8FDD5; Thu, 28 Nov 2019 17:58:55 +0900 (KST)
Received: from localhost.localdomain (unknown [10.88.100.192]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20191128085855epsmtip25fab837a88d73c4c2faf5c1eb3551b27~bR_MBqgm60498804988epsmtip2G;
 Thu, 28 Nov 2019 08:58:55 +0000 (GMT)
From: Jungseung Lee <js07.lee@samsung.com>
To: js07.lee@gmail.com, Marek Vasut <marek.vasut@gmail.com>, Tudor Ambarus
 <tudor.ambarus@microchip.com>, linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: spi-nor: fix typo of "JESB216" in comment
Date: Thu, 28 Nov 2019 17:58:50 +0900
Message-Id: <20191128085850.27531-1-js07.lee@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrHKsWRmVeSWpSXmKPExsWy7bCmvq5/z/1Yg8+3lC3+znnHZPHo5m9W
 i91Ny9gtju65x2zxcYmDA6vHzll32T02L6n3uPNjKaNH35ZVjAEsUTk2GamJKalFCql5yfkp
 mXnptkrewfHO8aZmBoa6hpYW5koKeYm5qbZKLj4Bum6ZOUBrlRTKEnNKgUIBicXFSvp2NkX5
 pSWpChn5xSW2SqkFKTkFhgYFesWJucWleel6yfm5VoYGBkamQJUJORmbj75kK5jHWrH9+wmm
 BsaVLF2MHBwSAiYSM1dmdDFycQgJ7GCU2L1oH2sXIyeQ84lR4sgtNYjEN0aJ/cv7mEASIA3/
 n59igkjsZZS41zqVFcL5zCjx/fYVsCo2AS2JG783gSVEBDoZJWbd62EGSTALaEj8PnCTBcQW
 FrCXePDpIDuIzSKgKjF940mw3bwClhKfGh8zQ6yTl1i94QAzyCAJgY+sEg8m/GGHSLhI/Dn7
 gRHCFpZ4dXwLVFxK4vO7vWwQdrHEzpUT2SGaWxglHi1fAlVkLPHu7VpmUAgwC2hKrN+lDxFW
 lNj5ey4jxKF8Eu++9rBCAolXoqNNCKJESeLNgxYWCFtC4sLjXlYI20Oi4V8rOyTsYiXWbN7L
 OoFRdhbCggWMjKsYxVILinPTU4sNC4yRY2kTIzgtaZnvYNxwzucQowAHoxIP74uke7FCrIll
 xZW5hxglOJiVRHhZsu7HCvGmJFZWpRblxxeV5qQWH2I0BYbeRGYp0eR8YMrMK4k3NDUyNja2
 MDEzNzM1VhLn5fhxMVZIID2xJDU7NbUgtQimj4mDU6qBkaW+YL+b6KF7xovfTso9PI3zoMeh
 2cl+xcGXl238ZGFztCawXGzhh4dulouDFi4KP7fXWTHNRK6WsWynQsHpQlmrY5Mm//Hem3qS
 6Y92ZIzE9PXfbu8/0XDW6v3ZQzdk8jiK75lWTyq+9lm5f4t/wdQFStMTZMz/mLbum29X8mLl
 pICYXT6FS5VYijMSDbWYi4oTAWSab51hAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrDJMWRmVeSWpSXmKPExsWy7bCSvK5/z/1Yg3cfWC3+znnHZPHo5m9W
 i91Ny9gtju65x2zxcYmDA6vHzll32T02L6n3uPNjKaNH35ZVjAEsUVw2Kak5mWWpRfp2CVwZ
 m4++ZCuYx1qx/fsJpgbGlSxdjJwcEgImEv+fn2LqYuTiEBLYzShx+vN1RoiEhMSjnV+AijiA
 bGGJw4eLIWo+Mkrs2vqJDaSGTUBL4sbvTawgCRGBXkaJLYe+gjUzC2hI/D5wE2yDsIC9xINP
 B9lBbBYBVYnpG0+ygti8ApYSnxofM0Msk5dYveEA8wRGngWMDKsYJVMLinPTc4sNC4zyUsv1
 ihNzi0vz0vWS83M3MYLDREtrB+OJE/GHGAU4GJV4eF8k3YsVYk0sK67MPcQowcGsJMLLknU/
 Vog3JbGyKrUoP76oNCe1+BCjNAeLkjivfP6xSCGB9MSS1OzU1ILUIpgsEwenVAPjxLvNO59N
 UpNI/FOnoMqf8edIwQsXS9Flci/Ocvzrq1p/7criNs3XRQ83N/i9L7A5eMuNW9bv4+JlWyOZ
 BPPv/nsTuUa9Pkx854MHJu/3b8oP2tOqI1XDNG361Z9LH2ibadn+Z61uKsiYXa8/ecPMWSVG
 ZhsfH/97PCaY86nZk2Pft//PKkyKU2Ipzkg01GIuKk4EAJQodKIPAgAA
X-CMS-MailID: 20191128085855epcas1p4df769371adf54c302feff687fdb30279
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20191128085855epcas1p4df769371adf54c302feff687fdb30279
References: <CGME20191128085855epcas1p4df769371adf54c302feff687fdb30279@epcas1p4.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191128_005901_521899_68C1EE06 
X-CRM114-Status: GOOD (  14.98  )
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
Cc: Jungseung Lee <js07.lee@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Fix typo s/JESB216/JESD216/

Signed-off-by: Jungseung Lee <js07.lee@samsung.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index f4afe123e9dc..8d4d721fd7f4 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -85,7 +85,7 @@ struct sfdp_header {
 #define BFPT_DWORD(i)		((i) - 1)
 #define BFPT_DWORD_MAX		16
 
-/* The first version of JESB216 defined only 9 DWORDs. */
+/* The first version of JESD216 defined only 9 DWORDs. */
 #define BFPT_DWORD_MAX_JESD216			9
 
 /* 1st DWORD. */
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
