Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B805DFA3741
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Jan 2026 12:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7BoQtrJOBOa0/xKhaqgxTujkmCDuHxFY8yWw7OG6mi4=; b=NE3ICLym+cGhBs
	kFk/q4l8vdaiaInGRif3d/euX2p7CfX7fHGVSiYIqyAMdojb+/6YSfP+pCGkbWpTx0o1oyVSzQ1IT
	QiG3oaL4MlrDEKpjJ1PRK4+6QdeX8Yx+yoeV/yivEiYs4JVdpTJWEMZI7rmhcIIAInXhkhEdTg/ZJ
	B85pV4trT0TeRwYWyG5F6ZgJHk45Hy2jDbzF0C4vDSurwQP7wArVeKTY4i6pjzieM20mmtpxu1Bbr
	/cPy0neNEbKhydi29uAXorZ1WTy68+dEG8Xycd9cwk9wAn8c3a+sWDCl/QnIOb/+N09J8KeW8UO11
	oAxfAcaQOlimx3dTdX1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbebM-00000008EY4-0VG5;
	Fri, 02 Jan 2026 12:49:56 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbebH-00000008ERU-27O0
	for linux-mtd@lists.infradead.org;
	Fri, 02 Jan 2026 12:49:54 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6029WjNZ428111
	for <linux-mtd@lists.infradead.org>; Fri, 2 Jan 2026 12:49:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=CyANrbDJtTc
	MsvrvrXtr1X2z0JYHYEEC2zyeTG24RQQ=; b=DmpnDve3awo0W3rdfyzH5C22aqa
	TORbWNdcJzQNWZg56Zjt6rO8lbBHlW8IkQx2duah75UjtnKbB/KB8/fmnCTFti+T
	cPMneOyIkO5q8R/0dSjzMq4cr990VmIEsKcQUb78yCe3lCoVKMfNiOPa1JGDW7as
	pskqdbw04ACjQaLDlXHIKjIbq/1diRDzkHPJ9fg9p1wLPzW15PIJhQ+3/d/z99PM
	/rM6Mj0v9zmn20aI17yAEBFiXrWnIlACaeVSN96YnnsSgW4dZjYrU/kzlf6M/HsS
	VMOU7stcLEjKi1wGZO9BjX8n/NddUJSVEYkb0L1CZb7RPpZ+ZUnpWaJEWuA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4be6fjrxqy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mtd@lists.infradead.org>; Fri, 02 Jan 2026 12:49:51 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-88a316ddbacso288179416d6.2
        for <linux-mtd@lists.infradead.org>; Fri, 02 Jan 2026 04:49:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767358190; x=1767962990; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CyANrbDJtTcMsvrvrXtr1X2z0JYHYEEC2zyeTG24RQQ=;
        b=KQYLR6MKbc5uGIK7HBcGK91arU9vALMtLMy53dTN2uetjxVplA5Y4CoY+l+oFTJ6hr
         4Rw9l9vGimBDDoXtRhrMCnpMYfAARMH930hKR8C4F2YrLn8FJFT79dmw98U3H3g7yl7C
         5KfCZbGtXfLptELkjQMuG8IsxBXNhfwPED9uSl92o12TPtsgwC98YapBTEtAf+P5F8MM
         pBqKY9kbJcwXloY8cSsNnEOHkMdx1QbIf5rgEajaToAGAWfjox1ExS6C/DNgUORwI+Jw
         OdA3RAnfSeKbGkMbYuVmbA7q6GeNBX8ica0VXlkmfWbriaZnCTe8v5v3RJgXQPDxmtWt
         qT2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767358190; x=1767962990;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CyANrbDJtTcMsvrvrXtr1X2z0JYHYEEC2zyeTG24RQQ=;
        b=B3tj+iLbfUktTC8RS2CZ+3a09FGovb8RxIJAg6cAjWM1q3U/aE1DlXt7ivebdJPUmg
         8eSfxXVMCJcwe8sPRCBQSMRyUqn1BXOruo5TEvGItbI6CmJAK0bZj7OppnxnKuj4EDWp
         SxB5xLDs7kCvOOLd0nwPuCAFSO4oHbzJlB9zk2HPUIOAUwp5mLmuf5BhneKZ6OFizhBu
         ttYhBJB1LGpH6Ixt2d572HYNLCL+lu0uu/Ba6hckPDXT0LEhzpx5yp5pTVIDTMjbaUQO
         jwYjZ6Oarh6poJWb2BvYPBlQjQzAUahc8KoVmBja939EDPUgdsWPLv5yqu++Wk4lLPy2
         RK4A==
