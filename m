Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96656FA3744
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Jan 2026 12:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KPMu9y5OHJmCPA8mPEw+Vbd68w6PrcF2ZdxDyaBbqP0=; b=ThC6ZlJftoJWba
	DCgqcFOMDOTpmU8rD2gefkP1tug/9v99PngkDdzJjZ7oDskI5+mbD/B3yu8MWF/YLVJSTFQ+Beoft
	8yjvgDw4go5xxNGSzMSTWeRxQcIijCHQ7rFGTwIkaQmIEIHuWbEawLuKRNfztBMg6I0K58niJ5+z8
	5k7oDv+ZNkmng9VU7hlIgDc7uECwVhxPdR8YU9XrfEKrM5IQAqC/JAKp7Xo499hUB7n7JozRMq3LD
	OgCLYzcW1Dhxs2ShN8Jda4n2iHBXHNjvVOycm35WZSygDZW/D0pTg7mLG4giBD9kV211NE7O/tNU3
	K6ytVNNTTTOMjX04hpXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbebS-00000008EfG-2L8J;
	Fri, 02 Jan 2026 12:50:02 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbebJ-00000008ETf-0kD9
	for linux-mtd@lists.infradead.org;
	Fri, 02 Jan 2026 12:50:00 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6029WEPE824541
	for <linux-mtd@lists.infradead.org>; Fri, 2 Jan 2026 12:49:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=WIoOrmukDmi
	KVA+SLtYYAQlXdF3Ad90O6gPmYeW1uDs=; b=P0acStaRJ7offTKMW4swuRsqa5v
	ZmnITIUjAPuumQTpMPvIN7pVKaCRRkeJ0Jx8vRNJeaHzH7IRqNR8l1GmJwDaJC7Y
	xhrS5qCR9v/KiqVWPQWBveQ4EDPp7ahCh/qP0K6qO973AHHqTaaLIywV0Ha81nuT
	2pIes9rZkTFB4M6ptyplDwnt4I0AWkowQWDSbyRs81uduMQWUnrXXxA/2uEDJnRJ
	HAp9fznuw4m6LlYJpYbVD0wzj3fEJg86yuJSU9XZ18v2rHwZX/StJMa9xBGYsKdH
	/05eBNuxDWnO3h4FhQRUO74RrfPq0JLve6iyZyjLyjdmvrtuLAT22f24cRA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bd8533c01-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mtd@lists.infradead.org>; Fri, 02 Jan 2026 12:49:52 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4f1d26abbd8so368217091cf.1
        for <linux-mtd@lists.infradead.org>; Fri, 02 Jan 2026 04:49:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767358191; x=1767962991; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WIoOrmukDmiKVA+SLtYYAQlXdF3Ad90O6gPmYeW1uDs=;
        b=SdpbwIhWzflSMzcB2YP7pk3q1wYkw52tNXhyDiUp+u2pBIJukUBgqdaxf2sXrkLpBB
         hMONs1tey9YLOeY2uR2j9Oag5ExdqDSevzJdAI7HTjMmNYINyEcu8Zr8C9fF+TpchTv6
         bFcSbkldsAR8/V5bJbMeEV0QMybkIyreDjBxcljVsSt43dnJ8tQ5im4Dlhi8ha6UAvWF
         yTxLNOHGsx5z6+0CqM3n6T7cTzusfKFtPxZdcfPCRdEMDJ6n6y+bVy0Ah+M8o/Q7pDRa
         /7ye4jLwaW3wL2JMb0hLSHxGLzo1++trZ92FZCHnpEpCtu7S53y6IsRDx8bPgt0PzI0P
         27qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767358191; x=1767962991;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WIoOrmukDmiKVA+SLtYYAQlXdF3Ad90O6gPmYeW1uDs=;
        b=iAwSnrkghLeiEeiVu+8xN7B5pkLvzgpzeFb/Cwav9jNxHaHWg5CjE0hj5mSHrXYOx6
         XQZj8B0fc5z0Bv3Ku/Zwb+Xpm7wfVKjbU8l6q4zKtXygr42qC2xJItxvZSgu3gzttCV4
         BpGce3dRZCyVDGElARde/Dq+2ouVT+ymA37UcICnu7dIlH6WS4+SJ8AJv0eM+gcvVpsZ
         ADeaFoRq+M00osYi4VOSuLcVLiq5P84hBu2zzbYsPdQawIlbQlp6VacLBfWC7HeqcHlA
         +jyCO6r3jvOyjW+jq3VSesiMoUqoYzouYyf3CN6vDUgz5EEY0JmjAgb76Sy/+RjPs+CZ
         FkMw==
