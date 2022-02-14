Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B13CC433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Feb 2022 10:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0F5hfZX+7vVg01+7Cc3Tu/6C5QC3qZAsNl4sOkDfc3A=; b=DCO13ps/aX0by1
	whNYy8Gddyfwe9X06kr9OyMQ54a9t6J7xbWfYNzjeg2IKdITUbBIX/5Y5nq7ErXBnzTFKW7eRrTkd
	E2WeHsINdw6+JQSyhUaunAbHgBXzk9rkC4kqW0Wk3s4vPINkCvWJvy6BxJWQsKQdcCcAo14AlJhzw
	lCiGir/9RwEeJx69wyKC0sSFpcH9Wwfj7lMjgjhSpwk2ZJz3Bia3abNmRQaoHpZggDXEliaO7Ea5J
	K1qS7oMkwdR4TLWo/GsPsO079vX5LtLiPF2IR5d75at6iaW4VyeY4pYDKYr7hehFEJwlE5o4vAJU+
	A+AhDLO+o0BWYN7XsTCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJYBP-00EOGY-HO; Mon, 14 Feb 2022 10:02:12 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJXt2-00EJ2F-IH; Mon, 14 Feb 2022 09:43:16 +0000
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21E7cXtS003354; 
 Mon, 14 Feb 2022 09:42:53 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e7dvm06ct-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Feb 2022 09:42:53 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21E9bkhQ002577;
 Mon, 14 Feb 2022 09:42:51 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma03fra.de.ibm.com with ESMTP id 3e64h9jrft-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Feb 2022 09:42:51 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21E9gmkp38797662
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 14 Feb 2022 09:42:49 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CEE1FA4055;
 Mon, 14 Feb 2022 09:42:48 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 37CF9A4040;
 Mon, 14 Feb 2022 09:42:48 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Mon, 14 Feb 2022 09:42:48 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.60.190])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id C984A2201E5;
 Mon, 14 Feb 2022 10:42:46 +0100 (CET)
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
Subject: [PATCH 07/10] spi: aspeed: Add support for the AST2400 SPI controller
Date: Mon, 14 Feb 2022 10:42:28 +0100
Message-Id: <20220214094231.3753686-8-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220214094231.3753686-1-clg@kaod.org>
References: <20220214094231.3753686-1-clg@kaod.org>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: _0RwvAi9IPxVlAqUDd93ID1x2tjNVpRL
X-Proofpoint-ORIG-GUID: _0RwvAi9IPxVlAqUDd93ID1x2tjNVpRL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-14_02,2022-02-14_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1034 mlxscore=0
 impostorscore=0 phishscore=0 suspectscore=0 spamscore=0 mlxlogscore=999
 adultscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202140058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_014312_914576_CE51FBC6 
X-CRM114-Status: GOOD (  21.33  )
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

