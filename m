Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ED60C61DA4
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Mar 2023 14:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wPwebRySYKAFldss2lBLXHEzgGQKvh69NGiwQY0YAPY=; b=cS5Rgg2yaOq3w/
	SSyvHRmb14xvGyDrS2RQ18GfNrepnxaWI701RS7ptNWTx729qqLh96nsXSxlb4tjRhsIi8P4Qk7U/
	lo17MmECBv16xkQE6Iv8Y2Sac3AywhVPzf4q7B/UD0hqg3MsCxn2zon3Zx5mll5yp7sIlk/nm3jAy
	H7NO/+ccb98uD0qV8VwAephaNvzawdfX7qdj1f8WGj9g77EPCU7VE/9YzaP+WpaMvYkLnD21oW8zE
	Muk5WUaUT7v12bbmikQkEpBiP73Rf61fNsn6pA+lCwW7EfYU6Olc3PiiXKp03A6npHyor9YkIcHtE
	GzDIm7UsWNGFkGOhJemQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZCDL-00DRvH-CP; Mon, 06 Mar 2023 14:53:23 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZC8S-00DPXP-O1
	for linux-mtd@lists.infradead.org; Mon, 06 Mar 2023 14:48:22 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 326DgsKt005152;
	Mon, 6 Mar 2023 14:48:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id; s=qcppdkim1;
 bh=wVTC4Q0LT3YwvLMJ74q3RRO4VzGWhpReLaEZ6kOGOjU=;
 b=hHoXNYDqZrq+Krf4b8bp2Fl9sQRumlYnP8NazM0eLdgg02/kxoH3CZzmHG7j5l1IWB9l
 xXkvQVJD2LeselaQk1ktUL5XxQ7kiKem3mct69tFA35DJRm/tbjL50/UCNXXiFN3FtDE
 HNNqaCudtDAVFDCFTqWhtE7uOwEk0PaoMLzbAWh71VR1NTBYuaJLVyFDf4rX0SzbuyfG
 jzbPPCbre6l5WQW3OozB1AgEMcWgO/i9pobEy6b+t3dqg5MiYHXPDUMkNRcyEfLHFPSA
 YM0Ll1d+xcdMPAJTXa6lLij58gsxZfK9ge3aizaw48zYsFLJVhCbO1AqAVJW4Nz3tlID DQ== 
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3p419151dc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Mar 2023 14:48:17 +0000
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 326EmDPa018021;
	Mon, 6 Mar 2023 14:48:13 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 3p4fft5j5g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Mon, 06 Mar 2023 14:48:13 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 326EfjQI011965;
	Mon, 6 Mar 2023 14:48:12 GMT
Received: from mdalam-linux.qualcomm.com (mdalam-linux.qualcomm.com [10.201.2.71])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 326EmCk1018016;
	Mon, 06 Mar 2023 14:48:12 +0000
Received: by mdalam-linux.qualcomm.com (Postfix, from userid 466583)
	id A926112010CA; Mon,  6 Mar 2023 20:18:11 +0530 (IST)
From: Md Sadre Alam <quic_mdalam@quicinc.com>
To: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
        linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: quic_sjaganat@quicinc.com, quic_srichara@quicinc.com,
        quic_varada@quicinc.com, quic_mdalam@quicinc.com
Subject: [PATCH 5/5] mtd: rawnand: Fix spelling mistake waifunc() -> waitfunc()
Date: Mon,  6 Mar 2023 20:18:10 +0530
Message-Id: <20230306144810.22078-1-quic_mdalam@quicinc.com>
X-Mailer: git-send-email 2.17.1
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: NFv1m6xKYlTOOm9i4MozZSTPosqoRhLu
X-Proofpoint-GUID: NFv1m6xKYlTOOm9i4MozZSTPosqoRhLu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-06_08,2023-03-06_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 mlxlogscore=848
 clxscore=1015 impostorscore=0 bulkscore=0 spamscore=0 phishscore=0
 suspectscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303060130
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_064820_867237_BEA840B4 
X-CRM114-Status: GOOD (  13.22  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

There is a spelling mistake in a chip->legacy.waifunc(). Fix it.

Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
---
 include/linux/mtd/rawnand.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index f8d4be9c587a..5159d692f9ce 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -1075,7 +1075,7 @@ static inline void nand_op_trace(const char *prefix,
  * @exec_op:	 controller specific method to execute NAND operations.
  *		 This method replaces chip->legacy.cmdfunc(),
  *		 chip->legacy.{read,write}_{buf,byte,word}(),
- *		 chip->legacy.dev_ready() and chip->legacy.waifunc().
+ *		 chip->legacy.dev_ready() and chip->legacy.waitfunc().
  * @setup_interface: setup the data interface and timing. If chipnr is set to
  *		     %NAND_DATA_IFACE_CHECK_ONLY this means the configuration
  *		     should not be applied but only checked.
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
