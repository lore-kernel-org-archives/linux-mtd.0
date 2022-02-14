Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C2EFC433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Feb 2022 10:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jvWbt4wfhDtJXQozd2HrrKXt/jvgysB7cn7HxlItAxk=; b=kBRDMmK07AUp2K
	f7XxwwLkMfSnXTb60BQU/UuINE8Ovd+8338pIvBvZe8OO3xNZWBHVAVvUdd2QCIZ7jH2Bd4U0cM9c
	PUMNSHFRjDAH70CO/ODFDZL+OrPGy5p9jAapZnhecIehPfdbrjJkHuUqaUjSaaUUwWKlWcEID6yg9
	F4SBXoP4HOw8Q6iO9bGmM6j+CUpoRA+gxYrFwBujri40Bb/hX+PGlNZJ+e+WmgHkcYwr3UeXgur2J
	/qeZ/XF53N61se9GscHcnLsndfkkHxKZ+mqkSRMzWkH0bRKspmn9hm9lfmfFPolm5kPx3mwPv30UT
	KWxfxkwJtA5YsUL6jb8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJYNa-00ERmk-72; Mon, 14 Feb 2022 10:14:46 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJXt6-00EJ38-Ln; Mon, 14 Feb 2022 09:43:19 +0000
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21E9eP2H019510; 
 Mon, 14 Feb 2022 09:42:57 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e779vdmbn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Feb 2022 09:42:57 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21E9bfsY004418;
 Mon, 14 Feb 2022 09:42:55 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma06fra.de.ibm.com with ESMTP id 3e645jat6m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Feb 2022 09:42:55 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 21E9WYme38797792
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 14 Feb 2022 09:32:34 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 051CE52052;
 Mon, 14 Feb 2022 09:42:53 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with SMTP id 6085952050;
 Mon, 14 Feb 2022 09:42:52 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.60.190])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 076D32201DE;
 Mon, 14 Feb 2022 10:42:50 +0100 (CET)
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
Subject: [PATCH 10/10] spi: aspeed: Activate new spi-mem driver
Date: Mon, 14 Feb 2022 10:42:31 +0100
Message-Id: <20220214094231.3753686-11-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220214094231.3753686-1-clg@kaod.org>
References: <20220214094231.3753686-1-clg@kaod.org>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: hi9H4j9w4wgHr4Kw5X0RWQekIHI7ip-1
X-Proofpoint-ORIG-GUID: hi9H4j9w4wgHr4Kw5X0RWQekIHI7ip-1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-14_01,2022-02-14_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 mlxscore=0 clxscore=1034
 impostorscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 mlxlogscore=588 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202140058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_014316_906859_269170A5 
X-CRM114-Status: GOOD (  16.46  )
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

