Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6527CC021AA
	for <linux-mtd@archiver.kernel.org>; Fri, 21 Feb 2025 13:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References:Message-ID
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fBAvehzGTGfBgteIMObxALQKCclCP1vBi6WxQ6GC7e4=; b=j5LOE4WRMOHlhR
	/Vs/wWJY7VgYA2wB299yrKcJrBJ7vGAEoAjuSvIR3YCPgMebKFH13xTu9mRmsHQ5A/DgytEiVHf3X
	BaDvRLMCbS/h6kLItrHfz9vwbu+AA1FoLqv/j/DM8sc8Opx0AFU1exnAZCRgKJnUrIYKr5NEcbFxT
	EdczDSkHRmpfWNLOWFqlVLFOeDzAGyEAvMTWU93G3KmjcsQKtVDUZFe+K70kP7NtV+33Dni1s/b75
	n2ypyKiguX0Bp2IWHkjcfLSE9cUPquxXMIALQGMNslFwiGhTRAktCBjhiN3RzZeZRkI8YKk6a98/O
	IK+z/kOtbE6tVoHNjPHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlSga-00000005Xgr-18gr;
	Fri, 21 Feb 2025 13:03:20 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlSgW-00000005Xbq-0iDT
	for linux-mtd@lists.infradead.org;
	Fri, 21 Feb 2025 13:03:17 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51LCth5u031375;
	Fri, 21 Feb 2025 13:02:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	23zc97bNEojfrf7Aepw+jdTM5CqbRIhKkZBo1Y/VTQA=; b=JrxFvFyVLAAmqDKi
	kYNLIHhaxo8Cj8UC54UO9/6+ZuVk4NreclcfZq+TrIuZaRffyaKLEcUKEuZYCNMu
	IbCa5Rgtk6JDT+yOvT3Y72tw8T03ns/DAHOpxJw21tYT6ZuogrjcAeMRitkbBCTz
	anJ0Cu/VNeW5s6pGTMisxOj3M58PgS9BTI+iwDpgE8PFnOyxUvFl7Zl1LTffAfG1
	n3fBwWEXNU2IVIsgJ2oUh1Z2gwNYGBbKwRQduSCYSWOJmb8zhIY68a3L3IvAW1v9
	YAOarG/pJMYc3tjovzowrAMT873PWtsFJ4QMv33RaCzl0pZ2YnKbkDnNgU676BUl
	SiwSkA==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44vyy5hyj0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Feb 2025 13:02:44 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51LD2gWn020361
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Feb 2025 13:02:42 GMT
Received: from hu-zijuhu-lv.qualcomm.com (10.49.16.6) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 21 Feb 2025 05:02:41 -0800
From: Zijun Hu <quic_zijuhu@quicinc.com>
Date: Fri, 21 Feb 2025 05:02:21 -0800
Subject: [PATCH *-next 16/18] rhashtable: Remove needless return in three
 void APIs
MIME-Version: 1.0
Message-ID: <20250221-rmv_return-v1-16-cc8dff275827@quicinc.com>
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
X-Proofpoint-ORIG-GUID: mXmn2OcLX0UFAdy8phFaZcXV3YHhHqOj
X-Proofpoint-GUID: mXmn2OcLX0UFAdy8phFaZcXV3YHhHqOj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-21_04,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=619 spamscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 adultscore=0 malwarescore=0 mlxscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502210096
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_050316_320161_BB84EBFB 
X-CRM114-Status: GOOD (  15.06  )
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

Remove needless 'return' in the following void APIs:

 rhltable_walk_enter()
 rhltable_free_and_destroy()
 rhltable_destroy()

Since both the API and callee involved are void functions.

Signed-off-by: Zijun Hu <quic_zijuhu@quicinc.com>
---
 include/linux/rhashtable.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/linux/rhashtable.h b/include/linux/rhashtable.h
index 8463a128e2f4..6c85b28ea30b 100644
--- a/include/linux/rhashtable.h
+++ b/include/linux/rhashtable.h
@@ -1259,7 +1259,7 @@ static inline int rhashtable_replace_fast(
 static inline void rhltable_walk_enter(struct rhltable *hlt,
 				       struct rhashtable_iter *iter)
 {
-	return rhashtable_walk_enter(&hlt->ht, iter);
+	rhashtable_walk_enter(&hlt->ht, iter);
 }
 
 /**
@@ -1275,12 +1275,12 @@ static inline void rhltable_free_and_destroy(struct rhltable *hlt,
 							     void *arg),
 					     void *arg)
 {
-	return rhashtable_free_and_destroy(&hlt->ht, free_fn, arg);
+	rhashtable_free_and_destroy(&hlt->ht, free_fn, arg);
 }
 
 static inline void rhltable_destroy(struct rhltable *hlt)
 {
-	return rhltable_free_and_destroy(hlt, NULL, NULL);
+	rhltable_free_and_destroy(hlt, NULL, NULL);
 }
 
 #endif /* _LINUX_RHASHTABLE_H */

-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
