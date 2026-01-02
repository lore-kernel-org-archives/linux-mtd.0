Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA3D4FA3745
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Jan 2026 12:49:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ivUZywNFmlX+0Qz3x0hcIeJTdOb3dxTfXNT0+i07afs=; b=bBCn6fLeh3EN2E
	5gMJ28SBKWvHFlRkhz10igRSQx8D60pMI3CJXMSHmPxxleqIftrKudJRlNqRdXF45N3d1xbL8i883
	rKdt4KSLKnYMfbzZ0OhzjK5a05UzQOv6wh8aLSv5HYwUcFDmjRQEmRiuoy5GmzCkVPVhGsO8v5dFl
	EizdNXg5lWSXAA7oON/d+4f8zIyvF1p0PgN0E86020pmfTAXN4Ldi2N9DqqiU8JLGeKj9CnhkyhgP
	pUeKlYGbRhUaiHHDcy75XMe3OSOctHMAUOeq0Yxx0f+peiGiqaOGPpWwcgF3kqU53xkpMHKx6xaLO
	qQGXiqkhjkdkluvoienA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbebH-00000008EQo-02hm;
	Fri, 02 Jan 2026 12:49:51 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbebE-00000008EON-3geR
	for linux-mtd@lists.infradead.org;
	Fri, 02 Jan 2026 12:49:50 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6029W0iV504534
	for <linux-mtd@lists.infradead.org>; Fri, 2 Jan 2026 12:49:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=I1PTZZIAa0t
	EuYR+p5xJVPIyMtUwfOVI7eaAwzoH1zQ=; b=NdVIkrRpWMfGZwnJAKnLYdnS5Ub
	PEbC6QWTYdCXT7UCQ430AU3n/u1+42O6c95zJeyXmph7rWOIbX4bLcbo5+x60HuJ
	b0UMaCGmTNu505s6Lg1jtpRy0iFgEBBRG2Du0gpI7CN9vjHimUAZQgXqAoO8R8gW
	OLZwmf2LPg58YpQgyLplTpLvjaSrLw/OivD6brb9tXhwMbTaU6tr1dmJsdOMkbnu
	a/7uRKgLv7A/VFz0RURgoL/MLl0Jxrv85OTHeFHOlQ/HMo9ho52ArSN4RIbHNSsO
	hl5bw9QRz62S1egdgIRvqANiOL5wQYJm+o8lVzZzQyPm3MVDxOo2Bf048Bw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4be8bk8qj8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mtd@lists.infradead.org>; Fri, 02 Jan 2026 12:49:48 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4f4d60d1fbdso374423011cf.3
        for <linux-mtd@lists.infradead.org>; Fri, 02 Jan 2026 04:49:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767358187; x=1767962987; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I1PTZZIAa0tEuYR+p5xJVPIyMtUwfOVI7eaAwzoH1zQ=;
        b=jUn2o1SyFse1VbAg3+udXiRqSyKiztNds0jjB8bymniHeYUK/Ld+eIzAogSx1z9QEA
         xyT5kWgCsXXHWzJNphy26RGdGJs/dQWwnDX+uyTnj2l8RyS+z2Rbfr5uiH/yk2kjbmFL
         ZgXzHNPaXjtwQEsDxSfUTRP/uj+wvfrQvw1xVgvyq3WHQMvt94MrP96h5OSA4m8XCJcF
         io2W12WRNzZOpCfMc1bq3DrS/8h2i72NlTk8Sd3stkKi/dqsfUbRI9tDMOadD8Jzfsdh
         j4slPs7liFs1Fwc5SnBjNx4oWAixWvLkjiiyXyv/tgBJWbbBN+vq6dIDaSiuz3o62LMO
         3m0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767358187; x=1767962987;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=I1PTZZIAa0tEuYR+p5xJVPIyMtUwfOVI7eaAwzoH1zQ=;
        b=jWCTnOpz33exOAUGEsCmSFu/e8g4k0XmKq+ge8I2ehhc7NB+/d3Vu3/IZxFTX/KLvg
         wxGr5OapYcztkFuOptvsSy2HYSjY+RxUJaVWkckl3ymqLIE/ZVqEQBszA+JaU7X/vCKO
         iawHqalLc7ji0Y7b6tuMWcuzJ/1FkhJ3fSyI9EFl9h4m43qSaDIZ/M9d8P9GvmfYB47F
         K8bpnX3+nGAuzU0p5AmKYZsro/ugZQggXdRRKDshbTI+zjzGQkkqZmWncGBCLb78vWSy
         lHHPZokCMhN2J/aLWE3uHjD0E7tS/y6ggcIAyUqin27ObjnnMXKyld9I2h5NzVFqXCSh
         BTgA==
