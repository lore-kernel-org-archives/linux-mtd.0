Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA064FA3741
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Jan 2026 12:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VnPxva2DneLs727gok/n1Hv9eQebkpHKqpXyMGGQhyk=; b=j8uSf7n+VFyuJM
	PNw2eAEDVvavOkf4d97g7CtS1J14BpyOu91GoEkZGrcUzNi5taFOTemw+fc8KW9333CzOX9vZMl9B
	hEraQENP+6kjyp60r++NHYFVuc3h0YAFl+XejZWQM9IHqjObD0otKxGHCGqgbSc90VJbqSp94bXvV
	k73uPAhLiZPwPvFtMMA4bRR0G3QLrGgt9IUFZafjYdEiG6a++RWblkk0tMKTgIuLrexQ0CJT79onA
	2++pMJR98HWb7y1WrynSB1UfjBn/nAq+0XQ8Cdt5R/B0UPeKg1ME1dxyVDJ55gx6HsjqoiB37mTb8
	Vw7K/2/YyVQt5oyKgHmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbebE-00000008ENi-1O9T;
	Fri, 02 Jan 2026 12:49:48 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbebB-00000008EKg-0yIT
	for linux-mtd@lists.infradead.org;
	Fri, 02 Jan 2026 12:49:46 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6029W3ma3961102
	for <linux-mtd@lists.infradead.org>; Fri, 2 Jan 2026 12:49:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=19EDiqJvxY+
	UJO1aSOASDk8Ku0ojEKI8jArYLNxDU5I=; b=CqP83ciqt467pUr+SB3/w3DT/ci
	dZMXyyhczbWpROV6nXCwz+9Ma88UycGXeJhfymtm117L+LPNOrRe/yoIzb0FRjuv
	+j9vyfGDSosPP8YbhazWBBlvNHgH02a+Q3QQNmqo58ccziY6A3PaHHLi5yykCcId
	/ULMD4F3C8RIgJgARrUs7coy+nHzV9s5Z1ByKSIEPXzcH05Zzkn5sPiinFrLfD0J
	EF92feTyoe7u4I3674/n5mXeWGZ9Ekkx/hZ/ZRDvmC0ovsq8NDeGTz6z1aoC6XC2
	bbMOPcmC3+xvGkkJ1BMsJOArMnsw/R+fktsDa+QfiBzA3oahr7Pv4YsCWwQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bd77v3fdr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mtd@lists.infradead.org>; Fri, 02 Jan 2026 12:49:44 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4edaf9e48ecso338376341cf.0
        for <linux-mtd@lists.infradead.org>; Fri, 02 Jan 2026 04:49:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767358184; x=1767962984; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=19EDiqJvxY+UJO1aSOASDk8Ku0ojEKI8jArYLNxDU5I=;
        b=jXeni0mtzjMEZJ2O3VkiKqSXwtO4Xzc8pjMyB0B7NuSieA6TjcFfykkGVpAVjw+Hl+
         c3D7ZjuP2tBuF0fTPeTJnjkTeL6TVSk7JQI+EnfwUKJ0VkRjGDrG8bH+W6Dyfc7hvjLl
         l0bh5ZT3ztEaRxx/omwos55PM6hHMWqjv675PRL47lDGpU5EEw22nKZipNw7dczpL2nw
         g7vDgQ0Cm7GD2zTR2A/QIxJdJpy2f3iumGjpv3PS6qyq0E98UmZIcow6zh1EwYNTQVww
         1M/mcthXukzA0dEAP41Omm+kn3vAUZi2ueKtnObfD3Zch6Nzal3Mja2zLQ6PO7dVF0Ml
         AfMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767358184; x=1767962984;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=19EDiqJvxY+UJO1aSOASDk8Ku0ojEKI8jArYLNxDU5I=;
        b=dTuFDDa8WvBi6F9IiFbA/dTzuCx3i00egdA1gT7jqmdHVfaVuR7iZT0EZEY/o2yaF7
         5cd+3sXlnPpKtdtjmwcMij5kCBVICOYITayktWdDX/whpzCxjTixtaQcI+nOUBD0hnY0
         Ps4EVEsa97q5tJyziNvKb9XWLU9bvva0O/vYQe5dLa4gQxgZ0ma0bYSx66Jnbn2zFC5j
         9RYdNjegH/G4qxEanp7xGZ/fd73bdifMlt7MjI86B4DTiUOvR6SQHXKX/c3lQ4qhqWXA
         5DDTvsKbEea2JMx+UE/+IyyoWIaAAwJ3OJbycl67hIyN98aF5jnSSThMHJBvsOGLY/ID
         Gipw==
