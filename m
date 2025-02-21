Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCAAEC021B5
	for <linux-mtd@archiver.kernel.org>; Fri, 21 Feb 2025 14:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References:Message-ID
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V7yH8AQKEhVjbksmHKRero/fpokq5OMVMk/lMwDwAFE=; b=OLBWjOb/94vZ31
	N1X2Av1YeukC5i+3o4SDVHurXYT4Y5zoClMmV9L/dCC6CnJ4isGuYM0IHzHDLxvztCld581ff9LTa
	JSH8FLkAfyccRjf1o4yFLcU8XCNNKZ81W63np98qG01cp7uJb/JSSMOW7qZQNACjgjnamLUB2OdJY
	AjLibmmYTUbLUN5TF90ZQiNG2WnPxBvJ86rQaqoIeYX6OtZOGeRI4UX3jawFge5ck826TMhhkNn5i
	wUOQgdhw6aWVrKkPbbyKtTJmYuexLAl+DW2SSrInbvYOSwdp8ZGXmhybJ5e+hTlHvQYUOen8KhYTS
	CRAs7edKJVD0sso0v2Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlTke-00000005lmF-3BcK;
	Fri, 21 Feb 2025 14:11:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlSgi-00000005XqU-0g8x
	for linux-mtd@bombadil.infradead.org;
	Fri, 21 Feb 2025 13:03:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=CC:To:In-Reply-To:References:
	Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=e8qnIPdSVA2jtju2GS19nOdRjzm3zHGxjzyB9pSCusI=; b=rRElR/jVf7nuCURSg7WrVXJ3wG
	L0DdFsLJ83cpyb5KJvvjuIGjphd9bnzTjZ5KzEqwqN5GQDa+NZ37ctkxAq5h0w7SS4qPSX8/uIjlT
	Ds+lwBo3ZhyUaMIp0IJt31Rf/4ER+WEFBdWLqXW34JjepQJ2CBq67E8jdvRSBfObUWVviYRrZoZN8
	Ip7vuTCK8k0pTvc+i0KO3CwW0XcveIZQX+Ewn0jy1G83A9fRajhg5ZGifTFJN5YpLUcNqbw016xgw
	M5S2n8QcYFHlgk0Tz4mm+sUqwNq+PWNvUj0aY2DIis9ZS1cICw6SRNxdHeBuCyxX2wzISGo+RymJZ
	SMuBLCtA==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlSgf-00000002dqW-0Mqv
	for linux-mtd@lists.infradead.org;
	Fri, 21 Feb 2025 13:03:27 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51L6011u015961;
	Fri, 21 Feb 2025 13:02:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e8qnIPdSVA2jtju2GS19nOdRjzm3zHGxjzyB9pSCusI=; b=d2c9PCcc47Zh0SML
	tLaMjQtGnaXZQZXQgkVyCtHf1x4TmmGvrLwErqMe7PQh5igGKy2QRMp0TKQUx8Et
	bw4/lw7DO+YeewiKmu7DOk5cvRV6nTjqAzsvSFsCEwpazoRBjj/iEvRsXfLJBbEE
	F5OngitLR8/5YjNq0b0U4vmbZvPfonnaBC+PIzfKbnmmQPeFREPeRC5qIABiH/9j
	ssKwtxgc4XQyIMPPw9NMATf2Betd2MJwsKcVrB90FlhhsIP/fR4bnGPAiioVkTGE
	jvo3vZW4QsRTiH4f3+TwBFAnJd7/MlGgqJKi9o9ymUHbdG0+V5sGB57sYUZKoHQX
	yuqaXw==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44xku6sccc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Feb 2025 13:02:53 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51LD2eQh016923
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Feb 2025 13:02:40 GMT
Received: from hu-zijuhu-lv.qualcomm.com (10.49.16.6) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 21 Feb 2025 05:02:39 -0800
From: Zijun Hu <quic_zijuhu@quicinc.com>
Date: Fri, 21 Feb 2025 05:02:19 -0800
Subject: [PATCH *-next 14/18] PM: wakeup: Remove needless return in three
 void APIs
MIME-Version: 1.0
Message-ID: <20250221-rmv_return-v1-14-cc8dff275827@quicinc.com>
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
X-Proofpoint-ORIG-GUID: DKQfdozma52UXuCPvRzdEuLz1FvuQgQJ
X-Proofpoint-GUID: DKQfdozma52UXuCPvRzdEuLz1FvuQgQJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-21_04,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 spamscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 mlxscore=0 bulkscore=0 phishscore=0 mlxlogscore=892 lowpriorityscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502210096
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_130325_550376_4C593DC4 
X-CRM114-Status: GOOD (  13.52  )
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

 __pm_wakeup_event()
 pm_wakeup_event()
 pm_wakeup_hard_event()

Since both the API and callee involved are void functions.

Signed-off-by: Zijun Hu <quic_zijuhu@quicinc.com>
---
 include/linux/pm_wakeup.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/linux/pm_wakeup.h b/include/linux/pm_wakeup.h
index d501c09c60cd..51e0e8dd5f9e 100644
--- a/include/linux/pm_wakeup.h
+++ b/include/linux/pm_wakeup.h
@@ -205,17 +205,17 @@ static inline void device_set_awake_path(struct device *dev)
 
 static inline void __pm_wakeup_event(struct wakeup_source *ws, unsigned int msec)
 {
-	return pm_wakeup_ws_event(ws, msec, false);
+	pm_wakeup_ws_event(ws, msec, false);
 }
 
 static inline void pm_wakeup_event(struct device *dev, unsigned int msec)
 {
-	return pm_wakeup_dev_event(dev, msec, false);
+	pm_wakeup_dev_event(dev, msec, false);
 }
 
 static inline void pm_wakeup_hard_event(struct device *dev)
 {
-	return pm_wakeup_dev_event(dev, 0, true);
+	pm_wakeup_dev_event(dev, 0, true);
 }
 
 /**

-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
