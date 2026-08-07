Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6172CC5AC7C
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Aug 2026 06:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PeGLET/77jZB5+/82Z6ouPzrMfII8hrQCg1FHn00gJ4=; b=gpLfaxQ9aC2fum
	brvdpmMJSDZ0jM19tJPPwueBI4q5xDwhK8CRaNMfSjc2inbaap2aQxfv3vQGVw8atNmgFJd+YdRPt
	vkCdtUMJ4WiEBTiEXOrDa8xVvJXC7tVM5Ps8qAMNTGBLIcqCsZ4slL9ocH+JRqrEEmFjVPFOZ5Phb
	8DDb4wp+f4dV9WX8kVm3szGa6elMt2//jMCagDnPGq1HGwMGw91t6UPzKKwc13ybIlSVmSuCl/97c
	NqTf60ZtqGe5kwmGE3UZC9z+d29tvNyyrDqXRSWA6lSjuATmRcbpC6zpF22ueh9Dlwj6RsBPcqToc
	Y+G8jUR2hkERlYnpQOiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsEJ5-00000007BkK-40D8;
	Fri, 07 Aug 2026 06:43:51 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsEJ3-00000007Bjk-3QTV
	for linux-mtd@lists.infradead.org;
	Fri, 07 Aug 2026 06:43:50 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6770Gl3a3177598
	for <linux-mtd@lists.infradead.org>; Fri, 7 Aug 2026 06:43:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=AvCPRmDGMOk
	Hdj7PQJSRQsWuMmuJha1UEt1BuslfUVM=; b=pk4p6d97cpob/gTRY/JcZa2mCV7
	Cx88wUkqx74sOvCV9+fCeN5Uux0Z/axgEBg5+YFB1weYrty9WjqjzOjOG9j+1zFq
	yzKZwcTHtW3/7w4uPziLLnerL2mEZZnYgV62bjCzdZIlrVfDnqUAzvwMO1mJEnyD
	svya0trf1JJZem5xBn4/Qvy5XIKKTQzXJYQDqpd14tRe+4o3vbtWk6WkFmwO894D
	rcIpkGAMlpzilFYUBRKuTonDwIRFInRhHjjAbSkEmQFkGjqRQL6ZDqXDYY7tpxqv
	hQiSyo9/s7Q6bZMaI13LAC+RD0qudueb1MfeypiUZjfEd56s1NEyf7eRNsQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvy6jjjee-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mtd@lists.infradead.org>; Fri, 07 Aug 2026 06:43:49 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cbb20f82a0eso3543303a12.0
        for <linux-mtd@lists.infradead.org>; Thu, 06 Aug 2026 23:43:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786085029; x=1786689829; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AvCPRmDGMOkHdj7PQJSRQsWuMmuJha1UEt1BuslfUVM=;
        b=Q+hrSzg8ZHjySP5T1MxyBj7lUA0Zftl6/hQFBSnbLe6xJ9wo952gpjMGOw+Tfs0jw/
         7683K+Dg+54AQFHgtPazLz8bBFDsRH2xVZ6C1hHabW6hKnzSo5qqX6mB14TuTAcHdPO1
         f0w+eR5J+aKYFsQvVNU3Tk/bJJE/xVtHwzEJVrUjGB18bILHCulvlaf7RRHBXxPnHA4D
         z13i+WSGYv75jeMvUhLXIOBtGZV3dKtQ2vM/RiKP9w4zoC/R1Apz8gGZpCdAyxF9Rzoz
         Yx9CtuK0a2uEQu2Ieue3AplurNgQ9465ks9UpA4oR5UH50f9L5wKkzQnyW7weHoV4roa
         BZ+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786085029; x=1786689829;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AvCPRmDGMOkHdj7PQJSRQsWuMmuJha1UEt1BuslfUVM=;
        b=FWGkpQwTBXVxWshGTmstGxpLfjkh2pOc7MZSXECvhpP1cBwDO7j8uINYvN+dSVK+Iw
         X+EtD96SSFwi9dMz7hFYHVrVYeYvVcHbRHoPzX6xgjgYg/7UjuWNFBGe33mX6nCdkOlR
         uZlBdMHPXQaha0XiRW2IVMQ9XFZfDCb58G1+xGSsBzEw+i2+rL8zDs3PRjQSduCBqSc1
         sJH1EFEhDv2YA5+v7edsKG4zGQlQLjr5XfX7IzzdHLRsZQZ/KJRaRojGM8KJwtb+4SO5
         abOYIid68y2N3rbczf8cmGPqdYBssqXM/uSSaFlWVjfFMowWKxjgcVKUMF6S3uu5/sb0
         3ADA==
