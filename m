Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C43CFC021B8
	for <linux-mtd@archiver.kernel.org>; Fri, 21 Feb 2025 14:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References:Message-ID
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8vt7MoFsPriX7TtkV3gC8gWrt32LdX2jJ0oc+a6O+HA=; b=tn1/HC4IReR2Sr
	PTN6FSyLSOkmMNsBWKrtYCMlv/By/WV09JIfQMMVG72CrW9JrUf0NgE/hz2b8A3Y2xgn//ljDpdgl
	zUefk2dq8exqLOq60qw84dL5LDQEreCePTMtm7CEjw3PEVZecx1dmwCUAh1PmhOa5olk8VO0A4tlL
	V+j7DW2f9bK3VoO7/OYXgeX6uA4WIpf9mjNq2PItwn28XRs9O4ezz0KunZ+jk4MxqtVEFrOMMLwYu
	AzCRDCROlNQ8pXu/JKoZ3va207eqKz+0zBOdl+MS0HpPX5kafVK+M5hzVLPwrL+1q6NtZcA1wtWIY
	IaL+H7JXPoA8q9GFN2jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlTkg-00000005lok-16zB;
	Fri, 21 Feb 2025 14:11:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlSgq-00000005Y2X-11C2
	for linux-mtd@bombadil.infradead.org;
	Fri, 21 Feb 2025 13:03:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=CC:To:In-Reply-To:References:
	Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=Tm0Zt0Z5RF7rdSISUfZdhv6NUQ6vAdfywek+iOtN6ys=; b=GSag5Yc+jRf9zttRepsUrMi5Xj
	8iHvMnXxXa7HkBvJexihYykWZf7k5xtQ6m50nUdEGXlchCTklvWjbKeP2yG9mJsFTvT6s61qHO3uu
	Z9WOKBYNvtwEK9sQuCU+7YsuBFrbSIfnzwpXOYuvc42gqsgHmeOc2/oM9HnFgHLznuYf5HvI7nc9H
	0DhtN/585ihEQaAYdXxpy6s/VW0xHxQ6z2UCT6mue5A92eo+S1qPcB/ye/UwSvR3QXjO3dS4vRjDW
	0AlbwsPu47NJ/tdqvKscZe8STwtFtXUmolGdHqCyzt5j0z4bsgU9AfVNKLwlNsk+PiKnjhv3muFbt
	3XMnD9aA==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlSgn-00000002dsL-0lGq
	for linux-mtd@lists.infradead.org;
	Fri, 21 Feb 2025 13:03:35 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51L6IIic018792;
	Fri, 21 Feb 2025 13:02:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Tm0Zt0Z5RF7rdSISUfZdhv6NUQ6vAdfywek+iOtN6ys=; b=fj5Rr2GqOR7fi3FG
	fjsXss2q2XoaUgou8BqAEeuLk62qi3JZ4uNEICFBcHVUhQgKhMH8iqNcQ+14OsDI
	3D8JYvyo18EgihIddxyPogVOfhf+IguAN7tT+m9DJTvKNDYweVPExp19+qrKn5lb
	hJeVgUYsrkGHEsc8mTukuCQ/wQiA7crqrDWy327ibsMuw7PvZxg3Vz/wURGUYS/7
	43fQHWlJsBBU6V8nSV8AvPbYEQEkm40tUJfw5Vefj3GBZpSSPnlVT4BnsMrqvN8J
	daY07Suy0b7Bz+hzpkbQ5CZ24JJJhm+4rTFweOuxERxbV2XKM1wQxCv0ZMX/FHir
	v8rajQ==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44xm3rhaak-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Feb 2025 13:02:44 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51LD2h8q028033
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Feb 2025 13:02:43 GMT
Received: from hu-zijuhu-lv.qualcomm.com (10.49.16.6) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 21 Feb 2025 05:02:42 -0800
From: Zijun Hu <quic_zijuhu@quicinc.com>
Date: Fri, 21 Feb 2025 05:02:23 -0800
Subject: [PATCH *-next 18/18] mtd: nand: Do not return void function in
 void function
MIME-Version: 1.0
Message-ID: <20250221-rmv_return-v1-18-cc8dff275827@quicinc.com>
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
X-Proofpoint-ORIG-GUID: SV8SpptYSPEhBGh6-hClx7JhQY8AZVMI
X-Proofpoint-GUID: SV8SpptYSPEhBGh6-hClx7JhQY8AZVMI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-21_04,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxscore=0
 suspectscore=0 mlxlogscore=763 phishscore=0 bulkscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502210095
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_130333_579308_C22F76B0 
X-CRM114-Status: GOOD (  13.81  )
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

In the following three void APIs:

	nanddev_pos_next_lun()
	nanddev_pos_next_eraseblock()
	nanddev_pos_next_page()

For void function void func(...), convert weird statement:
	return func(...);
"to":
	func(...);
	return;

Signed-off-by: Zijun Hu <quic_zijuhu@quicinc.com>
---
 include/linux/mtd/nand.h | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 0e2f228e8b4a..8e3f6cca0b24 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -863,8 +863,10 @@ static inline void nanddev_pos_next_target(struct nand_device *nand,
 static inline void nanddev_pos_next_lun(struct nand_device *nand,
 					struct nand_pos *pos)
 {
-	if (pos->lun >= nand->memorg.luns_per_target - 1)
-		return nanddev_pos_next_target(nand, pos);
+	if (pos->lun >= nand->memorg.luns_per_target - 1) {
+		nanddev_pos_next_target(nand, pos);
+		return;
+	}
 
 	pos->lun++;
 	pos->page = 0;
@@ -883,8 +885,10 @@ static inline void nanddev_pos_next_lun(struct nand_device *nand,
 static inline void nanddev_pos_next_eraseblock(struct nand_device *nand,
 					       struct nand_pos *pos)
 {
-	if (pos->eraseblock >= nand->memorg.eraseblocks_per_lun - 1)
-		return nanddev_pos_next_lun(nand, pos);
+	if (pos->eraseblock >= nand->memorg.eraseblocks_per_lun - 1) {
+		nanddev_pos_next_lun(nand, pos);
+		return;
+	}
 
 	pos->eraseblock++;
 	pos->page = 0;
@@ -902,8 +906,10 @@ static inline void nanddev_pos_next_eraseblock(struct nand_device *nand,
 static inline void nanddev_pos_next_page(struct nand_device *nand,
 					 struct nand_pos *pos)
 {
-	if (pos->page >= nand->memorg.pages_per_eraseblock - 1)
-		return nanddev_pos_next_eraseblock(nand, pos);
+	if (pos->page >= nand->memorg.pages_per_eraseblock - 1) {
+		nanddev_pos_next_eraseblock(nand, pos);
+		return;
+	}
 
 	pos->page++;
 }

-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
