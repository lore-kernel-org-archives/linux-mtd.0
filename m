Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01274C433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Feb 2022 10:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O1m0g/T2auQ0VYqvmpsE/4mH66aFyEpiNmi/j8A6W5A=; b=dJ7DGaEnnpei02
	psz1YFZi4Fb88Auo6/1sNqT67oyxhOPDKyTt6uTZWQzLVDUKVNVkgh5PQuVCv7AA2gYRwKPLEXxWa
	qeSEF2uCRBo/tb99Df9DIQiOI6+qaqiRe4xNFOGT8fozgpgKwBB30rocQOw1EuZtxDcvCpriuyC/d
	A5xQ/pboWaUaTKVYcSXpKEnhi1l0SPqontB4mAJmg4MkJdHaMm1/IWcwZ4/e1CaQNz+cDf59sDxUb
	RLY1/MVVoBpv0tNRmQzNn55KSraaKcI0ZcuZVN1iJ6+h7HYBBfkcK00FMjfQcm/uQKbvVf2o5kX8X
	rWIwDWtGmIIrhpQFwGow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJYZ6-00EVJQ-U3; Mon, 14 Feb 2022 10:26:41 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJXt8-00EJ3X-T2; Mon, 14 Feb 2022 09:43:22 +0000
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21E7LdkY020363; 
 Mon, 14 Feb 2022 09:42:52 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3e7d0jgwt6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Feb 2022 09:42:51 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21E9biex021905;
 Mon, 14 Feb 2022 09:42:50 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma06ams.nl.ibm.com with ESMTP id 3e645jbjt9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Feb 2022 09:42:50 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21E9glRs47055116
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 14 Feb 2022 09:42:47 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8555EA405B;
 Mon, 14 Feb 2022 09:42:47 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CFC96A406F;
 Mon, 14 Feb 2022 09:42:46 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Mon, 14 Feb 2022 09:42:46 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.60.190])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 5080A2201DE;
 Mon, 14 Feb 2022 10:42:45 +0100 (CET)
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
Subject: [PATCH 06/10] spi: aspeed: Workaround AST2500 limitations
Date: Mon, 14 Feb 2022 10:42:27 +0100
Message-Id: <20220214094231.3753686-7-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220214094231.3753686-1-clg@kaod.org>
References: <20220214094231.3753686-1-clg@kaod.org>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: gBnuaXrjM3F9pQMmir6ztSVgmiCYgopY
X-Proofpoint-GUID: gBnuaXrjM3F9pQMmir6ztSVgmiCYgopY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-14_01,2022-02-14_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 mlxlogscore=947
 adultscore=0 spamscore=0 clxscore=1034 bulkscore=0 priorityscore=1501
 mlxscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202140058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_014319_130337_3745B9BA 
X-CRM114-Status: GOOD (  16.02  )
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

SXQgaXMgbm90IHBvc3NpYmxlIHRvIGNvbmZpZ3VyZSBhIGZ1bGwgMTI4TUIgd2luZG93IGZvciBh
IGNoaXAgb2YgdGhlCnNhbWUgc2l6ZSBvbiB0aGUgQVNUMjUwMCBTUEkgY29udHJvbGxlci4gRm9y
IGhpcyBjYXNlLCB0aGUgbWF4aW11bQp3aW5kb3cgc2l6ZSBpcyByZXN0cmljdGVkIHRvIDEyME1C
IGZvciBDRTAuCgpTaWduZWQtb2ZmLWJ5OiBDw6lkcmljIExlIEdvYXRlciA8Y2xnQGthb2Qub3Jn
PgotLS0KIGRyaXZlcnMvc3BpL3NwaS1hc3BlZWQtc21jLmMgfCAxMiArKysrKysrKysrKysKIDEg
ZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9zcGkv
c3BpLWFzcGVlZC1zbWMuYyBiL2RyaXZlcnMvc3BpL3NwaS1hc3BlZWQtc21jLmMKaW5kZXggOWM0
ZWFjZmVkNzJjLi5jNmFjMzI1M2Q3ZDUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvc3BpL3NwaS1hc3Bl
ZWQtc21jLmMKKysrIGIvZHJpdmVycy9zcGkvc3BpLWFzcGVlZC1zbWMuYwpAQCAtNDY2LDYgKzQ2
Niw4IEBAIHN0YXRpYyBpbnQgYXNwZWVkX3NwaV9zZXRfd2luZG93KHN0cnVjdCBhc3BlZWRfc3Bp
ICphc3BpLAogICogLSBpb3JlbWFwIGVhY2ggd2luZG93LCBub3Qgc3RyaWN0bHkgbmVjZXNzYXJ5
IHNpbmNlIHRoZSBvdmVyYWxsIHdpbmRvdwogICogICBpcyBjb3JyZWN0LgogICovCitzdGF0aWMg
Y29uc3Qgc3RydWN0IGFzcGVlZF9zcGlfZGF0YSBhc3QyNTAwX3NwaV9kYXRhOworCiBzdGF0aWMg
aW50IGFzcGVlZF9zcGlfY2hpcF9hZGp1c3Rfd2luZG93KHN0cnVjdCBhc3BlZWRfc3BpX2NoaXAg
KmNoaXAsCiAJCQkJCSB1MzIgbG9jYWxfb2Zmc2V0LCB1MzIgc2l6ZSkKIHsKQEAgLTQ3NCw2ICs0
NzYsMTYgQEAgc3RhdGljIGludCBhc3BlZWRfc3BpX2NoaXBfYWRqdXN0X3dpbmRvdyhzdHJ1Y3Qg
YXNwZWVkX3NwaV9jaGlwICpjaGlwLAogCXN0cnVjdCBhc3BlZWRfc3BpX3dpbmRvdyAqd2luID0g
JndpbmRvd3NbY2hpcC0+Y3NdOwogCWludCByZXQ7CiAKKwkvKgorCSAqIER1ZSB0byBhbiBIVyBp
c3N1ZSBvbiB0aGUgQVNUMjUwMCBTUEkgY29udHJvbGxlciwgdGhlIENFMAorCSAqIHdpbmRvdyBz
aXplIHNob3VsZCBiZSBzbWFsbGVyIHRoYW4gdGhlIG1heGltdW0gMTI4TUIuCisJICovCisJaWYg
KGFzcGktPmRhdGEgPT0gJmFzdDI1MDBfc3BpX2RhdGEgJiYgY2hpcC0+Y3MgPT0gMCAmJiBzaXpl
ID09IFNaXzEyOE0pIHsKKwkJc2l6ZSA9IDEyMCA8PCAyMDsKKwkJZGV2X2luZm8oYXNwaS0+ZGV2
LCAiQ0UlZCB3aW5kb3cgcmVzaXplZCB0byAlZE1CIChBU1QyNTAwIEhXIHF1aXJrKSIsCisJCQkg
Y2hpcC0+Y3MsIHNpemUgPj4gMjApOworCX0KKwogCWFzcGVlZF9zcGlfZ2V0X3dpbmRvd3MoYXNw
aSwgd2luZG93cyk7CiAKIAkvKiBBZGp1c3QgdGhpcyBjaGlwIHdpbmRvdyAqLwotLSAKMi4zNC4x
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