X-Forwarded-Encrypted: i=1; AHgh+RrTGxHR0KQ56+/c0FZmY9vSJ2UtZw8V0SOBmGmBl8UB4PFpIrMebNUctkz3+ym7To2+jWK2hgiqsnY=@lists.infradead.org
X-Gm-Message-State: AOJu0YzP2EdJxlyMrNgTKrAVSuhBYitO5LJBiqVipVAPV+e4AGzdOhBB
	zSsrkMjBJ+kL6rOaJPL6IHcyJBWtZWGL7Xg4vNQn473n6TJYmu4x15ILUt7tZzLFO7Wi2NmMLzh
	zkmu2DPVH3jFu7oZbROvEj2lQoVF6vGnevSUKUV9l5ZVszRw92/o8PDyiKEDWZBIuvNCl
X-Gm-Gg: AR+sD10BOYh1djuSC4pzLev0vLEYMWr00FOEkQchNH3F7PpuokwLvCzKGfoc8XQaXoc
	ZEJULFp+s0OirIfv+Ajo/MjvmPyw1dN0q5Rg7JKFywmlCjVUy5keHLtXIDhclu4+KJxg0+MlhYe
	a8zlzFSzMmSshkTKh0j5rwJlWH+Umf8v2cNlK4ios3UGTcye1KbgeH4c85VAGs3mH2CxO6PZTsr
	SimLELZbZ0wc8RndVz3gC2CJhRl9lGCKLWmKWXEBash3HmE2TkIk5i+zp3+u+ph8L4IkqQiYb8B
	7hPAv3T5u2/l/Qco+Hvyca95nuB1Vsa3Z2RbfGJhInw26CmmdjB+rKBP4UZYvjJHeqbDUEUIQj7
	uM9snQBsUca6xVgxHeHkt0ox/UnOSxwEC809o6SGn+F6D9ENnDHfcUhAKHYboLdBYXkgaTTORjF
	ZPBTS1p5K/snw=
X-Received: by 2002:a05:6a21:6e92:b0:3c6:61c6:8970 with SMTP id adf61e73a8af0-3cb85df2778mr29127894637.14.1786085028673;
        Thu, 06 Aug 2026 23:43:48 -0700 (PDT)
X-Received: by 2002:a05:6a21:6e92:b0:3c6:61c6:8970 with SMTP id adf61e73a8af0-3cb85df2778mr29127843637.14.1786085028240;
        Thu, 06 Aug 2026 23:43:48 -0700 (PDT)
Received: from hu-mdalam-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141019b41d9sm3833652c88.5.2026.08.06.23.43.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 23:43:47 -0700 (PDT)
From: Md Sadre Alam <md.alam@oss.qualcomm.com>
To: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
        tudor.ambarus@linaro.org, s-k6@ti.com, linux-mtd@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc: varadarajan.narayanan@oss.qualcomm.com