X-Forwarded-Encrypted: i=1; AJvYcCV9/vM7HPmo6sSCALpwjCNEPvkU1jJRewcJuCjyDCuABok0AOScXf2PIcFXI8IXzhVKbxr5sPZzyBQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YxC2b3YFjRGGtvnIMG6FFrMYbmdG4paG9K9dqkP1pZVhwgAlgSx
	J673GBmficw0jcVmb0LXWlvnI+nupFGQHzvEDrzyLPCyZ1/QfQL1sC1UT/SRQoeiGC4gcyrqRHL
	YVU3eZBJT4QnpIvg72bWvWolW49Ome/UuesyN/DJ1jKyWbQ4O1O2GK4866/CYBAbyBFHv
X-Gm-Gg: AY/fxX4ZML5sYXCEYvXfF486Gt+l+5X0zF8+H9OtmTcrxIq1OSxjgPM6xuifrjoQ9aw
	MoIxAzr7wkktPQgmHbrhZinSN5lNmPcJeV8IqF7bjwqqEexed/yRRJoueW/wSJyG1P0I2Renvf1
	f+uUCnIOAP9adolnyr/0nnGH0ohnsWTbzCIVeGx8C30Hz2rRiYA5lUXJy7a/7JoaYSZfNkxMHI8
	H3jwUFIsj5noFcdWaaQnVicBrkip/5y7i71viFFhzSqsmea09ah2B4OO1Vfdvins12cjvGoQwTe
	Vy03F05IyyS+ioa/Mi4Q7XdRp39ba/WlZH7YIRkVWmyUdbViI3dZb0YtdvnRVzPVvy82LHl7fu0
	WueGBtC1G0azhOKfg3YFta0kK2Q==
X-Received: by 2002:a05:622a:cc:b0:4ee:9b1:e2c with SMTP id d75a77b69052e-4f4abd35e3emr688794001cf.33.1767358190161;
        Fri, 02 Jan 2026 04:49:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHEE/q2Fdco9ouztC8TyOboLodLR4WhdA5l56Xei6ZNTD5e80NDvaw2UNX8OTeAHWG46RcFDg==
X-Received: by 2002:a05:622a:cc:b0:4ee:9b1:e2c with SMTP id d75a77b69052e-4f4abd35e3emr688793431cf.33.1767358189222;
        Fri, 02 Jan 2026 04:49:49 -0800 (PST)
