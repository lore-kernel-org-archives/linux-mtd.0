Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46FCBEB28EE
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Feb 2026 08:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RKXWx0By/6pdfy0aTCjtadnHaHewcG3pRADNftcYGFQ=; b=KE/ryw4ea+SJPy
	dik0OlbYgd1RPbv+WJ4hIwwUpewyBO7LkG0/mHJdc9BBllRLVlVJsEsSxIMUNbYySj5orT3pbDXmu
	SfOhBZL4Jv6RG1QTNVk8ff93HThsxmevv6ygk1pKU+brlyNv9anWsniZyqwjtpc6facbbruVNsrXK
	RuHzAseKZlyO6wOafk656xa835ZUJEuj5Hks5+wpNMCE9KR9d8WGPJrkYlkbMzAHhYoH1DBPgdEet
	zbiUc6EDRrY75WUAWC5mLj30eqe8pw7MSA02a/S8NyccOIeEyThmJ9qKr1VOhsmISABuS4PahHqSc
	wF11nTpZaIDNJ7woUrXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voHMC-0000000B38L-2Ror;
	Fri, 06 Feb 2026 08:38:28 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voHM9-0000000B37p-3uKh
	for linux-mtd@lists.infradead.org;
	Fri, 06 Feb 2026 08:38:27 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61610N7k696579;
	Fri, 6 Feb 2026 08:38:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=2ItK0bfSni3ML6n6cbofcU
	kblq/cYV//88Dzpg8FABk=; b=AH1ul6qPf78TmiquSwMTx35BNftT6stjM/5SQB
	ewYkDxcLCrW7KPGJrbMexpdw24uijGrcWCFUIiDBt+yoQtdW7MG7OKTm4Y9rgVLA
	H4YpzKJg70stEChLQRC7a/496U2aGyEv4f3kWzZ1jB0W3hPlKXE3W2PnLzg7u+bo
	xjEu1/BamcQKYAt6hpcTaPBkYq9/UvBgP9eTSlYvPqNkVp62j2KPRJuUKvXlagl1
	6b8K8mi4G1a9LLga7fPZeXJCOQ9wizYIEmBfT0vaDMZYKDaS/tJA5DcNUFniIkHb
	CrvsxA/rpssdeCAZYPgyg04zCdMUOORSuH7efKnXvfKjL0Tg==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c53qv9rgw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Feb 2026 08:38:13 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 6168cBYu027916
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 6 Feb 2026 08:38:11 GMT
Received: from hu-mdalam-blr.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 6 Feb 2026 00:38:07 -0800
From: Md Sadre Alam <quic_mdalam@quicinc.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
        <tudor.ambarus@linaro.org>, <chengminglin@mxic.com.tw>,
        <mmkurbanov@salutedevices.com>, <mikhail.kshevetskiy@iopsys.eu>,
        <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <quic_mdalam@quicinc.com>
Subject: [PATCH] mtd: spinand: fix NULL pointer dereference in spinand_support_vendor_ops()
Date: Fri, 6 Feb 2026 14:07:52 +0530
Message-ID: <20260206083752.268838-1-quic_mdalam@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=TsPrRTXh c=1 sm=1 tr=0 ts=6985a875 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=gESLmC3Avy1suTuaoPUA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: LdYSxlNd7yk7ysuzzD7AvLUYxvHGIMuS
X-Proofpoint-GUID: LdYSxlNd7yk7ysuzzD7AvLUYxvHGIMuS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA2MDA1NSBTYWx0ZWRfX89/L3Wi5MF4Y
 WaqoKtfRwVX+NxJe5vLKpT6sIxrJ79bhZpnWtWLRi5TNBxJQQJnDZK/LBnU/aLRrXBUnzzoYOmp
 AODoJcD+Hqcfa1xk3fdXoTOldjBW+jQdhUG5QQEqT9sXe7eL9Z2irJ9scAaKdoxxB8n1JzlfBnS
 Tqkjk+Ru2QdxTs9EnoVYLcd884w2XHSeF1mSgm34KcXVepr+DSlhJzck+4a3tzILc49P6IV1OZp
 oTI5qPpSizCaFkKjdOexQxlkGGPz65DI0GAJUJegiEnU1vFdtqO1eJD6NpazgI3EEdXfqBFjiM4
 XFMcVmoSgsXBfdPLgPUPfS+qIGOycFZyKP5FUATKhfDUmRB/9nsVAQ312S1Nj/1FZOyqL1ESXjJ
 KXEvNqRfiZ3t7WltIzJHSL7iKksu7ypdfSfZ6EcfXdfi5M5Y6qhMzwUx45omDXyYVMDcQGBeSPc
 EkhIEIFyKB9RbQLB0/g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-06_02,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 suspectscore=0 malwarescore=0 bulkscore=0 spamscore=0 clxscore=1011
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602060055
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260206_003826_131906_568B99E5 
X-CRM114-Status: GOOD (  12.68  )
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

The spinand_support_vendor_ops() helper unconditionally dereferences
info->vendor_ops. For chips that do not define vendor_ops, this pointer
is NULL, leading to a kernel panic during probe:

Unable to handle kernel NULL pointer dereference at virtual address
0000000000000008

Add a guard to return early when vendor_ops is NULL. This prevents the
crash and allows SPI NAND devices without vendor-specific operations to
be probed correctly.

Fixes: fbc7538782f8 ("mtd: spinand: List vendor specific operations and make sure they are supported")
Cc: stable@vger.kernel.org
Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
---
 drivers/mtd/nand/spi/core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index 514f653f27f3..29fb2ac19569 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -1435,6 +1435,8 @@ static int spinand_support_vendor_ops(struct spinand_device *spinand,
 {
 	int i;
 
+	if (!info->vendor_ops)
+		return 0;
 	/*
 	 * The vendor ops array is only used in order to verify this chip and all its memory
 	 * operations are supported. If we see patterns emerging, we could ideally name these
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