X-Forwarded-Encrypted: i=1; AJvYcCUNsViMW3H5BTxhpP297jJIGegZryP4JwWf3+fQKRtXiELPS9GOgyb3nzAmApK+5mfSHGh7kDSCRl0=@lists.infradead.org
X-Gm-Message-State: AOJu0YwjVMUPZ9u4hr/jOflrGUtH1nmlusy3u4g2++/+HYsQoIvkOAA0
	+PJhx2GXOJMLUNxxbBb/TNPWWaUrUqRMiBdISyMpXEa7B7dHF6fk33jcO4NGmh5BlTS5z/tDlNy
	iYMwPvWOoq+fLpILvqXpWMcZfbnPOjHC0Z4G8fl9+JdvZAguPMoacKFUdbCbzcYJo7JSI
X-Gm-Gg: AY/fxX723Tu0HJ5IIjYo6Snr+IfH+pZeLhkOBcF3NpgKMnm7bk8PYNp5i0aZaK5ul2i
	rv6PHPTr3NWskUrk7XSv0CN4zWbPnRg6/GC0KH/K34MmE8Lo3BjXytke1BhFUi2LomN4jWeahWJ
	wOZNBL2X/89SNtT2UAeKEuXPnhsCVtGIdL0gpugzklQcrIu9Qu74cCChTaRNecKmjV/gYgdPdIL
	G+QEftSvuuMUcUjkSpHrJJVnzYMeu12Kc+l87G5Fn7crRUltP/tq72DcXmmlL7JLO2O5vFvGJ1Y
	JUEzQHNYyFB/KaTvgHB38hHU2cLVzlLNVeT8HRW3JHtoGK5uebq3lqSuaeb5fmvlGutRt67Po9H
	GFWp96yCgYzAbx2k3pardDmni+A==
X-Received: by 2002:a05:622a:108:b0:4ee:c1a:f11f with SMTP id d75a77b69052e-4f4abdd30demr605631451cf.84.1767358183781;
        Fri, 02 Jan 2026 04:49:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHQe3uglgGNR+qklPNQjuO2p+WFlVQPaOVJXoxxcfmLW7UGRPm8JS8xJPkf3hKH9eFSuLo+KA==
X-Received: by 2002:a05:622a:108:b0:4ee:c1a:f11f with SMTP id d75a77b69052e-4f4abdd30demr605631151cf.84.1767358183409;
        Fri, 02 Jan 2026 04:49:43 -0800 (PST)
