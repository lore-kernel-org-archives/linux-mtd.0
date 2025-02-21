Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEEE8C021AA
	for <linux-mtd@archiver.kernel.org>; Fri, 21 Feb 2025 13:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References:Message-ID
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RBH5B8aHUkUbUomrkQXerfVSaVyoF1Ww89YIhJV/5as=; b=prWCn3uiBkQY4S
	jS5+ejnuLy5LS9/FKyLQz4dB0jDrIIuM1JOoPRw3LN60VrKlbbZURKI96hbGliKXb31Lyn45cHsAz
	AMBkKK6Mpfh3fgLHILy8TAHI2fcLcy1ZmuhnXx9B5yJV3kGJ9s1aU3CoEYfanne+Oquf8KVPxMMZw
	3FIE6IJaKlPx/tYlQmaczyap+FPlIgJMZtUTJSHZ5lYqSOhnEnqaUcZfL15+cOk1JYsjt+mDi9tsB
	NHAsnVcWR9qumUDiDe8SpjUMB1viyYvgYuPGHZCd5vK/MMGc8nYk2O4Hrk1pUtLntQS45qxevNVWd
	xK+kKhvTKxb2N/HaTtUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlSgi-00000005Xsm-3g8S;
	Fri, 21 Feb 2025 13:03:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlSgf-00000005Xml-3KAE
	for linux-mtd@bombadil.infradead.org;
	Fri, 21 Feb 2025 13:03:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=CC:To:In-Reply-To:References:
	Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=hDfWtNTdbaSs92T18904n8pbiB3wRUppd+SKmscGAlk=; b=qQ8HoM3wQuZ5uHv8woeR71gsIJ
	uMKdRctVzRK9AcFV5347UUh3yzbtPh9HQTEI94dJwhwROeEW8NrMH6Ye2inL0siDxaY5r7o5UnJgJ
	of6rCy93MTUMpZgJX8JX0FV0VyL8BVRh1AwwTJKp4+5xKRpKYAIBls0jfGghqZJpJAkF17eji9UEZ
	Hu8s368Sx//MYBkIVOL++RJxx5f5YnHU8+802bzNe0co4VEyg4mCWjuTMAkuBYnsjpADVXv2BJivT
	5Cuhcc7vbbYn9xra0wMImI/0SFJ+WV7z1Uc08X8qYzTCDwtTp48ISglnTufCnclBasu42N8PM5MbJ
	I5636FXw==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlSgc-00000002dq7-2wZB
	for linux-mtd@lists.infradead.org;
	Fri, 21 Feb 2025 13:03:24 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51L603lr016207;
	Fri, 21 Feb 2025 13:02:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hDfWtNTdbaSs92T18904n8pbiB3wRUppd+SKmscGAlk=; b=INf48+qwdFqvjkyp
	hr9FZ0HQLyNg4hcmSyTZNhBw4yXREh3pOc0jXnfrkIo2KSet8sVR2NT+eMvstrd1
	QgIClbFUMlhYyV+yOrPSSx84dqMVISE+v0x2ZkchXsZk72MZ9TgvGRGmx8AF8+54
	wT64OU5DrVYBsD2bvtGe7zdA6esj3sY0s05oEQCJ6VIjL/+LkM8VAXvn7JianplY
	qqJVRrKRyhBgdM6L/otz/CY4O63/6dzAi6e1yktYQ5sIp9uoV2GYQd2wcA2P4HXQ
	KYlfDcMeFbK049HxNCeabb/d2EddFjgDD/5D+oJuDwGdMO2d6fCIUEXFGpNluzua
	AtDIxw==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44xku6scbv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Feb 2025 13:02:36 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51LD2YTj015730
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Feb 2025 13:02:35 GMT
Received: from hu-zijuhu-lv.qualcomm.com (10.49.16.6) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 21 Feb 2025 05:02:34 -0800
From: Zijun Hu <quic_zijuhu@quicinc.com>
Date: Fri, 21 Feb 2025 05:02:12 -0800
Subject: [PATCH *-next 07/18] wifi: mac80211: Remove needless return in
 void API _ieee80211_hw_set()
MIME-Version: 1.0
Message-ID: <20250221-rmv_return-v1-7-cc8dff275827@quicinc.com>
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
X-Proofpoint-ORIG-GUID: gFqBDpJVue8M_4g_3XIvrl5JrEzUCHjB
X-Proofpoint-GUID: gFqBDpJVue8M_4g_3XIvrl5JrEzUCHjB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-21_04,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 spamscore=0 impostorscore=0 suspectscore=0 clxscore=1011
 mlxscore=0 bulkscore=0 phishscore=0 mlxlogscore=743 lowpriorityscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502210096
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_130323_130379_C91751C8 
X-CRM114-Status: GOOD (  14.09  )
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

Remove needless 'return' in void API _ieee80211_hw_set()
since both the API and __set_bit() are void functions.

Signed-off-by: Zijun Hu <quic_zijuhu@quicinc.com>
---
 include/net/mac80211.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/net/mac80211.h b/include/net/mac80211.h
index c3ed2fcff8b7..3a654e9f41db 100644
--- a/include/net/mac80211.h
+++ b/include/net/mac80211.h
@@ -3091,7 +3091,7 @@ static inline bool _ieee80211_hw_check(struct ieee80211_hw *hw,
 static inline void _ieee80211_hw_set(struct ieee80211_hw *hw,
 				     enum ieee80211_hw_flags flg)
 {
-	return __set_bit(flg, hw->flags);
+	__set_bit(flg, hw->flags);
 }
 #define ieee80211_hw_set(hw, flg)	_ieee80211_hw_set(hw, IEEE80211_HW_##flg)
 

-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