X-Forwarded-Encrypted: i=1; AJvYcCWjwIUQejq4CFfK//raAbIvmty6kxgqfgDbReeesCfTEkUHRc01iWhiLbA+MxFAA+7C10pMxXZvAcI=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4R+cHdAFLMeqAoftpRgnKmO1GlNUARqHgXWZjTKSDVFetJj66
	pW146AP47gD2JQMOwQOqkDDyNXgkOHzc+jQ+5V2V8bFhEG0aD0A74i+oRjzmyhCbYaH483lCPrO
	hB9EPBlQABBINCeq1anYXp2cC18VAkcG8UxEdpSh6kShXZgAUxHOgWzGbzInrMrWBmRP9Qip9ri
	6g
X-Gm-Gg: AY/fxX4hp13H1A9iGOEoNUai5hkh44hkou4Y9ebyK/4E83hE5uDjHrbshT14K4x1seu
	o8RAOPPQ5qHARNJTtuy2tFWI8do78fvtWvZT7VQg6E5/OClqpizRjP4VGeqbcpK6Q/3WmenAUmg
	s7bI7kV1uqNbCNZeM21hRhAv3qFzrBw9LB6fdSMK5I2x1PBshnQbqdqhRBFqL/Uehs/FGFcUxxT
	LDQ69kzm4dL3ig1nAb3+xDo0vVHLElW5Hh9+3x7NoDwbtZUTzXPTtf/FGnhGypaLmoE1WagJiCr
	qoO6ANcYLJTADtPI0XdMpkJOF7s4IMFK3z9MIEr5pxiKpcXPAjMAcTutxl6q+Ont3GqPweHom24
	blK1ff8jd8Rk7CFE7vduIMGSAjQ==
X-Received: by 2002:a05:622a:1f13:b0:4ed:6b27:1d1a with SMTP id d75a77b69052e-4f4abd0ffa3mr640014311cf.32.1767358191446;
        Fri, 02 Jan 2026 04:49:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGVMf9IMN/4MmVFAXCQSAmHxzLFU2UpefBanTHFfjDtIyZNkbF7ek0j2v2fBFEvKipCrfTGQw==
X-Received: by 2002:a05:622a:1f13:b0:4ed:6b27:1d1a with SMTP id d75a77b69052e-4f4abd0ffa3mr640014111cf.32.1767358191071;
        Fri, 02 Jan 2026 04:49:51 -0800 (PST)
