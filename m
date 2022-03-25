Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75859C433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Mar 2022 10:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aRlxe26V48jO5a3EJszPZ8oeN3YFCNXl0vQFDc8k4r4=; b=VDKG2NciYMDt33
	zugCTSTSrXKtWn4OEEBApFk45WV4DaaskyNBlRymA3LIVPpaEietg3AvjSPK4CXwKXE43PKeIRQ9n
	zNBeL+zGOYIEcaLAuw9J+mhqLOrq36lBGpIxMk2+cG/pCsN9voDf5uAfK3z7rPrdmMBVg55RjI5O9
	DvTD1PEp6FBZ4OWDbt95L0E3PPqYL4MA3q/k17S4NRKetGoTyEm7mxyVmUQU/S+FwZVYA1nx6Oewd
	LPFFcIYkTWvfOzsf13zSTx8SQ+IvzPydrkn1lynxZDfkzthh95vXpqSMmE53iIS4d3hYot11DluyU
	F3V5O2abrynp3Wblv8lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nXgv4-001ddE-NJ; Fri, 25 Mar 2022 10:11:46 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nXgsv-001cVB-G0; Fri, 25 Mar 2022 10:09:37 +0000
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22P79ikE011990; 
 Fri, 25 Mar 2022 10:09:09 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3f0sd4e322-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Mar 2022 10:09:08 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 22PA4wSI022939;
 Fri, 25 Mar 2022 10:09:08 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3f0sd4e30x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Mar 2022 10:09:08 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22P9xuIU023402;
 Fri, 25 Mar 2022 10:09:06 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma04fra.de.ibm.com with ESMTP id 3ew6t8u170-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Mar 2022 10:09:06 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 22PA93FE28180806
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 25 Mar 2022 10:09:03 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CEDFA4C044;
 Fri, 25 Mar 2022 10:09:03 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 293FE4C04A;
 Fri, 25 Mar 2022 10:09:03 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Fri, 25 Mar 2022 10:09:03 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.95.248])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 8730A220121;
 Fri, 25 Mar 2022 11:09:01 +0100 (CET)
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
Subject: [PATCH v4 06/11] spi: aspeed: Workaround AST2500 limitations
Date: Fri, 25 Mar 2022 11:08:44 +0100
Message-Id: <20220325100849.2019209-7-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220325100849.2019209-1-clg@kaod.org>
References: <20220325100849.2019209-1-clg@kaod.org>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Vr9KBTYkV2lf7SbNCeOzO07bOXmW3gQQ
X-Proofpoint-ORIG-GUID: 6UxjmutcfKyqw4AT4F2r9mAtbUEivXFX
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
X-CRM114-CacheID: sfid-20220325_030933_700944_86CB6204 
X-CRM114-Status: GOOD (  16.12  )
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
IHRoaXMgY2FzZSwgdGhlIG1heGltdW0Kd2luZG93IHNpemUgaXMgcmVzdHJpY3RlZCB0byAxMjBN
QiBmb3IgQ0UwLgoKUmV2aWV3ZWQtYnk6IEpvZWwgU3RhbmxleSA8am9lbEBqbXMuaWQuYXU+ClRl
c3RlZC1ieTogSm9lbCBTdGFubGV5IDxqb2VsQGptcy5pZC5hdT4KVGVzdGVkLWJ5OiBUYW8gUmVu
IDxyZW50YW8uYnVwdEBnbWFpbC5jb20+ClNpZ25lZC1vZmYtYnk6IEPDqWRyaWMgTGUgR29hdGVy
IDxjbGdAa2FvZC5vcmc+Ci0tLQogZHJpdmVycy9zcGkvc3BpLWFzcGVlZC1zbWMuYyB8IDEyICsr
KysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL3NwaS9zcGktYXNwZWVkLXNtYy5jIGIvZHJpdmVycy9zcGkvc3BpLWFzcGVlZC1z
bWMuYwppbmRleCA5Zjc5MTBlNzlhZTguLmFiNmZhNWNmYWQ5YyAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9zcGkvc3BpLWFzcGVlZC1zbWMuYworKysgYi9kcml2ZXJzL3NwaS9zcGktYXNwZWVkLXNtYy5j
CkBAIC00NDMsNiArNDQzLDggQEAgc3RhdGljIGludCBhc3BlZWRfc3BpX3NldF93aW5kb3coc3Ry
dWN0IGFzcGVlZF9zcGkgKmFzcGksCiAgKiAtIGlvcmVtYXAgZWFjaCB3aW5kb3csIG5vdCBzdHJp
Y3RseSBuZWNlc3Nhcnkgc2luY2UgdGhlIG92ZXJhbGwgd2luZG93CiAgKiAgIGlzIGNvcnJlY3Qu
CiAgKi8KK3N0YXRpYyBjb25zdCBzdHJ1Y3QgYXNwZWVkX3NwaV9kYXRhIGFzdDI1MDBfc3BpX2Rh
dGE7CisKIHN0YXRpYyBpbnQgYXNwZWVkX3NwaV9jaGlwX2FkanVzdF93aW5kb3coc3RydWN0IGFz
cGVlZF9zcGlfY2hpcCAqY2hpcCwKIAkJCQkJIHUzMiBsb2NhbF9vZmZzZXQsIHUzMiBzaXplKQog
ewpAQCAtNDUxLDYgKzQ1MywxNiBAQCBzdGF0aWMgaW50IGFzcGVlZF9zcGlfY2hpcF9hZGp1c3Rf
d2luZG93KHN0cnVjdCBhc3BlZWRfc3BpX2NoaXAgKmNoaXAsCiAJc3RydWN0IGFzcGVlZF9zcGlf
d2luZG93ICp3aW4gPSAmd2luZG93c1tjaGlwLT5jc107CiAJaW50IHJldDsKIAorCS8qCisJICog
RHVlIHRvIGFuIEhXIGlzc3VlIG9uIHRoZSBBU1QyNTAwIFNQSSBjb250cm9sbGVyLCB0aGUgQ0Uw
CisJICogd2luZG93IHNpemUgc2hvdWxkIGJlIHNtYWxsZXIgdGhhbiB0aGUgbWF4aW11bSAxMjhN
Qi4KKwkgKi8KKwlpZiAoYXNwaS0+ZGF0YSA9PSAmYXN0MjUwMF9zcGlfZGF0YSAmJiBjaGlwLT5j
cyA9PSAwICYmIHNpemUgPT0gU1pfMTI4TSkgeworCQlzaXplID0gMTIwIDw8IDIwOworCQlkZXZf
aW5mbyhhc3BpLT5kZXYsICJDRSVkIHdpbmRvdyByZXNpemVkIHRvICVkTUIgKEFTVDI1MDAgSFcg
cXVpcmspIiwKKwkJCSBjaGlwLT5jcywgc2l6ZSA+PiAyMCk7CisJfQorCiAJYXNwZWVkX3NwaV9n
ZXRfd2luZG93cyhhc3BpLCB3aW5kb3dzKTsKIAogCS8qIEFkanVzdCB0aGlzIGNoaXAgd2luZG93
ICovCi0tIAoyLjM0LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
