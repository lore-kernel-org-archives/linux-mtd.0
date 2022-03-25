Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7857C433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Mar 2022 10:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WRejf0BgxKzoN397oW/si9WRiJWM/r0+K561kx38AOU=; b=WheLvrhvM5x42L
	67imSoZ7H3PJbEpbFBAZkXiSMrKT3KeOzK/4g4FRt5N8nCWhenjcw5kD4pQZr7auUbTB3A5iX5BlW
	A/6Ap4g9hZ1Rn+V0DSAJeAr7708OO+vMQaR/ELZl8qGRZ1BpZC5MoD96yAJZb8ptF2SkY8l988PhJ
	H7PKtWHroXQCLrsswBeIaSUmLmH8i+gYZr6RmY9fq1hNdf/7A5BK0LESX73/sr1Exy6kJdNedglWU
	o+Dz5JxSmSmM2l37K8UW+Oklg2c7vvq6kP5rovYeF/aKsoZJ4fW6Jqk/u9fAPnU743R+FCxx6ByKr
	LEHd0B1qzDk74fDKOW3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nXgu8-001dCf-6I; Fri, 25 Mar 2022 10:10:48 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nXgsv-001cVH-D8; Fri, 25 Mar 2022 10:09:35 +0000
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22P7b0qA032055; 
 Fri, 25 Mar 2022 10:09:08 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3f0p8nk8ck-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Mar 2022 10:09:08 +0000
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 22P9u1qL018498;
 Fri, 25 Mar 2022 10:09:07 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3f0p8nk8bg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Mar 2022 10:09:07 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22P9wC44004633;
 Fri, 25 Mar 2022 10:09:04 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma03ams.nl.ibm.com with ESMTP id 3ew6t94x43-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Mar 2022 10:09:04 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 22PA96HK45547822
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 25 Mar 2022 10:09:06 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4796CA405B;
 Fri, 25 Mar 2022 10:09:02 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 96069A405F;
 Fri, 25 Mar 2022 10:09:01 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Fri, 25 Mar 2022 10:09:01 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.95.248])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 09391220158;
 Fri, 25 Mar 2022 11:08:59 +0100 (CET)
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
Subject: [PATCH v4 05/11] spi: aspeed: Adjust direct mapping to device size
Date: Fri, 25 Mar 2022 11:08:43 +0100
Message-Id: <20220325100849.2019209-6-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220325100849.2019209-1-clg@kaod.org>
References: <20220325100849.2019209-1-clg@kaod.org>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: VYFc8nwlbAci8sKEocDCVNd6KB8q3woz
X-Proofpoint-GUID: vhRWtCE9iFd-zrzDb1JYN0e6x80dnumO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-25_02,2022-03-24_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxlogscore=999
 impostorscore=0 mlxscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 clxscore=1034
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203250057
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220325_030933_487780_7C1EE7BE 
X-CRM114-Status: GOOD (  23.51  )
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