X-Forwarded-Encrypted: i=1; AJvYcCUTajcpFzNCRbgwRCEK9upQtR5uHGpg3Xdx6nbOpMTPnqBBEq4A4+7AlVlDkZCWf+GGMxxf10XoeVc=@lists.infradead.org
X-Gm-Message-State: AOJu0YxN6mQc5rN5OLLrjKSa0kfmeBQbPoFdujCTOXbiHayPf6YxgaUi
	Yd0j1uhiPKrdNNHJ2MYTxfs/63/ArGpJvPmJJtxf0WFE0vOWk2B5RRkJJ+xdkf3lE96i1v4a4bx
	6jHZinTBpNbppPEYOUJFfDIwLMjCvktFwwdYXgVUprOJC0Hmqi7u2vUxJc9KIoaG3SOaj
X-Gm-Gg: AY/fxX4nFHFwGtbV3IzUFAAOT5SHOVOvgWw5oLLe+5e0CEvslIHZHFdWKgVA75YGd/n
	sBmurHrBwM3aIVuKpJKtsjH/CZGVIECnzvWfhoy0oNWsq9t4OVjcyBh9ISYPlQZmIvr4ClXp01F
	pM1ZDJBduGU49+w3zL4pm8JpFvQsKIef0GPd41oG3g4+qh2XVYkc9tVbN1LwLHatAzYb/YAEg+y
	PY2F1NJPDTkvmDHZmUScdezPuqGprBpbBi0BLAJAfCjOg7r4ALfjfq3Knp2LrGa/SYchc3Mfc90
	Q03cOOx6Wze4FkNQN7sizDmW9JWszN3FsQgCCT7Sh8UjCxnnLSnMRBMSWlFZ1z9fbQ1Rqpga3H7
	jQyvVFoIDpyJiJUMA1JEqnjT4qg==
X-Received: by 2002:ac8:7fc3:0:b0:4f3:4bbb:d5c9 with SMTP id d75a77b69052e-4f4abdca1a1mr687187791cf.79.1767358187645;
        Fri, 02 Jan 2026 04:49:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGPjxg3lErIClyj1q/c2QA920cSvN+jNUa0YCVQZucLeQ6j109UB9otuPfKDt7/rt2bIeq6Gg==
X-Received: by 2002:ac8:7fc3:0:b0:4f3:4bbb:d5c9 with SMTP id d75a77b69052e-4f4abdca1a1mr687187471cf.79.1767358187278;
        Fri, 02 Jan 2026 04:49:47 -0800 (PST)
