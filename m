Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA6BEC001DC
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Jul 2023 15:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=42psAw9jpvKvAy84imoBx5eYI5gbMi0aHMY7UoBSiJ4=; b=atjIXuT75217fx
	B/IWo3yydOfueNuW6Jszpc8tGfZr2JrLLIzeXNMcZYFkM8HAzMLfEZWz3KXWBps9CJQVTiVTTg/PO
	BHuACxcvrsTDpb+WMkpULztPQ8jmYKFqdFQrlPQWf2IU/VjqjI+PSkuHb45hHz3mjGLR4DI56e3S7
	i6l8LaVSBcNlwlFoyG9GRdvz3RzMgm7JxAc6ZQ9bIigRbaUp38ZpkqXo5p6Mfyf3IZPuXCnqY53aO
	5ayTnYCphKtr4Ue/j64hMFAlsloakhBNU/ZbPhyxMO0zIn7GdLA32WlujAuToYv7Ge+wEXtQ5yjFx
	mSAUawk927QEv91nPKAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLQIr-004Px8-1e;
	Mon, 17 Jul 2023 15:38:25 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLQIo-004PwL-17
	for linux-mtd@lists.infradead.org;
	Mon, 17 Jul 2023 15:38:23 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36HEvBZu021228;
	Mon, 17 Jul 2023 15:38:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=0fbSLUsHk5+aAh1Bv430lalQz/DMhxbQhNWIGzN5ChM=;
 b=ESkd9kzvGSuTqZ81PwWUsT6N6EovrxswZxPl8rDcOvxJbfg9OtpMAcR+8U3//feT4pPH
 iQNwf05KuJ43nFY04ZvVjnYYmjtByn7kLpVT/wlJSmJidcP29qXovBFHxJWbPEtOahWS
 piyEkCTpTPVOTOnuxc+VOTVL0eUFyxNwBL9l4Z7+XeoSKv+RjSLdAZ3mgSQ6HnYdlKgx
 QTQIAELBG7ioePzu3+BA1dESv6i4gANkma5u4hwLae7/HPYA3zJ2KJ7/I997CuwWXsKX
 XqxKVH7K5yhyO1BM1WLbKNEDAl7Un5XtNKY0l5IDrRJxlYMCzKlDthCqnTFHPNXwL+sz dA== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rw33mgv4k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Jul 2023 15:38:16 +0000
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 36HFcFXb008341
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Jul 2023 15:38:15 GMT
Received: from sridsn-linux.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Mon, 17 Jul 2023 08:38:12 -0700
From: Sridharan S N <quic_sridsn@quicinc.com>
To: <tudor.ambarus@linaro.org>, <pratyush@kernel.org>, <michael@walle.cc>,
        <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
        <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: Sridharan S N <quic_sridsn@quicinc.com>
Subject: [PATCH 0/2] Add support for gigadevice and macronix SPI-NOR
Date: Mon, 17 Jul 2023 21:05:34 +0530
Message-ID: <20230717153536.25700-1-quic_sridsn@quicinc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Q0f8jo4xFOLTs7NE7mmZQSNV-J3rJt3p
X-Proofpoint-ORIG-GUID: Q0f8jo4xFOLTs7NE7mmZQSNV-J3rJt3p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-17_12,2023-07-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 clxscore=1011 lowpriorityscore=0 bulkscore=0
 adultscore=0 phishscore=0 spamscore=0 mlxlogscore=819 suspectscore=0
 malwarescore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307170142
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230717_083822_530496_62CE594C 
X-CRM114-Status: GOOD (  12.40  )
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

This series add support for SPI NOR devices mentioned below:

gigadevice:
gd25lb256e   - This supports quad read and uniform 4K-byte erase.
gd25d{2,4}0c - These supports dual read and uniform 4K-byte erase.

macronix:
mx66u1g45g - This chip supports stateless 4-byte opcodes, dual and quad
             read and uniform 4K-byte erase.
Sridharan S N (2):
  mtd: spi-nor: gigadevice: Add support for gd25lb256e and gd25d{2,4}0c
  mtd: spi-nor: macronix: Add support for mx66u1g45g

 drivers/mtd/spi-nor/gigadevice.c | 6 ++++++
 drivers/mtd/spi-nor/macronix.c   | 3 +++
 2 files changed, 9 insertions(+)

-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