VGhlIHNlZ21lbnQgcmVnaXN0ZXJzIG9mIHRoZSBGTUMvU1BJIGNvbnRyb2xsZXJzIHByb3ZpZGUg
YSB3YXkgdG8KY29uZmlndXJlIHRoZSBtYXBwaW5nIHdpbmRvdyBvZiB0aGUgZmxhc2ggZGV2aWNl
IGNvbnRlbnRzIG9uIHRoZSBBSEIKYnVzLiBBZGp1c3QgdGhpcyB3aW5kb3cgdG8gdGhlIHNpemUg
b2YgdGhlIHNwaS1tZW0gbWFwcGluZy4KClRoaW5ncyBnZXQgbW9yZSBjb21wbGV4IHdpdGggbXVs
dGlwbGUgZGV2aWNlcy4gVGhlIGRyaXZlciBuZWVkcyB0bwphbHNvIGFkanVzdCB0aGUgd2luZG93
IG9mIHRoZSBuZXh0IGRldmljZSB0byBtYWtlIHN1cmUgdGhhdCB0aGVyZSBpcwpubyBvdmVybGFw
LCBldmVuIGlmIHRoZXJlIGlzIG5vIGF2YWlsYWJsZSBkZXZpY2UuIFRoZSBwcm9wb3NhbCBiZWxv
dwppcyBub3QgcGVyZmVjdCBidXQgaXQgaXMgY292ZXJpbmcgYWxsIHRoZSBjYXNlcyB3ZSBoYXZl
IHNlZW4gb24KZGlmZmVyZW50IGJvYXJkcyB3aXRoIG9uZSBhbmQgdHdvIGRldmljZXMgb24gdGhl
IHNhbWUgYnVzLgoKUmV2aWV3ZWQtYnk6IEpvZWwgU3RhbmxleSA8am9lbEBqbXMuaWQuYXU+ClRl
c3RlZC1ieTogSm9lbCBTdGFubGV5IDxqb2VsQGptcy5pZC5hdT4KVGVzdGVkLWJ5OiBUYW8gUmVu
IDxyZW50YW8uYnVwdEBnbWFpbC5jb20+ClNpZ25lZC1vZmYtYnk6IEPDqWRyaWMgTGUgR29hdGVy
IDxjbGdAa2FvZC5vcmc+Ci0tLQogZHJpdmVycy9zcGkvc3BpLWFzcGVlZC1zbWMuYyB8IDg4ICsr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDg4IGlu
c2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3NwaS9zcGktYXNwZWVkLXNtYy5jIGIv
ZHJpdmVycy9zcGkvc3BpLWFzcGVlZC1zbWMuYwppbmRleCAwOTUxNzY2YmFlZjQuLjlmNzkxMGU3
OWFlOCAxMDA2NDQKLS0tIGEvZHJpdmVycy9zcGkvc3BpLWFzcGVlZC1zbWMuYworKysgYi9kcml2
ZXJzL3NwaS9zcGktYXNwZWVkLXNtYy5jCkBAIC00MDMsNiArNDAzLDkyIEBAIHN0YXRpYyBpbnQg
YXNwZWVkX3NwaV9jaGlwX3NldF9kZWZhdWx0X3dpbmRvdyhzdHJ1Y3QgYXNwZWVkX3NwaV9jaGlw
ICpjaGlwKQogCXJldHVybiBjaGlwLT5haGJfd2luZG93X3NpemUgPyAwIDogLTE7CiB9CiAKK3N0
YXRpYyBpbnQgYXNwZWVkX3NwaV9zZXRfd2luZG93KHN0cnVjdCBhc3BlZWRfc3BpICphc3BpLAor
CQkJCSBjb25zdCBzdHJ1Y3QgYXNwZWVkX3NwaV93aW5kb3cgKndpbikKK3sKKwl1MzIgc3RhcnQg
PSBhc3BpLT5haGJfYmFzZV9waHkgKyB3aW4tPm9mZnNldDsKKwl1MzIgZW5kID0gc3RhcnQgKyB3
aW4tPnNpemU7CisJdm9pZCBfX2lvbWVtICpzZWdfcmVnID0gYXNwaS0+cmVncyArIENFMF9TRUdN
RU5UX0FERFJfUkVHICsgd2luLT5jcyAqIDQ7CisJdTMyIHNlZ192YWxfYmFja3VwID0gcmVhZGwo
c2VnX3JlZyk7CisJdTMyIHNlZ192YWwgPSBhc3BpLT5kYXRhLT5zZWdtZW50X3JlZyhhc3BpLCBz
dGFydCwgZW5kKTsKKworCWlmIChzZWdfdmFsID09IHNlZ192YWxfYmFja3VwKQorCQlyZXR1cm4g
MDsKKworCXdyaXRlbChzZWdfdmFsLCBzZWdfcmVnKTsKKworCS8qCisJICogUmVzdG9yZSBpbml0
aWFsIHZhbHVlIGlmIHNvbWV0aGluZyBnb2VzIHdyb25nIGVsc2Ugd2UgY291bGQKKwkgKiBsb29z
ZSBhY2Nlc3MgdG8gdGhlIGNoaXAuCisJICovCisJaWYgKHNlZ192YWwgIT0gcmVhZGwoc2VnX3Jl
ZykpIHsKKwkJZGV2X2Vycihhc3BpLT5kZXYsICJDRSVkIGludmFsaWQgd2luZG93IFsgMHglLjh4
IC0gMHglLjh4IF0gJWRNQiIsCisJCQl3aW4tPmNzLCBzdGFydCwgZW5kIC0gMSwgd2luLT5zaXpl
ID4+IDIwKTsKKwkJd3JpdGVsKHNlZ192YWxfYmFja3VwLCBzZWdfcmVnKTsKKwkJcmV0dXJuIC1F
SU87CisJfQorCisJaWYgKHdpbi0+c2l6ZSkKKwkJZGV2X2RiZyhhc3BpLT5kZXYsICJDRSVkIG5l
dyB3aW5kb3cgWyAweCUuOHggLSAweCUuOHggXSAlZE1CIiwKKwkJCXdpbi0+Y3MsIHN0YXJ0LCBl
bmQgLSAxLCAgd2luLT5zaXplID4+IDIwKTsKKwllbHNlCisJCWRldl9kYmcoYXNwaS0+ZGV2LCAi
Q0UlZCB3aW5kb3cgY2xvc2VkIiwgd2luLT5jcyk7CisKKwlyZXR1cm4gMDsKK30KKworLyoKKyAq
IFlldCB0byBiZSBkb25lIHdoZW4gcG9zc2libGUgOgorICogLSBBbGlnbiBtYXBwaW5ncyBvbiBm
bGFzaCBzaXplICh3ZSBkb24ndCBoYXZlIHRoZSBpbmZvKQorICogLSBpb3JlbWFwIGVhY2ggd2lu
ZG93LCBub3Qgc3RyaWN0bHkgbmVjZXNzYXJ5IHNpbmNlIHRoZSBvdmVyYWxsIHdpbmRvdworICog
ICBpcyBjb3JyZWN0LgorICovCitzdGF0aWMgaW50IGFzcGVlZF9zcGlfY2hpcF9hZGp1c3Rfd2lu
ZG93KHN0cnVjdCBhc3BlZWRfc3BpX2NoaXAgKmNoaXAsCisJCQkJCSB1MzIgbG9jYWxfb2Zmc2V0
LCB1MzIgc2l6ZSkKK3sKKwlzdHJ1Y3QgYXNwZWVkX3NwaSAqYXNwaSA9IGNoaXAtPmFzcGk7CisJ
c3RydWN0IGFzcGVlZF9zcGlfd2luZG93IHdpbmRvd3NbQVNQRUVEX1NQSV9NQVhfTlVNX0NTXSA9
IHsgMCB9OworCXN0cnVjdCBhc3BlZWRfc3BpX3dpbmRvdyAqd2luID0gJndpbmRvd3NbY2hpcC0+
Y3NdOworCWludCByZXQ7CisKKwlhc3BlZWRfc3BpX2dldF93aW5kb3dzKGFzcGksIHdpbmRvd3Mp
OworCisJLyogQWRqdXN0IHRoaXMgY2hpcCB3aW5kb3cgKi8KKwl3aW4tPm9mZnNldCArPSBsb2Nh
bF9vZmZzZXQ7CisJd2luLT5zaXplID0gc2l6ZTsKKworCWlmICh3aW4tPm9mZnNldCArIHdpbi0+
c2l6ZSA+IGFzcGktPmFoYl93aW5kb3dfc2l6ZSkgeworCQl3aW4tPnNpemUgPSBhc3BpLT5haGJf
d2luZG93X3NpemUgLSB3aW4tPm9mZnNldDsKKwkJZGV2X3dhcm4oYXNwaS0+ZGV2LCAiQ0UlZCB3
aW5kb3cgcmVzaXplZCB0byAlZE1CIiwgY2hpcC0+Y3MsIHdpbi0+c2l6ZSA+PiAyMCk7CisJfQor
CisJcmV0ID0gYXNwZWVkX3NwaV9zZXRfd2luZG93KGFzcGksIHdpbik7CisJaWYgKHJldCkKKwkJ
cmV0dXJuIHJldDsKKworCS8qIFVwZGF0ZSBjaGlwIG1hcHBpbmcgaW5mbyAqLworCWNoaXAtPmFo
Yl9iYXNlID0gYXNwaS0+YWhiX2Jhc2UgKyB3aW4tPm9mZnNldDsKKwljaGlwLT5haGJfd2luZG93
X3NpemUgPSB3aW4tPnNpemU7CisKKwkvKgorCSAqIEFsc28gYWRqdXN0IG5leHQgY2hpcCB3aW5k
b3cgdG8gbWFrZSBzdXJlIHRoYXQgaXQgZG9lcyBub3QKKwkgKiBvdmVybGFwIHdpdGggdGhlIGN1
cnJlbnQgd2luZG93LgorCSAqLworCWlmIChjaGlwLT5jcyA8IGFzcGktPmRhdGEtPm1heF9jcyAt
IDEpIHsKKwkJc3RydWN0IGFzcGVlZF9zcGlfd2luZG93ICpuZXh0ID0gJndpbmRvd3NbY2hpcC0+
Y3MgKyAxXTsKKworCQkvKiBDaGFuZ2Ugb2Zmc2V0IGFuZCBzaXplIHRvIGtlZXAgdGhlIHNhbWUg
ZW5kIGFkZHJlc3MgKi8KKwkJaWYgKChuZXh0LT5vZmZzZXQgKyBuZXh0LT5zaXplKSA+ICh3aW4t
Pm9mZnNldCArIHdpbi0+c2l6ZSkpCisJCQluZXh0LT5zaXplID0gKG5leHQtPm9mZnNldCArIG5l
eHQtPnNpemUpIC0gKHdpbi0+b2Zmc2V0ICsgd2luLT5zaXplKTsKKwkJZWxzZQorCQkJbmV4dC0+
c2l6ZSA9IDA7CisJCW5leHQtPm9mZnNldCA9IHdpbi0+b2Zmc2V0ICsgd2luLT5zaXplOworCisJ
CWFzcGVlZF9zcGlfc2V0X3dpbmRvdyhhc3BpLCBuZXh0KTsKKwl9CisJcmV0dXJuIDA7Cit9CisK
IHN0YXRpYyBpbnQgYXNwZWVkX3NwaV9kaXJtYXBfY3JlYXRlKHN0cnVjdCBzcGlfbWVtX2Rpcm1h
cF9kZXNjICpkZXNjKQogewogCXN0cnVjdCBhc3BlZWRfc3BpICphc3BpID0gc3BpX2NvbnRyb2xs
ZXJfZ2V0X2RldmRhdGEoZGVzYy0+bWVtLT5zcGktPm1hc3Rlcik7CkBAIC00MTcsNiArNTAzLDgg
QEAgc3RhdGljIGludCBhc3BlZWRfc3BpX2Rpcm1hcF9jcmVhdGUoc3RydWN0IHNwaV9tZW1fZGly
bWFwX2Rlc2MgKmRlc2MpCiAJaWYgKG9wLT5kYXRhLmRpciAhPSBTUElfTUVNX0RBVEFfSU4pCiAJ
CXJldHVybiAtRU9QTk9UU1VQUDsKIAorCWFzcGVlZF9zcGlfY2hpcF9hZGp1c3Rfd2luZG93KGNo
aXAsIGRlc2MtPmluZm8ub2Zmc2V0LCBkZXNjLT5pbmZvLmxlbmd0aCk7CisKIAlpZiAoZGVzYy0+
aW5mby5sZW5ndGggPiBjaGlwLT5haGJfd2luZG93X3NpemUpCiAJCWRldl93YXJuKGFzcGktPmRl
diwgIkNFJWQgd2luZG93ICglZE1CKSB0b28gc21hbGwgZm9yIG1hcHBpbmciLAogCQkJIGNoaXAt
PmNzLCBjaGlwLT5haGJfd2luZG93X3NpemUgPj4gMjApOwotLSAKMi4zNC4xCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBk
aXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW10ZC8K