Subject: [PATCH 1/2] mtd: spinand: winbond: add support for W25N04LW
Date: Fri,  7 Aug 2026 12:13:38 +0530
Message-Id: <20260807064339.1632249-2-md.alam@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260807064339.1632249-1-md.alam@oss.qualcomm.com>
References: <20260807064339.1632249-1-md.alam@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDA0OCBTYWx0ZWRfX9MqTx8BViwyC
 66oeRMRh+n2+FTH9ty9VltR/I2YUBX20Jr9L3nIQhPPccyNqLzVuMOCOnp5yKUi0rI8CXzMn3lw
 cDOQLgsbgZ0vZiL6p0L4kviuiYW5swec6YK6Ist7sIyODFIeWRFId5KNyYEwIDq/RtPNugVpu/v
 HEtfdIGiGZz2LzmBFEmaBty/Dp+Ycyymg5SCli/iIAGz2RbS/jAttZyAivRD416u0+yF1dMt0lm
 X5YCEZUvtbWDZEJbcJVDl7JxLjdrlYUGIxX/L6wTb946KZyUxJOyR2Wkcm6aAMKFWsRPgz4Y7K9
 7ROYc/DPntY/0mVuTBRAEBN+2vxn/SwNrOXtVN3h04T5WDw1xEOb72KzxJJ3lnfvEobJLQ9Ho4T
 84oNqXR4uY/5vbjsUSJXDFtIXT4IRLul22dzkLIlLNaxWEOysRMPpvUd/UhrPlGX5/vFD9Ipf5B
 E8Sj3hbqO36g3q3u2AQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDA0OCBTYWx0ZWRfX0bzj277dckbk
 yhHsSeZvAU3Z1SpDLjc4xAszKJv8n45uV/rfypBf+GUU/5mQbLHVrfi/Q9juRDi2FXhWnuGhEYo
 YxrkzjLq14gqxzCESgdGslB7DypONd8=
X-Proofpoint-ORIG-GUID: 6ptC9Vt0uCuYXYddw6oHwNzA4PpmR3t6
X-Proofpoint-GUID: 6ptC9Vt0uCuYXYddw6oHwNzA4PpmR3t6
X-Authority-Analysis: v=2.4 cv=e5Y2j6p/ c=1 sm=1 tr=0 ts=6a757ea5 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=WBRZZNzXIX_3tYRKepwA:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608070048
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_234349_858615_5446D502 
X-CRM114-Status: GOOD (  13.73  )
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

Add support for Winbond W25N04LW 4Gbit SPI-NAND.
It has 8-bit on-die ECC and a 4096+256 byte page
(4096 byte main area, 128 byte usable OOB once
on-chip ECC hides the 128 byte parity area),
organized as 2048 blocks of 64 pages each, unlike
the existing 2048 byte page W25N04KV/W25N04KW parts.

Signed-off-by: Md Sadre Alam <md.alam@oss.qualcomm.com>
---
 drivers/mtd/nand/spi/winbond.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/mtd/nand/spi/winbond.c b/drivers/mtd/nand/spi/winbond.c
index 9b78c1e6cbc9..b0147b7cb76f 100644
--- a/drivers/mtd/nand/spi/winbond.c
+++ b/drivers/mtd/nand/spi/winbond.c
@@ -345,6 +345,29 @@ static const struct mtd_ooblayout_ops w25n02kv_ooblayout = {
 	.free = w25n02kv_ooblayout_free,
 };
 
+static int w25n04lw_ooblayout_ecc(struct mtd_info *mtd, int section,
+				  struct mtd_oob_region *region)
+{
+	return -ERANGE;
+}
+
+static int w25n04lw_ooblayout_free(struct mtd_info *mtd, int section,
+				   struct mtd_oob_region *region)
+{
+	if (section)
+		return -ERANGE;
+
+	region->offset = 2;
+	region->length = mtd->oobsize - 2;
+
+	return 0;
+}
+
+static const struct mtd_ooblayout_ops w25n04lw_ooblayout = {
+	.ecc = w25n04lw_ooblayout_ecc,
+	.free = w25n04lw_ooblayout_free,
+};
+
 static int w25n01jw_ooblayout_ecc(struct mtd_info *mtd, int section,
 				  struct mtd_oob_region *region)
 {
@@ -768,6 +791,15 @@ static const struct spinand_info winbond_spinand_table[] = {
 					      &update_cache_variants),
 		     0,
 		     SPINAND_ECCINFO(&w25n02kv_ooblayout, w25n02kv_ecc_get_status)),
+	SPINAND_INFO("W25N04LW", /* 1.8V */
+		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xb2, 0x23),
+		     NAND_MEMORG(1, 4096, 128, 64, 2048, 40, 1, 1, 1),
+		     NAND_ECCREQ(8, 512),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     0,
+		     SPINAND_ECCINFO(&w25n04lw_ooblayout, w25n02kv_ecc_get_status)),
 	SPINAND_INFO("W35N04JW", /* 1.8V */
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xdf, 0x23),
 		     NAND_MEMORG(1, 4096, 128, 64, 512, 10, 1, 4, 1),
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
