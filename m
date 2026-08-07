Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C0DAC5AC7A
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Aug 2026 06:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=j1yycmU2RqvQ6ItqgfTIcGeqpRR41pwV1z1zhG/Dx7Y=; b=kQCyd+6CPvsVV7
	+TBnyijI0a4+XZ9j5Th08svLwianMCdzc3WHHLXpcnrRKPPhtVwCkOgX11YPTdinr3x+EFbXqsWej
	tHBkfN9qPDflu/m966/3B4YigCOwxWi1KT9aFJIk4RApayNpc3CTr4qbW8kI2Nldq5NH4Qmeo1/fR
	uPR4rW8Pn1ycRTkGvMl9m6NQFM8ypgYg49j9RJD2g1a6M8gZQnGSxXq1pMW4LSw5wN1YJD7AZXLlD
	d/1ZluKvFX3in4oSbASKUBzAkJbWuHpR9CTPjrsRzy5OPq3Bs36PIn0nFr/+jL1dzES4RUmizMJTs
	xSJjzEGw3sUQMxX3L+0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsEJ4-00000007Bk1-3cEX;
	Fri, 07 Aug 2026 06:43:50 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsEJ2-00000007BjR-0Zwk
	for linux-mtd@lists.infradead.org;
	Fri, 07 Aug 2026 06:43:49 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6770HdPv3830803
	for <linux-mtd@lists.infradead.org>; Fri, 7 Aug 2026 06:43:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=cvRpN9Ro1r4aWdXgPJBzWDdE0KCcrEODja6
	sI47yN4s=; b=FJYRWfnTSKuy4CrIyMnZso25HNLV8RTRn0lizMqWdLuBcKclh+y
	uVGnx8qgUynK+hN00OJYFXGfaHdr67N5gpheEgtRMpBxICE/DA1zLsix4BrgddRp
	2+8Ch/l6iIzxBEyDFkBucjRbPlbFbb9m51O05wM/9eo91QN6KKaUzI9iQ5trgTf+
	NinfSpI1xKmgZOSX9Ob2VOeE0vDTbWbs6azzVkHbJ7xqlEuJJTcE9Exj70Xdhs1W
	PIzEyDYSvLzhSfd9sIU+mH7E4441u54YtytCqG48YW+74qeByfLrk6JHn3/m76vq
	ws13iRZvEIEWMqfBSdUEY9JK/bGcit7v4PQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvy6gtqdf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mtd@lists.infradead.org>; Fri, 07 Aug 2026 06:43:46 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cb5cc1e13f8so3446547a12.3
        for <linux-mtd@lists.infradead.org>; Thu, 06 Aug 2026 23:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786085025; x=1786689825; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cvRpN9Ro1r4aWdXgPJBzWDdE0KCcrEODja6sI47yN4s=;
        b=d8Ugrmf2dHiPDHRZfJMx5viaRqbzRH7uPHX1SyjN6bddtDkljyxCZletNraGzVBx9o
         9Rz5GKIRLxsvD1ApJuLemVVdkeZS1xAt6rbCZf7EMG0vdO9joO0TZOqLqD3A7eFEy/TU
         wR1BBa+JbHx7aK+ZlyLSzkKBZh6xZHhkRB2AqnhF52vTIkp/EzoDKXb5VDOx5V4aLI3j
         d9HiycnjhiVho2IMeQReeTGB/M8XTfxEokh1SKBveMXZKOja+7HAhuDw8nl1j+6BulzA
         MMafhoayvo6VXBdMjs6ESL7J85ftzrxfD6iETLL8nXidK8LM1gwEVlTiCuDhjfYS13pO
         uJQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786085025; x=1786689825;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cvRpN9Ro1r4aWdXgPJBzWDdE0KCcrEODja6sI47yN4s=;
        b=AdfWBUCtMK1p/hpMqfxGMdXi4WTwLcSUFNZH9/K4QdaoUWquVq1xRew4EwOjvbGhlm
         2s3zo+69BlTCP2M+fZ+tCwt5LxgJ6G+q5Ur0F/qmhvpTsFrevE6i9O6C47DN4MIOEvFI
         MlUaum9y6RRNLE5pu5xkJiuWZJo//xb2n2Mz8DYmHchGBXoCZmNnhgesyMzEHE/r/4Jx
         Z589MrrB361GXiq5tQTpssdB2nRXB2GDrkrQL6764mK6+lxvSSfIBwdvhPDdQM6aw0+O
         xCUUyG7vKl4d7HsZeVGkCLMTWk18DsZRPZQf6xiMeQ3AvLtfDO4i7Emj8NBT4ZqGCgkV
         Bnhw==
X-Forwarded-Encrypted: i=1; AHgh+RqqCsaWSnY9Gm21Nw9go2+Skuz8ijN3oAqNzp2Z1bq2ct7kw2vRyvjHA2eNgVzWGDt8JwgIIvKP9SQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YxgJ6KyIsdgS4Z0TDWpcty0R5L2TP2a7olHPQ3IZlOXhHbT4dro
	S9bx8qsA+lLyQKwQD7mvV1ZIVZ8JGawMBmdfLL9R7td8cscg8aJWd/xGXMsqwhTiVK2eKALuWdM
	Uo+Pnsacr8mxc8SBPYJjDaqZjza7uCkxVfCZFHFaqaBF4vvVIRIWGYSNrHxLfHvgx6IUq
