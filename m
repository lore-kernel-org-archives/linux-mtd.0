Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18785C433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Mar 2022 10:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e0+fxzb7nRcNh9J40gIwbU+2z0hLpKSBeKbIsZcF140=; b=dfsTwPume/PzVG
	28bSTQ9qlJaiLfFQLmFsPP08qtHrEo2iiibhSC/IqLkJ3XFiz7EKPGR3HaKPkOKYSmtCDwSjB41kl
	gNzgvSdAd0b77bVjQPRm9aFS8f00NXqE8ZYCKczzmPl/9to+CsYrhaG8N2PNcND5Q4cAxie3H98Mt
	80OM94h+1/Z4AwDWOOAVbYYOg8x9fmOx2vAKkL1/agogHfVJTTIlbAK5waAiC9qZ8gJYaszbnBaIE
	s77OepCM7iE+MTjxl4v7lgRshBliWX0J/51CoqXlETTALUbqMNixR/MGDXCTnp/FyklcAxhwkFG0S
	KLUgoOT8u0F4ImAP7vZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nXgte-001cwt-Bp; Fri, 25 Mar 2022 10:10:18 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nXgsv-001cUW-De; Fri, 25 Mar 2022 10:09:35 +0000
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22P7K5Fd012530; 
 Fri, 25 Mar 2022 10:09:06 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3f0sd4e306-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Mar 2022 10:09:05 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 22P9hYLl007011;
 Fri, 25 Mar 2022 10:09:05 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3f0sd4e2ye-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Mar 2022 10:09:05 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22P9wD41004638;
 Fri, 25 Mar 2022 10:09:03 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma03ams.nl.ibm.com with ESMTP id 3ew6t94x40-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Mar 2022 10:09:03 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 22PA90Nv53608896
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 25 Mar 2022 10:09:00 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B8FF5A4040;
 Fri, 25 Mar 2022 10:09:00 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 14B4BA404D;
 Fri, 25 Mar 2022 10:09:00 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Fri, 25 Mar 2022 10:09:00 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.95.248])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 5E366220121;
 Fri, 25 Mar 2022 11:08:58 +0100 (CET)
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
Subject: [PATCH v4 04/11] spi: aspeed: Add support for direct mapping
Date: Fri, 25 Mar 2022 11:08:42 +0100
Message-Id: <20220325100849.2019209-5-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220325100849.2019209-1-clg@kaod.org>
References: <20220325100849.2019209-1-clg@kaod.org>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: auwhFV9zKQbVaVEFIE41naOGPyXyMTbM
X-Proofpoint-ORIG-GUID: tKiyv61eRBg-lxy0Gu0UUr6IIQBxAMMB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-25_02,2022-03-24_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0
 suspectscore=0 mlxlogscore=999 bulkscore=0 priorityscore=1501
 clxscore=1034 impostorscore=0 phishscore=0 mlxscore=0 lowpriorityscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203250057
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220325_030933_641662_B4E090C5 
X-CRM114-Status: GOOD (  22.01  )
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

