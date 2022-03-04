Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51657C433F5
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Mar 2022 08:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gUp3Lafrz4NC637D2/cGyiVECpg2mvoo3+2fSB8qvtI=; b=LJ+CG3JU3iadT0
	yX82EPfrfbMPVA/IiFn46nuslE/j1CeLkMpxyxjNBPgtLJ9HzoYeJDBOD/mJ+YV0g7YwmtSQwJERm
	7UZDBD8shVkyFUkbJ8iOi65952eMD0v08YjK6pbBX2jfJoRUrtrQamfc9PjDHvxq1E2IWn691Ssj1
	oWCZA8/UG7JRK8Q2EVcvlATfUJ7O6BebWCTqmsP7f5sYKEktC10cN5bEZwRt5KsuyPmKgYcN/AJBj
	ogNO7XMje30Qs1wLEYt1UTfiSOm3WBXumwxPmEk3/Simw8NAOaZOke3wsEv0Dic4fwQEF1wVsvWFU
	XO4p7jkZ/c6/xa4k32kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nQ3aH-0096y1-AU; Fri, 04 Mar 2022 08:46:45 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nQ3RG-00941F-L7; Fri, 04 Mar 2022 08:37:30 +0000
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 2247IXYX028487; 
 Fri, 4 Mar 2022 08:37:09 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3eke90s86t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Mar 2022 08:37:09 +0000
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 2248SrHq021740;
 Fri, 4 Mar 2022 08:37:09 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3eke90s86c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Mar 2022 08:37:09 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2248XW5P020673;
 Fri, 4 Mar 2022 08:37:07 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma05fra.de.ibm.com with ESMTP id 3ek4ka920p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Mar 2022 08:37:06 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2248b4c049611120
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 4 Mar 2022 08:37:04 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 81EAAA405C;
 Fri,  4 Mar 2022 08:37:04 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D243AA4054;
 Fri,  4 Mar 2022 08:37:03 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Fri,  4 Mar 2022 08:37:03 +0000 (GMT)
