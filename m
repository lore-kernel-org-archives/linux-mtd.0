Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E3B5FF8862
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Apr 2026 07:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tO++4OAfdP9t6+fZEceLci3L1Mhg0oG8zJhONhPUDiQ=; b=mJazbxiMtQnSn3
	xz8z3DJaTm2urgi/DWeyeYJVnp63RvbzrbzydsDKJLnJX4zfGCuxoFklWqcdT+088er+Fw4imhNQG
	IGLD0EJADUVRNROo1cIco5uDByNIUlWPLJ2hpCXMX0tMCctnRRiLuafEuc08GJ7crfbt4XQEJGxCC
	7CGzTj1opGyyWgthXe2NAxyMwt4OuZKJKmaRcsZoXvMV3Rw9ar7+z0F917c7tqBjLo0g7fpY9V2y4
	fI1RoWn0qVNO2BhrKmg+9EdwwDbaPm48bCqI+jAueYO+auviHvH3xxCe2qpHeymDbGoJq7bbhSArJ
	Fysxd13nk9wX3Gp7q2kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHFy1-0000000GKBA-0aUv;
	Mon, 27 Apr 2026 07:01:17 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHFxu-0000000GK8n-3T4b
	for linux-mtd@lists.infradead.org;
	Mon, 27 Apr 2026 07:01:15 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63QHP2i21781219
	for <linux-mtd@lists.infradead.org>; Mon, 27 Apr 2026 07:01:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=P+HSbX6rCEmk+WgtBkvRIPUPeLUPVqSttsY
	Srbkixo4=; b=ovc/+USBdXGYxPmj5yeUDoROgr6V+Zt0Bg6xOSCJ2fuC2V7+MnE
	eTVIBYjSCbrVyIZw/8V0x/p0/vJE76+o0Qz/38omBWK5pmjfhvh/drh96/4KuJ6A
	5kcxF63A0Lja0DrBMjE5a9YWQkzTgewQiBdDQ1+tK1N3nBQH0OZ9z7+bnyWQ9yUd
	+200z1lpF2QS8gZLEdxKeKQOhT5kOhvtA9n8sSZ01VranEv1Q3Xl6Ve7vqL9VJ8Q
	FaDXI7Z4rw8YSy3PrGMSp49Wcs42bvdMGQaOM39HOI2svYbKa6vCghBfyGf6aTVu
	hhHTUSE+veWRHV1w9bocvvL0R4WdfXrcvYA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drnmr4syy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mtd@lists.infradead.org>; Mon, 27 Apr 2026 07:01:09 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50fb3c7b989so109685641cf.0
        for <linux-mtd@lists.infradead.org>; Mon, 27 Apr 2026 00:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777273269; x=1777878069; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=P+HSbX6rCEmk+WgtBkvRIPUPeLUPVqSttsYSrbkixo4=;
        b=B2EGiCajL/9yhlBccvND+FGMi6txKzMPBiJq7BesKcwWF20Ta9eKnD9dz1o0uWuQk+
         5HbF1DisVBb5sLs3xI5E4gsaC1X5ZC6n0GW+j/1bQAyi24e1FcBdgSgiKgELuraYb77H
         FK2928psBUWgMZzA1UaYGXbC0XigzIX36wUOszYuFxHN/jC30socHyisXeY/1TtJ2glX
         CMo4yEYagxhCGBitzSdSgeJysYdZNCPPS8NelbgmB37GAfrtMyDG7OxNHNSAXrZiIqFf
         NITEk53Mby3mIRytcC8Sxw4RI9c0sZI2AMlrk5PbzQoi3/SP99BmCBu5cCOMc7AXwFU/
         SF8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777273269; x=1777878069;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P+HSbX6rCEmk+WgtBkvRIPUPeLUPVqSttsYSrbkixo4=;
        b=brCwtM7GqtlUNZGy9a3SYsdozaiIViGw65FMphIwJrQnsCtRJ3gw/gJy9PzYzGVSVr
         8jzFqZ9YetgLrgujPi8Ig12NP+7rDDwblFkjI88yXPaLvYzRuDV7K8g7XNreIC07RAVX
         gK7HZOixutYfsg/XkvWzk4QBg4ZvpatG4ULryx0ICyeI7LmhWFmmD27xDK25I23sFH5g
         VBphQs1eBKJXoAI9m2VddWIzdoR+cz8ZAHzGN/JhkYe76/jYVcv5ftMJjxKikZS71Icg
         9X7kPeQ6mFSCm4PYGxVEY9mjbZzp/Lr1iWjrk/Lklj5ptb8ZJxVE4vN22GB/leeuLkHA
         aXpQ==
