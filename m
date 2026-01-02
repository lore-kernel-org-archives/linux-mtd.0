Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7A14FA374A
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Jan 2026 12:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G8BnXSIJw1kTIhnwjGf0FYVqxyJlSf/zBKWD0k3RfFE=; b=PT6QLElAhQX7mW
	c1U7hVtHGD9Gmj4I7UFYcLG07fhcBS68R0Ww1/uR+8u4NiScOkOtDFvd7BKRObDl2/A1v9l1yMmXt
	yks50ZLHtC0Mb2itpBcmJhgVLm/R73UJ4PQEVEH50Qk7USmfbyowpIvvlAv/WPSlAP40au0tYHh0J
	w6rBWVDQT7wMlJyJ+Pz7rI6fWgls4+uGcdhrYw+H4CPbTh1lsYpVgRfaAx/urMA7dF50tQKwjIZYe
	7hq6JvCkm5rJe67sayx4Zrgctyujf3wza+ytQgAOZXwBoC4e85TKhFuDaMbfvimr5DcTD8D9W0k7X
	t7dwMit8HSLWWT95UgeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbebF-00000008EPV-2jZI;
	Fri, 02 Jan 2026 12:49:49 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbebD-00000008EMZ-0Z0P
	for linux-mtd@lists.infradead.org;
	Fri, 02 Jan 2026 12:49:48 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6029VvJ4504454
	for <linux-mtd@lists.infradead.org>; Fri, 2 Jan 2026 12:49:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=0a4z7tWbV7c
	PqM6DrSE7hr2il6yV/9/oG4yDR65zbps=; b=ANicxl1WbcX990IM/vlgkJskL4a
	7BFSuJdJ5lcP5UzYZs3UnEj0B/5G2CRPSaWawBH3rMnGV8Fy2XBEUPdjYfcKDGIJ
	7uFWj37UeFwBCAUqjk46HQ28gZiZplJd509Ga8cpD7wxB/mfQBKhn+aGVr22Kfds
	j4RzvYxGY++uhkG9j+GpcDlKdUQowqqE3VudfhVKHSNNYpeUP+iCkP4H9ry9dlrS
	LtLCCst09PY3mYVNXo7WIyQgPoGmhq7X+DFajHY4aFECQw6I9o+zwDlc2owOanSj
	aJmHTIDgW3i9mbrINKO679uoNrwPNzR3vaTzPhsnO1EfGY9dPjw4YZgw4YQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4be8bk8qj5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mtd@lists.infradead.org>; Fri, 02 Jan 2026 12:49:46 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-88887611049so390479186d6.3
        for <linux-mtd@lists.infradead.org>; Fri, 02 Jan 2026 04:49:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767358186; x=1767962986; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0a4z7tWbV7cPqM6DrSE7hr2il6yV/9/oG4yDR65zbps=;
        b=K/5OV3k76s5Ic4cDZGMti/Ht43SqCUXbeFQB8GljXmkFnARGkNnElDog3MjWJR+C/E
         6XREcBhQ05e1EUHZx8xTv6TOHYac3TEW3PMEygsehGtB6VFPJ1k9pvhUXaSNQi6rHEce
         mnBq07gae9no+WuANKxK82mkmQmIUuCHaz3sBiYH8QSQvd9k7oCPkwR9gMHNGNRcbXBn
         78vAfSxJjnh5qbgNNUpIc4zt/Qv74zseiyu3T290zERuhYjFglKwtLHosHkEZkW+DwZG
         PZZH1zvCVVwadHXdmcPu8cEweNYWbhEWxGBAyBUA17M6POirb0ajEPbsEf5oMHRZW/aq
         +qVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767358186; x=1767962986;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0a4z7tWbV7cPqM6DrSE7hr2il6yV/9/oG4yDR65zbps=;
        b=AeiKVvPMoNB+g8uas8vHEqV462gd17DzElm8kYdT+WTmnD/8+c7H+ny14P2uZnMVnY
         Vn8cP+hpC7Jy3fkycmMoYauNeLzctQcHJT1teYV0kkXyQ2IYHqbOf3YzXwzgQTWmYZws
         sk/hhOTkG6ZyqfbaDJ0imf/KlQMdwVx08o4Zj+TQeVVkIPkFu4bD2QYzntvUC0qdeVvp
         QgInOLnuA0jCN36OWh9auNC1Yglb/Zd1o2i4/ozsPIW+9S/ni7k2EDCORmwwN1U5jVi2
         2mE56ueY6We2jzdDUGP9J1sNEKr4vyL78oO4+ha7b0Fy35JV2bT4dId1dUiwpm5y+rDD
         uTDw==
