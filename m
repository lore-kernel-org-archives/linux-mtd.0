Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A586C021B3
	for <linux-mtd@archiver.kernel.org>; Fri, 21 Feb 2025 14:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References:Message-ID
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TE18Wtffqle9pgI2ux77i9Q3siDy9t8/yvGet3+g0+k=; b=RJXaqi4h/2ijE4
	pn5L0TsyY3j7ljscV6CkXHrRkBX6hIbAnXgeaizBcSaM9bSxZxtTb58RFNJ0kzREBqnVNOmYsxzUB
	XKbdS0js4hqEFr6IhSKkC7ZDSaNhfBLOCFccx/2DqcwT+h1dLkoqTqSwlBbsIx7UJmSlxPCoCmyY+
	h4fSa9wkAZtN52rJXteNQTMqlNrF1m1TLkqf1hE25Tl3GoExaRqWFWqXcLN2R/xNv/T/lhD9vSfSI
	XaUtQqHuKiEj1zKm1UHU26fIrPegvRifYkG3KjFGEq8c0gh7APRj0i2G7INdNHOeqoSZIJpCiE166
	pbXSaUVKWYNmOLbMSanQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlTkd-00000005ljY-12bN;
	Fri, 21 Feb 2025 14:11:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlSgf-00000005Xme-2vSM
	for linux-mtd@bombadil.infradead.org;
	Fri, 21 Feb 2025 13:03:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=CC:To:In-Reply-To:References:
	Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=JTYq6GLYbyjWCpZOBvzAKYBa3FWEQNkwL+TuIPTmGnA=; b=ZHIHK8s93qHKPnZp9YV94sXZ5j
	0HsalAsMqgteFRzizu/lGLl+dfF+z1tPoBrjKG0RC/4Ct356VfGpWdMaNMRNgc/MTqiLtM6kJDX0U
	GirzIKz8Rf2cBXHCHwPIrpCcK6y3ku7mbuQzkLgzTQLJBOAEW8SAhemRF1baHN3lBt8DyTDUPLOW/
	DYz85V41JjZEM6Rnep1JNFdfTy9NHEs5q/5SDlqIG+qAGxcl4ZdqE/s5Mon88AhIDlqDfd5kCLGGf
	zoUNJCeOa9qA7Da2/UgDWaIf0xbQLtifVn7WQkGlmqhT8DFtdwBarCEXiK+NwUTTFD2jCLhh2EzZ+
	Lh47VQzg==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlSga-00000002dor-36rC
	for linux-mtd@lists.infradead.org;
	Fri, 21 Feb 2025 13:03:24 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51L5kJ3h011654;
	Fri, 21 Feb 2025 13:02:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JTYq6GLYbyjWCpZOBvzAKYBa3FWEQNkwL+TuIPTmGnA=; b=e2ALmXztII+drsoG
	nEEBqIeFku6TjQT7FJq+O2Vngclyf+h1QcC9PgUSQ2P06qiaf3fifXtwdsE0BRmk
	MovLqWKxgMS3rH1uAoXkwRhNnI+tMX7uJxCyEyK51Rg9ukmrw0Z80Pg/1rLj01Pq
	NAQikpvcggOR59HE/qSGarjpDju6tr0tsSz9aS5DvI8qbHTFnvg95mUO6tDFtuIo
	Qh0lJoeu3OCDkA2duJntBljCJ35knK19/12Ox2dj/3n84NqO7a5xJQ0k9ggk00LL
	bvRMCYcf3iyJEihlhFZdvgIHhe8aIbhxvOUbWvSV987/djgmjVyn2CAqAlXvwHTp
	jSOb/Q==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44vyy3sys1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Feb 2025 13:02:43 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51LD2fJg020335
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Feb 2025 13:02:41 GMT
Received: from hu-zijuhu-lv.qualcomm.com (10.49.16.6) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 21 Feb 2025 05:02:40 -0800
From: Zijun Hu <quic_zijuhu@quicinc.com>
Date: Fri, 21 Feb 2025 05:02:20 -0800
Subject: [PATCH *-next 15/18] mfd: db8500-prcmu: Remove needless return in
 three void APIs
MIME-Version: 1.0
Message-ID: <20250221-rmv_return-v1-15-cc8dff275827@quicinc.com>
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
X-Proofpoint-ORIG-GUID: kDlPpVuo82Hyjkqx4P3EIG9D67W7lqTY
X-Proofpoint-GUID: kDlPpVuo82Hyjkqx4P3EIG9D67W7lqTY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-21_04,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 mlxlogscore=999 bulkscore=0 mlxscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2502100000 definitions=main-2502210096
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_130321_308210_DE92909D 
X-CRM114-Status: GOOD (  13.98  )
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

 prcmu_early_init()
 prcmu_system_reset()
 prcmu_modem_reset()

Since both the API and callee involved are void functions.

Signed-off-by: Zijun Hu <quic_zijuhu@quicinc.com>
---
 include/linux/mfd/dbx500-prcmu.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/linux/mfd/dbx500-prcmu.h b/include/linux/mfd/dbx500-prcmu.h
index dd0fc891b228..98567623c9df 100644
--- a/include/linux/mfd/dbx500-prcmu.h
+++ b/include/linux/mfd/dbx500-prcmu.h
@@ -215,7 +215,7 @@ struct prcmu_fw_version {
 
 static inline void prcmu_early_init(void)
 {
-	return db8500_prcmu_early_init();
+	db8500_prcmu_early_init();
 }
 
 static inline int prcmu_set_power_state(u8 state, bool keep_ulp_clk,
@@ -302,7 +302,7 @@ static inline int prcmu_request_ape_opp_100_voltage(bool enable)
 
 static inline void prcmu_system_reset(u16 reset_code)
 {
-	return db8500_prcmu_system_reset(reset_code);
+	db8500_prcmu_system_reset(reset_code);
 }
 
 static inline u16 prcmu_get_reset_code(void)
@@ -314,7 +314,7 @@ int prcmu_ac_wake_req(void);
 void prcmu_ac_sleep_req(void);
 static inline void prcmu_modem_reset(void)
 {
-	return db8500_prcmu_modem_reset();
+	db8500_prcmu_modem_reset();
 }
 
 static inline bool prcmu_is_ac_wake_requested(void)

-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