X-Forwarded-Encrypted: i=1; AFNElJ/yZh2sRQUPG7xmJ5RF01Rgft+cju0HJE1BU2UAcGWZTy+htwOCRlaECBMCdYCeRqaWXrNArqXWDrk=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywn9xdk5/+2PCYgbtdCO8lhMnC/mqlnK1xKktlvQFUkdRkbqY5K
	nRUEd78F7t0qd2nNO7Z8dJUsRqGlIGw8QcA0WbujqYqNqv2juVbn8MAohz6reMewIHtVp40IvdL
	9U8XHOmkH2pkxctq8f+H3OdHhuWEu7PFRubhT43GpgYWphZ6BPkEDoii4LgWnZaJK1Ep+
X-Gm-Gg: AeBDiet+j9cwYXKix45aOn88yOl5KizMvvr5zcFzs9gLOdoK4d33x2xDqfTOmsLWnUr
	4EXZJTr5W/Eykk8RtKmxlZHT+HBLahagt/G8drk0Dga5kd/dN9NDVP11TuM7nHyaqWqgXydyYjK
	Yg3SbHP4mbynCQa+TKZY0SwcqNQd+lBL+uO8Y+B6t+GR/lUa6bU8PNwoF9eKo6kcSwEfUG3/3R+
	G29Cksd50NYKyzrtd8kh1n5+F3FbvupEtOJRMmsfSc80qQOQksm0k6C7pbOCD2gGYBtOReXGwJd
	1oeBY5QwMcAhLl1PeMy7dQjRtXRmoQdOBnebCMDvtieZm2tvWI/ygzRnj0psWOBKGgKpgy6YmD8
	ihFG/qji70QiR5m6S7Keg+XJJB+g38OCKXB1/hDeGn+CVBOfuXbSDD1DROrqoB35mhclDLkM7Qe
	iTSZiiU34hsQ==
X-Received: by 2002:a05:622a:1390:b0:50f:b076:43dd with SMTP id d75a77b69052e-50fb0764918mr402154721cf.36.1777273269220;
        Mon, 27 Apr 2026 00:01:09 -0700 (PDT)
X-Received: by 2002:a05:622a:1390:b0:50f:b076:43dd with SMTP id d75a77b69052e-50fb0764918mr402154151cf.36.1777273268477;
        Mon, 27 Apr 2026 00:01:08 -0700 (PDT)
