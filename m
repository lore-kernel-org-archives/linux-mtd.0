Return-Path: <SRS0=enRf=27=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36CABC33CA2
	for <linux-mtd@archiver.kernel.org>; Fri, 10 Jan 2020 10:23:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0711320721
	for <linux-mtd@archiver.kernel.org>; Fri, 10 Jan 2020 10:23:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PUmooyLJ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="rSBva2eX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0711320721
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=samsung.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Bc1gTWU0XRyWQ0Pk1q2AD1nmdSxzXxOyYhUiBTOr6jc=; b=PUmooyLJHgvWfD
	7YVg+fGS72ayhK7yDWEFjw8MNe5vq4a/rPR/HLWK9poFQLCriEpURtnsNEkzV4dxbhdNE/JrsXuis
	OBxYn7z9eTltgfyXqWFVOKa2O7FhQjuhSllLari0Cz/g/Xlq9tj8lf4SKij8FaEOqjaUgIwUlqoB/
	EMZbbZx7Tp3wlhVPgsBUDfDDNkO5C8gzhgfld/am5AtmnbPd4ligPsi2QvV3PEVaeUiogDLI2rfTu
	YQk6BqSl3yQ0TGWprg8bdGDhQ7riEWGHNCUbat08jzBr0jT2XfpsZUnM/xsARj3lgoek9yCvtkP31
	aLI4trvvMxhh5f+67Kqg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iprSC-0006U5-RH; Fri, 10 Jan 2020 10:23:44 +0000
Received: from mailout3.samsung.com ([203.254.224.33])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iprRm-00064N-Hg
 for linux-mtd@lists.infradead.org; Fri, 10 Jan 2020 10:23:20 +0000
Received: from epcas1p4.samsung.com (unknown [182.195.41.48])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20200110102316epoutp03aa23b58b59125e288cbc81ae1b252282~of3HaBbTf0933809338epoutp03X
 for <linux-mtd@lists.infradead.org>; Fri, 10 Jan 2020 10:23:16 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20200110102316epoutp03aa23b58b59125e288cbc81ae1b252282~of3HaBbTf0933809338epoutp03X
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1578651796;
 bh=NXqvgu93jktm98REzLwi1PHKLZGL1NwHKwcYD3YaDKA=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=rSBva2eXtaK24dPgMqAfm7L5QBQGxokmTA8/NGwBAZ5IDziyV2NfhBjobQVV96r9H
 76o2v/f2hbiJ+Rgn425brjJEToLw8spsth6MmqjJNVurYTg+xgz4PkJY8uqJp+Cv4O
 ZLZBJGgPByJYkZmu8V5MbEzZW8hN3eT0aGz1lfXw=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
 epcas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200110102316epcas1p145cfe32d680394ac046b0b6a4232b4a6~of3HJOhrK0264502645epcas1p1n;
 Fri, 10 Jan 2020 10:23:16 +0000 (GMT)
Received: from epsmges1p5.samsung.com (unknown [182.195.40.164]) by
 epsnrtp2.localdomain (Postfix) with ESMTP id 47vJwL5mgZzMqYkV; Fri, 10 Jan
 2020 10:23:14 +0000 (GMT)
Received: from epcas1p2.samsung.com ( [182.195.41.46]) by
 epsmges1p5.samsung.com (Symantec Messaging Gateway) with SMTP id
 F5.CE.51241.190581E5; Fri, 10 Jan 2020 19:23:13 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200110102313epcas1p17aed8316bfacb0a0fb9a42fc0db24292~of3Eny-F50218302183epcas1p1r;
 Fri, 10 Jan 2020 10:23:13 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200110102313epsmtrp23288d51b692ca66ffbfea0d89e3c82fb~of3EnL3Zs3146731467epsmtrp2e;
 Fri, 10 Jan 2020 10:23:13 +0000 (GMT)
