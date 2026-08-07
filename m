Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 466BEC5AC7C
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Aug 2026 06:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d1b/z3+Ln1wI9mzSYdfCSI9xR+m54yUjmnQNwCb8Xx4=; b=uci6G4rkvOUDRI
	kJ63A1eqBgV07P7+MqmvbgseEu2gACLB7lbSzlfQehDbeZi7bZ+cKS/ij0DoKj6WecnEnLORctSs3
	5wI4s6GOt7XlH3egfHGbKdoBHnOfchVwZAnHEuatqKTXpJZjqC7LD5cBewSUINq9AuyLZ9NgfP54S
	JnOF1p1t2kfFPW8TQAMp+5tWrApnCiYaT4PT8htx5Tnpz8cAMpoiwCdHtZXoF4wW7cNV5HqMLtC2J
	WLwCYKTsenbbWzucYT2BrLs7TqvX9yNcA51iiBlQby0KfcIAbG9RPAjPUt3OObt7Bg97fKSXAW3yt
	8Adv7fAGhP8VRPePtXFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsEJB-00000007BmI-0A9h;
	Fri, 07 Aug 2026 06:43:57 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsEJ8-00000007BlA-2QZg
	for linux-mtd@lists.infradead.org;
	Fri, 07 Aug 2026 06:43:55 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6770Gjf03519179
	for <linux-mtd@lists.infradead.org>; Fri, 7 Aug 2026 06:43:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=DIc7tTONT2N
	Ui9BC/ovIG249vzJ7fzLiLqW43ipbscw=; b=hgxrNC+xlv+PB/0txir6PcS682Y
	o6n/77wqrMJpqpGYqblIsYAtQ088kByURh76vW3NOvCpz5JXP9uYm+znMxdBm/9y
	n/P2NiYt/IRZoYX3lTMQ2MWZE8dCM98fgBeFqkKhP+9aeDrgbJvHHCAwIk1Nt6Sr
	hnAbJzopphgGzbEg7q/CTXddJlUv/OBPw42grTaE/ADWm/pEndG0h97eXoEePD/0
	0DlnvA1Jz7aQCDyU54gnRIQ8FqV5mmi+tOap1IodbvSJy3J+4I8Sby09DKWvAHs4
	BNJFa93w8NKV4ldl1lSGVSlYwEfUEy47wNUyk1G2lFZEVzYec8aI/woLxCA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvy6s2nr6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mtd@lists.infradead.org>; Fri, 07 Aug 2026 06:43:53 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38dc085b0a7so4570074a91.2
        for <linux-mtd@lists.infradead.org>; Thu, 06 Aug 2026 23:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786085032; x=1786689832; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DIc7tTONT2NUi9BC/ovIG249vzJ7fzLiLqW43ipbscw=;
        b=XU799zE37MN9AcDl/SIXuswEB0XlGfYVBVtVjJf6tmW39tNxioFdOw/Q4y3AvMP0gl
         IY7rhtmrNJZYB2NSpXKgatAcCRF0IHGP4fosFU00DbwYfZ95sfiDgTJd+smaNzrUzuyD
         ScNseJMH372u4pqMHqM5Q+n3KpQt0Y1yDwALHrtl+GVmJ85X9FaF55SJFV509DnQft0J
         RxmmVUsr45g7tBmGJl02Sditmd3Bw/FmhIQJ0YBU26huWrEW1y3IlwLEfQvMdxX+afl7
         TfXNje1yJ/bX80ho3rF7e/5mw3Bv0ukWokYIG09r/glFgmQo/zkrhsyvPeSGV5HgvUS7
         aerQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786085032; x=1786689832;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DIc7tTONT2NUi9BC/ovIG249vzJ7fzLiLqW43ipbscw=;
        b=RupL5vnpSOboUOwixedhOcowgfA0J5wvOUOg1B7Zp59xt9AxwS/o2ISett6acTrX5r
         U7d9cusUujBeQHlWPs78VDY4C9pIaiZdA8pMoQKuNGYce7wmOd7CMY+sPsQYWpgAhRx7
         hrsOcs20pJKgBvrNrpHB613OzhvK8DXWRz+Z7j7n0cjkq/2D/CZ2go2oB1keOCOjEvoi
         a5J8woiaAp4vIuGaQyBxUttFRnV54N3WMGnOhZ16hXJZH36xRogs35bLFtJLjlsUEmU0
         SasfcB/TKPnhnlQnZa8YIF6eHl6YHuPzSaZjrhiyYw1J7AueTrocQbERkMZYq/UeRXud
         pWMQ==