Received: from quoll ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea82f6asm86385833f8f.27.2026.01.02.04.49.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jan 2026 04:49:50 -0800 (PST)
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
Subject: [PATCH 7/7] mtd: spi-nor: hisi-sfc: Simplify with scoped for each OF child loop
Date: Fri,  2 Jan 2026 13:49:34 +0100
Message-ID: <20260102124927.64703-14-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260102124927.64703-8-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260102124927.64703-8-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1136; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=kjdJYWdNUl5KclFKxYTWNNG5kkOEBU1fS578yV9TsrM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpV77dQjeohSg8lei73Gg0uadUyLqljkiLtt1C0
 wYhfaAnr8+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaVe+3QAKCRDBN2bmhouD
 1+DxEACTimO5Ql5LgejdoctH2lN8H00RIE66UE7YbHeS+LzxHc6Z16LUMwkdIJvE1wl+KRN3MqA
 QbTQYe8zyNyngNQSDxJvEx18VJNC4/a0Eu//latTs9k4tRA6HUFDr0J8fVOsA4UU4Ew6DKrIqxc
 QGKvtjOYT9lt4HQRuDXLJGnssl4HaFztnL8lta8xck2HQSIYWIHCZPud2H8XIopBinkAIC+YcMa
 2rp0lZTJH3bKmhtqizT+9+uIEF3CinYr56X9CmHTvLpAmz3tavz/QkB9CKwI5o4w0t9XsejOI52
 e59ATwz+4/DXiwrjXELzY0gbRfiIX41/cgTMzovDyT6OIls3IP6KcTKzioTeb1/f8GF3X5eZ2hP
 JzdeA3qQ4Wyivz/1UhUF2uRU2/dPoQiK+y5wJZNMcZ6UbpGQ/AJAVk36Fw6jWRYMzmEFlTDiIzg
 01D5L2ZAtnYOuIQ0wKhG/4Q5xAiPsOaUx6yHa/hlzkiwg7SSP5wv4l9L1PTEjNEDYaQUhLUK0Uv
 0lhn25rNmyZ8UapGaeRBQ8fGVXdvnDUbTtWBMbKbVlXxwLOlXu11MwIVoDygzNqtFZMGSv94Zcz
 BK+BonJcbetJNo8WckCosCezUHyStP+weL7Cdn5Pk43XRt7OmeNcO+cU0gogn+Ye+46YTLN/8Zt 0tVDSYxqgm6x2Ew==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: H1Jx-6rRgSRZmOjxgZKOFK4CFX8iJbaU
X-Authority-Analysis: v=2.4 cv=fL80HJae c=1 sm=1 tr=0 ts=6957bef0 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=vTKw0S6QdLxGGRXgtZgA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: H1Jx-6rRgSRZmOjxgZKOFK4CFX8iJbaU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAyMDExMyBTYWx0ZWRfX392cEAO2TnJi
 DMeW0mUtkoCn/2AIWYgHwPwBwwK7V4IqtHWfDep1d0FJUz/1bS5zBqVY6O9UgQhCQVDJNmeapFH
 EJtTrcCQsPZB0r4Baci4/nmhFLjQpcEhDXN0TbztH5tKEN4cATRqnstT+Is0L0NTJgLv/kx3TMW
 rUKx0Saz/MC4G6TCkwXI/bzHbkw5aZeccd5DSTpFcQJo4tXkokecOaRhc/tisjRmt+2V+TBBcVX
 hSI0FckhBqKZsf3NKrJzCddNr+NuOe3QFNoSOOjN4/sMpzM+FMtwkZ5DXAHSyGlE4r+Iuc7nSHX
 rOiLCdkf8SQrDVCDEBavwVGmTZcXlzOhLReaTus+XpU/CAMbjT82q/wDfyo5tr4orvjzj9iBgo1
 fu6LCAoLHNV+3VHOTJ/kAexkD3JL8u0ap+J4tL5joIb91iH6xgj9gMaf8JZRLWwBmy+4QfWbPh1
 iy1DnPgLBj0FPRk5Glg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-02_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 spamscore=0 impostorscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601020113
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260102_044953_258329_A4461478 
X-CRM114-Status: GOOD (  16.44  )
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
 drivers/mtd/spi-nor/controllers/hisi-sfc.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/spi-nor/controllers/hisi-sfc.c b/drivers/mtd/spi-nor/controllers/hisi-sfc.c
index db948da2c4c5..54c49a8423a2 100644
--- a/drivers/mtd/spi-nor/controllers/hisi-sfc.c
+++ b/drivers/mtd/spi-nor/controllers/hisi-sfc.c
@@ -394,15 +394,12 @@ static void hisi_spi_nor_unregister_all(struct hifmc_host *host)
 static int hisi_spi_nor_register_all(struct hifmc_host *host)
 {
 	struct device *dev = host->dev;
-	struct device_node *np;
 	int ret;
 
-	for_each_available_child_of_node(dev->of_node, np) {
+	for_each_available_child_of_node_scoped(dev->of_node, np) {
 		ret = hisi_spi_nor_register(np, host);
-		if (ret) {
-			of_node_put(np);
+		if (ret)
 			goto fail;
-		}
 
 		if (host->num_chip == HIFMC_MAX_CHIP_NUM) {
 			dev_warn(dev, "Flash device number exceeds the maximum chipselect number\n");
-- 
2.51.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