X-Forwarded-Encrypted: i=1; AJvYcCUCE8tEk6Wcv4liIJdVuXczkRhyyJPmCCb3vXfQWEWtbCErv94T3zIACUB5JEqNHO7l/TIoPhNcgD4=@lists.infradead.org
X-Gm-Message-State: AOJu0YzOFIaCnXbLwGBj6dXcawN6C7xjTKLxGsWaPc6YR3BPPWeqJUDw
	BnH0g0ue/iJAJJ1XTb7CqR4cNbgSkeB9FwhxXJxSIGlmj+RiPXKQr3sxp4RbtKy4t4cKdySh4sM
	Sf9U5+bSoXnmSdUNzBdhhfogoZ0cOhDKORlq2eW3iEEDtVOzhvXh/zX0fXgppr8vs3cOL
X-Gm-Gg: AY/fxX69BnZ4pISzAWRL622tLmnwcD3+obXUloY4KaKRu2Wj0HM1owxKYH1o4ePMcRa
	W3pxz2/ce/iIRMqdrj7IPtaoM3GvENLEBApsxCoFRibbEfvM2CJLBYI4GA0SFSwlpPW6bE1Lzzr
	67b40+fHkX8rT93mnOfU0GuI0/Ct0WzXW5fMIjCLE037WefSKDyssC2vxdZPsSV+fGtvK8dbrnv
	cOjG7qn+dQatD06sL5cCQqta8S1JgYmzNrL1aPuafdpI91QyCH6fDmogpVQ6ouGeFzYm0u1hjGf
	oYbh2SKwwNYmQrzHbUHwtOzKKzbc2RnNod3KFURwYc6C6p8JTDGP2+aoaGRJs7vey09hbVa0sMz
	aW64Y51tBvwsLWPft1+UwzbbZog==
X-Received: by 2002:a05:622a:1390:b0:4ec:f969:cabc with SMTP id d75a77b69052e-4f4abcb8e00mr513642661cf.10.1767358185808;
        Fri, 02 Jan 2026 04:49:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGVBupyh1i7Yhgm1qePFT0hVTvPy77WSZBhwL5Nr5X5pvyUlLefbQKpyRSWJBl2fU6acK4kiw==
X-Received: by 2002:a05:622a:1390:b0:4ec:f969:cabc with SMTP id d75a77b69052e-4f4abcb8e00mr513642351cf.10.1767358185429;
        Fri, 02 Jan 2026 04:49:45 -0800 (PST)