X-Forwarded-Encrypted: i=1; AHgh+RqKht854S6B0bUfaEteEL72rUqOAfXG+5KHLj9UI6qd/w3VinL5qVgGy5Z3Q0/ldoPEJpCjnlGbDAA=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzmwquk3EpxqA2Wvu15uQYW2coj5wkdMLwIeR4ymIhYd3mjFhpe
	iO3U9jLEoy9NARjW/05d7sNJtjEQk/iG2Z34tkZuE1eIOywyIH+rocPTzQwgPBs8SZ2Dhq0LJqA
	pX605NWSthDnBSr/XtBLxHdejVthF8xj+tmpeh2Fk0CezWiD10HL7zJ1Q+QsqT1w0m5fV
X-Gm-Gg: AR+sD13KV8wcjmc38gYKL7SvtQQU0cw+MWX0LULgIaqLFK4dqthTICeLkUdYrsOpPH4
	VbwjUyXaVnB1ZKCb7vjUVnXv+uEFeUdwjDeNBRNzu/pq62A7k4RhFarThEmRD0n4F/YrnRZ5hmJ
	k24yhIo4W6M6j0buQSiZDriVxiNWhEM9+WHbNdjYkAbmNyPFflNGibhHOJvYGa6AqI7F3fsWnvM
	XGHAoY2og9a//v6ZVUjFA5TFM02+wzLoG7oyaAdM+Q+o2+hFnYLiPWlXoMPgVinaNA2h+gjsfUB
	llkqSCSNHSIDxptYA3kgk6rqxtEnhHgSUPcAx8+QaKE90APDfUKnnjaNVkcg3dS4PLVqkoUuvGK
	tFwsKVm14GF8B52cnZP1GwdkZK0KFbzWsuG3K/QQH0lbJoTqwEkpmAmvUKJ4zrf+P8LygNwcIW9
	M90rzY8Vo+hyE=
X-Received: by 2002:a17:90b:540f:b0:38f:5801:dc0e with SMTP id 98e67ed59e1d1-3903c5b7247mr22588269a91.15.1786085032300;
        Thu, 06 Aug 2026 23:43:52 -0700 (PDT)
X-Received: by 2002:a17:90b:540f:b0:38f:5801:dc0e with SMTP id 98e67ed59e1d1-3903c5b7247mr22588226a91.15.1786085031685;
        Thu, 06 Aug 2026 23:43:51 -0700 (PDT)
Received: from hu-mdalam-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141019b41d9sm3833652c88.5.2026.08.06.23.43.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 23:43:51 -0700 (PDT)
From: Md Sadre Alam <md.alam@oss.qualcomm.com>
To: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
        tudor.ambarus@linaro.org, s-k6@ti.com, linux-mtd@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc: varadarajan.narayanan@oss.qualcomm.com
Subject: [PATCH 2/2] mtd: spinand: winbond: add support for W25N01KW and W25N02LW
Date: Fri,  7 Aug 2026 12:13:39 +0530
Message-Id: <20260807064339.1632249-3-md.alam@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260807064339.1632249-1-md.alam@oss.qualcomm.com>
References: <20260807064339.1632249-1-md.alam@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDA0OCBTYWx0ZWRfX34I0QXqiv3b/
 sGPyhbtEdhG6hQLY8SnOqHlwalC6qoGguDAoOFVBJzfudgznX/LLUk+pXvVYuN6SwuMa4lw/FYB
 Id1xDGRPephMhnlDMf83m0uSbPZt3bA=