RXh0ZW5kIHRoZSBkcml2ZXIgZm9yIHRoZSBBU1QyNDAwIFNQSSBGbGFzaCBDb250cm9sbGVyIChT
UEkpLiBUaGlzCmNvbnRyb2xsZXIgaGFzIGEgc2xpZ2h0bHkgZGlmZmVyZW50IGludGVyZmFjZSB3
aGljaCByZXF1aXJlcwphZGFwdGF0aW9uIG9mIHRoZSA0QiBoYW5kbGluZy4gU3VtbWFyeSBvZiBm
ZWF0dXJlcyA6CgogICAuIGhvc3QgRmlybXdhcmUKICAgLiAxIGNoaXAgc2VsZWN0IHBpbiAoQ0Uw
KQogICAuIHNsaWdodGx5IGRpZmZlcmVudCByZWdpc3RlciBzZXQsIGJldHdlZW4gQVNUMjUwMCBh
bmQgdGhlIGxlZ2FjeQogICAgIGNvbnRyb2xsZXIKICAgLiBubyBzZWdtZW50IHJlZ2lzdGVycwog
ICAuIHNpbmdsZSwgZHVhbCBtb2RlLgoKU2lnbmVkLW9mZi1ieTogQ8OpZHJpYyBMZSBHb2F0ZXIg
PGNsZ0BrYW9kLm9yZz4KLS0tCiBkcml2ZXJzL3NwaS9zcGktYXNwZWVkLXNtYy5jIHwgMzMgKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKystCiAxIGZpbGUgY2hhbmdlZCwgMzIgaW5zZXJ0
aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvc3BpL3NwaS1hc3Bl
ZWQtc21jLmMgYi9kcml2ZXJzL3NwaS9zcGktYXNwZWVkLXNtYy5jCmluZGV4IGM2YWMzMjUzZDdk
NS4uZTQ0ZTgwYmFiNTBmIDEwMDY0NAotLS0gYS9kcml2ZXJzL3NwaS9zcGktYXNwZWVkLXNtYy5j
CisrKyBiL2RyaXZlcnMvc3BpL3NwaS1hc3BlZWQtc21jLmMKQEAgLTMyLDYgKzMyLDcgQEAKICNk
ZWZpbmUgICBDVFJMX0lPX0RVQUxfREFUQQkJQklUKDI5KQogI2RlZmluZSAgIENUUkxfSU9fUVVB
RF9EQVRBCQlCSVQoMzApCiAjZGVmaW5lICAgQ1RSTF9DT01NQU5EX1NISUZUCQkxNgorI2RlZmlu
ZSAgIENUUkxfSU9fQUREUkVTU180QgkJQklUKDEzKQkvKiBBU1QyNDAwIFNQSSBvbmx5ICovCiAj
ZGVmaW5lICAgQ1RSTF9JT19EVU1NWV9TRVQoZHVtbXkpCQkJCQlcCiAJKCgoKChkdW1teSkgPj4g
MikgJiAweDEpIDw8IDE0KSB8ICgoKGR1bW15KSAmIDB4MykgPDwgNikpCiAjZGVmaW5lICAgQ1RS
TF9DRV9TVE9QX0FDVElWRQkJQklUKDIpCkBAIC0yOTMsNiArMjk0LDggQEAgc3RhdGljIGJvb2wg
YXNwZWVkX3NwaV9zdXBwb3J0c19vcChzdHJ1Y3Qgc3BpX21lbSAqbWVtLCBjb25zdCBzdHJ1Y3Qg
c3BpX21lbV9vcAogCXJldHVybiB0cnVlOwogfQogCitzdGF0aWMgY29uc3Qgc3RydWN0IGFzcGVl
ZF9zcGlfZGF0YSBhc3QyNDAwX3NwaV9kYXRhOworCiBzdGF0aWMgaW50IGRvX2FzcGVlZF9zcGlf
ZXhlY19vcChzdHJ1Y3Qgc3BpX21lbSAqbWVtLCBjb25zdCBzdHJ1Y3Qgc3BpX21lbV9vcCAqb3Ap
CiB7CiAJc3RydWN0IGFzcGVlZF9zcGkgKmFzcGkgPSBzcGlfY29udHJvbGxlcl9nZXRfZGV2ZGF0
YShtZW0tPnNwaS0+bWFzdGVyKTsKQEAgLTMyMiw2ICszMjUsOSBAQCBzdGF0aWMgaW50IGRvX2Fz
cGVlZF9zcGlfZXhlY19vcChzdHJ1Y3Qgc3BpX21lbSAqbWVtLCBjb25zdCBzdHJ1Y3Qgc3BpX21l
bV9vcCAqbwogCQkJYWRkcl9tb2RlIHw9ICgweDExIDw8IGNoaXAtPmNzKTsKIAkJZWxzZQogCQkJ
YWRkcl9tb2RlICY9IH4oMHgxMSA8PCBjaGlwLT5jcyk7CisKKwkJaWYgKG9wLT5hZGRyLm5ieXRl
cyA9PSA0ICYmIGNoaXAtPmFzcGktPmRhdGEgPT0gJmFzdDI0MDBfc3BpX2RhdGEpCisJCQljdGxf
dmFsIHw9IENUUkxfSU9fQUREUkVTU180QjsKIAl9CiAKIAlpZiAob3AtPmR1bW15LmJ1c3dpZHRo
ICYmIG9wLT5kdW1teS5uYnl0ZXMpCkBAIC00MTMsNyArNDE5LDEzIEBAIHN0YXRpYyBpbnQgYXNw
ZWVkX3NwaV9jaGlwX3NldF9kZWZhdWx0X3dpbmRvdyhzdHJ1Y3QgYXNwZWVkX3NwaV9jaGlwICpj
aGlwKQogCXN0cnVjdCBhc3BlZWRfc3BpX3dpbmRvdyB3aW5kb3dzW0FTUEVFRF9TUElfTUFYX05V
TV9DU10gPSB7IDAgfTsKIAlzdHJ1Y3QgYXNwZWVkX3NwaV93aW5kb3cgKndpbiA9ICZ3aW5kb3dz
W2NoaXAtPmNzXTsKIAotCWFzcGVlZF9zcGlfZ2V0X3dpbmRvd3MoYXNwaSwgd2luZG93cyk7CisJ
LyogTm8gc2VnbWVudCByZWdpc3RlcnMgZm9yIHRoZSBBU1QyNDAwIFNQSSBjb250cm9sbGVyICov
CisJaWYgKGFzcGktPmRhdGEgPT0gJmFzdDI0MDBfc3BpX2RhdGEpIHsKKwkJd2luLT5vZmZzZXQg
PSAwOworCQl3aW4tPnNpemUgPSBhc3BpLT5haGJfd2luZG93X3NpemU7CisJfSBlbHNlIHsKKwkJ
YXNwZWVkX3NwaV9nZXRfd2luZG93cyhhc3BpLCB3aW5kb3dzKTsKKwl9CiAKIAljaGlwLT5haGJf
YmFzZSA9IGFzcGktPmFoYl9iYXNlICsgd2luLT5vZmZzZXQ7CiAJY2hpcC0+YWhiX3dpbmRvd19z
aXplID0gd2luLT5zaXplOwpAQCAtNDc2LDYgKzQ4OCwxMCBAQCBzdGF0aWMgaW50IGFzcGVlZF9z
cGlfY2hpcF9hZGp1c3Rfd2luZG93KHN0cnVjdCBhc3BlZWRfc3BpX2NoaXAgKmNoaXAsCiAJc3Ry
dWN0IGFzcGVlZF9zcGlfd2luZG93ICp3aW4gPSAmd2luZG93c1tjaGlwLT5jc107CiAJaW50IHJl
dDsKIAorCS8qIE5vIHNlZ21lbnQgcmVnaXN0ZXJzIGZvciB0aGUgQVNUMjQwMCBTUEkgY29udHJv
bGxlciAqLworCWlmIChhc3BpLT5kYXRhID09ICZhc3QyNDAwX3NwaV9kYXRhKQorCQlyZXR1cm4g
MDsKKwogCS8qCiAJICogRHVlIHRvIGFuIEhXIGlzc3VlIG9uIHRoZSBBU1QyNTAwIFNQSSBjb250
cm9sbGVyLCB0aGUgQ0UwCiAJICogd2luZG93IHNpemUgc2hvdWxkIGJlIHNtYWxsZXIgdGhhbiB0
aGUgbWF4aW11bSAxMjhNQi4KQEAgLTU2MCw2ICs1NzYsMTIgQEAgc3RhdGljIGludCBhc3BlZWRf
c3BpX2Rpcm1hcF9jcmVhdGUoc3RydWN0IHNwaV9tZW1fZGlybWFwX2Rlc2MgKmRlc2MpCiAJCWVs
c2UKIAkJCWFkZHJfbW9kZSAmPSB+KDB4MTEgPDwgY2hpcC0+Y3MpOwogCQl3cml0ZWwoYWRkcl9t
b2RlLCBhc3BpLT5yZWdzICsgQ0VfQ1RSTF9SRUcpOworCisJCS8qIEFTVDI0MDAgU1BJIGNvbnRy
b2xsZXIgc2V0cyA0QllURSBhZGRyZXNzIG1vZGUgaW4KKwkJICogQ0UwIENvbnRyb2wgUmVnaXN0
ZXIKKwkJICovCisJCWlmIChvcC0+YWRkci5uYnl0ZXMgPT0gNCAmJiBjaGlwLT5hc3BpLT5kYXRh
ID09ICZhc3QyNDAwX3NwaV9kYXRhKQorCQkJY3RsX3ZhbCB8PSBDVFJMX0lPX0FERFJFU1NfNEI7
CiAJfQogCiAJLyogUkVBRCBtb2RlIGlzIHRoZSBjb250cm9sbGVyIGRlZmF1bHQgc2V0dGluZyAq
LwpAQCAtODYwLDYgKzg4MiwxNCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGFzcGVlZF9zcGlfZGF0
YSBhc3QyNDAwX2ZtY19kYXRhID0gewogCS5zZWdtZW50X3JlZyAgID0gYXNwZWVkX3NwaV9zZWdt
ZW50X3JlZywKIH07CiAKK3N0YXRpYyBjb25zdCBzdHJ1Y3QgYXNwZWVkX3NwaV9kYXRhIGFzdDI0
MDBfc3BpX2RhdGEgPSB7CisJLm1heF9jcwkgICAgICAgPSAxLAorCS5oYXN0eXBlICAgICAgID0g
ZmFsc2UsCisJLndlMAkgICAgICAgPSAwLAorCS5jdGwwCSAgICAgICA9IDB4MDQsCisJLyogTm8g
c2VnbWVudCByZWdpc3RlcnMgKi8KK307CisKIHN0YXRpYyBjb25zdCBzdHJ1Y3QgYXNwZWVkX3Nw
aV9kYXRhIGFzdDI1MDBfZm1jX2RhdGEgPSB7CiAJLm1heF9jcwkgICAgICAgPSAzLAogCS5oYXN0
eXBlICAgICAgID0gdHJ1ZSwKQEAgLTkwNCw2ICs5MzQsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0
IGFzcGVlZF9zcGlfZGF0YSBhc3QyNjAwX3NwaV9kYXRhID0gewogCiBzdGF0aWMgY29uc3Qgc3Ry
dWN0IG9mX2RldmljZV9pZCBhc3BlZWRfc3BpX21hdGNoZXNbXSA9IHsKIAl7IC5jb21wYXRpYmxl
ID0gImFzcGVlZCxhc3QyNDAwLWZtYyIsIC5kYXRhID0gJmFzdDI0MDBfZm1jX2RhdGEgfSwKKwl7
IC5jb21wYXRpYmxlID0gImFzcGVlZCxhc3QyNDAwLXNwaSIsIC5kYXRhID0gJmFzdDI0MDBfc3Bp
X2RhdGEgfSwKIAl7IC5jb21wYXRpYmxlID0gImFzcGVlZCxhc3QyNTAwLWZtYyIsIC5kYXRhID0g
JmFzdDI1MDBfZm1jX2RhdGEgfSwKIAl7IC5jb21wYXRpYmxlID0gImFzcGVlZCxhc3QyNTAwLXNw
aSIsIC5kYXRhID0gJmFzdDI1MDBfc3BpX2RhdGEgfSwKIAl7IC5jb21wYXRpYmxlID0gImFzcGVl
ZCxhc3QyNjAwLWZtYyIsIC5kYXRhID0gJmFzdDI2MDBfZm1jX2RhdGEgfSwKLS0gCjIuMzQuMQoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