Received: from quoll ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea82f6asm86385833f8f.27.2026.01.02.04.49.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jan 2026 04:49:44 -0800 (PST)
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
Subject: [PATCH 4/7] mtd: rawnand: qcom: Simplify with scoped for each OF child loop
Date: Fri,  2 Jan 2026 13:49:31 +0100
Message-ID: <20260102124927.64703-11-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260102124927.64703-8-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260102124927.64703-8-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1186; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=WKsUzSB5NIe1xJgJA3iTvoyEJt/voq3uK5YhgnzvsDM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpV77a78BJV2bdK0UdQDD7V7cRyRBrlL8h7NxaA
 IsGC2wLGYqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaVe+2gAKCRDBN2bmhouD
 12bID/9Wi7A8E+e9tq4qi7HQTwIcsZvCfBuY+Q750Ud86sGjMaXi49XMxGYCzK7nGlB2aIL447c
 cPGsZrZMv5tam28NeRhX7719CcinVuum/vPTVcadJtsglQN1QPYHjWi6NxCZytriNTx1pJYgx9i
 kJqy2SCOkMUNutSut0pimP6SpghiSVLFQtWhDegMCw4uIJnnb6TH0MiNBQziqgQRXj7FCHQtUuv
 9lWVbchA1nbRg5ai0dSfVCKtZvIR18avdtf0qw/xR2RbutgbO7pWfb57MrFK14ThksnbN6nei6D
 ui0fhayHOnVl7vW3wZ9f8hDGNDlZASyS88C8I43anb4zbyM16OLpQsmbpYKB4rCdabF2n600hH0
 QHpHplaV7/AWxRDT4ogJ46I9e+6Y/yhnR2+IgDgkul+s0rhfeVN2oxQxw8i4ze9dQllfEvW05g7
 sU5E6hEO2Nu9NQYEXOKMHfaNmwFO5qX3iC/R1e2+R967q7K2or9EnDExD0oKUTYM/Y0b92I7Smh
 mbkihOo4wIHw3qcj+X5EuIKn9KoCAVTODAMPtaD7e7lDN1Wxb3gEwO28EHNLaz0uR2qoTBPwAJb
 HdjLy6NM2ndJ55qV4sb859e5KL+xXwn6TJp3nIJGYyzWXaeYIssnofZXJPUmDVAIuqrZtnoAAt2 BMsAqbWd5SmJKnw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAyMDExMyBTYWx0ZWRfX6ittNbH2EU6U
 DS3UdR7Vw9EA/IHPz3psQh6mAwa8n3+pCVW0njeBfB1Cpt/1dRekdr224Er0tA+2szBLHnWVKEA
 hMeXS9TLXngC4iPmtUkeyUUwhqgXWWeyzH0JVjax6V1oUC5BUmuOLpwBqvtgPLuxLjpzZthvuG0
 gW6pFQVtdjcK7IXWhER5L/Mc4rXhQPQr1/JON2LcIuXmRNRT/I1QDmBSOzJdzJ+TpQKrW1j8Gjo
 kY0AJo7w+M8jtCCOtLvzMhkYorBWYCSBHzWoA2ErkRYvQngYH/TUndQhFt1s19OW72KimvIK2HI
 C7J8kIuca5nmZNsWR5SwZ4zFapzffHUh0H/2Nsbsb6zp6WYj4Rjroa7VbSfA5JWohkHlqk0CsFq
 RFCMvqs+cDZydG+YI9/5mzhDCJ36Gi55cUjfhOo/02t1SsmE22+Q4gt/h2fTxjEluS0ptNZ+ctz
 wZFtqGVrsyeJ9oCCfaw==
X-Proofpoint-ORIG-GUID: jHZUWf7VBl_-ZLkhfhnaj9geRNBk5R6N
X-Authority-Analysis: v=2.4 cv=d5/4CBjE c=1 sm=1 tr=0 ts=6957beea cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=Wn3wlxd-YHlgXba-soAA:9 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: jHZUWf7VBl_-ZLkhfhnaj9geRNBk5R6N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-02_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601020113
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260102_044947_183885_9BB4B669 
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
 drivers/mtd/nand/raw/qcom_nandc.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index 4dd6f1a4e797..b7e79b76654d 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -2206,16 +2206,14 @@ static int qcom_nand_host_init_and_register(struct qcom_nand_controller *nandc,
 static int qcom_probe_nand_devices(struct qcom_nand_controller *nandc)
 {
 	struct device *dev = nandc->dev;
-	struct device_node *dn = dev->of_node, *child;
+	struct device_node *dn = dev->of_node;
 	struct qcom_nand_host *host;
 	int ret = -ENODEV;
 
-	for_each_available_child_of_node(dn, child) {
+	for_each_available_child_of_node_scoped(dn, child) {
 		host = devm_kzalloc(dev, sizeof(*host), GFP_KERNEL);
-		if (!host) {
-			of_node_put(child);
+		if (!host)
 			return -ENOMEM;
-		}
 
 		ret = qcom_nand_host_init_and_register(nandc, host, child);
 		if (ret) {
-- 
2.51.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