X-AuditID: b6c32a39-14bff7000001c829-ac-5e18509171fb
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 19.68.10238.190581E5; Fri, 10 Jan 2020 19:23:13 +0900 (KST)
Received: from localhost.localdomain (unknown [10.88.100.192]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200110102313epsmtip206e471c4c241651098c32b5e11c7b7ca~of3EdqyGV1142511425epsmtip2_;
 Fri, 10 Jan 2020 10:23:13 +0000 (GMT)
From: Jungseung Lee <js07.lee@samsung.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>, Vignesh Raghavendra
 <vigneshr@ti.com>, linux-mtd@lists.infradead.org, js07.lee@gmail.com,
 js07.lee@samsung.com
Subject: [PATCH 3/3] mtd: spi-nor: support lock/unlock for a few Micron chip s
Date: Fri, 10 Jan 2020 19:22:57 +0900
Message-Id: <20200110102257.28883-3-js07.lee@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200110102257.28883-1-js07.lee@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrKKsWRmVeSWpSXmKPExsWy7bCmnu7EAIk4g66NahZ/57xjsnh08zer
 xe6mZewWH5c4WPw/+4HdgdVj56y77B6bl9R73PmxlNGjb8sqRo/jN7YzBbBG5dhkpCampBYp
 pOYl56dk5qXbKnkHxzvHm5oZGOoaWlqYKynkJeam2iq5+AToumXmAO1WUihLzCkFCgUkFhcr
 6dvZFOWXlqQqZOQXl9gqpRak5BQYGhToFSfmFpfmpesl5+daGRoYGJkCVSbkZNx8vJetoIO/
 ouv1TNYGxmfcXYycHBICJhLX7+1n6mLk4hAS2MEo8fvHUijnE6PEkXmz2SGcb4wSTf+nM8G0
 bP4/nQ0isZdRov/jHxaQhJDAZ0aJqyv5QGw2AS2JG783sYIUiQgsZpToeXuZESQhLBAgcWjJ
 VlYQm0VAVeLUm/1gzbwClhKHzs1ihdggL7F6wwFmEJtTwEpi4ZW3zCCDJAQ62CSW9qyEOsNF
 Yuqbc1C2sMSr41vYIWwpic/v9rJB2MUSO1dOZIdobmGUeLR8CVSRscS7t2uBpnJwMAtoSqzf
 pQ8RVpTY+Xsu2KHMAnwS7772sIKUSAjwSnS0CUGUKEm8edDCAmFLSFx43At1s4fEzicPWSCh
 0ssocX3vXJYJjLKzEDYsYGRcxSiWWlCcm55abFhgihxPmxjBSUrLcgfjsXM+hxgFOBiVeHgz
 hMXjhFgTy4orcw8xSnAwK4nwHr0hFifEm5JYWZValB9fVJqTWnyI0RQYlBOZpUST84EJNK8k
 3tDUyNjY2MLEzNzM1FhJnJfjx8VYIYH0xJLU7NTUgtQimD4mDk6pBsZWu5NtGzmSVB+HLnwd
 yBNVcDBuxmXT0HMbw9+d3n9JJP3KKc6tmf8Ob6z2bNYLUrc1bGL5suHN6a2Ni74vvb7mqFS1
 9bXyfVc3RatbLj0r8OCj6lP3HeeeyutvqWftPC2/rlxs529b3W9SasXWv7+Er727lOktS77s
 cWalC+e2TVuT6L+qenurEktxRqKhFnNRcSIAzgXXDmgDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuplluLIzCtJLcpLzFFi42LZdlhJXndigEScwdIdghZ/57xjsnh08zer
 xe6mZewWH5c4WPw/+4HdgdVj56y77B6bl9R73PmxlNGjb8sqRo/jN7YzBbBGcdmkpOZklqUW
 6dslcGXcfLyXraCDv6Lr9UzWBsZn3F2MnBwSAiYSm/9PZ+ti5OIQEtjNKDH95V9miISExKOd
 X1i6GDmAbGGJw4eLIWo+Mkqc3neVCaSGTUBL4sbvTawgCRGB5YwS53/eZQdJCAsESBxp2MoG
 YrMIqEqcerOfBcTmFbCUOHRuFivEAnmJ1RsOgC3jFLCSWHjlLZgtBFTz5/Az1gmMvAsYGVYx
 SqYWFOem5xYbFhjmpZbrFSfmFpfmpesl5+duYgQHkpbmDsbLS+IPMQpwMCrx8GYIi8cJsSaW
 FVfmHmKU4GBWEuE9ekMsTog3JbGyKrUoP76oNCe1+BCjNAeLkjjv07xjkUIC6YklqdmpqQWp
 RTBZJg5OqQZGtbfpt3q2PYzc8mP2e7PYO9q3GM7/fvg6RXdTcdiTK2kyy4PZ5xbvz/7QN1Uz
 de4j0dIdW5ZFvnmifyXB+YPJhKf1IdFHHi+Ms/nYXX/RwGh/4kqT15NrdO9XCv/64izgKfTl
 xDmpBolNSUxMymktoi02OtaK1m13EiYL/w4y6ppc+m8zx0cOJZbijERDLeai4kQA+w3I9SAC
 AAA=
X-CMS-MailID: 20200110102313epcas1p17aed8316bfacb0a0fb9a42fc0db24292
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200110102313epcas1p17aed8316bfacb0a0fb9a42fc0db24292
References: <20200110102257.28883-1-js07.lee@samsung.com>
 <CGME20200110102313epcas1p17aed8316bfacb0a0fb9a42fc0db24292@epcas1p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200110_022318_934309_B65861EC 
X-CRM114-Status: GOOD (  13.37  )
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
 drivers/mtd/spi-nor/spi-nor.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 214f3b733e9b..da285ab56a3d 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -2558,12 +2558,17 @@ static const struct flash_info spi_nor_ids[] = {
 	{ "mt25ql512a",  INFO6(0x20ba20, 0x104400, 64 * 1024, 1024,
 			       SECT_4K | USE_FSR | SPI_NOR_DUAL_READ |
 			       SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES) },
-	{ "n25q512ax3",  INFO(0x20ba20, 0, 64 * 1024, 1024, SECT_4K | USE_FSR | SPI_NOR_QUAD_READ) },
+	{ "n25q512ax3",  INFO(0x20ba20, 0, 64 * 1024, 1024,
+			       SECT_4K | USE_FSR | SPI_NOR_DUAL_READ |
+			       SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB |
+			       SPI_NOR_HAS_BP3 | SPI_NOR_BP3_SR_BIT6) },
 	{ "mt25qu512a",  INFO6(0x20bb20, 0x104400, 64 * 1024, 1024,
 			       SECT_4K | USE_FSR | SPI_NOR_DUAL_READ |
 			       SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES) },
-	{ "n25q512a",    INFO(0x20bb20, 0, 64 * 1024, 1024, SECT_4K |
-			      USE_FSR | SPI_NOR_QUAD_READ) },
+	{ "n25q512a",    INFO(0x20bb20, 0, 64 * 1024, 1024,
+			       SECT_4K | USE_FSR | SPI_NOR_QUAD_READ |
+			       SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB |
+			       SPI_NOR_HAS_BP3 | SPI_NOR_BP3_SR_BIT6) },
 	{ "n25q00",      INFO(0x20ba21, 0, 64 * 1024, 2048, SECT_4K | USE_FSR | SPI_NOR_QUAD_READ | NO_CHIP_ERASE) },
 	{ "n25q00a",     INFO(0x20bb21, 0, 64 * 1024, 2048, SECT_4K | USE_FSR | SPI_NOR_QUAD_READ | NO_CHIP_ERASE) },
 	{ "mt25ql02g",   INFO(0x20ba22, 0, 64 * 1024, 4096,
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