VXNlIGRpcmVjdCBtYXBwaW5nIHRvIHJlYWQgdGhlIGZsYXNoIGRldmljZSBjb250ZW50cy4gVGhp
cyBvcGVyYXRpb24KbW9kZSBpcyBjYWxsZWQgIkNvbW1hbmQgbW9kZSIgb24gQXNwZWVkIFNvQyBT
TUMgY29udHJvbGxlcnMuIEl0IHVzZXMgYQpDb250cm9sIFJlZ2lzdGVyIGZvciB0aGUgc2V0dGlu
Z3MgdG8gYXBwbHkgd2hlbiBhIG1lbW9yeSBvcGVyYXRpb24gaXMKcGVyZm9ybWVkIG9uIHRoZSBm
bGFzaCBkZXZpY2UgbWFwcGluZyB3aW5kb3cuCgpJZiB0aGUgd2luZG93IGlzIG5vdCBiaWcgZW5v
dWdoLCBmYWxsIGJhY2sgdG8gdGhlICJVc2VyIG1vZGUiIHRvCnBlcmZvcm0gdGhlIHJlYWQuCgpT
aW5jZSBkaXJlY3QgbWFwcGluZyBub3cgaGFuZGxlcyBhbGwgcmVhZHMgb2YgdGhlIGZsYXNoIGRl
dmljZQpjb250ZW50cywgYWxzbyB1c2UgbWVtY3B5X2Zyb21pbyBmb3Igb3RoZXIgYWRkcmVzcyBz
cGFjZXMsIHN1Y2ggYXMKU0ZEUC4KCkRpcmVjdCBtYXBwaW5nIGZvciB3cml0ZXMgd2lsbCBjb21l
IGxhdGVyIHdoZW4gdmFsaWRhdGVkLgoKUmV2aWV3ZWQtYnk6IEpvZWwgU3RhbmxleSA8am9lbEBq
bXMuaWQuYXU+ClRlc3RlZC1ieTogSm9lbCBTdGFubGV5IDxqb2VsQGptcy5pZC5hdT4KVGVzdGVk
LWJ5OiBUYW8gUmVuIDxyZW50YW8uYnVwdEBnbWFpbC5jb20+ClNpZ25lZC1vZmYtYnk6IEPDqWRy
aWMgTGUgR29hdGVyIDxjbGdAa2FvZC5vcmc+Ci0tLQogZHJpdmVycy9zcGkvc3BpLWFzcGVlZC1z
bWMuYyB8IDY3ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLQogMSBmaWxlIGNo
YW5nZWQsIDY1IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9zcGkvc3BpLWFzcGVlZC1zbWMuYyBiL2RyaXZlcnMvc3BpL3NwaS1hc3BlZWQtc21jLmMK
aW5kZXggOTk3ZWMyZTQ1MTE4Li4wOTUxNzY2YmFlZjQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvc3Bp
L3NwaS1hc3BlZWQtc21jLmMKKysrIGIvZHJpdmVycy9zcGkvc3BpLWFzcGVlZC1zbWMuYwpAQCAt
MzIyLDggKzMyMiw4IEBAIHN0YXRpYyBpbnQgZG9fYXNwZWVkX3NwaV9leGVjX29wKHN0cnVjdCBz
cGlfbWVtICptZW0sIGNvbnN0IHN0cnVjdCBzcGlfbWVtX29wICpvCiAJCWlmICghb3AtPmFkZHIu
bmJ5dGVzKQogCQkJcmV0ID0gYXNwZWVkX3NwaV9yZWFkX3JlZyhjaGlwLCBvcCk7CiAJCWVsc2UK
LQkJCXJldCA9IGFzcGVlZF9zcGlfcmVhZF91c2VyKGNoaXAsIG9wLCBvcC0+YWRkci52YWwsCi0J
CQkJCQkgICBvcC0+ZGF0YS5uYnl0ZXMsIG9wLT5kYXRhLmJ1Zi5pbik7CisJCQltZW1jcHlfZnJv
bWlvKG9wLT5kYXRhLmJ1Zi5pbiwgY2hpcC0+YWhiX2Jhc2UgKyBvcC0+YWRkci52YWwsCisJCQkJ
ICAgICAgb3AtPmRhdGEubmJ5dGVzKTsKIAl9IGVsc2UgewogCQlpZiAoIW9wLT5hZGRyLm5ieXRl
cykKIAkJCXJldCA9IGFzcGVlZF9zcGlfd3JpdGVfcmVnKGNoaXAsIG9wKTsKQEAgLTQwMywxMCAr
NDAzLDczIEBAIHN0YXRpYyBpbnQgYXNwZWVkX3NwaV9jaGlwX3NldF9kZWZhdWx0X3dpbmRvdyhz
dHJ1Y3QgYXNwZWVkX3NwaV9jaGlwICpjaGlwKQogCXJldHVybiBjaGlwLT5haGJfd2luZG93X3Np
emUgPyAwIDogLTE7CiB9CiAKK3N0YXRpYyBpbnQgYXNwZWVkX3NwaV9kaXJtYXBfY3JlYXRlKHN0
cnVjdCBzcGlfbWVtX2Rpcm1hcF9kZXNjICpkZXNjKQoreworCXN0cnVjdCBhc3BlZWRfc3BpICph
c3BpID0gc3BpX2NvbnRyb2xsZXJfZ2V0X2RldmRhdGEoZGVzYy0+bWVtLT5zcGktPm1hc3Rlcik7
CisJc3RydWN0IGFzcGVlZF9zcGlfY2hpcCAqY2hpcCA9ICZhc3BpLT5jaGlwc1tkZXNjLT5tZW0t
PnNwaS0+Y2hpcF9zZWxlY3RdOworCXN0cnVjdCBzcGlfbWVtX29wICpvcCA9ICZkZXNjLT5pbmZv
Lm9wX3RtcGw7CisJdTMyIGN0bF92YWw7CisJaW50IHJldCA9IDA7CisKKwljaGlwLT5jbGtfZnJl
cSA9IGRlc2MtPm1lbS0+c3BpLT5tYXhfc3BlZWRfaHo7CisKKwkvKiBPbmx5IGZvciByZWFkcyAq
LworCWlmIChvcC0+ZGF0YS5kaXIgIT0gU1BJX01FTV9EQVRBX0lOKQorCQlyZXR1cm4gLUVPUE5P
VFNVUFA7CisKKwlpZiAoZGVzYy0+aW5mby5sZW5ndGggPiBjaGlwLT5haGJfd2luZG93X3NpemUp
CisJCWRldl93YXJuKGFzcGktPmRldiwgIkNFJWQgd2luZG93ICglZE1CKSB0b28gc21hbGwgZm9y
IG1hcHBpbmciLAorCQkJIGNoaXAtPmNzLCBjaGlwLT5haGJfd2luZG93X3NpemUgPj4gMjApOwor
CisJLyogRGVmaW5lIHRoZSBkZWZhdWx0IElPIHJlYWQgc2V0dGluZ3MgKi8KKwljdGxfdmFsID0g
cmVhZGwoY2hpcC0+Y3RsKSAmIH5DVFJMX0lPX0NNRF9NQVNLOworCWN0bF92YWwgfD0gYXNwZWVk
X3NwaV9nZXRfaW9fbW9kZShvcCkgfAorCQlvcC0+Y21kLm9wY29kZSA8PCBDVFJMX0NPTU1BTkRf
U0hJRlQgfAorCQlDVFJMX0lPX0RVTU1ZX1NFVChvcC0+ZHVtbXkubmJ5dGVzIC8gb3AtPmR1bW15
LmJ1c3dpZHRoKSB8CisJCUNUUkxfSU9fTU9ERV9SRUFEOworCisJLyogVHVuZSA0QllURSBhZGRy
ZXNzIG1vZGUgKi8KKwlpZiAob3AtPmFkZHIubmJ5dGVzKSB7CisJCXUzMiBhZGRyX21vZGUgPSBy
ZWFkbChhc3BpLT5yZWdzICsgQ0VfQ1RSTF9SRUcpOworCisJCWlmIChvcC0+YWRkci5uYnl0ZXMg
PT0gNCkKKwkJCWFkZHJfbW9kZSB8PSAoMHgxMSA8PCBjaGlwLT5jcyk7CisJCWVsc2UKKwkJCWFk
ZHJfbW9kZSAmPSB+KDB4MTEgPDwgY2hpcC0+Y3MpOworCQl3cml0ZWwoYWRkcl9tb2RlLCBhc3Bp
LT5yZWdzICsgQ0VfQ1RSTF9SRUcpOworCX0KKworCS8qIFJFQUQgbW9kZSBpcyB0aGUgY29udHJv
bGxlciBkZWZhdWx0IHNldHRpbmcgKi8KKwljaGlwLT5jdGxfdmFsW0FTUEVFRF9TUElfUkVBRF0g
PSBjdGxfdmFsOworCXdyaXRlbChjaGlwLT5jdGxfdmFsW0FTUEVFRF9TUElfUkVBRF0sIGNoaXAt
PmN0bCk7CisKKwlkZXZfaW5mbyhhc3BpLT5kZXYsICJDRSVkIHJlYWQgYnVzd2lkdGg6JWQgWzB4
JTA4eF1cbiIsCisJCSBjaGlwLT5jcywgb3AtPmRhdGEuYnVzd2lkdGgsIGNoaXAtPmN0bF92YWxb
QVNQRUVEX1NQSV9SRUFEXSk7CisKKwlyZXR1cm4gcmV0OworfQorCitzdGF0aWMgc3NpemVfdCBh
c3BlZWRfc3BpX2Rpcm1hcF9yZWFkKHN0cnVjdCBzcGlfbWVtX2Rpcm1hcF9kZXNjICpkZXNjLAor
CQkJCSAgICAgIHU2NCBvZmZzZXQsIHNpemVfdCBsZW4sIHZvaWQgKmJ1ZikKK3sKKwlzdHJ1Y3Qg
YXNwZWVkX3NwaSAqYXNwaSA9IHNwaV9jb250cm9sbGVyX2dldF9kZXZkYXRhKGRlc2MtPm1lbS0+
c3BpLT5tYXN0ZXIpOworCXN0cnVjdCBhc3BlZWRfc3BpX2NoaXAgKmNoaXAgPSAmYXNwaS0+Y2hp
cHNbZGVzYy0+bWVtLT5zcGktPmNoaXBfc2VsZWN0XTsKKworCS8qIFN3aXRjaCB0byBVU0VSIGNv
bW1hbmQgbW9kZSBpZiBtYXBwaW5nIHdpbmRvdyBpcyB0b28gc21hbGwgKi8KKwlpZiAoY2hpcC0+
YWhiX3dpbmRvd19zaXplIDwgb2Zmc2V0ICsgbGVuKQorCQlhc3BlZWRfc3BpX3JlYWRfdXNlcihj
aGlwLCAmZGVzYy0+aW5mby5vcF90bXBsLCBvZmZzZXQsIGxlbiwgYnVmKTsKKwllbHNlCisJCW1l
bWNweV9mcm9taW8oYnVmLCBjaGlwLT5haGJfYmFzZSArIG9mZnNldCwgbGVuKTsKKworCXJldHVy
biBsZW47Cit9CisKIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgc3BpX2NvbnRyb2xsZXJfbWVtX29wcyBh
c3BlZWRfc3BpX21lbV9vcHMgPSB7CiAJLnN1cHBvcnRzX29wID0gYXNwZWVkX3NwaV9zdXBwb3J0
c19vcCwKIAkuZXhlY19vcCA9IGFzcGVlZF9zcGlfZXhlY19vcCwKIAkuZ2V0X25hbWUgPSBhc3Bl
ZWRfc3BpX2dldF9uYW1lLAorCS5kaXJtYXBfY3JlYXRlID0gYXNwZWVkX3NwaV9kaXJtYXBfY3Jl
YXRlLAorCS5kaXJtYXBfcmVhZCA9IGFzcGVlZF9zcGlfZGlybWFwX3JlYWQsCiB9OwogCiBzdGF0
aWMgdm9pZCBhc3BlZWRfc3BpX2NoaXBfc2V0X3R5cGUoc3RydWN0IGFzcGVlZF9zcGkgKmFzcGks
IHVuc2lnbmVkIGludCBjcywgaW50IHR5cGUpCi0tIAoyLjM0LjEKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Np
b24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbXRkLwo=
