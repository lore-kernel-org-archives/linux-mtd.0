Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6751EC433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Feb 2022 10:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fGzgD+DMdnkWLVefPzsp9yvUmFxhcED7tr55ygCR/Mc=; b=jDkJAq9vhUhgF9
	qY98WIuz5bEHYLwIzCg9KGdUpZS/aQWkKIfVt8Tmc+wmPPK7QBwzFJCkrdWqYUaVJfja4JobwTgGl
	6CJiQs1RVPlwtLm29YJIg+VOsDvrrElLjRMYuECrOzDyUoN0HnvMZG/y9HTPklpGVjvPavEww4tRv
	2h+V43cfKsJVPTzAqQTUmyBoQV/+luQK+uFTnjP1e74bja21NgkrlJt/nQyuofuLn5yRwpalg7Oig
	2cg5YZ2RipZx8v4NbGBwRcyK9bDff11P7xdgAdX5G0yEBNamEnCHzE47s22bEOUrE9/bhULbhK7Ll
	kjPA0I3FlblHrQyjFaUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJYKz-00EQxH-Sl; Mon, 14 Feb 2022 10:12:06 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJXt5-00EJ32-Qc; Mon, 14 Feb 2022 09:43:18 +0000
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21E9MQY8031392; 
 Mon, 14 Feb 2022 09:42:56 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3e6thxexg6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Feb 2022 09:42:56 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21E9blfS031636;
 Mon, 14 Feb 2022 09:42:54 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma04fra.de.ibm.com with ESMTP id 3e64h9js61-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Feb 2022 09:42:54 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 21E9gpJx44433700
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 14 Feb 2022 09:42:51 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A7125A4051;
 Mon, 14 Feb 2022 09:42:51 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 159F4A4055;
 Mon, 14 Feb 2022 09:42:51 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Mon, 14 Feb 2022 09:42:50 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.60.190])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 99BD02201E5;
 Mon, 14 Feb 2022 10:42:49 +0100 (CET)
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
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH 09/10] ARM: dts: aspeed: Enable Dual SPI RX transfers
Date: Mon, 14 Feb 2022 10:42:30 +0100
Message-Id: <20220214094231.3753686-10-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220214094231.3753686-1-clg@kaod.org>
References: <20220214094231.3753686-1-clg@kaod.org>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: QLbS7MTYhjvaSpSpPmWkytPeGaWNJ1H8
X-Proofpoint-ORIG-GUID: QLbS7MTYhjvaSpSpPmWkytPeGaWNJ1H8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-14_02,2022-02-14_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 lowpriorityscore=0 clxscore=1034 mlxlogscore=563 priorityscore=1501
 malwarescore=0 phishscore=0 suspectscore=0 spamscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202140058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_014316_115392_50C06446 
X-CRM114-Status: GOOD (  13.20  )
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

