Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AA64C433F5
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Mar 2022 17:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=049V2n4+MEpmn5ikOCIvLursRm+BBLRSK7SawAgnezc=; b=WcjUK5FYUkuiVj
	JKODhNaF0gPBkBujpbNsTE7AELQFBEHgCoj40QPv7s89NvQMIiIYO+VpOadR1LNbYvvOXYXvAv2ZI
	EgtZjo3cc7FNdzzM2G9jHcAV2LYQg11C6hSyA+UKyaLFVgjAC13+kSmHda4kzmXFyZYnZmFV1X+Rr
	KoQTsFZeSxpSE21XqS2Dht4vK2djrv2/ruTpnQzCHOGH1Zku2MXXJ35pTiHI4sYXfHXJ1TnnZwwjp
	S6PiXeCZZCIiM0qWRSPKB5Fs7l972P3RiLPBZvHDKdd4geNNPRabi87f8bTZOofOLIEdFJISqfoxF
	9hwrYhOuipHrwAUsOJGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPT5H-003eJu-Q2; Wed, 02 Mar 2022 17:48:20 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPSq4-003ZWy-3Q; Wed, 02 Mar 2022 17:32:38 +0000
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 222FrqMW005719; 
 Wed, 2 Mar 2022 17:32:15 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ejbmdt32p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 17:32:14 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 222HDSVA008084;
 Wed, 2 Mar 2022 17:31:22 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma04ams.nl.ibm.com with ESMTP id 3egbj1amfq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 17:31:22 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 222HVKEU51511702
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 2 Mar 2022 17:31:20 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 64AFD4203F;
 Wed,  2 Mar 2022 17:31:20 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BF6D642042;
 Wed,  2 Mar 2022 17:31:19 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed,  2 Mar 2022 17:31:19 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.58.125])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 581E42200FE;
 Wed,  2 Mar 2022 18:31:18 +0100 (CET)
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
Subject: [PATCH v2 02/10] ARM: dts: aspeed: Adjust "reg" property of FMC/SPI
 controllers
Date: Wed,  2 Mar 2022 18:31:06 +0100
Message-Id: <20220302173114.927476-3-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220302173114.927476-1-clg@kaod.org>
References: <20220302173114.927476-1-clg@kaod.org>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: UYF6sFSv9nuLXwvrpwtM6l_8y6ANseni
X-Proofpoint-GUID: UYF6sFSv9nuLXwvrpwtM6l_8y6ANseni
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-02_12,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1034 impostorscore=0
 phishscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 adultscore=0
 mlxlogscore=507 malwarescore=0 priorityscore=1501 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2203020076
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220302_093236_246605_5B9BA909 
X-CRM114-Status: GOOD (  14.41  )
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

