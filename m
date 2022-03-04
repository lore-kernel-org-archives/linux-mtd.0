Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31E1EC433EF
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Mar 2022 08:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oeJL3WO8L9hfYHbWnQixN76119381UqKH2URDdZi2PU=; b=bBqtKmE0/QFEYC
	QpPXqLk2R+v0ULXbXxvMdAPHdRcU76iy+dyd5vOADZC/0MnfmmMxRk1hjsXuw7RlI+gPczCpbSPvJ
	NblY18cH9/w8ujMJoWgvWQkv9B0U9HAIma483kfx0BYQ9I4G/km6h59Ca1e8gR1ovZBZz2lCMph+x
	67Y7WOBWKeM9TXos7Wj6PxSqi6qzD5exCVdpo+OJ8HBAlZ+4hkDdfuzWQuP4p5jEaY8eGCO5aNDCd
	1dOyy5Uau0R1ZTkgtxS/21gqFz8K5ZkXTJFwkawn5eU+VpkWp7Fq+s6B7h2iCJTRMT2hnWiz073sa
	GjKZ9T8aLkjjkYdPpGHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nQ3Rk-00949w-3O; Fri, 04 Mar 2022 08:37:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nQ3RF-00940s-R6; Fri, 04 Mar 2022 08:37:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
 :MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=eknyCz+vkIplenIzRfKdiRkNd4pFCmbvog6xalQKlf4=; b=C5vFq0mLBlGe/rehWkuWLZpLNX
 Xd91p9hRvAFkoN5d/jkQnijyoQ5cv5Dyc3eQEsog6qi3Y6Syg1S+rKWKhDKDXb9N2o+M+edJP6bSU
 DAW/EKxixjrjvJaA7uI+ND8FxCRlkFQ4eA06hlA3vfTuwcpj+JjArH2Y3XVi7yD7swGiu/2knejUJ
 536TrH4rTnWXzNJXIZgUER/MIlmoaqnHXh77rdSjcN0e+/9KcXDGE2ePVDm73RehzLpVgC6FXa+b/
 hbJO0YST+GcWC2XsIfejoWK3fC3kWczby9SJBOK+pkXr1omxa41R23x67DJBRVptHF3mp9/aOvpA6
 jJuezs/g==;
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nQ3RA-00F9Bl-DT; Fri, 04 Mar 2022 08:37:22 +0000
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 2246Y8v4028009; 
 Fri, 4 Mar 2022 08:36:57 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ek9y65g14-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Mar 2022 08:36:56 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 2248autx014835;
 Fri, 4 Mar 2022 08:36:56 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ek9y65g0m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Mar 2022 08:36:56 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2248X4vh013605;
 Fri, 4 Mar 2022 08:36:53 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma03ams.nl.ibm.com with ESMTP id 3ek4k417h3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Mar 2022 08:36:53 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 2248apq434013686
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 4 Mar 2022 08:36:51 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2E51C4C044;
 Fri,  4 Mar 2022 08:36:51 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8033B4C040;
 Fri,  4 Mar 2022 08:36:50 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Fri,  4 Mar 2022 08:36:50 +0000 (GMT)
Received: from yukon.home (unknown [9.171.91.16])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id DA99A2200FD;
 Fri,  4 Mar 2022 09:36:48 +0100 (CET)
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
Subject: [PATCH v3 02/11] ARM: dts: aspeed: Adjust "reg" property of FMC/SPI
 controllers