Received: from quoll ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea82f6asm86385833f8f.27.2026.01.02.04.49.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jan 2026 04:49:48 -0800 (PST)
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
Subject: [PATCH 6/7] mtd: rawnand: vf610: Simplify with scoped for each OF child loop
Date: Fri,  2 Jan 2026 13:49:33 +0100
Message-ID: <20260102124927.64703-13-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260102124927.64703-8-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260102124927.64703-8-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1186; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=F7Kk+7HLc+g1YYGm+o1eCX8RgtT9tyzfifARk7ozNSQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpV77cLysMrmgaG5ns/nrL5d4zYXzAy0uQLWg8q
 0r5eyNewxqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaVe+3AAKCRDBN2bmhouD
 13FXD/9fEjxdaWR32ImdhxvYI31+PdVTzd9S/Q5khkafnHnb8EKMGaE7OsNzBLBHJG4AOWrgBCl
 CWgzHBZiLc47tW++MIdBquoQjyPW20dk7ZIO9pM5KN+iQRXFYUBEq/qc0GihzXg3wN+1EE3EelX
 Tk6gedm9V8pTx9Q53pJBoPGI/ZbKapdK6+ocpHrzoI+zwOr3krbdJLxBQcLvCuxZC9Tvdh6oEh4
 qF5BjyN1d/0LoOeCEnVvHmgRBoZOtbZGGc9H2D3vg8Uc+Q9l2TRzsGtRHPhKbUq5y4SdiL5enw1
 eb++MnKmb/DXKIMKZqNA6Q0rXksdUe3xalqwXUO4kB+hUYuvpdlFx2Z3jrx7yfy3K749BMLFECk
 0zvPnXff7zmkT3aTFHHM+45A4GDHHNcov93/1/c6uFJTsMfAm1yatvEpcE/7jhXCLwMPiMsCjT1
 YP/3hzKfctE4HyqHOTpo8Pn4XhXUWfKajWtWayuYTUAiKVZp45XJhOv1cfP0Tcd5oou5ME6xQ0+
 JULIMJZAXU1KgkWUUGK0kSZO2HZetOzthobPuj2rpTfZUDlVzgHzp1sp3hEKtqtb7WvTKHmMZW8
 rSRlT3WRjDyQ3eTMH0wJt80Vf0yxE8Fh6Qom/7VAx9fyRLMgIQaRTm0FbxrTOO6buxu6X2ev02U kJETjK/2HOFFt8A==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=Av7jHe9P c=1 sm=1 tr=0 ts=6957beef cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=kVq6N5mEIK0mURhpU1kA:9 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: 8Qxz-iiElReLiIFJClHphijqNhRe1tls
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAyMDExMyBTYWx0ZWRfX1JCBhsaKWiKA
 j6sZzBUfCdAG0kuVbysM5XI8WTbffv8V72+pabyyqeYX+8PdSYRpjpumd2ERAUD6b5Z96GqG7K2
 UxFnw7tPzPw8iGi5ATP47rJd9d1yqIfz8YzzBLT++Hc460nvgqkzbBZwWysD9vsw3VStBA+89KH
 YxjCuYjtgLA6/Qe0UoX8kXbt6rr48gXrzxgIinzUxeVHZu9IQwp1YibFciQ4qnT4niYTDw475uf
 Z0XBuQ4EB26CUp49J7NVm2BKQfPue3JeG0HRMhI3WnacR5vatteNJfJZO57F6CIkpBsPHelICrj
 3jRtHnzvGAoCktGi8nVuqrqSsUFJMQ+KGkUBafFWta+ynxXDA1m9MBC3em6wY82/ZwRx451wsRV
 ysnJIBuCF2BlmVbHIUANaIyLLwsepHyIKLahJ/Sub+B+WQsxdwgY+gT0nT1pBVtgBZA4i/yJcKM
 8KmBVvmY1n/VYIe6zcg==
X-Proofpoint-GUID: 8Qxz-iiElReLiIFJClHphijqNhRe1tls
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-02_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601020113
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260102_044951_569134_AF50029F 
X-CRM114-Status: GOOD (  15.81  )
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
 drivers/mtd/nand/raw/vf610_nfc.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/vf610_nfc.c b/drivers/mtd/nand/raw/vf610_nfc.c
index 1955dc50b40a..9940681810cf 100644
--- a/drivers/mtd/nand/raw/vf610_nfc.c
+++ b/drivers/mtd/nand/raw/vf610_nfc.c
@@ -810,7 +810,6 @@ static int vf610_nfc_probe(struct platform_device *pdev)
 	struct vf610_nfc *nfc;
 	struct mtd_info *mtd;
 	struct nand_chip *chip;
-	struct device_node *child;
 	int err;
 	int irq;
 
@@ -844,13 +843,12 @@ static int vf610_nfc_probe(struct platform_device *pdev)
 	if (!nfc->variant)
 		return -ENODEV;
 
-	for_each_available_child_of_node(nfc->dev->of_node, child) {
+	for_each_available_child_of_node_scoped(nfc->dev->of_node, child) {
 		if (of_device_is_compatible(child, "fsl,vf610-nfc-nandcs")) {
 
 			if (nand_get_flash_node(chip)) {
 				dev_err(nfc->dev,
 					"Only one NAND chip supported!\n");
-				of_node_put(child);
 				return -EINVAL;
 			}
 
-- 
2.51.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