Received: from quoll ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea82f6asm86385833f8f.27.2026.01.02.04.49.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jan 2026 04:49:46 -0800 (PST)
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
Subject: [PATCH 5/7] mtd: rawnand: vf610: Fix Wvoid-pointer-to-enum-cast warning
Date: Fri,  2 Jan 2026 13:49:32 +0100
Message-ID: <20260102124927.64703-12-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260102124927.64703-8-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260102124927.64703-8-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=936; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=nDvM2tNc7bhnswWwCc3vXNDXP4C1H2W2zKaXu5ozTQc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpV77bC0qTYrHh193XJS6xkRC3AcCNBpx+8voar
 IeQOheWfXOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaVe+2wAKCRDBN2bmhouD
 1+VED/9nCajKvFH2HUNRtSa685vy12JdBeXoLcJ7SzfTs0WnxG+r+r9cbvpL7vPW9ikOIcnnOCt
 DTBfkWRJmmggpB6RAkJOCxKswAStjMOQU+0gxkD+DrNfQ/L1CaG1SgR5BbNzIr1kP1HZey9J+5z
 faZbFmaf2NGpVGI0rM9cfbCadHzLjqf9I/a0Yt+WyEj8g8wRONlRkwVXb6WlXnb4hExlwbLaQXd
 EZNZamSXX2zZtNMH0xpCyPtf6d5sTpOlXq7gUghE4D1mj5+yYwQxZ0k6RUsfmpJ1GD99xdIvLO5
 z2u167lPzwz3jjRayeQpjgpI39gjdEQrp+PL3gXC7aAcYETamK5al/9Vm2fZ0ugmiAcn7DNlksn
 MGrA/CBI57LzaF2P6KAR7AZII5GtMU6tMHyrowRSadM8rk86RTov5Vhonfz337MMgIJ20kBsKTu
 pkWzftQMFkxpE/JHEAPjgG0swDDcrsoJcee3zYNEFZGBaegmqT2iuKP2FbnVH03WHSj0+LT6N4k
 vkcq2tAG3cC//wWZ3tZI0USZN7rGMkRa51i7IFLGriycgsmXMJF9dsxlNmUDBLIYl2QH5ST4fFb
 mFiHTog0RvCAwkOmy21hC0aFulT77OqoCwLkLnGapgscBfKaNTgS3g2q/aByvutYdczfoninGWA P8HQjOl0aUFIeMg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAyMDExMyBTYWx0ZWRfX8WggSMM7G0c4
 yrL6KQ2ng1stclE+RSG61aeVh8jhiffw/EUxidtlq1JCa7oGSuk1YoAASgmeXwjGA9Ekt9bcAZm
 J/vjcMnQAtjsfu2JEd7XARRFMzBRFQexWvgXwtx5Ih5rlTHHEjDxnpqIyOqkgRGi/j67uzX0H+T
 s5KAMZEcxvTkbdQ8diz7cfQ2cBBV0sWeDsgpr1oZQOJE+SAx6xR/0x6ABhEMOHI3RvmkSNGE21+
 PGACFsdaHfsjNiUVaXApM1sGYTWnqJhqWQe38IEgE9jHlFGmtZrzxwjE1et7OG4jNlWcfVR/VtQ
 9xBLBkd5hg4iEtal6E1JZi1BANm7TVtMT5Kbgb/KrbaV9iZL179YZ5yGMMrSgpgBSE9za/3QYKW
 ppHajk1bUUR1WUGkxFaFyqtr9TSIPynXeFj3hDmCEAcRyCmZ6qTqhmNhqYJaU/rYpiqnN/FnyBk
 iPrcMPu5/x8aGTl0WRg==
X-Proofpoint-ORIG-GUID: ynSzB3cdMTp-lm3ZngK3LkJclxpf5s56
X-Authority-Analysis: v=2.4 cv=d5/4CBjE c=1 sm=1 tr=0 ts=6957beec cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=TpWAFCZ4qp-4Y20zCj4A:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: ynSzB3cdMTp-lm3ZngK3LkJclxpf5s56
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-02_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601020113
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260102_044948_925225_39E4837A 
X-CRM114-Status: GOOD (  15.59  )
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

"nfc->variant" is an enum, thus cast of pointer on 64-bit compile test
with clang W=1 causes:

  vf610_nfc.c:843:17: error: cast to smaller integer type 'enum vf610_nfc_variant' from 'const void *' [-Werror,-Wvoid-pointer-to-enum-cast]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/mtd/nand/raw/vf610_nfc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/vf610_nfc.c b/drivers/mtd/nand/raw/vf610_nfc.c
index 4b5ba3187853..1955dc50b40a 100644
--- a/drivers/mtd/nand/raw/vf610_nfc.c
+++ b/drivers/mtd/nand/raw/vf610_nfc.c
@@ -840,7 +840,7 @@ static int vf610_nfc_probe(struct platform_device *pdev)
 		return PTR_ERR(nfc->clk);
 	}
 
-	nfc->variant = (enum vf610_nfc_variant)device_get_match_data(&pdev->dev);
+	nfc->variant = (unsigned long)device_get_match_data(&pdev->dev);
 	if (!nfc->variant)
 		return -ENODEV;
 
-- 
2.51.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