Date: Fri,  4 Mar 2022 09:36:34 +0100
Message-Id: <20220304083643.1079142-3-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220304083643.1079142-1-clg@kaod.org>
References: <20220304083643.1079142-1-clg@kaod.org>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: qC6AbQvSAZX2MND-QXwovoy0MMzaMKbm
X-Proofpoint-GUID: VYweexoNYkTGZZVQarP9WR1cUQcJ-xzF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-04_02,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 mlxscore=0 impostorscore=0 phishscore=0
 mlxlogscore=650 adultscore=0 malwarescore=0 bulkscore=0 spamscore=0
 clxscore=1034 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203040044
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220304_083720_890778_C1553C2B 
X-CRM114-Status: GOOD (  13.18  )
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
bmcgS3VvIDxjaGluLXRpbmdfa3VvQGFzcGVlZHRlY2guY29tPgpUZXN0ZWQtYnk6IEpvZWwgU3Rh
bmxleSA8am9lbEBqbXMuaWQuYXU+ClRlc3RlZC1ieTogVGFvIFJlbiA8cmVudGFvLmJ1cHRAZ21h
aWwuY29tPgpTaWduZWQtb2ZmLWJ5OiBDw6lkcmljIExlIEdvYXRlciA8Y2xnQGthb2Qub3JnPgot
LS0KIGFyY2gvYXJtL2Jvb3QvZHRzL2FzcGVlZC1nNC5kdHNpIHwgNiArKy0tLS0KIGFyY2gvYXJt
L2Jvb3QvZHRzL2FzcGVlZC1nNS5kdHNpIHwgOSArKystLS0tLS0KIGFyY2gvYXJtL2Jvb3QvZHRz
L2FzcGVlZC1nNi5kdHNpIHwgOSArKystLS0tLS0KIDMgZmlsZXMgY2hhbmdlZCwgOCBpbnNlcnRp
b25zKCspLCAxNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9h
c3BlZWQtZzQuZHRzaSBiL2FyY2gvYXJtL2Jvb3QvZHRzL2FzcGVlZC1nNC5kdHNpCmluZGV4IGYx
NGRhY2UzNGM1YS4uOWFlNjdlODNjZjYwIDEwMDY0NAotLS0gYS9hcmNoL2FybS9ib290L2R0cy9h
c3BlZWQtZzQuZHRzaQorKysgYi9hcmNoL2FybS9ib290L2R0cy9hc3BlZWQtZzQuZHRzaQpAQCAt
NTQsOCArNTQsNyBAQCBhaGIgewogCQlyYW5nZXM7CiAKIAkJZm1jOiBzcGlAMWU2MjAwMDAgewot
CQkJcmVnID0gPCAweDFlNjIwMDAwIDB4OTQKLQkJCQkweDIwMDAwMDAwIDB4MTAwMDAwMDAgPjsK
KwkJCXJlZyA9IDwweDFlNjIwMDAwIDB4OTQ+LCA8MHgyMDAwMDAwMCAweDEwMDAwMDAwPjsKIAkJ
CSNhZGRyZXNzLWNlbGxzID0gPDE+OwogCQkJI3NpemUtY2VsbHMgPSA8MD47CiAJCQljb21wYXRp
YmxlID0gImFzcGVlZCxhc3QyNDAwLWZtYyI7CkBAIC05MSw4ICs5MCw3IEBAIGZsYXNoQDQgewog
CQl9OwogCiAJCXNwaTogc3BpQDFlNjMwMDAwIHsKLQkJCXJlZyA9IDwgMHgxZTYzMDAwMCAweDE4
Ci0JCQkJMHgzMDAwMDAwMCAweDEwMDAwMDAwID47CisJCQlyZWcgPSA8MHgxZTYzMDAwMCAweDE4
PiwgPDB4MzAwMDAwMDAgMHgxMDAwMDAwMD47CiAJCQkjYWRkcmVzcy1jZWxscyA9IDwxPjsKIAkJ
CSNzaXplLWNlbGxzID0gPDA+OwogCQkJY29tcGF0aWJsZSA9ICJhc3BlZWQsYXN0MjQwMC1zcGki
OwpkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vYm9vdC9kdHMvYXNwZWVkLWc1LmR0c2kgYi9hcmNoL2Fy
bS9ib290L2R0cy9hc3BlZWQtZzUuZHRzaQppbmRleCA3NDk1ZjkzYzUwNjkuLmMzZTBhOGUxM2M4
YSAxMDA2NDQKLS0tIGEvYXJjaC9hcm0vYm9vdC9kdHMvYXNwZWVkLWc1LmR0c2kKKysrIGIvYXJj
aC9hcm0vYm9vdC9kdHMvYXNwZWVkLWc1LmR0c2kKQEAgLTU1LDggKzU1LDcgQEAgYWhiIHsKIAkJ
cmFuZ2VzOwogCiAJCWZtYzogc3BpQDFlNjIwMDAwIHsKLQkJCXJlZyA9IDwgMHgxZTYyMDAwMCAw
eGM0Ci0JCQkJMHgyMDAwMDAwMCAweDEwMDAwMDAwID47CisJCQlyZWcgPSA8MHgxZTYyMDAwMCAw
eGM0PiwgPDB4MjAwMDAwMDAgMHgxMDAwMDAwMD47CiAJCQkjYWRkcmVzcy1jZWxscyA9IDwxPjsK
IAkJCSNzaXplLWNlbGxzID0gPDA+OwogCQkJY29tcGF0aWJsZSA9ICJhc3BlZWQsYXN0MjUwMC1m
bWMiOwpAQCAtODQsOCArODMsNyBAQCBmbGFzaEAyIHsKIAkJfTsKIAogCQlzcGkxOiBzcGlAMWU2
MzAwMDAgewotCQkJcmVnID0gPCAweDFlNjMwMDAwIDB4YzQKLQkJCQkweDMwMDAwMDAwIDB4MDgw
MDAwMDAgPjsKKwkJCXJlZyA9IDwweDFlNjMwMDAwIDB4YzQ+LCA8MHgzMDAwMDAwMCAweDA4MDAw
MDAwPjsKIAkJCSNhZGRyZXNzLWNlbGxzID0gPDE+OwogCQkJI3NpemUtY2VsbHMgPSA8MD47CiAJ
CQljb21wYXRpYmxlID0gImFzcGVlZCxhc3QyNTAwLXNwaSI7CkBAIC0xMDYsOCArMTA0LDcgQEAg
Zmxhc2hAMSB7CiAJCX07CiAKIAkJc3BpMjogc3BpQDFlNjMxMDAwIHsKLQkJCXJlZyA9IDwgMHgx
ZTYzMTAwMCAweGM0Ci0JCQkJMHgzODAwMDAwMCAweDA4MDAwMDAwID47CisJCQlyZWcgPSA8MHgx
ZTYzMTAwMCAweGM0PiwgPDB4MzgwMDAwMDAgMHgwODAwMDAwMD47CiAJCQkjYWRkcmVzcy1jZWxs
cyA9IDwxPjsKIAkJCSNzaXplLWNlbGxzID0gPDA+OwogCQkJY29tcGF0aWJsZSA9ICJhc3BlZWQs
YXN0MjUwMC1zcGkiOwpkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vYm9vdC9kdHMvYXNwZWVkLWc2LmR0
c2kgYi9hcmNoL2FybS9ib290L2R0cy9hc3BlZWQtZzYuZHRzaQppbmRleCBjMzJlODdmYWQ0ZGMu
LjFhZDA1ZGRlMTlkMiAxMDA2NDQKLS0tIGEvYXJjaC9hcm0vYm9vdC9kdHMvYXNwZWVkLWc2LmR0
c2kKKysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvYXNwZWVkLWc2LmR0c2kKQEAgLTk1LDggKzk1LDcg
QEAgZ2ljOiBpbnRlcnJ1cHQtY29udHJvbGxlckA0MDQ2MTAwMCB7CiAJCQl9OwogCiAJCWZtYzog
c3BpQDFlNjIwMDAwIHsKLQkJCXJlZyA9IDwgMHgxZTYyMDAwMCAweGM0Ci0JCQkJMHgyMDAwMDAw
MCAweDEwMDAwMDAwID47CisJCQlyZWcgPSA8MHgxZTYyMDAwMCAweGM0PiwgPDB4MjAwMDAwMDAg
MHgxMDAwMDAwMD47CiAJCQkjYWRkcmVzcy1jZWxscyA9IDwxPjsKIAkJCSNzaXplLWNlbGxzID0g
PDA+OwogCQkJY29tcGF0aWJsZSA9ICJhc3BlZWQsYXN0MjYwMC1mbWMiOwpAQCAtMTI0LDggKzEy
Myw3IEBAIGZsYXNoQDIgewogCQl9OwogCiAJCXNwaTE6IHNwaUAxZTYzMDAwMCB7Ci0JCQlyZWcg
PSA8IDB4MWU2MzAwMDAgMHhjNAotCQkJCTB4MzAwMDAwMDAgMHgxMDAwMDAwMCA+OworCQkJcmVn
ID0gPDB4MWU2MzAwMDAgMHhjND4sIDwweDMwMDAwMDAwIDB4MTAwMDAwMDA+OwogCQkJI2FkZHJl
c3MtY2VsbHMgPSA8MT47CiAJCQkjc2l6ZS1jZWxscyA9IDwwPjsKIAkJCWNvbXBhdGlibGUgPSAi
YXNwZWVkLGFzdDI2MDAtc3BpIjsKQEAgLTE0Niw4ICsxNDQsNyBAQCBmbGFzaEAxIHsKIAkJfTsK
IAogCQlzcGkyOiBzcGlAMWU2MzEwMDAgewotCQkJcmVnID0gPCAweDFlNjMxMDAwIDB4YzQKLQkJ
CQkweDUwMDAwMDAwIDB4MTAwMDAwMDAgPjsKKwkJCXJlZyA9IDwweDFlNjMxMDAwIDB4YzQ+LCA8
MHg1MDAwMDAwMCAweDEwMDAwMDAwPjsKIAkJCSNhZGRyZXNzLWNlbGxzID0gPDE+OwogCQkJI3Np
emUtY2VsbHMgPSA8MD47CiAJCQljb21wYXRpYmxlID0gImFzcGVlZCxhc3QyNjAwLXNwaSI7Ci0t
IAoyLjM0LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
