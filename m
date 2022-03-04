Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7597AC433F5
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Mar 2022 08:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aRlxe26V48jO5a3EJszPZ8oeN3YFCNXl0vQFDc8k4r4=; b=qsvKJ0cUruAdD6
	vOQpy9j88MKmq2uak6ah2FlWEsoPQh/LhWmHA8zPr74ZQasHJLybvHGlR7qhAUQHdoXmAp2Sx+4Kl
	OXhsPOM4Qg7QEx/wUfHlYFboIzE3rw9NzM1F6BksvlsX/NvGCPsNrQ9cXl1krleCJ2QJgKMxwT86F
	ythUB9RIxgj0oLST2mv3tYALKsHLot1MaMxTs8Q2ht1cauGmnFFzsBiHF40X4ELTXNFTMyOqyzR+H
	2G1mjYnQF//4VnrsSIyYgGhi0jc1MvvzXk7Oq/V8FJmxF67zBB6dtBtUDdLFPPc8n72ZE0cQCy7PU
	R3guA9gspNwSKHTuODMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nQ3WP-0095oe-Qo; Fri, 04 Mar 2022 08:42:46 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nQ3RG-0093zm-Ai; Fri, 04 Mar 2022 08:37:28 +0000
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 2246t3Qk010730; 
 Fri, 4 Mar 2022 08:37:05 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ekacwn01x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Mar 2022 08:37:05 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 2248ZvoD002239;
 Fri, 4 Mar 2022 08:37:04 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ekacwn01c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Mar 2022 08:37:04 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2248X5ku013656;
 Fri, 4 Mar 2022 08:37:02 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma03ams.nl.ibm.com with ESMTP id 3ek4k417hd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Mar 2022 08:37:01 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 2248Q0An49545702
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 4 Mar 2022 08:26:00 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 918B5A4051;
 Fri,  4 Mar 2022 08:36:59 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E3DF3A404D;
 Fri,  4 Mar 2022 08:36:58 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Fri,  4 Mar 2022 08:36:58 +0000 (GMT)
Received: from yukon.home (unknown [9.171.91.16])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 4C6BE2201B4;
 Fri,  4 Mar 2022 09:36:57 +0100 (CET)
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
Subject: [PATCH v3 07/11] spi: aspeed: Workaround AST2500 limitations
Date: Fri,  4 Mar 2022 09:36:39 +0100
Message-Id: <20220304083643.1079142-8-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220304083643.1079142-1-clg@kaod.org>
References: <20220304083643.1079142-1-clg@kaod.org>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: k1vTTo0hq93LL-BmrUlUX3196LLTUrXh
X-Proofpoint-ORIG-GUID: ttx03KY3t1k4gjwnjRKXY2yhH00I1i6i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-04_02,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0
 mlxlogscore=999 clxscore=1034 mlxscore=0 lowpriorityscore=0 suspectscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2203040044
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220304_003726_408440_FABBFC26 
X-CRM114-Status: GOOD (  15.73  )
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
