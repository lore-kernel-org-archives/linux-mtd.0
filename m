Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 854E5FA3745
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Jan 2026 12:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mHrUT2b3nUpkficItWX3gUVBC2i2dbLRSPD5oFUsM4c=; b=nXnkxeocj4ZTN3
	JEegFKBBxyhtxZEnq1+D+LSvWhTKTimMl4UOhEnZaz1w2zlRBWYri8IXjnhUsltPf8cmKQiBvinWK
	FIZvPj/SsIGmufzh3jYok0mSSX8tQZcMFL7CI5CSjhKMrTfodG1gjTHqr1ldNrZtlamoVRclvb5Zc
	m8Lbpomniv+fnvmhp4f0JiDI/1knwu+33wX+s7Y+in/tlWdHvVkd4SSeMe+phWMpSBbDJeJfUyhdU
	16SRzDRr+ypDfwTmL+NfTaoclfRC6ZtZgY9XSrUqTvdMrdT15+1rgoNnalF3HE27kbr86+S4bhgXH
	rfo2SUrrQAyAp+sXYgZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbebD-00000008EN1-20kZ;
	Fri, 02 Jan 2026 12:49:47 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbeb9-00000008EJm-2Ygd
	for linux-mtd@lists.infradead.org;
	Fri, 02 Jan 2026 12:49:45 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6029W2tB3961097
	for <linux-mtd@lists.infradead.org>; Fri, 2 Jan 2026 12:49:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=imFOXG0sly0
	peMhXKSlV52oA/rftbzRYv5spTS32Zjk=; b=FCrAMEE9y+id5h8z0DN8Iv3OAug
	LLDwb3y27vUY1LWNYcWH419RuN2r7zqKpuzEtAErsnFf02A+ZmyazLwhnXaW4NnC
	VAMdG+SQG0MiQe6wb3bBKYlM0bLiOkDVNX4898z5ahnuspizgZpW1Kp7R66024XZ
	EkzwENB6GGwYlvnOjGe4/qtgUPJFNDI887RRJQ75JEyF8Y8DZAuZFGuTcIeeMtzK
	k/PHYlbnqsXMlSCfZ+n/eIYxlBvqDgb6hfrB/sM9vbPR2GunbwGDt1632bKwN90M
	B0r4aW6wzD1BmxYKXtyi0uDRFrq3qkpKzdjhNsI34K9YdAWVZC/VeHxwD5g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bd77v3fdn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mtd@lists.infradead.org>; Fri, 02 Jan 2026 12:49:42 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b22d590227so1372499685a.1
        for <linux-mtd@lists.infradead.org>; Fri, 02 Jan 2026 04:49:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767358182; x=1767962982; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=imFOXG0sly0peMhXKSlV52oA/rftbzRYv5spTS32Zjk=;
        b=Q1+BwnHyCFbObyvEvDaJGc69+1/Rx8bZIWIjDX4zyw+ZyknX8cx30vYSzHwN4Mbf00
         lmlcB7/UkfUFErZTWxVRGIAaqkBLriNCiX+UHEosyTvNFkCh6D6O1ClfhmRkwuxMO/sT
         kypKyFFAmSkE0wvNC7aP2XbaMd2mR/zlMPXNvOHX3cgv/Wl2IrxPlSzol5jkhyed/ESx
         ljMg3w+/Qd1U7x9W6fAF48Tbh1ys28PF/2PA2C6msKnrUqmGyQJJvvC7AqRVufRu8uAv
         7wMY45ncuBuWfjXCpiK2rVXpupKKGLi1i9r18TtOwFj9bUdyP+T9lZI1Uxk01wk3dac9
         GQlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767358182; x=1767962982;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=imFOXG0sly0peMhXKSlV52oA/rftbzRYv5spTS32Zjk=;
        b=n4dtSyfuS+vH0H7JltlIiWpcgx0RAs3IyyHjjDbbv6rvbN8mtB+0bauLNp5rMGDIBy
         iNt4TMmXwP61nCaYtQu84JZiPIC9GkYfx/2fYkTNckBmfy69gX8DrJpYSQzGb8q8/XlF
         Q0ywdJAyYffh9GAZlecsuBrWtcG+BvudejIvTjq7QjDdzCe1lugljBzTiBjQmyIChIfJ
         dIjeEylkj7iq6ce/hL7EeGLw8A0106I8MVtQa6y+FI12aC/FQEAhe6rShBD4aIWlYt9K
         kGzuw5DUM17T4C38SHSVfodXiW5/CYoPEEq1CYk6b55TFQWkez8qCjvJW6OUNum6ee9y
         zVQA==