X-Gm-Gg: AR+sD13E4or4x0Chczxj8nqHIeIX0J2bhEZS8NEbVBzehBT42wQq/L3MbwdmOeXhA91
	qpoGSzrpGqeWTConRwD6ZsZsbBIXHCsbIOPWDa927mLYsO2rMqqnkLII0Ie5ilsAgcpXFeqAW4d
	KkUUyVwYKO1nHTwMVjLdPlkYY4VFjCn4RqFQXrdJvPHhdO/lRo8KffHfcGlLsibFntuVCvIojRp
	tjwoTArVS/8f5i2Bo3POP9Xc6LIOdkJ5jx0y6/kc7CvNtOd52SiOev7LG8CXsLxg/zb7BIVt66f
	q7MaBjTZ/ssl7HhWYDHbvlKqliwyJnOxbXXT8iYm1W42A7DdSSkv4eQLLxUtIC1wIt1pncfg55W
	kD2/gcX7HSDbAkLHn5hFNLT546RtrknYxcZUqTust3BRvyimXv0vSQAqavh49PqUNIsvco6XtZA
	grmFsmtYrei9o=
X-Received: by 2002:a05:6300:4049:b0:3bf:a638:4376 with SMTP id adf61e73a8af0-3cb85ea369dmr25216779637.21.1786085025115;
        Thu, 06 Aug 2026 23:43:45 -0700 (PDT)
X-Received: by 2002:a05:6300:4049:b0:3bf:a638:4376 with SMTP id adf61e73a8af0-3cb85ea369dmr25216731637.21.1786085024694;
        Thu, 06 Aug 2026 23:43:44 -0700 (PDT)
Received: from hu-mdalam-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141019b41d9sm3833652c88.5.2026.08.06.23.43.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 23:43:44 -0700 (PDT)
From: Md Sadre Alam <md.alam@oss.qualcomm.com>
To: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
        tudor.ambarus@linaro.org, s-k6@ti.com, linux-mtd@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc: varadarajan.narayanan@oss.qualcomm.com
Subject: [PATCH 0/2] mtd: spinand: winbond: add support for additional SPI-NAND devices
Date: Fri,  7 Aug 2026 12:13:37 +0530
Message-Id: <20260807064339.1632249-1-md.alam@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Authority-Analysis: v=2.4 cv=frDsol4f c=1 sm=1 tr=0 ts=6a757ea2 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=TLn6Lr6f4kt20a3eaVoA:9
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: KjYceGF_J2kWw5vzUzlf5UMqfOyM6La2
X-Proofpoint-ORIG-GUID: KjYceGF_J2kWw5vzUzlf5UMqfOyM6La2
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDA0OCBTYWx0ZWRfX1ehZo1Adjl7/
 gav3FOpNgNXf/r15FeRGanT/ivgGrTIFMmFrxSmpU8GGjbTK2LXPrhtql0lbCVOv2UKQRvsenIu
 eT/dl/vGd81D8eiT5D+Tixkqjhn8NiQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDA0OCBTYWx0ZWRfXyYYSEYMz8rsQ
 0X4Y3BzFFIVI83gRMhQTQ/9lYGAbfAUmLUe5xLD36YjxwjlHKeQ/MBSwSQSkJSwgUS70e294K5M
 s1YfsL4xF008oby8pYD37ub0fmoQvwookEm6jJpj74TD2AMSd+JBbZHKMPRFOMvuEOuI1rI7Nxj
 fS6PARlCexgMztJKOe4do5Px5Si6RMD+wN72nF5ampSJediOEl/EMoGxbG+H++NSa0TQY86/akO
 UWA2AnSdP5DlWZAkf+IpTZwevpckkTQAMLcESfCXOAHwd+o4DzfxhQkhdg/bR7R2/0fJ0DWvJeL
 Jo43g7fqFn/GeWHvLfcTfr75wbcz/9/umERvw2m0E7M3se41mnDSHwMfjoHg3Nc19oi2nNTVHNe
 U0VCsKOvZo8a0dPkIdvyzJVErG2erPyuW/oPkhweIIN8XmAihM3dquqMSF/vvxF7Dkkb3DOuzNU
 NFL+ALKWGt83pn6hL2A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 clxscore=1015 suspectscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608070048
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_234348_314230_77072B82 
X-CRM114-Status: UNSURE (   8.80  )
X-CRM114-Notice: Please train this message.
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


This series adds support for three Winbond SPI-NAND devices that
are currently not recognized by the winbond SPI-NAND driver.

The W25N01KW and W25N02LW share page geometry and ECC handling
with existing supported devices and therefore reuse the existing
OOB layout definitions and ECC status callbacks.

The W25N04LW uses a different page and spare-area organization
from the existing W25N04KV/W25N04KW devices and requires a
dedicated OOB layout description.

Md Sadre Alam (2):
  mtd: spinand: winbond: add support for W25N04LW
  mtd: spinand: winbond: Add support for W25N01KW and W25N02LW

 drivers/mtd/nand/spi/winbond.c | 50 ++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