X-Proofpoint-ORIG-GUID: GlnAjdSorFUQfXgnnnmbGgoygtztYvlG
X-Proofpoint-GUID: GlnAjdSorFUQfXgnnnmbGgoygtztYvlG
X-Authority-Analysis: v=2.4 cv=B+eJFutM c=1 sm=1 tr=0 ts=6a757ea9 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=skpaqr9hH7cb6v_Vb3kA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDA0OCBTYWx0ZWRfXwEZKCFe2y1DA
 a3IMkN7nzrvTuNdnRPrJRYvCm1BvRGLC8Jw+sh9TzTSTVp3VlfjL1GzhTgV7E3SFrEg5I2ONf0+
 4fJ2CvgLMGx/XQdovr2gI1FBo2FpBKZHcKtNjnzNnxHiIuHx26P/AbKTdTsbZR6RZr5zQGbIG1L
 YreEYBRnSXYzQIkvot/3Qyg39qJZqzIpsDTrnERyRT7/YqYNvd4p93aTTXEEs6T5JlG+kA9S23g
 pnLqkRXGVTvRlLzxO6fpPwbdvH8dkXgFPIvn5lY0R/wNVEPoylsrBrhk04TWuohiVDMUbsauUWM
 nrjGv732aBUVgXrrAHxzHrZj9HV8wkZt8YPJ9Tsq8WPfeJS3ECWsPQfVhFbitllIpcxdmhohrfG
 88Dn9PbCuXHY/e9vA+qfM2R8IEAnenijcoGxq+epOCww/ZGygr97kclSkKwS0ahPZ7efaT4Ns8v
 VfrpDkcm+oixFGufvsQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608070048
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_234354_732243_DCDFC085 
X-CRM114-Status: GOOD (  11.10  )
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

Add support for the Winbond W25N01KW and W25N02LW SPI-NAND
devices.

The W25N01KW shares the same geometry, OOB layout, and ECC
status handling as the existing W25N01KV, while the W25N02LW
matches the existing W25N02KV/W25N02KW devices and reuses
their OOB layout and ECC status callback.

Signed-off-by: Md Sadre Alam <md.alam@oss.qualcomm.com>
---
 drivers/mtd/nand/spi/winbond.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/mtd/nand/spi/winbond.c b/drivers/mtd/nand/spi/winbond.c
index b0147b7cb76f..3bffa13bfa68 100644
--- a/drivers/mtd/nand/spi/winbond.c
+++ b/drivers/mtd/nand/spi/winbond.c
@@ -704,6 +704,15 @@ static const struct spinand_info winbond_spinand_table[] = {
 					      &update_cache_variants),
 		     0,
 		     SPINAND_ECCINFO(&w25n01kv_ooblayout, w25n02kv_ecc_get_status)),
+	SPINAND_INFO("W25N01KW", /* 1.8V */
+		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xbe, 0x21),
+		     NAND_MEMORG(1, 2048, 96, 64, 1024, 20, 1, 1, 1),
+		     NAND_ECCREQ(4, 512),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     0,
+		     SPINAND_ECCINFO(&w25n01kv_ooblayout, w25n02kv_ecc_get_status)),
 	SPINAND_INFO("W35N01JW", /* 1.8V */
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xdc, 0x21),
 		     NAND_MEMORG(1, 4096, 128, 64, 512, 10, 1, 1, 1),
@@ -759,6 +768,15 @@ static const struct spinand_info winbond_spinand_table[] = {
 					      &update_cache_variants),
 		     0,
 		     SPINAND_ECCINFO(&w25n02kv_ooblayout, w25n02kv_ecc_get_status)),
+	SPINAND_INFO("W25N02LW", /* 1.8V */
+		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x12, 0x22),
+		     NAND_MEMORG(1, 2048, 128, 64, 2048, 40, 1, 1, 1),
+		     NAND_ECCREQ(8, 512),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     0,
+		     SPINAND_ECCINFO(&w25n02kv_ooblayout, w25n02kv_ecc_get_status)),
 	SPINAND_INFO("W35N02JW", /* 1.8V */
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xdf, 0x22),
 		     NAND_MEMORG(1, 4096, 128, 64, 512, 10, 1, 2, 1),
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