X-Forwarded-Encrypted: i=1; AJvYcCWyNLBqnJfOTlZr7DCi4VVjN0h9Y5C6hpr/lAmtyVeiAadDlhzlxehceTABvcr8VE8niLUjtB5+5lM=@lists.infradead.org
X-Gm-Message-State: AOJu0YzmEfajuTJX5iL6ZOGrSNpzPbYOdrYkOkxbifOb1k7jtxG20hWY
	xxYCHjpfVvx7SBzO5jQrLWMEcbe/ReEjwnnxfbw/daaBq1oxzb6eX8fygf5C87KW+Ww9vkAEOOh
	izX2rIKeBvz/IPXiF5hIk0J4psAScPY3Bh/B3bR0iF+VNdBx8is30EaJa5VfrMxDBn90p
X-Gm-Gg: AY/fxX66FH/KQFFBpn2K+eBljb47EzhiA7kTBgv4+xd9TL0CxvJa/0aZLepulNGMA7S
	XmOMu681iojNHhraQK+v/c/2AM2X1YZXuDHnl02T5FyXNlcUP7AMnG4AZ9proCKsx9Fozz194xu
	eddntq0VyJ0OysthxqIH+1VUP4Mq8i8KzByjINH5fdxs1VBcBwwQCXoLfFoKDCWHi2WxSdHVfM4
	ZTxS5hITwiippsfGOLE3/mqXOPYQl8nlEs1QbDIXgEQJzeuMvdBPS/a1V4x94uedOj/sN0nUfe7
	mvE52B51HEuGBvgKXne5IUlzlcOEoi6h980+UM44rPCIbsYkPG0ft+ZTjYmSBzF4cH2PO4tdrft
	nOs1FpdcDAOfewDl+miM6gazJ7A==
X-Received: by 2002:a05:622a:480e:b0:4f1:bdba:8cfc with SMTP id d75a77b69052e-4f4abd942dfmr645284851cf.65.1767358181998;
        Fri, 02 Jan 2026 04:49:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHT1txQdBszLd7m8UMVD5gJdJoPAWm8VqLTOz4fR95P96AkN4L2pVtSv48GMc2uikngxpnUBg==
X-Received: by 2002:a05:622a:480e:b0:4f1:bdba:8cfc with SMTP id d75a77b69052e-4f4abd942dfmr645284561cf.65.1767358181601;
        Fri, 02 Jan 2026 04:49:41 -0800 (PST)
Received: from quoll ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea82f6asm86385833f8f.27.2026.01.02.04.49.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jan 2026 04:49:41 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Brian Norris <computersforpeace@gmail.com>,
        Kamal Dasu <kamal.dasu@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Harvey Hunt <harveyhuntnexus@gmail.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Stefan Agner <stefan@agner.ch>,
        Tudor Ambarus <tudor.ambarus@linaro.org>,
        Pratyush Yadav <pratyush@kernel.org>,
        Michael Walle <mwalle@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>, linux-mtd@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, llvm@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 2/7] mtd: rawnand: denali: Simplify with scoped for each OF child loop