Received: from yukon.home (unknown [9.171.91.16])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 1D5B32200FD;
 Fri,  4 Mar 2022 09:37:02 +0100 (CET)
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
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Tao Ren <rentao.bupt@gmail.com>
Subject: [PATCH v3 10/11] ARM: dts: aspeed: Enable Dual SPI RX transfers
Date: Fri,  4 Mar 2022 09:36:42 +0100
Message-Id: <20220304083643.1079142-11-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220304083643.1079142-1-clg@kaod.org>
References: <20220304083643.1079142-1-clg@kaod.org>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: WCdqW2nETb4UQ0Mwgm4fKcA-MTAiRqt1
X-Proofpoint-ORIG-GUID: HtRGs9r0M2zi5Ybu2iNLriu2HSRkh_lF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-04_02,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1034
 lowpriorityscore=0 mlxscore=0 bulkscore=0 mlxlogscore=746
 priorityscore=1501 suspectscore=0 spamscore=0 impostorscore=0
 malwarescore=0 phishscore=0 adultscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2203040044
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220304_003726_837655_5D72906F 
X-CRM114-Status: GOOD (  12.57  )
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
aGUgRFRzLgoKUmV2aWV3ZWQtYnk6IEpvZWwgU3RhbmxleSA8am9lbEBqbXMuaWQuYXU+ClRlc3Rl
ZC1ieTogSm9lbCBTdGFubGV5IDxqb2VsQGptcy5pZC5hdT4KVGVzdGVkLWJ5OiBUYW8gUmVuIDxy
ZW50YW8uYnVwdEBnbWFpbC5jb20+ClNpZ25lZC1vZmYtYnk6IEPDqWRyaWMgTGUgR29hdGVyIDxj
bGdAa2FvZC5vcmc+Ci0tLQogYXJjaC9hcm0vYm9vdC9kdHMvYXNwZWVkLWc0LmR0c2kgfCA2ICsr
KysrKwogYXJjaC9hcm0vYm9vdC9kdHMvYXNwZWVkLWc1LmR0c2kgfCA3ICsrKysrKysKIGFyY2gv
YXJtL2Jvb3QvZHRzL2FzcGVlZC1nNi5kdHNpIHwgOCArKysrKysrKwogMyBmaWxlcyBjaGFuZ2Vk
LCAyMSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vYm9vdC9kdHMvYXNwZWVk
LWc0LmR0c2kgYi9hcmNoL2FybS9ib290L2R0cy9hc3BlZWQtZzQuZHRzaQppbmRleCA5YWU2N2U4
M2NmNjAuLjMxZTY1NjlkYjk3ZSAxMDA2NDQKLS0tIGEvYXJjaC9hcm0vYm9vdC9kdHMvYXNwZWVk
LWc0LmR0c2kKKysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvYXNwZWVkLWc0LmR0c2kKQEAgLTY0LDI3
ICs2NCwzMiBAQCBmbWM6IHNwaUAxZTYyMDAwMCB7CiAJCQlmbGFzaEAwIHsKIAkJCQlyZWcgPSA8
IDAgPjsKIAkJCQljb21wYXRpYmxlID0gImplZGVjLHNwaS1ub3IiOworCQkJCXNwaS1yeC1idXMt
d2lkdGggPSA8Mj47CiAJCQkJc3BpLW1heC1mcmVxdWVuY3kgPSA8NTAwMDAwMDA+OwogCQkJCXN0
YXR1cyA9ICJkaXNhYmxlZCI7CiAJCQl9OwogCQkJZmxhc2hAMSB7CiAJCQkJcmVnID0gPCAxID47
CiAJCQkJY29tcGF0aWJsZSA9ICJqZWRlYyxzcGktbm9yIjsKKwkJCQlzcGktcngtYnVzLXdpZHRo
ID0gPDI+OwogCQkJCXN0YXR1cyA9ICJkaXNhYmxlZCI7CiAJCQl9OwogCQkJZmxhc2hAMiB7CiAJ
CQkJcmVnID0gPCAyID47CiAJCQkJY29tcGF0aWJsZSA9ICJqZWRlYyxzcGktbm9yIjsKKwkJCQlz
cGktcngtYnVzLXdpZHRoID0gPDI+OwogCQkJCXN0YXR1cyA9ICJkaXNhYmxlZCI7CiAJCQl9Owog
CQkJZmxhc2hAMyB7CiAJCQkJcmVnID0gPCAzID47CiAJCQkJY29tcGF0aWJsZSA9ICJqZWRlYyxz
cGktbm9yIjsKKwkJCQlzcGktcngtYnVzLXdpZHRoID0gPDI+OwogCQkJCXN0YXR1cyA9ICJkaXNh
YmxlZCI7CiAJCQl9OwogCQkJZmxhc2hANCB7CiAJCQkJcmVnID0gPCA0ID47CiAJCQkJY29tcGF0
aWJsZSA9ICJqZWRlYyxzcGktbm9yIjsKKwkJCQlzcGktcngtYnVzLXdpZHRoID0gPDI+OwogCQkJ
CXN0YXR1cyA9ICJkaXNhYmxlZCI7CiAJCQl9OwogCQl9OwpAQCAtMTAwLDYgKzEwNSw3IEBAIGZs
YXNoQDAgewogCQkJCXJlZyA9IDwgMCA+OwogCQkJCWNvbXBhdGlibGUgPSAiamVkZWMsc3BpLW5v
ciI7CiAJCQkJc3BpLW1heC1mcmVxdWVuY3kgPSA8NTAwMDAwMDA+OworCQkJCXNwaS1yeC1idXMt
d2lkdGggPSA8Mj47CiAJCQkJc3RhdHVzID0gImRpc2FibGVkIjsKIAkJCX07CiAJCX07CmRpZmYg
LS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9hc3BlZWQtZzUuZHRzaSBiL2FyY2gvYXJtL2Jvb3Qv
ZHRzL2FzcGVlZC1nNS5kdHNpCmluZGV4IGMzZTBhOGUxM2M4YS4uMjliZjAxNzg5OWI2IDEwMDY0
NAotLS0gYS9hcmNoL2FybS9ib290L2R0cy9hc3BlZWQtZzUuZHRzaQorKysgYi9hcmNoL2FybS9i
b290L2R0cy9hc3BlZWQtZzUuZHRzaQpAQCAtNjYsMTggKzY2LDIxIEBAIGZsYXNoQDAgewogCQkJ
CXJlZyA9IDwgMCA+OwogCQkJCWNvbXBhdGlibGUgPSAiamVkZWMsc3BpLW5vciI7CiAJCQkJc3Bp
LW1heC1mcmVxdWVuY3kgPSA8NTAwMDAwMDA+OworCQkJCXNwaS1yeC1idXMtd2lkdGggPSA8Mj47
CiAJCQkJc3RhdHVzID0gImRpc2FibGVkIjsKIAkJCX07CiAJCQlmbGFzaEAxIHsKIAkJCQlyZWcg
PSA8IDEgPjsKIAkJCQljb21wYXRpYmxlID0gImplZGVjLHNwaS1ub3IiOwogCQkJCXNwaS1tYXgt
ZnJlcXVlbmN5ID0gPDUwMDAwMDAwPjsKKwkJCQlzcGktcngtYnVzLXdpZHRoID0gPDI+OwogCQkJ
CXN0YXR1cyA9ICJkaXNhYmxlZCI7CiAJCQl9OwogCQkJZmxhc2hAMiB7CiAJCQkJcmVnID0gPCAy
ID47CiAJCQkJY29tcGF0aWJsZSA9ICJqZWRlYyxzcGktbm9yIjsKIAkJCQlzcGktbWF4LWZyZXF1
ZW5jeSA9IDw1MDAwMDAwMD47CisJCQkJc3BpLXJ4LWJ1cy13aWR0aCA9IDwyPjsKIAkJCQlzdGF0
dXMgPSAiZGlzYWJsZWQiOwogCQkJfTsKIAkJfTsKQEAgLTkzLDEyICs5NiwxNCBAQCBmbGFzaEAw
IHsKIAkJCQlyZWcgPSA8IDAgPjsKIAkJCQljb21wYXRpYmxlID0gImplZGVjLHNwaS1ub3IiOwog
CQkJCXNwaS1tYXgtZnJlcXVlbmN5ID0gPDUwMDAwMDAwPjsKKwkJCQlzcGktcngtYnVzLXdpZHRo
ID0gPDI+OwogCQkJCXN0YXR1cyA9ICJkaXNhYmxlZCI7CiAJCQl9OwogCQkJZmxhc2hAMSB7CiAJ
CQkJcmVnID0gPCAxID47CiAJCQkJY29tcGF0aWJsZSA9ICJqZWRlYyxzcGktbm9yIjsKIAkJCQlz
cGktbWF4LWZyZXF1ZW5jeSA9IDw1MDAwMDAwMD47CisJCQkJc3BpLXJ4LWJ1cy13aWR0aCA9IDwy
PjsKIAkJCQlzdGF0dXMgPSAiZGlzYWJsZWQiOwogCQkJfTsKIAkJfTsKQEAgLTExNCwxMiArMTE5
LDE0IEBAIGZsYXNoQDAgewogCQkJCXJlZyA9IDwgMCA+OwogCQkJCWNvbXBhdGlibGUgPSAiamVk
ZWMsc3BpLW5vciI7CiAJCQkJc3BpLW1heC1mcmVxdWVuY3kgPSA8NTAwMDAwMDA+OworCQkJCXNw
aS1yeC1idXMtd2lkdGggPSA8Mj47CiAJCQkJc3RhdHVzID0gImRpc2FibGVkIjsKIAkJCX07CiAJ
CQlmbGFzaEAxIHsKIAkJCQlyZWcgPSA8IDEgPjsKIAkJCQljb21wYXRpYmxlID0gImplZGVjLHNw
aS1ub3IiOwogCQkJCXNwaS1tYXgtZnJlcXVlbmN5ID0gPDUwMDAwMDAwPjsKKwkJCQlzcGktcngt
YnVzLXdpZHRoID0gPDI+OwogCQkJCXN0YXR1cyA9ICJkaXNhYmxlZCI7CiAJCQl9OwogCQl9Owpk
aWZmIC0tZ2l0IGEvYXJjaC9hcm0vYm9vdC9kdHMvYXNwZWVkLWc2LmR0c2kgYi9hcmNoL2FybS9i
b290L2R0cy9hc3BlZWQtZzYuZHRzaQppbmRleCAxYWQwNWRkZTE5ZDIuLmNlOTNjNTZhMjFhNyAx
MDA2NDQKLS0tIGEvYXJjaC9hcm0vYm9vdC9kdHMvYXNwZWVkLWc2LmR0c2kKKysrIGIvYXJjaC9h
cm0vYm9vdC9kdHMvYXNwZWVkLWc2LmR0c2kKQEAgLTEwNiwxOCArMTA2LDIxIEBAIGZsYXNoQDAg
ewogCQkJCXJlZyA9IDwgMCA+OwogCQkJCWNvbXBhdGlibGUgPSAiamVkZWMsc3BpLW5vciI7CiAJ
CQkJc3BpLW1heC1mcmVxdWVuY3kgPSA8NTAwMDAwMDA+OworCQkJCXNwaS1yeC1idXMtd2lkdGgg
PSA8Mj47CiAJCQkJc3RhdHVzID0gImRpc2FibGVkIjsKIAkJCX07CiAJCQlmbGFzaEAxIHsKIAkJ
CQlyZWcgPSA8IDEgPjsKIAkJCQljb21wYXRpYmxlID0gImplZGVjLHNwaS1ub3IiOwogCQkJCXNw
aS1tYXgtZnJlcXVlbmN5ID0gPDUwMDAwMDAwPjsKKwkJCQlzcGktcngtYnVzLXdpZHRoID0gPDI+
OwogCQkJCXN0YXR1cyA9ICJkaXNhYmxlZCI7CiAJCQl9OwogCQkJZmxhc2hAMiB7CiAJCQkJcmVn
ID0gPCAyID47CiAJCQkJY29tcGF0aWJsZSA9ICJqZWRlYyxzcGktbm9yIjsKIAkJCQlzcGktbWF4
LWZyZXF1ZW5jeSA9IDw1MDAwMDAwMD47CisJCQkJc3BpLXJ4LWJ1cy13aWR0aCA9IDwyPjsKIAkJ
CQlzdGF0dXMgPSAiZGlzYWJsZWQiOwogCQkJfTsKIAkJfTsKQEAgLTEzMywxMiArMTM2LDE0IEBA
IGZsYXNoQDAgewogCQkJCXJlZyA9IDwgMCA+OwogCQkJCWNvbXBhdGlibGUgPSAiamVkZWMsc3Bp
LW5vciI7CiAJCQkJc3BpLW1heC1mcmVxdWVuY3kgPSA8NTAwMDAwMDA+OworCQkJCXNwaS1yeC1i
dXMtd2lkdGggPSA8Mj47CiAJCQkJc3RhdHVzID0gImRpc2FibGVkIjsKIAkJCX07CiAJCQlmbGFz
aEAxIHsKIAkJCQlyZWcgPSA8IDEgPjsKIAkJCQljb21wYXRpYmxlID0gImplZGVjLHNwaS1ub3Ii
OwogCQkJCXNwaS1tYXgtZnJlcXVlbmN5ID0gPDUwMDAwMDAwPjsKKwkJCQlzcGktcngtYnVzLXdp
ZHRoID0gPDI+OwogCQkJCXN0YXR1cyA9ICJkaXNhYmxlZCI7CiAJCQl9OwogCQl9OwpAQCAtMTU0
LDE4ICsxNTksMjEgQEAgZmxhc2hAMCB7CiAJCQkJcmVnID0gPCAwID47CiAJCQkJY29tcGF0aWJs
ZSA9ICJqZWRlYyxzcGktbm9yIjsKIAkJCQlzcGktbWF4LWZyZXF1ZW5jeSA9IDw1MDAwMDAwMD47
CisJCQkJc3BpLXJ4LWJ1cy13aWR0aCA9IDwyPjsKIAkJCQlzdGF0dXMgPSAiZGlzYWJsZWQiOwog
CQkJfTsKIAkJCWZsYXNoQDEgewogCQkJCXJlZyA9IDwgMSA+OwogCQkJCWNvbXBhdGlibGUgPSAi
amVkZWMsc3BpLW5vciI7CiAJCQkJc3BpLW1heC1mcmVxdWVuY3kgPSA8NTAwMDAwMDA+OworCQkJ
CXNwaS1yeC1idXMtd2lkdGggPSA8Mj47CiAJCQkJc3RhdHVzID0gImRpc2FibGVkIjsKIAkJCX07
CiAJCQlmbGFzaEAyIHsKIAkJCQlyZWcgPSA8IDIgPjsKIAkJCQljb21wYXRpYmxlID0gImplZGVj
LHNwaS1ub3IiOwogCQkJCXNwaS1tYXgtZnJlcXVlbmN5ID0gPDUwMDAwMDAwPjsKKwkJCQlzcGkt
cngtYnVzLXdpZHRoID0gPDI+OwogCQkJCXN0YXR1cyA9ICJkaXNhYmxlZCI7CiAJCQl9OwogCQl9
OwotLSAKMi4zNC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