Received: from quoll ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea82f6asm86385833f8f.27.2026.01.02.04.49.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jan 2026 04:49:42 -0800 (PST)
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
Subject: [PATCH 3/7] mtd: rawnand: ingenic: Simplify with scoped for each OF child loop
Date: Fri,  2 Jan 2026 13:49:30 +0100
Message-ID: <20260102124927.64703-10-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260102124927.64703-8-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260102124927.64703-8-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1185; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=BrOZrPc6bseLN+K6r5ZwNFA65cvJt1kgK4mCCBkPf3Y=;
 b=kA0DAAoBwTdm5oaLg9cByyZiAGlXvtmjRJQ/CGih+wivKTkGTWlmFMe8ev0DJktZN4XBFnVnH
 4kCMwQAAQoAHRYhBN3SYig9ERsjO264qME3ZuaGi4PXBQJpV77ZAAoJEME3ZuaGi4PXiBgQAIPj
 k04vQPYnOHjYCyieHRtlHWoHx8lw66rdY7P1LYZsDJWufIdsgM9PI9I21BAxiQYEHbdIzqtjKL9
 VzrNHmjbT0oqQuai5r0LgvzfM3U13fKpOX2CXAYAJ2L8wCVjhrPpsOOhAnejS2aWJdMUPQdpbhb
 T/1FhKHxcgNSKkvecy1DiqOu186pbe0nvK97Z8N4VzCxBDp3TX8a4A3lkSQ8QT/1rw5gsiqhf8g
 RjpaQXbDKuHUgxTOB5js8jnKrtKzpyu9ojn6ZqNZzN0Zv8U/ae4CRm6O5QXs8uR/FbK7ZeebldR
 5i51ikNsKa+0xDhfXm8Bg4r3RBoubBoQkxVCSdSLA6bEGcuUL359zvPi2oYnh+7SMIPcGrbLmig
 T0PzYWlAkZObdQ8nGhF8SbcWBiMpYz7UecX0a1rTPJxfMICEP+DxJwcrU/zIsPtNEE3Jc2DfJLq
 csoGQT21G4RzS+mD2jDOS3lEm3JnSxnzGqS+sYZpgK2KS3eSeM6TVYlLH93M/kRMHZW9K4zsuO0
 hOanEPnS8AJH9ohlpuDAmEsq+o1mQ4ymzfGoCTGDm8DkHTPhxqN4EcS/fA8FmmpYp3b4QTk3OSa
 AKbAvM76pWQxj1/PM9yWef3dj9+6j2O4YhXip7xxv3yeoG/tSyiwCoSG3pX7f8ZcPQcXtfJSXTB IAT0A
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: Vtyebqjn0duKBUIea9b8xwxmAtoBOC81
X-Proofpoint-ORIG-GUID: Vtyebqjn0duKBUIea9b8xwxmAtoBOC81
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAyMDExMyBTYWx0ZWRfX8zuWhIldGsDW
 GxitguXCcBgsxZeEFoMAbSKnUl7hlQprsk8hPpF+J5UF8HBtooP7nsjvl/tAE0H9XIxW7Kt7Z40
 Jqs4r1fz7dLeUDiN7l4ihsYM8ijUQtPBCNSa1gyfbLU/nLOQG/ho8SzhYQY9X90LGSZQd58sizz
 wkJ0MWnS6OUPeutOIIGMzarqc4a40aPJVkcVkNwLreiEMO3IkPMWUmQMWzPg01cvCPO9oH+9ARC
 xEFZemTb6M+MEw6EfNLBJFmuqqFx2CmQneT9s7FAj1fd0vuaYKz13eUzdF+aFJZGBB/yxkaZblV
 Dx0buwLyAr34itwqP3Mh/h0gS7+Ut1RcQ8ttvI6U/RAk+CeijajS7Q8WkjObycEwW0DmMufGQv4
 Yoz03T+AQfa3XPGdI1YVBt3OMoHtLYTRnZSYn8g9sfNbA0uDFfusdXeczvPQEQlgdBIyurX+Bj4
 fhaFJOOWL0m8BvvQpFQ==
X-Authority-Analysis: v=2.4 cv=ev7SD4pX c=1 sm=1 tr=0 ts=6957bee8 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=kVq6N5mEIK0mURhpU1kA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-02_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 malwarescore=0 clxscore=1015 adultscore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601020113
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260102_044945_390063_F2E2473F 
X-CRM114-Status: GOOD (  15.62  )
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
 drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c b/drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c
index 47dc3efcee92..f1e2c82936b3 100644
--- a/drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c
+++ b/drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c
@@ -438,7 +438,6 @@ static int ingenic_nand_init_chips(struct ingenic_nfc *nfc,
 				   struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct device_node *np;
 	int i = 0;
 	int ret;
 	int num_chips = of_get_child_count(dev->of_node);
@@ -449,11 +448,10 @@ static int ingenic_nand_init_chips(struct ingenic_nfc *nfc,
 		return -EINVAL;
 	}
 
-	for_each_child_of_node(dev->of_node, np) {
+	for_each_child_of_node_scoped(dev->of_node, np) {
 		ret = ingenic_nand_init_chip(pdev, nfc, np, i);
 		if (ret) {
 			ingenic_nand_cleanup_chips(nfc);
-			of_node_put(np);
 			return ret;
 		}
 
-- 
2.51.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