Received: from quoll (5-226-109-134.static.ip.netia.com.pl. [5.226.109.134])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4cb135asm84258724f8f.6.2026.04.27.00.01.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 00:01:07 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc: =Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] mtd: qcom: Unify user-visible "Qualcomm" name
Date: Mon, 27 Apr 2026 09:01:05 +0200
Message-ID: <20260427070104.18227-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1172; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=9oxPfm9GW9t/GwNdjoHimHUcvuT3jEKHo89NglBUots=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp7wmx5YbeCWIeDxUe4wuY6WAZow/fJOOofzWj/
 RQvgIheuW6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCae8JsQAKCRDBN2bmhouD
 14ntEACOQR8QIAZgSqHwCwFWP3G9mRee+vBgMXeM7/5u2JLa9abz+vahtpR4l+TEdsNDW8/L6Yn
 rt53bLNA3UGnIiAOclbVTmp2fmjaVABJUkyBn4282Tv0uFw5eNAeTgjQbFUTB0bI8H0wLvwoWZF
 XnIakcE67L3UD1AbcY6TX/q6Mo1LpD4zqwgTEuBmTyhItmM+dJNraYZR9HD1X4XrupOfMrb9jiA
 07u5NEedTF4HuWhSzw/i73/QJxwA9PxSkr0lmJk7U9fAkZjvVFJi1h9PT3QtJlt0KNrJp1aF307
 g7DXYVYsRX/LK6E0LuKmehAQNzObPWEsOPml/Vsuijd3rderA14WGNnVLzN+SU2Z6oLlStl/TvH
 2KIDc4uY86ZaZEzT/jXwhvlJ9yqs0qpEmM/u3yCvvZdYAZmPDzpdtRAKwxXP7ycz9K/YPVV/0en
 ETPnwsR/uu9PX62g6YHt8ExA8q+hm+ANgkAVBbknDuXOzYy6Za/4rO9hqd6tK9D2GqvA8EmhwiV
 IFsPsJduwmpKs0ciffygZYjgq2tspgrmzV2PdSmHJXhPnZnZot4OzVGpizF+AQOKKr+7RX0ILoD
 q2jmewfIfRV9ssmUJeBDqMMn3msNKTkWEXxvNmUdCxkTNTpWiVFHM3nf9FIih9U1TUKBM9CaKsE 7nz0UcTuJBvsXJg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=aqCCzyZV c=1 sm=1 tr=0 ts=69ef09b5 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=nnYKl1aPHK5ktf5uHVwi7Q==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=OH2BrCJ_zWbRPc5wGsQA:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: TwSdWXf5oPcFO4YJCAUCoQEpMUpOnNdx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDA3MyBTYWx0ZWRfX6PzHK/FMxvmL
 2DzewFfojWo0XrSyHsEHfho/jezF807DF+y2j4Ff2G5SUzIS4t1eVyWPIra6q4GWHfWcMGwuxBN
 X34Cr9QFYGCFaaOpwySomp3wFeYAFUki7xcDAWKiuBqlJCRdUFFRvse9VIovO4k4WMwkt+nzzw1
 cCYGpqeILQPq0Q2wk7fpktacOXV6Tw76VEn28EaYe2gX9MY17dD7hUqdqtjOzEdrEuIZ+Ub6jcQ
 Md6Eh/DCkOHQ6TlxrY/DGtoWDuRtuKGvcp9TRvEMqhQaopddh5G9594Cm3+Qv7Bo/8FjDx2LD9d
 /5iIFfTH3VugjyVKpT0JhKkTKL9KcIr3ArIx+2245DVP6paE/IYNLO+8PchjcE9prO2UzwmLdLW
 /JMxT+gh8sILj8G8DFvo+Mqcav56KPBhl1xY86rG2Zu8bwvf6t4JGrCtlpg0XGQsVSvMpC08d6y
 PpuxbnXNkB9fSajALBQ==
X-Proofpoint-ORIG-GUID: TwSdWXf5oPcFO4YJCAUCoQEpMUpOnNdx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0 adultscore=0
 suspectscore=0 malwarescore=0 bulkscore=0 clxscore=1011 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270073
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_000110_992376_A21EF67F 
X-CRM114-Status: GOOD (  14.29  )
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

Various names for Qualcomm as a company are used in user-visible config
options: QCOM, Qualcomm and Qualcomm Technologies.  Switch to unified
"Qualcomm" so it will be easier for users to identify the options when
for example running menuconfig.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

And "Qualcomm Technologies" has even variations over the tree:
Qualcomm Technologies
Qualcomm Technologies Inc.
Qualcomm Technologies, Inc.

I am doing this tree wide:
https://lore.kernel.org/all/?q=f%3Akrzysztof+s%3A%22Unify+user-visible%22+s%3AQualcomm
---
 drivers/mtd/nand/raw/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/Kconfig b/drivers/mtd/nand/raw/Kconfig
index 7408f34f0c68..d488213b631f 100644
--- a/drivers/mtd/nand/raw/Kconfig
+++ b/drivers/mtd/nand/raw/Kconfig
@@ -304,7 +304,7 @@ config MTD_NAND_HISI504
 	  Enables support for NAND controller on Hisilicon SoC Hip04.
 
 config MTD_NAND_QCOM
-	tristate "QCOM NAND controller"
+	tristate "Qualcomm NAND controller"
 	depends on ARCH_QCOM || COMPILE_TEST
 	depends on HAS_IOMEM
 	help
-- 
2.51.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
