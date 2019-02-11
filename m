Return-Path: <SRS0=7Ms1=QS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F824C169C4
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Feb 2019 13:33:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 139A721B1A
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Feb 2019 13:33:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pG8oBEl9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 139A721B1A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:MIME-Version:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mRviLyYutsU51ZyXW+eWwhshCkaaMfvXE2MHrdWjs4I=; b=pG8oBEl9IwLw8/
	QtVPHkRqaiDg4rrf2NpE8aUpXbnWZ6/Pck2IEVmhacY6PSWk6uZ50f1JkUr7eFb2tWRkXco/uiICg
	E6d1LwtKinJTbRqtwbdRStha8ifzVqVnP2tYnpZUaBvF3rHLtGBSF3HdDNRqM0h8b3nB17EKVCvRg
	kLbxvIx+errZQhZVG5DiqbqtdbPlcu4mog11PJcEixLpB7pNYRhyc3N0tXhWa1cOIeEVnZRyj2hLk
	fT3TEN3zFej+wSn+a+fI4FI825WRpjfkvnh0qmUG8I29Co92Y0IF2FWmrM0Onb31z9FOmqwDh95mr
	TAksa+IGVP5C6lS4N8JA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gtBib-0006MB-B2; Mon, 11 Feb 2019 13:33:53 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gtBiW-0006Ln-17
 for linux-mtd@lists.infradead.org; Mon, 11 Feb 2019 13:33:49 +0000
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x1BDWIsv074175
 for <linux-mtd@lists.infradead.org>; Mon, 11 Feb 2019 08:33:47 -0500
Received: from e15.ny.us.ibm.com (e15.ny.us.ibm.com [129.33.205.205])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2qk6katb15-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linux-mtd@lists.infradead.org>; Mon, 11 Feb 2019 08:33:46 -0500
Received: from localhost
 by e15.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linux-mtd@lists.infradead.org> from <aneesh.kumar@linux.ibm.com>;
 Mon, 11 Feb 2019 13:33:45 -0000
Received: from b01cxnp22034.gho.pok.ibm.com (9.57.198.24)
 by e15.ny.us.ibm.com (146.89.104.202) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 11 Feb 2019 13:33:43 -0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x1BDXg9o21889262
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 11 Feb 2019 13:33:42 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7789C12405B;
 Mon, 11 Feb 2019 13:33:42 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CADF6124052;
 Mon, 11 Feb 2019 13:33:40 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.85.73.133])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 11 Feb 2019 13:33:40 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: Alban Bedel <albeu@free.fr>, linuxppc-dev@lists.ozlabs.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 linux-mtd@lists.infradead.org
Subject: [PATCH v3 1/2] drivers/mtd: Use mtd->name when registering nvmem
 device
Date: Mon, 11 Feb 2019 19:03:37 +0530
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-TM-AS-GCONF: 00
x-cbid: 19021113-0068-0000-0000-00000392119E
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00010576; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000279; SDB=6.01159515; UDB=6.00605100; IPR=6.00940061; 
 MB=3.00025525; MTD=3.00000008; XFM=3.00000015; UTC=2019-02-11 13:33:44
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19021113-0069-0000-0000-000047784AC4
Message-Id: <20190211133338.30399-1-aneesh.kumar@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-02-11_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=942 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1902110106
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190211_053348_181470_C18AB053 
X-CRM114-Status: GOOD (  18.94  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

With this patch, we use the mtd->name instead of concatenating the name with '0'

Fixes: c4dfa25ab307 ("mtd: add support for reading MTD devices via the nvmem API")
Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 drivers/mtd/mtdcore.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 999b705769a8..3ef01baef9b6 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -507,6 +507,7 @@ static int mtd_nvmem_add(struct mtd_info *mtd)
 {
 	struct nvmem_config config = {};
 
+	config.id = -1;
 	config.dev = &mtd->dev;
 	config.name = mtd->name;
 	config.owner = THIS_MODULE;
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
