Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC87AC433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Mar 2022 10:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x7BAwxqOn3B4aFQ+PcMhAZEUdkvsbIKhAdXbZ6Dazqc=; b=P8vzs4zeRxJLRQ
	u+LLHwlrS2tMMEgiOnjuUAziFjPdhazcaMZBYbjQGTpbt+JwD92va+mLRQg27ofAz7JMzzhMldMtf
	H07DRz4dKNCc7D6Adl68iLenIVL+EFhvJeH2dZTghUiCwqye1Elansfxsi/ZDFWz1woK0NEJgv7+4
	VMAJFYRHJNMP/DJw7Gq7qHBRb33+yQ8KEDka/B22PA0HACYYniTZJWlZkN7++0pA6zkM63SSR8OQG
	vIBqKIccex8Qz/z8mcGC8HTOVGv3VX53vWuilvBD53gEJ0rbakEY8dLPgkuc0tHcqXLSdc0TL17f7
	8B2cXKgqJJckKUKiXlZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nXgvo-001dtq-C2; Fri, 25 Mar 2022 10:12:32 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nXgsx-001cWI-DX; Fri, 25 Mar 2022 10:09:38 +0000
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22P8oIMP016467; 
 Fri, 25 Mar 2022 10:09:16 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3f0gnk1qrh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Mar 2022 10:09:16 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22P9w5Ql004280;
 Fri, 25 Mar 2022 10:09:13 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma03ams.nl.ibm.com with ESMTP id 3ew6t94x4f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Mar 2022 10:09:13 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 22PA9Bq149348926
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 25 Mar 2022 10:09:11 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8E84011C04A;
 Fri, 25 Mar 2022 10:09:11 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E24A211C04C;
 Fri, 25 Mar 2022 10:09:10 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Fri, 25 Mar 2022 10:09:10 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.95.248])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 4A760220158;
 Fri, 25 Mar 2022 11:09:09 +0100 (CET)
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
 Potin Lai <potin.lai@quantatw.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH v4 11/11] mtd: spi-nor: aspeed: set the decoding size to at
 least 2MB for AST2600
Date: Fri, 25 Mar 2022 11:08:49 +0100
Message-Id: <20220325100849.2019209-12-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220325100849.2019209-1-clg@kaod.org>
References: <20220325100849.2019209-1-clg@kaod.org>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: dLn_uyNuaBgXXxkKZwl1H-aVA55JLQjM
X-Proofpoint-ORIG-GUID: dLn_uyNuaBgXXxkKZwl1H-aVA55JLQjM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-25_02,2022-03-24_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 phishscore=0 spamscore=0 bulkscore=0 priorityscore=1501 mlxscore=0
 mlxlogscore=896 clxscore=1034 suspectscore=0 malwarescore=0 adultscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203250057
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220325_030935_573048_F4388D4D 
X-CRM114-Status: GOOD (  16.77  )
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