VGhpcyBpcyBjb21wYXRpYmxlIHdpdGggdGhlIGN1cnJlbnQgZHJpdmVyIGFuZCBhZGRyZXNzZXMg
aXNzdWVzIHdoZW4KcnVubmluZyAnbWFrZSBkdF9iaW5kaW5nX2NoZWNrJy4KCkNjOiBDaGluLVRp
bmcgS3VvIDxjaGluLXRpbmdfa3VvQGFzcGVlZHRlY2guY29tPgpTaWduZWQtb2ZmLWJ5OiBDw6lk
cmljIExlIEdvYXRlciA8Y2xnQGthb2Qub3JnPgotLS0KIGFyY2gvYXJtL2Jvb3QvZHRzL2FzcGVl
ZC1nNC5kdHNpIHwgNiArKy0tLS0KIGFyY2gvYXJtL2Jvb3QvZHRzL2FzcGVlZC1nNS5kdHNpIHwg
OSArKystLS0tLS0KIGFyY2gvYXJtL2Jvb3QvZHRzL2FzcGVlZC1nNi5kdHNpIHwgOSArKystLS0t
LS0KIDMgZmlsZXMgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCAxNiBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9hc3BlZWQtZzQuZHRzaSBiL2FyY2gvYXJtL2Jv
b3QvZHRzL2FzcGVlZC1nNC5kdHNpCmluZGV4IGYxNGRhY2UzNGM1YS4uOWFlNjdlODNjZjYwIDEw
MDY0NAotLS0gYS9hcmNoL2FybS9ib290L2R0cy9hc3BlZWQtZzQuZHRzaQorKysgYi9hcmNoL2Fy
bS9ib290L2R0cy9hc3BlZWQtZzQuZHRzaQpAQCAtNTQsOCArNTQsNyBAQCBhaGIgewogCQlyYW5n
ZXM7CiAKIAkJZm1jOiBzcGlAMWU2MjAwMDAgewotCQkJcmVnID0gPCAweDFlNjIwMDAwIDB4OTQK
LQkJCQkweDIwMDAwMDAwIDB4MTAwMDAwMDAgPjsKKwkJCXJlZyA9IDwweDFlNjIwMDAwIDB4OTQ+
LCA8MHgyMDAwMDAwMCAweDEwMDAwMDAwPjsKIAkJCSNhZGRyZXNzLWNlbGxzID0gPDE+OwogCQkJ
I3NpemUtY2VsbHMgPSA8MD47CiAJCQljb21wYXRpYmxlID0gImFzcGVlZCxhc3QyNDAwLWZtYyI7
CkBAIC05MSw4ICs5MCw3IEBAIGZsYXNoQDQgewogCQl9OwogCiAJCXNwaTogc3BpQDFlNjMwMDAw
IHsKLQkJCXJlZyA9IDwgMHgxZTYzMDAwMCAweDE4Ci0JCQkJMHgzMDAwMDAwMCAweDEwMDAwMDAw
ID47CisJCQlyZWcgPSA8MHgxZTYzMDAwMCAweDE4PiwgPDB4MzAwMDAwMDAgMHgxMDAwMDAwMD47
CiAJCQkjYWRkcmVzcy1jZWxscyA9IDwxPjsKIAkJCSNzaXplLWNlbGxzID0gPDA+OwogCQkJY29t
cGF0aWJsZSA9ICJhc3BlZWQsYXN0MjQwMC1zcGkiOwpkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vYm9v
dC9kdHMvYXNwZWVkLWc1LmR0c2kgYi9hcmNoL2FybS9ib290L2R0cy9hc3BlZWQtZzUuZHRzaQpp
bmRleCA3NDk1ZjkzYzUwNjkuLmMzZTBhOGUxM2M4YSAxMDA2NDQKLS0tIGEvYXJjaC9hcm0vYm9v
dC9kdHMvYXNwZWVkLWc1LmR0c2kKKysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvYXNwZWVkLWc1LmR0
c2kKQEAgLTU1LDggKzU1LDcgQEAgYWhiIHsKIAkJcmFuZ2VzOwogCiAJCWZtYzogc3BpQDFlNjIw
MDAwIHsKLQkJCXJlZyA9IDwgMHgxZTYyMDAwMCAweGM0Ci0JCQkJMHgyMDAwMDAwMCAweDEwMDAw
MDAwID47CisJCQlyZWcgPSA8MHgxZTYyMDAwMCAweGM0PiwgPDB4MjAwMDAwMDAgMHgxMDAwMDAw
MD47CiAJCQkjYWRkcmVzcy1jZWxscyA9IDwxPjsKIAkJCSNzaXplLWNlbGxzID0gPDA+OwogCQkJ
Y29tcGF0aWJsZSA9ICJhc3BlZWQsYXN0MjUwMC1mbWMiOwpAQCAtODQsOCArODMsNyBAQCBmbGFz
aEAyIHsKIAkJfTsKIAogCQlzcGkxOiBzcGlAMWU2MzAwMDAgewotCQkJcmVnID0gPCAweDFlNjMw
MDAwIDB4YzQKLQkJCQkweDMwMDAwMDAwIDB4MDgwMDAwMDAgPjsKKwkJCXJlZyA9IDwweDFlNjMw
MDAwIDB4YzQ+LCA8MHgzMDAwMDAwMCAweDA4MDAwMDAwPjsKIAkJCSNhZGRyZXNzLWNlbGxzID0g
PDE+OwogCQkJI3NpemUtY2VsbHMgPSA8MD47CiAJCQljb21wYXRpYmxlID0gImFzcGVlZCxhc3Qy
NTAwLXNwaSI7CkBAIC0xMDYsOCArMTA0LDcgQEAgZmxhc2hAMSB7CiAJCX07CiAKIAkJc3BpMjog
c3BpQDFlNjMxMDAwIHsKLQkJCXJlZyA9IDwgMHgxZTYzMTAwMCAweGM0Ci0JCQkJMHgzODAwMDAw
MCAweDA4MDAwMDAwID47CisJCQlyZWcgPSA8MHgxZTYzMTAwMCAweGM0PiwgPDB4MzgwMDAwMDAg
MHgwODAwMDAwMD47CiAJCQkjYWRkcmVzcy1jZWxscyA9IDwxPjsKIAkJCSNzaXplLWNlbGxzID0g
PDA+OwogCQkJY29tcGF0aWJsZSA9ICJhc3BlZWQsYXN0MjUwMC1zcGkiOwpkaWZmIC0tZ2l0IGEv
YXJjaC9hcm0vYm9vdC9kdHMvYXNwZWVkLWc2LmR0c2kgYi9hcmNoL2FybS9ib290L2R0cy9hc3Bl
ZWQtZzYuZHRzaQppbmRleCBjMzJlODdmYWQ0ZGMuLjFhZDA1ZGRlMTlkMiAxMDA2NDQKLS0tIGEv
YXJjaC9hcm0vYm9vdC9kdHMvYXNwZWVkLWc2LmR0c2kKKysrIGIvYXJjaC9hcm0vYm9vdC9kdHMv
YXNwZWVkLWc2LmR0c2kKQEAgLTk1LDggKzk1LDcgQEAgZ2ljOiBpbnRlcnJ1cHQtY29udHJvbGxl
ckA0MDQ2MTAwMCB7CiAJCQl9OwogCiAJCWZtYzogc3BpQDFlNjIwMDAwIHsKLQkJCXJlZyA9IDwg
MHgxZTYyMDAwMCAweGM0Ci0JCQkJMHgyMDAwMDAwMCAweDEwMDAwMDAwID47CisJCQlyZWcgPSA8
MHgxZTYyMDAwMCAweGM0PiwgPDB4MjAwMDAwMDAgMHgxMDAwMDAwMD47CiAJCQkjYWRkcmVzcy1j
ZWxscyA9IDwxPjsKIAkJCSNzaXplLWNlbGxzID0gPDA+OwogCQkJY29tcGF0aWJsZSA9ICJhc3Bl
ZWQsYXN0MjYwMC1mbWMiOwpAQCAtMTI0LDggKzEyMyw3IEBAIGZsYXNoQDIgewogCQl9OwogCiAJ
CXNwaTE6IHNwaUAxZTYzMDAwMCB7Ci0JCQlyZWcgPSA8IDB4MWU2MzAwMDAgMHhjNAotCQkJCTB4
MzAwMDAwMDAgMHgxMDAwMDAwMCA+OworCQkJcmVnID0gPDB4MWU2MzAwMDAgMHhjND4sIDwweDMw
MDAwMDAwIDB4MTAwMDAwMDA+OwogCQkJI2FkZHJlc3MtY2VsbHMgPSA8MT47CiAJCQkjc2l6ZS1j
ZWxscyA9IDwwPjsKIAkJCWNvbXBhdGlibGUgPSAiYXNwZWVkLGFzdDI2MDAtc3BpIjsKQEAgLTE0
Niw4ICsxNDQsNyBAQCBmbGFzaEAxIHsKIAkJfTsKIAogCQlzcGkyOiBzcGlAMWU2MzEwMDAgewot
CQkJcmVnID0gPCAweDFlNjMxMDAwIDB4YzQKLQkJCQkweDUwMDAwMDAwIDB4MTAwMDAwMDAgPjsK
KwkJCXJlZyA9IDwweDFlNjMxMDAwIDB4YzQ+LCA8MHg1MDAwMDAwMCAweDEwMDAwMDAwPjsKIAkJ
CSNhZGRyZXNzLWNlbGxzID0gPDE+OwogCQkJI3NpemUtY2VsbHMgPSA8MD47CiAJCQljb21wYXRp
YmxlID0gImFzcGVlZCxhc3QyNjAwLXNwaSI7Ci0tIAoyLjM0LjEKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Np
b24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbXRkLwo=