VGhlIHByZXZpb3VzIGRyaXZlciB1c2luZyB0aGUgTVREIFNQSSBOT1IgaW50ZXJmYWNlIGlzIGtl
cHQgaW4gY2FzZSB3ZQpmaW5kIHNvbWUgaXNzdWVzIGJ1dCB3ZSBzaG91bGQgcmVtb3ZlIGl0IHF1
aWNrbHkgb25jZSB0aGUgbmV3IGRyaXZlcgp1c2luZyB0aGUgc3BpLW1lbSBpbnRlcmZhY2UgaGFz
IGJlZW4gc3VmZmljaWVudGx5IGV4cG9zZWQuCgpTaWduZWQtb2ZmLWJ5OiBDw6lkcmljIExlIEdv
YXRlciA8Y2xnQGthb2Qub3JnPgotLS0KIGFyY2gvYXJtL2NvbmZpZ3MvYXNwZWVkX2c0X2RlZmNv
bmZpZyB8IDIgKy0KIGFyY2gvYXJtL2NvbmZpZ3MvYXNwZWVkX2c1X2RlZmNvbmZpZyB8IDIgKy0K
IGFyY2gvYXJtL2NvbmZpZ3MvbXVsdGlfdjVfZGVmY29uZmlnICB8IDIgKy0KIGFyY2gvYXJtL2Nv
bmZpZ3MvbXVsdGlfdjdfZGVmY29uZmlnICB8IDIgKy0KIDQgZmlsZXMgY2hhbmdlZCwgNCBpbnNl
cnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2NvbmZpZ3Mv
YXNwZWVkX2c0X2RlZmNvbmZpZyBiL2FyY2gvYXJtL2NvbmZpZ3MvYXNwZWVkX2c0X2RlZmNvbmZp
ZwppbmRleCA5NjQ1MzY0NDRjZDcuLmI0YTFiMmVkMWExNyAxMDA2NDQKLS0tIGEvYXJjaC9hcm0v
Y29uZmlncy9hc3BlZWRfZzRfZGVmY29uZmlnCisrKyBiL2FyY2gvYXJtL2NvbmZpZ3MvYXNwZWVk
X2c0X2RlZmNvbmZpZwpAQCAtNjQsNyArNjQsNyBAQCBDT05GSUdfTVREX0JMT0NLPXkKIENPTkZJ
R19NVERfUEFSVElUSU9ORURfTUFTVEVSPXkKIENPTkZJR19NVERfU1BJX05PUj15CiAjIENPTkZJ
R19NVERfU1BJX05PUl9VU0VfNEtfU0VDVE9SUyBpcyBub3Qgc2V0Ci1DT05GSUdfU1BJX0FTUEVF
RF9TTUNfTVREX1NQSV9OT1I9eQorQ09ORklHX1NQSV9BU1BFRURfU01DPXkKIENPTkZJR19NVERf
VUJJPXkKIENPTkZJR19NVERfVUJJX0ZBU1RNQVA9eQogQ09ORklHX01URF9VQklfQkxPQ0s9eQpk
aWZmIC0tZ2l0IGEvYXJjaC9hcm0vY29uZmlncy9hc3BlZWRfZzVfZGVmY29uZmlnIGIvYXJjaC9h
cm0vY29uZmlncy9hc3BlZWRfZzVfZGVmY29uZmlnCmluZGV4IGU4MDkyMzZjYTg4Yi4uY2NjNDI0
MGVlNGI1IDEwMDY0NAotLS0gYS9hcmNoL2FybS9jb25maWdzL2FzcGVlZF9nNV9kZWZjb25maWcK
KysrIGIvYXJjaC9hcm0vY29uZmlncy9hc3BlZWRfZzVfZGVmY29uZmlnCkBAIC0xMDMsNyArMTAz
LDcgQEAgQ09ORklHX01URF9CTE9DSz15CiBDT05GSUdfTVREX1BBUlRJVElPTkVEX01BU1RFUj15
CiBDT05GSUdfTVREX1NQSV9OT1I9eQogIyBDT05GSUdfTVREX1NQSV9OT1JfVVNFXzRLX1NFQ1RP
UlMgaXMgbm90IHNldAotQ09ORklHX1NQSV9BU1BFRURfU01DX01URF9TUElfTk9SPXkKK0NPTkZJ
R19TUElfQVNQRUVEX1NNQz15CiBDT05GSUdfTVREX1VCST15CiBDT05GSUdfTVREX1VCSV9GQVNU
TUFQPXkKIENPTkZJR19NVERfVUJJX0JMT0NLPXkKZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2NvbmZp
Z3MvbXVsdGlfdjVfZGVmY29uZmlnIGIvYXJjaC9hcm0vY29uZmlncy9tdWx0aV92NV9kZWZjb25m
aWcKaW5kZXggNDkwODNlZjA1ZmIwLi44MGEzYWUwMmQ3NTkgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJt
L2NvbmZpZ3MvbXVsdGlfdjVfZGVmY29uZmlnCisrKyBiL2FyY2gvYXJtL2NvbmZpZ3MvbXVsdGlf
djVfZGVmY29uZmlnCkBAIC0xMDMsNyArMTAzLDcgQEAgQ09ORklHX01URF9SQVdfTkFORD15CiBD
T05GSUdfTVREX05BTkRfQVRNRUw9eQogQ09ORklHX01URF9OQU5EX09SSU9OPXkKIENPTkZJR19N
VERfU1BJX05PUj15Ci1DT05GSUdfU1BJX0FTUEVFRF9TTUNfTVREX1NQSV9OT1I9eQorQ09ORklH
X1NQSV9BU1BFRURfU01DPXkKIENPTkZJR19NVERfVUJJPXkKIENPTkZJR19CTEtfREVWX0xPT1A9
eQogQ09ORklHX0FUTUVMX1NTQz1tCmRpZmYgLS1naXQgYS9hcmNoL2FybS9jb25maWdzL211bHRp
X3Y3X2RlZmNvbmZpZyBiL2FyY2gvYXJtL2NvbmZpZ3MvbXVsdGlfdjdfZGVmY29uZmlnCmluZGV4
IGZjMWI2OTI1NmI2NC4uMzM1NzI5OThkYmJlIDEwMDY0NAotLS0gYS9hcmNoL2FybS9jb25maWdz
L211bHRpX3Y3X2RlZmNvbmZpZworKysgYi9hcmNoL2FybS9jb25maWdzL211bHRpX3Y3X2RlZmNv
bmZpZwpAQCAtMjE3LDcgKzIxNyw3IEBAIENPTkZJR19NVERfTkFORF9EQVZJTkNJPXkKIENPTkZJ
R19NVERfTkFORF9TVE0zMl9GTUMyPXkKIENPTkZJR19NVERfTkFORF9QTDM1WD15CiBDT05GSUdf
TVREX1NQSV9OT1I9eQotQ09ORklHX1NQSV9BU1BFRURfU01DX01URF9TUElfTk9SPW0KK0NPTkZJ
R19TUElfQVNQRUVEX1NNQz1tCiBDT05GSUdfTVREX1VCST15CiBDT05GSUdfQkxLX0RFVl9MT09Q
PXkKIENPTkZJR19CTEtfREVWX1JBTT15Ci0tIAoyLjM0LjEKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24g
bWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbXRkLwo=