Date: Fri,  2 Jan 2026 13:49:29 +0100
Message-ID: <20260102124927.64703-9-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260102124927.64703-8-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260102124927.64703-8-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1147; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=sBSnKcyMGQZIqcjce3lbMUghOycYQyfzC3HJXcyHbGY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpV77YCiAV7tcHXkpkf4bqBHwky6Qoz/np3HIyx
 MfEw1pn1cGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaVe+2AAKCRDBN2bmhouD
 1wLHD/wKh5j1mcOQ0K6bfHRhqc1Y7UiVom1LjviO8AE6GDqHLuoea4sq82dEPvdB+iw7SIEIXbQ
 /xFNf+KfiDchxyuxQ+T4lGaZ8x6WAAx0X4vteAWTqG4l01FoqMBj8pVs8qBvXtJfczUuSKKWGty
 lHel4Tazw/t21yRSf+Y82KLxdE7EkZ1dZ9b09IJGrmxFmKcEVFlmzgW/Ld1sl9E+XavBpplsQNq
 LctU5OBW4R4qvqD4kJrYscewoMoQJTlPu7InLOkeqyCRUCpl1Fym987mlu28GZBYQuRSajHDOXT
 f9HPbuEodD8mLWu+8iOURU8OZ98wCj00bgs9p9AEVpoe8tnYnWUVggb/u4Ip7XbvZ0vnGg21b8Z
 G56JQoVCjK/KyduNGUkZVvJFEzQ4v+P8o6tMqlRKP/5sloqZwug29GVuBXi18Ul9gKVDV0EbgdG
 hcSii0FvyI6jaIIl7NF5ellj+qXUqQN8FKeIMSBZ+60IAfUzpoXB0fNsg774Lvkz+GBI6M+tKvn
 jWAL8vTI9b0K4sQD2rMh7u5l57MqBjUcDkjePNbPtJAHosyqtON/Jtq/BOmd/ZGkQZc9G2L8V6T
 n5/m44JVJ43AkOX905OuLvpKD/yO8gd+PLKiSENBUMdvNiyqTKLIkQURI2ozDwZ6l8uaIy/61OK 7HM+k/p6elpt54w==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: yXPUZrVA0a-tQljseJRMxjk9hbN05vJa
X-Proofpoint-ORIG-GUID: yXPUZrVA0a-tQljseJRMxjk9hbN05vJa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAyMDExMyBTYWx0ZWRfXxTw6jxZo4ctT
 8H4Dc5hlH+sKXIVu0p0fsECyBgt6Xtv8ZQ7RNm2WELyci08w9WSyv6Zpn+yRqiYOCy8TUFKCkwk
 Wxh0R5EYgogtSScah8kp5dpG80CbCFmUhRlMslqgUVGn4O1PxAotwcCUOlJPx13e1sD4q0GWXeD
 2H0jOurUkkMrrZFRhw6Vr3zLVySyXmNvWAVthv2JEt24qfHYUiwuvOFmv+WQrHwP+N6ROBPKJhQ
 CMzGT8CItlu/JgX2mWda9OzJUVEAC8czd6YY6z5QI1GXokrCa5RCzTlRnbynUoRLEN3vbpcBF/g
 V6lQl6OgNY7xkkodctt2D83WGb+Jrock7WUWGS3nDREj7Q05oBE6s/yhaAMfJE3Sy96NIl2ElMg
 Zli7nUvF9aiPbPynxFm+EgsXZ7w3TFqSV54IoVU6D6VLKrBKI1tw9AVouHXadWiZXFegGThFP0m
 r3z6tEqK0gRiqpqTp8A==
X-Authority-Analysis: v=2.4 cv=ev7SD4pX c=1 sm=1 tr=0 ts=6957bee6 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=nYNvWqTqVqtrO4BW6YQA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-02_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 malwarescore=0 clxscore=1015 adultscore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601020113
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260102_044943_770489_A0702B4B 
X-CRM114-Status: GOOD (  15.31  )
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

Use scoped for-each loop when iterating over device nodes to make code a
bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/mtd/nand/raw/denali_dt.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/raw/denali_dt.c b/drivers/mtd/nand/raw/denali_dt.c
index e0dd59bba4bd..8c822eae72e7 100644
--- a/drivers/mtd/nand/raw/denali_dt.c
+++ b/drivers/mtd/nand/raw/denali_dt.c
@@ -115,7 +115,6 @@ static int denali_dt_probe(struct platform_device *pdev)
 	struct denali_dt *dt;
 	const struct denali_dt_data *data;
 	struct denali_controller *denali;
-	struct device_node *np;
 	int ret;
 
 	dt = devm_kzalloc(dev, sizeof(*dt), GFP_KERNEL);
@@ -192,12 +191,10 @@ static int denali_dt_probe(struct platform_device *pdev)
 	if (ret)
 		goto out_assert_rst;
 
-	for_each_child_of_node(dev->of_node, np) {
+	for_each_child_of_node_scoped(dev->of_node, np) {
 		ret = denali_dt_chip_init(denali, np);
-		if (ret) {
-			of_node_put(np);
+		if (ret)
 			goto out_remove_denali;
-		}
 	}
 
 	platform_set_drvdata(pdev, dt);
-- 
2.51.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