QWxsIHRoZXNlIGNvbnRyb2xsZXJzIHN1cHBvcnQgYXQgbGVhc3QgRHVhbCBTUEkuIFVwZGF0ZSB0
aGUgRFRzLgoKU2lnbmVkLW9mZi1ieTogQ8OpZHJpYyBMZSBHb2F0ZXIgPGNsZ0BrYW9kLm9yZz4K
LS0tCiBhcmNoL2FybS9ib290L2R0cy9hc3BlZWQtZzQuZHRzaSB8IDYgKysrKysrCiBhcmNoL2Fy
bS9ib290L2R0cy9hc3BlZWQtZzUuZHRzaSB8IDcgKysrKysrKwogYXJjaC9hcm0vYm9vdC9kdHMv
YXNwZWVkLWc2LmR0c2kgfCA4ICsrKysrKysrCiAzIGZpbGVzIGNoYW5nZWQsIDIxIGluc2VydGlv
bnMoKykKCmRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9hc3BlZWQtZzQuZHRzaSBiL2Fy
Y2gvYXJtL2Jvb3QvZHRzL2FzcGVlZC1nNC5kdHNpCmluZGV4IGYxNGRhY2UzNGM1YS4uZGEyMTFm
YmQ4NjU4IDEwMDY0NAotLS0gYS9hcmNoL2FybS9ib290L2R0cy9hc3BlZWQtZzQuZHRzaQorKysg
Yi9hcmNoL2FybS9ib290L2R0cy9hc3BlZWQtZzQuZHRzaQpAQCAtNjUsMjcgKzY1LDMyIEBAIGZt
Yzogc3BpQDFlNjIwMDAwIHsKIAkJCWZsYXNoQDAgewogCQkJCXJlZyA9IDwgMCA+OwogCQkJCWNv
bXBhdGlibGUgPSAiamVkZWMsc3BpLW5vciI7CisJCQkJc3BpLXJ4LWJ1cy13aWR0aCA9IDwyPjsK
IAkJCQlzcGktbWF4LWZyZXF1ZW5jeSA9IDw1MDAwMDAwMD47CiAJCQkJc3RhdHVzID0gImRpc2Fi
bGVkIjsKIAkJCX07CiAJCQlmbGFzaEAxIHsKIAkJCQlyZWcgPSA8IDEgPjsKIAkJCQljb21wYXRp
YmxlID0gImplZGVjLHNwaS1ub3IiOworCQkJCXNwaS1yeC1idXMtd2lkdGggPSA8Mj47CiAJCQkJ
c3RhdHVzID0gImRpc2FibGVkIjsKIAkJCX07CiAJCQlmbGFzaEAyIHsKIAkJCQlyZWcgPSA8IDIg
PjsKIAkJCQljb21wYXRpYmxlID0gImplZGVjLHNwaS1ub3IiOworCQkJCXNwaS1yeC1idXMtd2lk
dGggPSA8Mj47CiAJCQkJc3RhdHVzID0gImRpc2FibGVkIjsKIAkJCX07CiAJCQlmbGFzaEAzIHsK
IAkJCQlyZWcgPSA8IDMgPjsKIAkJCQljb21wYXRpYmxlID0gImplZGVjLHNwaS1ub3IiOworCQkJ
CXNwaS1yeC1idXMtd2lkdGggPSA8Mj47CiAJCQkJc3RhdHVzID0gImRpc2FibGVkIjsKIAkJCX07
CiAJCQlmbGFzaEA0IHsKIAkJCQlyZWcgPSA8IDQgPjsKIAkJCQljb21wYXRpYmxlID0gImplZGVj
LHNwaS1ub3IiOworCQkJCXNwaS1yeC1idXMtd2lkdGggPSA8Mj47CiAJCQkJc3RhdHVzID0gImRp
c2FibGVkIjsKIAkJCX07CiAJCX07CkBAIC0xMDIsNiArMTA3LDcgQEAgZmxhc2hAMCB7CiAJCQkJ
cmVnID0gPCAwID47CiAJCQkJY29tcGF0aWJsZSA9ICJqZWRlYyxzcGktbm9yIjsKIAkJCQlzcGkt
bWF4LWZyZXF1ZW5jeSA9IDw1MDAwMDAwMD47CisJCQkJc3BpLXJ4LWJ1cy13aWR0aCA9IDwyPjsK
IAkJCQlzdGF0dXMgPSAiZGlzYWJsZWQiOwogCQkJfTsKIAkJfTsKZGlmZiAtLWdpdCBhL2FyY2gv
YXJtL2Jvb3QvZHRzL2FzcGVlZC1nNS5kdHNpIGIvYXJjaC9hcm0vYm9vdC9kdHMvYXNwZWVkLWc1
LmR0c2kKaW5kZXggNzQ5NWY5M2M1MDY5Li44MDRiNjZkMzIxMjcgMTAwNjQ0Ci0tLSBhL2FyY2gv
YXJtL2Jvb3QvZHRzL2FzcGVlZC1nNS5kdHNpCisrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL2FzcGVl
ZC1nNS5kdHNpCkBAIC02NywxOCArNjcsMjEgQEAgZmxhc2hAMCB7CiAJCQkJcmVnID0gPCAwID47
CiAJCQkJY29tcGF0aWJsZSA9ICJqZWRlYyxzcGktbm9yIjsKIAkJCQlzcGktbWF4LWZyZXF1ZW5j
eSA9IDw1MDAwMDAwMD47CisJCQkJc3BpLXJ4LWJ1cy13aWR0aCA9IDwyPjsKIAkJCQlzdGF0dXMg
PSAiZGlzYWJsZWQiOwogCQkJfTsKIAkJCWZsYXNoQDEgewogCQkJCXJlZyA9IDwgMSA+OwogCQkJ
CWNvbXBhdGlibGUgPSAiamVkZWMsc3BpLW5vciI7CiAJCQkJc3BpLW1heC1mcmVxdWVuY3kgPSA8
NTAwMDAwMDA+OworCQkJCXNwaS1yeC1idXMtd2lkdGggPSA8Mj47CiAJCQkJc3RhdHVzID0gImRp
c2FibGVkIjsKIAkJCX07CiAJCQlmbGFzaEAyIHsKIAkJCQlyZWcgPSA8IDIgPjsKIAkJCQljb21w
YXRpYmxlID0gImplZGVjLHNwaS1ub3IiOwogCQkJCXNwaS1tYXgtZnJlcXVlbmN5ID0gPDUwMDAw
MDAwPjsKKwkJCQlzcGktcngtYnVzLXdpZHRoID0gPDI+OwogCQkJCXN0YXR1cyA9ICJkaXNhYmxl
ZCI7CiAJCQl9OwogCQl9OwpAQCAtOTUsMTIgKzk4LDE0IEBAIGZsYXNoQDAgewogCQkJCXJlZyA9
IDwgMCA+OwogCQkJCWNvbXBhdGlibGUgPSAiamVkZWMsc3BpLW5vciI7CiAJCQkJc3BpLW1heC1m
cmVxdWVuY3kgPSA8NTAwMDAwMDA+OworCQkJCXNwaS1yeC1idXMtd2lkdGggPSA8Mj47CiAJCQkJ
c3RhdHVzID0gImRpc2FibGVkIjsKIAkJCX07CiAJCQlmbGFzaEAxIHsKIAkJCQlyZWcgPSA8IDEg
PjsKIAkJCQljb21wYXRpYmxlID0gImplZGVjLHNwaS1ub3IiOwogCQkJCXNwaS1tYXgtZnJlcXVl
bmN5ID0gPDUwMDAwMDAwPjsKKwkJCQlzcGktcngtYnVzLXdpZHRoID0gPDI+OwogCQkJCXN0YXR1
cyA9ICJkaXNhYmxlZCI7CiAJCQl9OwogCQl9OwpAQCAtMTE3LDEyICsxMjIsMTQgQEAgZmxhc2hA
MCB7CiAJCQkJcmVnID0gPCAwID47CiAJCQkJY29tcGF0aWJsZSA9ICJqZWRlYyxzcGktbm9yIjsK
IAkJCQlzcGktbWF4LWZyZXF1ZW5jeSA9IDw1MDAwMDAwMD47CisJCQkJc3BpLXJ4LWJ1cy13aWR0
aCA9IDwyPjsKIAkJCQlzdGF0dXMgPSAiZGlzYWJsZWQiOwogCQkJfTsKIAkJCWZsYXNoQDEgewog
CQkJCXJlZyA9IDwgMSA+OwogCQkJCWNvbXBhdGlibGUgPSAiamVkZWMsc3BpLW5vciI7CiAJCQkJ
c3BpLW1heC1mcmVxdWVuY3kgPSA8NTAwMDAwMDA+OworCQkJCXNwaS1yeC1idXMtd2lkdGggPSA8
Mj47CiAJCQkJc3RhdHVzID0gImRpc2FibGVkIjsKIAkJCX07CiAJCX07CmRpZmYgLS1naXQgYS9h
cmNoL2FybS9ib290L2R0cy9hc3BlZWQtZzYuZHRzaSBiL2FyY2gvYXJtL2Jvb3QvZHRzL2FzcGVl
ZC1nNi5kdHNpCmluZGV4IGMzMmU4N2ZhZDRkYy4uNTQyNzE0YzYxYTg1IDEwMDY0NAotLS0gYS9h
cmNoL2FybS9ib290L2R0cy9hc3BlZWQtZzYuZHRzaQorKysgYi9hcmNoL2FybS9ib290L2R0cy9h
c3BlZWQtZzYuZHRzaQpAQCAtMTA3LDE4ICsxMDcsMjEgQEAgZmxhc2hAMCB7CiAJCQkJcmVnID0g
PCAwID47CiAJCQkJY29tcGF0aWJsZSA9ICJqZWRlYyxzcGktbm9yIjsKIAkJCQlzcGktbWF4LWZy
ZXF1ZW5jeSA9IDw1MDAwMDAwMD47CisJCQkJc3BpLXJ4LWJ1cy13aWR0aCA9IDwyPjsKIAkJCQlz
dGF0dXMgPSAiZGlzYWJsZWQiOwogCQkJfTsKIAkJCWZsYXNoQDEgewogCQkJCXJlZyA9IDwgMSA+
OwogCQkJCWNvbXBhdGlibGUgPSAiamVkZWMsc3BpLW5vciI7CiAJCQkJc3BpLW1heC1mcmVxdWVu
Y3kgPSA8NTAwMDAwMDA+OworCQkJCXNwaS1yeC1idXMtd2lkdGggPSA8Mj47CiAJCQkJc3RhdHVz
ID0gImRpc2FibGVkIjsKIAkJCX07CiAJCQlmbGFzaEAyIHsKIAkJCQlyZWcgPSA8IDIgPjsKIAkJ
CQljb21wYXRpYmxlID0gImplZGVjLHNwaS1ub3IiOwogCQkJCXNwaS1tYXgtZnJlcXVlbmN5ID0g
PDUwMDAwMDAwPjsKKwkJCQlzcGktcngtYnVzLXdpZHRoID0gPDI+OwogCQkJCXN0YXR1cyA9ICJk
aXNhYmxlZCI7CiAJCQl9OwogCQl9OwpAQCAtMTM1LDEyICsxMzgsMTQgQEAgZmxhc2hAMCB7CiAJ
CQkJcmVnID0gPCAwID47CiAJCQkJY29tcGF0aWJsZSA9ICJqZWRlYyxzcGktbm9yIjsKIAkJCQlz
cGktbWF4LWZyZXF1ZW5jeSA9IDw1MDAwMDAwMD47CisJCQkJc3BpLXJ4LWJ1cy13aWR0aCA9IDwy
PjsKIAkJCQlzdGF0dXMgPSAiZGlzYWJsZWQiOwogCQkJfTsKIAkJCWZsYXNoQDEgewogCQkJCXJl
ZyA9IDwgMSA+OwogCQkJCWNvbXBhdGlibGUgPSAiamVkZWMsc3BpLW5vciI7CiAJCQkJc3BpLW1h
eC1mcmVxdWVuY3kgPSA8NTAwMDAwMDA+OworCQkJCXNwaS1yeC1idXMtd2lkdGggPSA8Mj47CiAJ
CQkJc3RhdHVzID0gImRpc2FibGVkIjsKIAkJCX07CiAJCX07CkBAIC0xNTcsMTggKzE2MiwyMSBA
QCBmbGFzaEAwIHsKIAkJCQlyZWcgPSA8IDAgPjsKIAkJCQljb21wYXRpYmxlID0gImplZGVjLHNw
aS1ub3IiOwogCQkJCXNwaS1tYXgtZnJlcXVlbmN5ID0gPDUwMDAwMDAwPjsKKwkJCQlzcGktcngt
YnVzLXdpZHRoID0gPDI+OwogCQkJCXN0YXR1cyA9ICJkaXNhYmxlZCI7CiAJCQl9OwogCQkJZmxh
c2hAMSB7CiAJCQkJcmVnID0gPCAxID47CiAJCQkJY29tcGF0aWJsZSA9ICJqZWRlYyxzcGktbm9y
IjsKIAkJCQlzcGktbWF4LWZyZXF1ZW5jeSA9IDw1MDAwMDAwMD47CisJCQkJc3BpLXJ4LWJ1cy13
aWR0aCA9IDwyPjsKIAkJCQlzdGF0dXMgPSAiZGlzYWJsZWQiOwogCQkJfTsKIAkJCWZsYXNoQDIg
ewogCQkJCXJlZyA9IDwgMiA+OwogCQkJCWNvbXBhdGlibGUgPSAiamVkZWMsc3BpLW5vciI7CiAJ
CQkJc3BpLW1heC1mcmVxdWVuY3kgPSA8NTAwMDAwMDA+OworCQkJCXNwaS1yeC1idXMtd2lkdGgg
PSA8Mj47CiAJCQkJc3RhdHVzID0gImRpc2FibGVkIjsKIAkJCX07CiAJCX07Ci0tIAoyLjM0LjEK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
