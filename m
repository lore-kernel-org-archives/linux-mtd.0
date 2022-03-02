Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84A27C433EF
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Mar 2022 17:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jcu6XkA1QMtwFM8SA6Zoj7gNxw5bxxHsjjZFqhUK+vk=; b=VbufK4XjdBf6iN
	9nJvmoPcxXB1PxiRI3uqwwCA2YNB2Qc4TRxqelOea1s6f1w1w+APJkFVa/M4K1SP7bpKhmdwBDlK+
	MZwutoUlqTirkaPfVAL1ua5v4pOjRUiveMAagHndPQxEyFYgmdch/CJSRtBi8MAgfTgwRVxPwWWvE
	F3rK1evUmXAYVkLxedA8fMaHMY2R+7Lpz84DEERR53u+mJY7KeWld69VZrQZCIm0jQiR7iLZxlPXY
	c89MdZZsgVGjONiD5BnuGqbwFUI9mrKJwOwDShnwf0Q6I0CZcsrMEkteuPMRoNdzvuk6WK3RxdT4m
	nPJWbN8l/K+dstfI8yAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPStl-003b4m-IK; Wed, 02 Mar 2022 17:36:25 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPSpK-003Z9A-W4; Wed, 02 Mar 2022 17:31:54 +0000
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 222GilZL003358; 
 Wed, 2 Mar 2022 17:31:36 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ejaa4m7x2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 17:31:35 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 222HD55M032484;
 Wed, 2 Mar 2022 17:31:33 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma06ams.nl.ibm.com with ESMTP id 3efbfjqhb4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 17:31:33 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 222HVVUi42664402
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 2 Mar 2022 17:31:31 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4EEA3AE051;
 Wed,  2 Mar 2022 17:31:31 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A7293AE04D;
 Wed,  2 Mar 2022 17:31:30 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed,  2 Mar 2022 17:31:30 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.58.125])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 35C132200FE;
 Wed,  2 Mar 2022 18:31:29 +0100 (CET)
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
Subject: [PATCH v2 10/10] ARM: dts: aspeed: Enable Dual SPI RX transfers
Date: Wed,  2 Mar 2022 18:31:14 +0100
Message-Id: <20220302173114.927476-11-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220302173114.927476-1-clg@kaod.org>
References: <20220302173114.927476-1-clg@kaod.org>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: uQAF39tSoHn8K62b_eSIuS_mFCCzJmmJ
X-Proofpoint-GUID: uQAF39tSoHn8K62b_eSIuS_mFCCzJmmJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-02_12,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 clxscore=1034
 phishscore=0 adultscore=0 mlxlogscore=649 lowpriorityscore=0 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2203020076
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220302_093151_190962_BC16CDBB 
X-CRM114-Status: GOOD (  13.67  )
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
aGUgRFRzLgoKUmV2aWV3ZWQtYnk6IEpvZWwgU3RhbmxleSA8am9lbEBqbXMuaWQuYXU+ClNpZ25l
ZC1vZmYtYnk6IEPDqWRyaWMgTGUgR29hdGVyIDxjbGdAa2FvZC5vcmc+Ci0tLQogYXJjaC9hcm0v
Ym9vdC9kdHMvYXNwZWVkLWc0LmR0c2kgfCA2ICsrKysrKwogYXJjaC9hcm0vYm9vdC9kdHMvYXNw
ZWVkLWc1LmR0c2kgfCA3ICsrKysrKysKIGFyY2gvYXJtL2Jvb3QvZHRzL2FzcGVlZC1nNi5kdHNp
IHwgOCArKysrKysrKwogMyBmaWxlcyBjaGFuZ2VkLCAyMSBpbnNlcnRpb25zKCspCgpkaWZmIC0t
Z2l0IGEvYXJjaC9hcm0vYm9vdC9kdHMvYXNwZWVkLWc0LmR0c2kgYi9hcmNoL2FybS9ib290L2R0
cy9hc3BlZWQtZzQuZHRzaQppbmRleCA5YWU2N2U4M2NmNjAuLjMxZTY1NjlkYjk3ZSAxMDA2NDQK
LS0tIGEvYXJjaC9hcm0vYm9vdC9kdHMvYXNwZWVkLWc0LmR0c2kKKysrIGIvYXJjaC9hcm0vYm9v
dC9kdHMvYXNwZWVkLWc0LmR0c2kKQEAgLTY0LDI3ICs2NCwzMiBAQCBmbWM6IHNwaUAxZTYyMDAw
MCB7CiAJCQlmbGFzaEAwIHsKIAkJCQlyZWcgPSA8IDAgPjsKIAkJCQljb21wYXRpYmxlID0gImpl
ZGVjLHNwaS1ub3IiOworCQkJCXNwaS1yeC1idXMtd2lkdGggPSA8Mj47CiAJCQkJc3BpLW1heC1m
cmVxdWVuY3kgPSA8NTAwMDAwMDA+OwogCQkJCXN0YXR1cyA9ICJkaXNhYmxlZCI7CiAJCQl9Owog
CQkJZmxhc2hAMSB7CiAJCQkJcmVnID0gPCAxID47CiAJCQkJY29tcGF0aWJsZSA9ICJqZWRlYyxz
cGktbm9yIjsKKwkJCQlzcGktcngtYnVzLXdpZHRoID0gPDI+OwogCQkJCXN0YXR1cyA9ICJkaXNh
YmxlZCI7CiAJCQl9OwogCQkJZmxhc2hAMiB7CiAJCQkJcmVnID0gPCAyID47CiAJCQkJY29tcGF0
aWJsZSA9ICJqZWRlYyxzcGktbm9yIjsKKwkJCQlzcGktcngtYnVzLXdpZHRoID0gPDI+OwogCQkJ
CXN0YXR1cyA9ICJkaXNhYmxlZCI7CiAJCQl9OwogCQkJZmxhc2hAMyB7CiAJCQkJcmVnID0gPCAz
ID47CiAJCQkJY29tcGF0aWJsZSA9ICJqZWRlYyxzcGktbm9yIjsKKwkJCQlzcGktcngtYnVzLXdp
ZHRoID0gPDI+OwogCQkJCXN0YXR1cyA9ICJkaXNhYmxlZCI7CiAJCQl9OwogCQkJZmxhc2hANCB7
CiAJCQkJcmVnID0gPCA0ID47CiAJCQkJY29tcGF0aWJsZSA9ICJqZWRlYyxzcGktbm9yIjsKKwkJ
CQlzcGktcngtYnVzLXdpZHRoID0gPDI+OwogCQkJCXN0YXR1cyA9ICJkaXNhYmxlZCI7CiAJCQl9
OwogCQl9OwpAQCAtMTAwLDYgKzEwNSw3IEBAIGZsYXNoQDAgewogCQkJCXJlZyA9IDwgMCA+Owog
CQkJCWNvbXBhdGlibGUgPSAiamVkZWMsc3BpLW5vciI7CiAJCQkJc3BpLW1heC1mcmVxdWVuY3kg
PSA8NTAwMDAwMDA+OworCQkJCXNwaS1yeC1idXMtd2lkdGggPSA8Mj47CiAJCQkJc3RhdHVzID0g
ImRpc2FibGVkIjsKIAkJCX07CiAJCX07CmRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9h
c3BlZWQtZzUuZHRzaSBiL2FyY2gvYXJtL2Jvb3QvZHRzL2FzcGVlZC1nNS5kdHNpCmluZGV4IGMz
ZTBhOGUxM2M4YS4uMjliZjAxNzg5OWI2IDEwMDY0NAotLS0gYS9hcmNoL2FybS9ib290L2R0cy9h
c3BlZWQtZzUuZHRzaQorKysgYi9hcmNoL2FybS9ib290L2R0cy9hc3BlZWQtZzUuZHRzaQpAQCAt
NjYsMTggKzY2LDIxIEBAIGZsYXNoQDAgewogCQkJCXJlZyA9IDwgMCA+OwogCQkJCWNvbXBhdGli
bGUgPSAiamVkZWMsc3BpLW5vciI7CiAJCQkJc3BpLW1heC1mcmVxdWVuY3kgPSA8NTAwMDAwMDA+
OworCQkJCXNwaS1yeC1idXMtd2lkdGggPSA8Mj47CiAJCQkJc3RhdHVzID0gImRpc2FibGVkIjsK
IAkJCX07CiAJCQlmbGFzaEAxIHsKIAkJCQlyZWcgPSA8IDEgPjsKIAkJCQljb21wYXRpYmxlID0g
ImplZGVjLHNwaS1ub3IiOwogCQkJCXNwaS1tYXgtZnJlcXVlbmN5ID0gPDUwMDAwMDAwPjsKKwkJ
CQlzcGktcngtYnVzLXdpZHRoID0gPDI+OwogCQkJCXN0YXR1cyA9ICJkaXNhYmxlZCI7CiAJCQl9
OwogCQkJZmxhc2hAMiB7CiAJCQkJcmVnID0gPCAyID47CiAJCQkJY29tcGF0aWJsZSA9ICJqZWRl
YyxzcGktbm9yIjsKIAkJCQlzcGktbWF4LWZyZXF1ZW5jeSA9IDw1MDAwMDAwMD47CisJCQkJc3Bp
LXJ4LWJ1cy13aWR0aCA9IDwyPjsKIAkJCQlzdGF0dXMgPSAiZGlzYWJsZWQiOwogCQkJfTsKIAkJ
fTsKQEAgLTkzLDEyICs5NiwxNCBAQCBmbGFzaEAwIHsKIAkJCQlyZWcgPSA8IDAgPjsKIAkJCQlj
b21wYXRpYmxlID0gImplZGVjLHNwaS1ub3IiOwogCQkJCXNwaS1tYXgtZnJlcXVlbmN5ID0gPDUw
MDAwMDAwPjsKKwkJCQlzcGktcngtYnVzLXdpZHRoID0gPDI+OwogCQkJCXN0YXR1cyA9ICJkaXNh
YmxlZCI7CiAJCQl9OwogCQkJZmxhc2hAMSB7CiAJCQkJcmVnID0gPCAxID47CiAJCQkJY29tcGF0
aWJsZSA9ICJqZWRlYyxzcGktbm9yIjsKIAkJCQlzcGktbWF4LWZyZXF1ZW5jeSA9IDw1MDAwMDAw
MD47CisJCQkJc3BpLXJ4LWJ1cy13aWR0aCA9IDwyPjsKIAkJCQlzdGF0dXMgPSAiZGlzYWJsZWQi
OwogCQkJfTsKIAkJfTsKQEAgLTExNCwxMiArMTE5LDE0IEBAIGZsYXNoQDAgewogCQkJCXJlZyA9
IDwgMCA+OwogCQkJCWNvbXBhdGlibGUgPSAiamVkZWMsc3BpLW5vciI7CiAJCQkJc3BpLW1heC1m
cmVxdWVuY3kgPSA8NTAwMDAwMDA+OworCQkJCXNwaS1yeC1idXMtd2lkdGggPSA8Mj47CiAJCQkJ
c3RhdHVzID0gImRpc2FibGVkIjsKIAkJCX07CiAJCQlmbGFzaEAxIHsKIAkJCQlyZWcgPSA8IDEg
PjsKIAkJCQljb21wYXRpYmxlID0gImplZGVjLHNwaS1ub3IiOwogCQkJCXNwaS1tYXgtZnJlcXVl
bmN5ID0gPDUwMDAwMDAwPjsKKwkJCQlzcGktcngtYnVzLXdpZHRoID0gPDI+OwogCQkJCXN0YXR1
cyA9ICJkaXNhYmxlZCI7CiAJCQl9OwogCQl9OwpkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vYm9vdC9k
dHMvYXNwZWVkLWc2LmR0c2kgYi9hcmNoL2FybS9ib290L2R0cy9hc3BlZWQtZzYuZHRzaQppbmRl
eCAxYWQwNWRkZTE5ZDIuLmNlOTNjNTZhMjFhNyAxMDA2NDQKLS0tIGEvYXJjaC9hcm0vYm9vdC9k
dHMvYXNwZWVkLWc2LmR0c2kKKysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvYXNwZWVkLWc2LmR0c2kK
QEAgLTEwNiwxOCArMTA2LDIxIEBAIGZsYXNoQDAgewogCQkJCXJlZyA9IDwgMCA+OwogCQkJCWNv
bXBhdGlibGUgPSAiamVkZWMsc3BpLW5vciI7CiAJCQkJc3BpLW1heC1mcmVxdWVuY3kgPSA8NTAw
MDAwMDA+OworCQkJCXNwaS1yeC1idXMtd2lkdGggPSA8Mj47CiAJCQkJc3RhdHVzID0gImRpc2Fi
bGVkIjsKIAkJCX07CiAJCQlmbGFzaEAxIHsKIAkJCQlyZWcgPSA8IDEgPjsKIAkJCQljb21wYXRp
YmxlID0gImplZGVjLHNwaS1ub3IiOwogCQkJCXNwaS1tYXgtZnJlcXVlbmN5ID0gPDUwMDAwMDAw
PjsKKwkJCQlzcGktcngtYnVzLXdpZHRoID0gPDI+OwogCQkJCXN0YXR1cyA9ICJkaXNhYmxlZCI7
CiAJCQl9OwogCQkJZmxhc2hAMiB7CiAJCQkJcmVnID0gPCAyID47CiAJCQkJY29tcGF0aWJsZSA9
ICJqZWRlYyxzcGktbm9yIjsKIAkJCQlzcGktbWF4LWZyZXF1ZW5jeSA9IDw1MDAwMDAwMD47CisJ
CQkJc3BpLXJ4LWJ1cy13aWR0aCA9IDwyPjsKIAkJCQlzdGF0dXMgPSAiZGlzYWJsZWQiOwogCQkJ
fTsKIAkJfTsKQEAgLTEzMywxMiArMTM2LDE0IEBAIGZsYXNoQDAgewogCQkJCXJlZyA9IDwgMCA+
OwogCQkJCWNvbXBhdGlibGUgPSAiamVkZWMsc3BpLW5vciI7CiAJCQkJc3BpLW1heC1mcmVxdWVu
Y3kgPSA8NTAwMDAwMDA+OworCQkJCXNwaS1yeC1idXMtd2lkdGggPSA8Mj47CiAJCQkJc3RhdHVz
ID0gImRpc2FibGVkIjsKIAkJCX07CiAJCQlmbGFzaEAxIHsKIAkJCQlyZWcgPSA8IDEgPjsKIAkJ
CQljb21wYXRpYmxlID0gImplZGVjLHNwaS1ub3IiOwogCQkJCXNwaS1tYXgtZnJlcXVlbmN5ID0g
PDUwMDAwMDAwPjsKKwkJCQlzcGktcngtYnVzLXdpZHRoID0gPDI+OwogCQkJCXN0YXR1cyA9ICJk
aXNhYmxlZCI7CiAJCQl9OwogCQl9OwpAQCAtMTU0LDE4ICsxNTksMjEgQEAgZmxhc2hAMCB7CiAJ
CQkJcmVnID0gPCAwID47CiAJCQkJY29tcGF0aWJsZSA9ICJqZWRlYyxzcGktbm9yIjsKIAkJCQlz
cGktbWF4LWZyZXF1ZW5jeSA9IDw1MDAwMDAwMD47CisJCQkJc3BpLXJ4LWJ1cy13aWR0aCA9IDwy
PjsKIAkJCQlzdGF0dXMgPSAiZGlzYWJsZWQiOwogCQkJfTsKIAkJCWZsYXNoQDEgewogCQkJCXJl
ZyA9IDwgMSA+OwogCQkJCWNvbXBhdGlibGUgPSAiamVkZWMsc3BpLW5vciI7CiAJCQkJc3BpLW1h
eC1mcmVxdWVuY3kgPSA8NTAwMDAwMDA+OworCQkJCXNwaS1yeC1idXMtd2lkdGggPSA8Mj47CiAJ
CQkJc3RhdHVzID0gImRpc2FibGVkIjsKIAkJCX07CiAJCQlmbGFzaEAyIHsKIAkJCQlyZWcgPSA8
IDIgPjsKIAkJCQljb21wYXRpYmxlID0gImplZGVjLHNwaS1ub3IiOwogCQkJCXNwaS1tYXgtZnJl
cXVlbmN5ID0gPDUwMDAwMDAwPjsKKwkJCQlzcGktcngtYnVzLXdpZHRoID0gPDI+OwogCQkJCXN0
YXR1cyA9ICJkaXNhYmxlZCI7CiAJCQl9OwogCQl9OwotLSAKMi4zNC4xCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNj
dXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LW10ZC8K
