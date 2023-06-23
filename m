Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C2CDC3DA41
	for <linux-mtd@archiver.kernel.org>; Fri, 23 Jun 2023 04:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=N1yfR0t6ukn8b10L+n8Z/dFRtyuhoxgzJgjq+bvIVso=; b=AWrCEAkawXXdWb
	5jsNfuwT6SQtNBrZ1VdUVVV/zl0nOiNgLWxSE5h70xFthTI7VYWZVAOBzmxoR0DCXmnDnQrCdXL1u
	p9srCIbhrBxWrPoqdAZ+OuPk7yCIZw9liuc3TQVvMdBLlWJDPH6aalwHBuo8v1Jky3kMdYzlcp+Xv
	OdYPHQgGOekWQEAdKLZJN7mdixTR8/BCqn/zKgJWhm7ob4E/eSJ+H6CBk8zVnPv9hf4Aai7nH9Fbx
	KlDO9pvnNOFFSNmoGS7zYukEDqTdR7PI0DhkQ9J5JAeJPp55VTfWC4ro5dBXv0lyHtsjEWhK6EnKD
	rozF9YR4YexmFAEDfQoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCYt5-002YPO-1U;
	Fri, 23 Jun 2023 04:59:11 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCYt1-002YOK-0K
	for linux-mtd@lists.infradead.org;
	Fri, 23 Jun 2023 04:59:08 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35N4WCqH012079;
	Fri, 23 Jun 2023 04:59:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : subject
 : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=SNZbmJs47GRm3pObGSbK4H/JErwORPG8/lwb10BP4Wg=;
 b=azzheQ4gsmWhWuuBh1urEKwyGNYIbodEh5pB9k4TjNqaGKVl5rHeJllWGVDYujCRfww3
 KLP4dpQFcLVTs2DQlfsV8YXOOxI2FQHEzbgy4GlBL8CinIp/mEReddCCmsajNxf+wEyY
 KU0X89t624K+WSDH0e9Vp9Cfpe/anuC1qSZajWuhhX0uS8tFEiS44zp257qlv7Tj7WoZ
 Xo4StrMV+E3EV8g3L6A6fDKyrEmlRVDAgLF44wBxqehE7f7h6pPBXH6NXuh1KkyfS+wx
 pCKD+8nqxUWFeUhlH4pM2sNKhnzyIWBxRaxbEjDBJ3OULSnOe1cbLHOmb49piXXGweJX jw== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rbwvmd8kv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 Jun 2023 04:59:00 +0000
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 35N4wxOj010241
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 Jun 2023 04:58:59 GMT
Received: from sridsn-linux.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Thu, 22 Jun 2023 21:58:55 -0700
From: Sridharan S N <quic_sridsn@quicinc.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
        <quic_sridsn@quicinc.com>, <ddrokosov@sberdevices.ru>,
        <gch981213@gmail.com>, <mmkurbanov@sberdevices.ru>,
        <quic_mdalam@quicinc.com>, <linux-mtd@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH 0/3] Add support for gigadevice, esmt and toshiba NAND
Date: Fri, 23 Jun 2023 10:27:54 +0530
Message-ID: <20230623045757.30055-1-quic_sridsn@quicinc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: gPl6F03WStKoC91cseFKR6gsQ_Lq_G0u
X-Proofpoint-GUID: gPl6F03WStKoC91cseFKR6gsQ_Lq_G0u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-23_02,2023-06-22_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 mlxlogscore=433 malwarescore=0 spamscore=0 mlxscore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1011 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2306230043
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230622_215907_256146_8F973965 
X-CRM114-Status: GOOD (  12.01  )
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

This series add support for SPI NAND devices mentioned below:

gigadevice :
GD5F1GQ5RExxH and GD5F1GQ4RExxH - These are 1Gb SLC NAND flash
with 4b/512b on-die ECC capability. Both has 2K + 64B PageSize.

esmt :
F50D2G41KA - This is 2Gb SLC NAND flash with 8b/512b on-die ECC
	     capability.It has 2K + 128B  pagesize.

toshiba :
TC58NYG0S3HBAI4 - This is 1Gb SLC NAND flash with 8b/512b on-die ECC
		  capability.It has 2K + 128B  pagesize.
TH58NYG2S3HBAI4 - This is 4Gb SLC NAND flash with 8b/512b on-die ECC
		  capability.It has 2K + 128B  pagesize.
TH58NYG3S0HBAI6 - This is 8Gb SLC NAND flash with 8b/512b on-die ECC
		  capability.It has 4K + 256B  pagesize.

Sridharan S N (3):
  mtd: spinand: gigadevice: add support for GD5F1GQ{4,5}RExxH
  mtd: spinand: add support for ESMT F50D2G41KA
  mtd: spinand: add support for Toshiba T{C,H}58NYG{0,2}S3HBAI4 and
    TH58NYG3S0HBAI6

 drivers/mtd/nand/spi/esmt.c       |  9 +++++++++
 drivers/mtd/nand/spi/gigadevice.c | 20 +++++++++++++++++++
 drivers/mtd/nand/spi/toshiba.c    | 33 +++++++++++++++++++++++++++++++
 3 files changed, 62 insertions(+)

-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