RnJvbTogUG90aW4gTGFpIDxwb3Rpbi5sYWlAcXVhbnRhdHcuY29tPgoKSW4gQVNUMjYwMCwgdGhl
IHVuaXQgb2YgU1BJIENFeCBkZWNvZGluZyByYW5nZSByZWdpc3RlciBpcyAxTUIsIGFuZCBlbmQK
YWRkcmVzcyBvZmZzZXQgaXMgc2V0IHRvIHRoZSBhY2N0dWFsIG9mZnNldCAtIDFNQi4gSWYgdGhl
IGZsYXNoIG9ubHkgaGFzCjFNQiwgdGhlIGVuZCBhZGRyZXNzIHdpbGwgaGFzIHNhbWUgdmFsdWUg
YXMgc3RhcnQgYWRkcmVzcywgd2hpY2ggd2lsbApjYXVzaW5nIHVuZXhwZWN0ZWQgZXJyb3JzLgoK
VGhpcyBwYXRjaCBzZXQgdGhlIGRlY29kaW5nIHNpemUgdG8gYXQgbGVhc3QgMk1CIHRvIGF2b2lk
IGRlY29kaW5nIGVycm9ycy4KClRlc3RlZDoKcm9vdEBibGV0Y2hsZXk6fiMgZG1lc2cgfCBncmVw
ICJhc3BlZWQtc21jIDFlNjMxMDAwLnNwaTogQ0UwIHdpbmRvdyIKWyAgIDU5LjMyODEzNF0gYXNw
ZWVkLXNtYyAxZTYzMTAwMC5zcGk6IENFMCB3aW5kb3cgcmVzaXplZCB0byAyTUIgKEFTVDI2MDAg
RGVjb2RpbmcpClsgICA1OS4zNDMwMDFdIGFzcGVlZC1zbWMgMWU2MzEwMDAuc3BpOiBDRTAgd2lu
ZG93IFsgMHg1MDAwMDAwMCAtIDB4NTAyMDAwMDAgXSAyTUIKcm9vdEBibGV0Y2hsZXk6fiMgZGV2
bWVtIDB4MWU2MzEwMzAKMHgwMDEwMDAwMAoKU2lnbmVkLW9mZi1ieTogUG90aW4gTGFpIDxwb3Rp
bi5sYWlAcXVhbnRhdHcuY29tPgpbIGNsZyA6IFBvcnRlZCBvbiBuZXcgc3BpLW1lbSBkcml2ZXIg
XQpTaWduZWQtb2ZmLWJ5OiBDw6lkcmljIExlIEdvYXRlciA8Y2xnQGthb2Qub3JnPgotLS0KIGRy
aXZlcnMvc3BpL3NwaS1hc3BlZWQtc21jLmMgfCAxMyArKysrKysrKysrKysrCiAxIGZpbGUgY2hh
bmdlZCwgMTMgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvc3BpL3NwaS1hc3Bl
ZWQtc21jLmMgYi9kcml2ZXJzL3NwaS9zcGktYXNwZWVkLXNtYy5jCmluZGV4IDY2MDQ1MTY2N2Ez
OS4uMjI3Nzk3ZTEzOTk3IDEwMDY0NAotLS0gYS9kcml2ZXJzL3NwaS9zcGktYXNwZWVkLXNtYy5j
CisrKyBiL2RyaXZlcnMvc3BpL3NwaS1hc3BlZWQtc21jLmMKQEAgLTQ2Niw2ICs0NjYsOCBAQCBz
dGF0aWMgaW50IGFzcGVlZF9zcGlfc2V0X3dpbmRvdyhzdHJ1Y3QgYXNwZWVkX3NwaSAqYXNwaSwK
ICAqICAgaXMgY29ycmVjdC4KICAqLwogc3RhdGljIGNvbnN0IHN0cnVjdCBhc3BlZWRfc3BpX2Rh
dGEgYXN0MjUwMF9zcGlfZGF0YTsKK3N0YXRpYyBjb25zdCBzdHJ1Y3QgYXNwZWVkX3NwaV9kYXRh
IGFzdDI2MDBfc3BpX2RhdGE7CitzdGF0aWMgY29uc3Qgc3RydWN0IGFzcGVlZF9zcGlfZGF0YSBh
c3QyNjAwX2ZtY19kYXRhOwogCiBzdGF0aWMgaW50IGFzcGVlZF9zcGlfY2hpcF9hZGp1c3Rfd2lu
ZG93KHN0cnVjdCBhc3BlZWRfc3BpX2NoaXAgKmNoaXAsCiAJCQkJCSB1MzIgbG9jYWxfb2Zmc2V0
LCB1MzIgc2l6ZSkKQEAgLTQ4OSw2ICs0OTEsMTcgQEAgc3RhdGljIGludCBhc3BlZWRfc3BpX2No
aXBfYWRqdXN0X3dpbmRvdyhzdHJ1Y3QgYXNwZWVkX3NwaV9jaGlwICpjaGlwLAogCQkJIGNoaXAt
PmNzLCBzaXplID4+IDIwKTsKIAl9CiAKKwkvKgorCSAqIFRoZSBkZWNvZGluZyBzaXplIG9mIEFT
VDI2MDAgU1BJIGNvbnRyb2xsZXIgc2hvdWxkIHNldCBhdAorCSAqIGxlYXN0IDJNQi4KKwkgKi8K
KwlpZiAoKGFzcGktPmRhdGEgPT0gJmFzdDI2MDBfc3BpX2RhdGEgfHwgYXNwaS0+ZGF0YSA9PSAm
YXN0MjYwMF9mbWNfZGF0YSkgJiYKKwkgICAgc2l6ZSA8IFNaXzJNKSB7CisJCXNpemUgPSBTWl8y
TTsKKwkJZGV2X2luZm8oYXNwaS0+ZGV2LCAiQ0UlZCB3aW5kb3cgcmVzaXplZCB0byAlZE1CIChB
U1QyNjAwIERlY29kaW5nKSIsCisJCQkgY2hpcC0+Y3MsIHNpemUgPj4gMjApOworCX0KKwogCWFz
cGVlZF9zcGlfZ2V0X3dpbmRvd3MoYXNwaSwgd2luZG93cyk7CiAKIAkvKiBBZGp1c3QgdGhpcyBj
aGlwIHdpbmRvdyAqLwotLSAKMi4zNC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlz
dApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
