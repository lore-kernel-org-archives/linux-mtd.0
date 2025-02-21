Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66B2CC021B5
	for <linux-mtd@archiver.kernel.org>; Fri, 21 Feb 2025 14:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References:Message-ID
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tD4NYYh9Rr70m5WRwCOfN9TKzUgaFYI5bwJT7cbH3cw=; b=M/ob6UGudPKpin
	f23WiUS2n2mS0cPS56J7QTAtjhU1EqC3Zz2788bEQ3N4tvmTLsPCODZE1Fk2aW4T/5tyKtmh5oRqZ
	FyHkYGstFRewnNmKJ9dJ5m/7DFqkoGWc0Q/V0vbGX9SDON+7cWnI6Z7XRylBbOmKpUjBo32VoAiZi
	rLiaLp/0XMIjcIm/MdcMg3VK4VatG6gM4JcgGGfsKW5Hk+HmpMYzuywUV/kh4P2wwrWm40JKegefA
	NUsy4no/j8YYHFYgnLh7mAmp6mMwCNgp/EEGW91a/EWZMINW4zpbqOKdf/vpMBmKw8zR2IhAPLmR/
	Gt+jS3rRLucRX+ec2zHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlTkY-00000005leN-1N3j;
	Fri, 21 Feb 2025 14:11:30 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlSgU-00000005XaH-3XdD
	for linux-mtd@lists.infradead.org;
	Fri, 21 Feb 2025 13:03:16 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51L6ILqX018822;
	Fri, 21 Feb 2025 13:02:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VXe5BH0CLWb34FDh3mku8unL00+Sgymv2t8WSQkUd70=; b=CUwUZJslP/4ngj7Y
	gXYIMQOVcCgLwUNeDGzGlJRCS9L8HcSKvayznht2VrEd/lL1fg3hOBL361D7oM02
	2qGwYY8Gpl4eBINWBd2Gzl9UWVpDjia4Fek9Y31Tn7wB5reYP+eENeh3FyX3rBvi
	rJ0mQFyxs61ir3KJiLOV0jjvZ22Hl1Z5qwxKnVSjbJlvZezOJdlxHJc9cskZSeRA
	L6q7Tnsox4XAYrdkKjBV9TLHzwj2FvwxhbHJyr4pUEgTgpQtFqdSFXsb3eVk4nH4
	XGWv6G+MiGUMIj7hZ/pJoP+6UUof5bbVDgNfdMiSaMyBgM3+Hrf2JPK941Dg4mq0
	RzN1dA==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44xm3rhaa6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Feb 2025 13:02:40 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51LD2cra020298
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Feb 2025 13:02:38 GMT
Received: from hu-zijuhu-lv.qualcomm.com (10.49.16.6) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 21 Feb 2025 05:02:37 -0800
From: Zijun Hu <quic_zijuhu@quicinc.com>
Date: Fri, 21 Feb 2025 05:02:17 -0800
Subject: [PATCH *-next 12/18] siox: Remove needless return in void API
 siox_driver_unregister()
MIME-Version: 1.0
Message-ID: <20250221-rmv_return-v1-12-cc8dff275827@quicinc.com>
References: <20250221-rmv_return-v1-0-cc8dff275827@quicinc.com>
In-Reply-To: <20250221-rmv_return-v1-0-cc8dff275827@quicinc.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Will Deacon
	<will@kernel.org>,
        Aneesh Kumar K.V <aneesh.kumar@kernel.org>,
        Andrew Morton
	<akpm@linux-foundation.org>,
        Nick Piggin <npiggin@gmail.com>,
        Peter Zijlstra
	<peterz@infradead.org>, Arnd Bergmann <arnd@arndb.de>,
        Thomas Gleixner
	<tglx@linutronix.de>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S.
 Miller" <davem@davemloft.net>,
        Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        "Danilo Krummrich" <dakr@kernel.org>,
        Eric Dumazet <edumazet@google.com>, "Jakub Kicinski" <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon
 Horman <horms@kernel.org>,
        Johannes Berg <johannes@sipsolutions.net>,
        "Jamal
 Hadi Salim" <jhs@mojatatu.com>,
        Cong Wang <xiyou.wangcong@gmail.com>, Jiri
 Pirko <jiri@resnulli.us>,
        Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky
	<leon@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        "Bartosz
 Golaszewski" <brgl@bgdev.pl>, Lee Jones <lee@kernel.org>,
        Thomas Graf
	<tgraf@suug.ch>, Christoph Hellwig <hch@lst.de>,
        Marek Szyprowski
	<m.szyprowski@samsung.com>,
        Robin Murphy <robin.murphy@arm.com>,
        "Miquel
 Raynal" <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>
CC: Zijun Hu <zijun_hu@icloud.com>, <linux-arch@vger.kernel.org>,
        <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>,
        <linux-crypto@vger.kernel.org>, <netdev@vger.kernel.org>,
        <linux-wireless@vger.kernel.org>, <linux-rdma@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <linux-pm@vger.kernel.org>,
        <iommu@lists.linux.dev>, <linux-mtd@lists.infradead.org>,
        Zijun Hu
	<quic_zijuhu@quicinc.com>
X-Mailer: b4 0.14.1
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: EBB6WKKcc5YXKjfEU7ajz-2xvo9w9S3v
X-Proofpoint-GUID: EBB6WKKcc5YXKjfEU7ajz-2xvo9w9S3v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-21_04,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxscore=0
 suspectscore=0 mlxlogscore=761 phishscore=0 bulkscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502210095
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_050314_994892_E267DAD1 
X-CRM114-Status: GOOD (  14.85  )
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

Remove needless 'return' in void API siox_driver_unregister()
since both the API and driver_unregister() are void functions.

Signed-off-by: Zijun Hu <quic_zijuhu@quicinc.com>
---
 include/linux/siox.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/siox.h b/include/linux/siox.h
index 6bfbda3f634c..31a20ba03d3a 100644
--- a/include/linux/siox.h
+++ b/include/linux/siox.h
@@ -70,7 +70,7 @@ static inline int siox_driver_register(struct siox_driver *sdriver)
 
 static inline void siox_driver_unregister(struct siox_driver *sdriver)
 {
-	return driver_unregister(&sdriver->driver);
+	driver_unregister(&sdriver->driver);
 }
 
 /*

-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
