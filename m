Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73E42C021B3
	for <linux-mtd@archiver.kernel.org>; Fri, 21 Feb 2025 14:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References:Message-ID
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rooffTlvyS8a/sXMOlcEafpNlr2yvJWl5Urbm711Znw=; b=rzcDr78x0R8MZ4
	E1hSj0Owf1kQxO5tv2ChVgasIFRt4wkQ6EJDjdSqFkiUAVrYdpSSGOQ37iK/XWlvw/bJqOcBt5BIk
	oInl/UzsRJHUM1iHg0TRvc+HGPGHbX9J1pJsQXr3gE/dTUdkz+h4wcj8e/bbWsjjgcs7Dw3bS5vvR
	0jFj5XgmP4UA29ZNy6Vh1ZKq3/SRFMP+cYSNTk8Kc6mxTH3GHsTlrHxD7k5h4C5pk0MmYYM7UXa0X
	rXwBKh+zIK4sx4gGhs54+TY/3hTI0Gu6S0kzUTiiWiIdXTwfq44n6ZgHUbZGn0EI4Exw9AaJTYqps
	Q+5tQmbzxFrhD+h9WVVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlTkf-00000005ln7-1oUX;
	Fri, 21 Feb 2025 14:11:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlSgj-00000005Xs3-0ZPT
	for linux-mtd@bombadil.infradead.org;
	Fri, 21 Feb 2025 13:03:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=CC:To:In-Reply-To:References:
	Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=julPx67IQ3FmBl4gwmVVCyKrnfGS063OMiD1KD32OCg=; b=d/BAzvGtWT68eSBiVcA7XrsOrZ
	lGkKFPOF+/48WC71gI7LOyDV/i149u6N6lXiOcmc1PA1pqA/z9KyxaX92SvNkljla3jge8QcMIE/L
	O4y+IBVRw+QlU23tEwSkzzRY5y0Xq6VuQBdxN6MwC3dK8CmrealAepRo919SPUgOELoQ7sf4PtlLa
	hHENySOFHV0U5P0yUR8X4/pEKNnFdSQxv1YGDnAgWGIs48xj/pkORUbE0EpvatmqxAMFGgsi5eScH
	7qP5GU4OQbbm7ZA3oAhAOyVLCQ28sTMe9HLwXy72O9naG8ywQ6cVsQ+EMulN8FT5En0cD2lCkL3ND
	aZEC6GTA==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlSgf-00000002dqh-4Avp
	for linux-mtd@lists.infradead.org;
	Fri, 21 Feb 2025 13:03:27 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51L603ls016207;
	Fri, 21 Feb 2025 13:02:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	julPx67IQ3FmBl4gwmVVCyKrnfGS063OMiD1KD32OCg=; b=k4/RDLYACQM644LC
	fiklJgZI5EwoIby5+xay8N3TUAlaSmASI6qLRkxLhRMDhZHUsNkLVBQai1O79Hqi
	AyYDWXdSmGYpEdUSmb7xsD2Jb1LPVNH8TxdQCjmI1aSQalyhqcaCtmJ5E/aE6rPg
	vpJYnj71GAzNgAPuD18KUAi51lCizP/r/evdR8lOUGF2uNprDyZXriQuBvhPMxtR
	FSHKHewlb4OH9uXSA8S3e62Z+Ex14rpdxzZiR/Vmng3eHoEXGkFakDG49rAUf02a
	L8SsmxfrJuc2yZxuZGwXiL5gCM+W1Dr/g48UCwmFG7BIb4Ugh935lyA+N5dOtLK6
	C95jrg==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44xku6scbx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Feb 2025 13:02:52 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51LD2ZUa020247
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Feb 2025 13:02:35 GMT
Received: from hu-zijuhu-lv.qualcomm.com (10.49.16.6) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 21 Feb 2025 05:02:34 -0800
From: Zijun Hu <quic_zijuhu@quicinc.com>
Date: Fri, 21 Feb 2025 05:02:13 -0800
Subject: [PATCH *-next 08/18] net: sched: Remove needless return in void
 API qdisc_watchdog_schedule_ns()
MIME-Version: 1.0
Message-ID: <20250221-rmv_return-v1-8-cc8dff275827@quicinc.com>
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
X-Proofpoint-ORIG-GUID: FYztKemt9Tqs0W9uKA0g8HoIcTexhhme
X-Proofpoint-GUID: FYztKemt9Tqs0W9uKA0g8HoIcTexhhme
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-21_04,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 spamscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 mlxscore=0 bulkscore=0 phishscore=0 mlxlogscore=999 lowpriorityscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502210096
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_130326_457318_D51ACBF9 
X-CRM114-Status: GOOD (  14.06  )
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

Remove needless 'return' in void API qdisc_watchdog_schedule_ns() since
both the API and qdisc_watchdog_schedule_range_ns() are void functions.

Signed-off-by: Zijun Hu <quic_zijuhu@quicinc.com>
---
 include/net/pkt_sched.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/net/pkt_sched.h b/include/net/pkt_sched.h
index d7b7b6cd4aa1..b4d9ea54d947 100644
--- a/include/net/pkt_sched.h
+++ b/include/net/pkt_sched.h
@@ -78,7 +78,7 @@ void qdisc_watchdog_schedule_range_ns(struct qdisc_watchdog *wd, u64 expires,
 static inline void qdisc_watchdog_schedule_ns(struct qdisc_watchdog *wd,
 					      u64 expires)
 {
-	return qdisc_watchdog_schedule_range_ns(wd, expires, 0ULL);
+	qdisc_watchdog_schedule_range_ns(wd, expires, 0ULL);
 }
 
 static inline void qdisc_watchdog_schedule(struct qdisc_watchdog *wd,

-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
