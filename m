Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89236C433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Mar 2022 10:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hdt3jHPElwR8BzAJXjrJBP7VfuKV8zJDBeUN8BOwVGE=; b=TOJg5dAOqNOlCr
	MRowrYn4+bHxlGAQQrVexC2Ej13oF5eIlbaiP1qlQs1AGUBNJJsKFlDicpdW83RZ7kOIeS7Fqqk5o
	K2h9/SoueYDs7v6Sc/BpqIj9qUwd2kwMeeVZoIbNWVkKHAsobYCb1VQ6K8sVYInJdNyEW8YPq5ca/
	2OPnUsOGS7m9jtrfskiwyLAhCV2hG6dmNa9jtLxm4AaCogiKNUn7MDdbTg1EveOIxQ343IYxAYAQF
	2ev7X5gnNBWvFeg1Rd2W48lTDX14haoG9LG9dIuOtJeSUcZqdV7EhHvyLO34FxsiVwR+OamHPqhg0
	FOOeewv5uXMgR6yvLhZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nXh85-001hxF-3Y; Fri, 25 Mar 2022 10:25:13 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nXgt0-001cWw-P8; Fri, 25 Mar 2022 10:09:40 +0000
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22P7AZZ2016746; 
 Fri, 25 Mar 2022 10:09:15 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3f0t9e4w9w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Mar 2022 10:09:15 +0000
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 22P9v2aJ029411;
 Fri, 25 Mar 2022 10:09:15 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3f0t9e4w92-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Mar 2022 10:09:14 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22PA94FQ002679;
 Fri, 25 Mar 2022 10:09:12 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma06fra.de.ibm.com with ESMTP id 3ew6ej333s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Mar 2022 10:09:12 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 22PA9Amu31457700
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 25 Mar 2022 10:09:10 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 05E1EAE053;
 Fri, 25 Mar 2022 10:09:10 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5A2FFAE045;
 Fri, 25 Mar 2022 10:09:09 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Fri, 25 Mar 2022 10:09:09 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.95.248])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id C3077220121;
 Fri, 25 Mar 2022 11:09:07 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org
Cc: Mark Brown <broonie@kernel.org>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-aspeed@lists.ozlabs.org,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Tao Ren <rentao.bupt@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH v4 10/11] ARM: dts: aspeed-g4: Set spi-max-frequency for all
 flashes
Date: Fri, 25 Mar 2022 11:08:48 +0100
Message-Id: <20220325100849.2019209-11-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220325100849.2019209-1-clg@kaod.org>
References: <20220325100849.2019209-1-clg@kaod.org>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: xGQYi3qNJbO3AWOcwviaj5AfQ_f4P8zQ
X-Proofpoint-ORIG-GUID: vFsPwF6JcPNgmdIzh24HbP7Y22XtgJyv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-25_02,2022-03-24_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=578
 impostorscore=0 mlxscore=0 lowpriorityscore=0 clxscore=1034 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203250057
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220325_030938_919193_6ADF9801 
X-CRM114-Status: GOOD (  11.79  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

RnJvbTogVGFvIFJlbiA8cmVudGFvLmJ1cHRAZ21haWwuY29tPgoKU2V0ICJzcGktbWF4LWZyZXF1
ZW5jeSIgdG8gNTAgTUh6IGZvciBhbGwgdGhlIGZsYXNoZXMgdW5kZXIgdGhlIEZNQwpjb250cm9s
bGVyIHRvIGVuc3VyZSB0aGUgY2xvY2sgZnJlcXVlbmN5IGlzIGNhbGN1bGF0ZWQgY29ycmVjdGx5
LgoKU3VnZ2VzdGVkLWJ5OiBDw6lkcmljIExlIEdvYXRlciA8Y2xnQGthb2Qub3JnPgpTaWduZWQt
b2ZmLWJ5OiBUYW8gUmVuIDxyZW50YW8uYnVwdEBnbWFpbC5jb20+ClNpZ25lZC1vZmYtYnk6IEPD
qWRyaWMgTGUgR29hdGVyIDxjbGdAa2FvZC5vcmc+Ci0tLQogYXJjaC9hcm0vYm9vdC9kdHMvYXNw
ZWVkLWc0LmR0c2kgfCA0ICsrKysKIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKCmRp
ZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9hc3BlZWQtZzQuZHRzaSBiL2FyY2gvYXJtL2Jv
b3QvZHRzL2FzcGVlZC1nNC5kdHNpCmluZGV4IDMxZTY1NjlkYjk3ZS4uZDNkOTE5ZGNiOGQ0IDEw
MDY0NAotLS0gYS9hcmNoL2FybS9ib290L2R0cy9hc3BlZWQtZzQuZHRzaQorKysgYi9hcmNoL2Fy
bS9ib290L2R0cy9hc3BlZWQtZzQuZHRzaQpAQCAtNzIsMjQgKzcyLDI4IEBAIGZsYXNoQDEgewog
CQkJCXJlZyA9IDwgMSA+OwogCQkJCWNvbXBhdGlibGUgPSAiamVkZWMsc3BpLW5vciI7CiAJCQkJ
c3BpLXJ4LWJ1cy13aWR0aCA9IDwyPjsKKwkJCQlzcGktbWF4LWZyZXF1ZW5jeSA9IDw1MDAwMDAw
MD47CiAJCQkJc3RhdHVzID0gImRpc2FibGVkIjsKIAkJCX07CiAJCQlmbGFzaEAyIHsKIAkJCQly
ZWcgPSA8IDIgPjsKIAkJCQljb21wYXRpYmxlID0gImplZGVjLHNwaS1ub3IiOwogCQkJCXNwaS1y
eC1idXMtd2lkdGggPSA8Mj47CisJCQkJc3BpLW1heC1mcmVxdWVuY3kgPSA8NTAwMDAwMDA+Owog
CQkJCXN0YXR1cyA9ICJkaXNhYmxlZCI7CiAJCQl9OwogCQkJZmxhc2hAMyB7CiAJCQkJcmVnID0g
PCAzID47CiAJCQkJY29tcGF0aWJsZSA9ICJqZWRlYyxzcGktbm9yIjsKIAkJCQlzcGktcngtYnVz
LXdpZHRoID0gPDI+OworCQkJCXNwaS1tYXgtZnJlcXVlbmN5ID0gPDUwMDAwMDAwPjsKIAkJCQlz
dGF0dXMgPSAiZGlzYWJsZWQiOwogCQkJfTsKIAkJCWZsYXNoQDQgewogCQkJCXJlZyA9IDwgNCA+
OwogCQkJCWNvbXBhdGlibGUgPSAiamVkZWMsc3BpLW5vciI7CiAJCQkJc3BpLXJ4LWJ1cy13aWR0
aCA9IDwyPjsKKwkJCQlzcGktbWF4LWZyZXF1ZW5jeSA9IDw1MDAwMDAwMD47CiAJCQkJc3RhdHVz
ID0gImRpc2FibGVkIjsKIAkJCX07CiAJCX07Ci0tIAoyLjM0LjEKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Np
b24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbXRkLwo=
