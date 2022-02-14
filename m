Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6715C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Feb 2022 10:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+A867kzok/rhZ3IFfh9AxzeDlvVITeKRe7BjaEJS2+A=; b=h2AOMUHhF877ii
	9cc0ShCmlwQAdXR1EymWnJrjlrGdq/d7gUv0Js1wQRMTKrR5i0HDW7YJgoCN/WGRe/FxKATvWmKDU
	f+NqKgq4UffHssMGELYp/t9Xj3QZ39viP+v/EFU6hYbkrU/e/SSMJDmUeamxk4AeZTImcaA9DU2id
	zTUSEIVYx0RddrbYudRmx/r7UmHlAVk0ycLvo6JAbIsLjyU+ozaWsNGJ4bbVO3xSS9elthYxWKJeg
	4wgMoVvCPoseB5CbqEzzQo2+9+YoWPFJTpWuED/wNXhmcuP2315cbbvySFwO7L55p9hPaZSw2Me91
	PV42Vcyi1L8vCIJ9tfGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJYEe-00EPJe-70; Mon, 14 Feb 2022 10:05:32 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJXt2-00EJ1o-DS; Mon, 14 Feb 2022 09:43:15 +0000
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21E8kHEJ012501; 
 Mon, 14 Feb 2022 09:42:51 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e785swfce-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Feb 2022 09:42:51 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21E9dnIL001483;
 Mon, 14 Feb 2022 09:42:48 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma03ams.nl.ibm.com with ESMTP id 3e64h9kgkm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Feb 2022 09:42:48 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 21E9WRad27525510
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 14 Feb 2022 09:32:27 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EBBE311C06C;
 Mon, 14 Feb 2022 09:42:45 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5CA0411C052;
 Mon, 14 Feb 2022 09:42:45 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Mon, 14 Feb 2022 09:42:45 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.60.190])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id A2AF12201E5;
 Mon, 14 Feb 2022 10:42:43 +0100 (CET)
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
Subject: [PATCH 05/10] spi: aspeed: Adjust direct mapping to device size
Date: Mon, 14 Feb 2022 10:42:26 +0100
Message-Id: <20220214094231.3753686-6-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220214094231.3753686-1-clg@kaod.org>
References: <20220214094231.3753686-1-clg@kaod.org>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ySFE6WxU1sMm1cIrMdIdBbJzw2ZzwQUk
X-Proofpoint-ORIG-GUID: ySFE6WxU1sMm1cIrMdIdBbJzw2ZzwQUk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-14_01,2022-02-14_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=974
 malwarescore=0 adultscore=0 lowpriorityscore=0 clxscore=1034
 impostorscore=0 priorityscore=1501 bulkscore=0 suspectscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202140058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_014312_548377_3E7EBE34 
X-CRM114-Status: GOOD (  23.66  )
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
IHNhbWUgYnVzLgoKU2lnbmVkLW9mZi1ieTogQ8OpZHJpYyBMZSBHb2F0ZXIgPGNsZ0BrYW9kLm9y
Zz4KLS0tCiBkcml2ZXJzL3NwaS9zcGktYXNwZWVkLXNtYy5jIHwgODggKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgODggaW5zZXJ0aW9ucygrKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvc3BpL3NwaS1hc3BlZWQtc21jLmMgYi9kcml2ZXJzL3NwaS9z
cGktYXNwZWVkLXNtYy5jCmluZGV4IDhkMzNmY2I3NzM2YS4uOWM0ZWFjZmVkNzJjIDEwMDY0NAot
LS0gYS9kcml2ZXJzL3NwaS9zcGktYXNwZWVkLXNtYy5jCisrKyBiL2RyaXZlcnMvc3BpL3NwaS1h
c3BlZWQtc21jLmMKQEAgLTQyNiw2ICs0MjYsOTIgQEAgc3RhdGljIGludCBhc3BlZWRfc3BpX2No
aXBfc2V0X2RlZmF1bHRfd2luZG93KHN0cnVjdCBhc3BlZWRfc3BpX2NoaXAgKmNoaXApCiAJcmV0
dXJuIGNoaXAtPmFoYl93aW5kb3dfc2l6ZSA/IDAgOiAtMTsKIH0KIAorc3RhdGljIGludCBhc3Bl
ZWRfc3BpX3NldF93aW5kb3coc3RydWN0IGFzcGVlZF9zcGkgKmFzcGksCisJCQkJIGNvbnN0IHN0
cnVjdCBhc3BlZWRfc3BpX3dpbmRvdyAqd2luKQoreworCXUzMiBzdGFydCA9IGFzcGktPmFoYl9i
YXNlX3BoeSArIHdpbi0+b2Zmc2V0OworCXUzMiBlbmQgPSBzdGFydCArIHdpbi0+c2l6ZTsKKwl2
b2lkIF9faW9tZW0gKnNlZ19yZWcgPSBhc3BpLT5yZWdzICsgQ0UwX1NFR01FTlRfQUREUl9SRUcg
KyB3aW4tPmNzICogNDsKKwl1MzIgc2VnX3ZhbF9iYWNrdXAgPSByZWFkbChzZWdfcmVnKTsKKwl1
MzIgc2VnX3ZhbCA9IGFzcGktPmRhdGEtPnNlZ21lbnRfcmVnKGFzcGksIHN0YXJ0LCBlbmQpOwor
CisJaWYgKHNlZ192YWwgPT0gc2VnX3ZhbF9iYWNrdXApCisJCXJldHVybiAwOworCisJd3JpdGVs
KHNlZ192YWwsIHNlZ19yZWcpOworCisJLyoKKwkgKiBSZXN0b3JlIGluaXRpYWwgdmFsdWUgaWYg
c29tZXRoaW5nIGdvZXMgd3JvbmcgZWxzZSB3ZSBjb3VsZAorCSAqIGxvb3NlIGFjY2VzcyB0byB0
aGUgY2hpcC4KKwkgKi8KKwlpZiAoc2VnX3ZhbCAhPSByZWFkbChzZWdfcmVnKSkgeworCQlkZXZf
ZXJyKGFzcGktPmRldiwgIkNFJWQgaW52YWxpZCB3aW5kb3cgWyAweCUuOHggLSAweCUuOHggXSAl
ZE1CIiwKKwkJCXdpbi0+Y3MsIHN0YXJ0LCBlbmQgLSAxLCB3aW4tPnNpemUgPj4gMjApOworCQl3
cml0ZWwoc2VnX3ZhbF9iYWNrdXAsIHNlZ19yZWcpOworCQlyZXR1cm4gLUVJTzsKKwl9CisKKwlp
ZiAod2luLT5zaXplKQorCQlkZXZfZGJnKGFzcGktPmRldiwgIkNFJWQgbmV3IHdpbmRvdyBbIDB4
JS44eCAtIDB4JS44eCBdICVkTUIiLAorCQkJd2luLT5jcywgc3RhcnQsIGVuZCAtIDEsICB3aW4t
PnNpemUgPj4gMjApOworCWVsc2UKKwkJZGV2X2RiZyhhc3BpLT5kZXYsICJDRSVkIHdpbmRvdyBj
bG9zZWQiLCB3aW4tPmNzKTsKKworCXJldHVybiAwOworfQorCisvKgorICogWWV0IHRvIGJlIGRv
bmUgd2hlbiBwb3NzaWJsZSA6CisgKiAtIEFsaWduIG1hcHBpbmdzIG9uIGZsYXNoIHNpemUgKHdl
IGRvbid0IGhhdmUgdGhlIGluZm8pCisgKiAtIGlvcmVtYXAgZWFjaCB3aW5kb3csIG5vdCBzdHJp
Y3RseSBuZWNlc3Nhcnkgc2luY2UgdGhlIG92ZXJhbGwgd2luZG93CisgKiAgIGlzIGNvcnJlY3Qu
CisgKi8KK3N0YXRpYyBpbnQgYXNwZWVkX3NwaV9jaGlwX2FkanVzdF93aW5kb3coc3RydWN0IGFz
cGVlZF9zcGlfY2hpcCAqY2hpcCwKKwkJCQkJIHUzMiBsb2NhbF9vZmZzZXQsIHUzMiBzaXplKQor
eworCXN0cnVjdCBhc3BlZWRfc3BpICphc3BpID0gY2hpcC0+YXNwaTsKKwlzdHJ1Y3QgYXNwZWVk
X3NwaV93aW5kb3cgd2luZG93c1tBU1BFRURfU1BJX01BWF9OVU1fQ1NdID0geyAwIH07CisJc3Ry
dWN0IGFzcGVlZF9zcGlfd2luZG93ICp3aW4gPSAmd2luZG93c1tjaGlwLT5jc107CisJaW50IHJl
dDsKKworCWFzcGVlZF9zcGlfZ2V0X3dpbmRvd3MoYXNwaSwgd2luZG93cyk7CisKKwkvKiBBZGp1
c3QgdGhpcyBjaGlwIHdpbmRvdyAqLworCXdpbi0+b2Zmc2V0ICs9IGxvY2FsX29mZnNldDsKKwl3
aW4tPnNpemUgPSBzaXplOworCisJaWYgKHdpbi0+b2Zmc2V0ICsgd2luLT5zaXplID4gYXNwaS0+
YWhiX3dpbmRvd19zaXplKSB7CisJCXdpbi0+c2l6ZSA9IGFzcGktPmFoYl93aW5kb3dfc2l6ZSAt
IHdpbi0+b2Zmc2V0OworCQlkZXZfd2Fybihhc3BpLT5kZXYsICJDRSVkIHdpbmRvdyByZXNpemVk
IHRvICVkTUIiLCBjaGlwLT5jcywgd2luLT5zaXplID4+IDIwKTsKKwl9CisKKwlyZXQgPSBhc3Bl
ZWRfc3BpX3NldF93aW5kb3coYXNwaSwgd2luKTsKKwlpZiAocmV0KQorCQlyZXR1cm4gcmV0Owor
CisJLyogVXBkYXRlIGNoaXAgbWFwcGluZyBpbmZvICovCisJY2hpcC0+YWhiX2Jhc2UgPSBhc3Bp
LT5haGJfYmFzZSArIHdpbi0+b2Zmc2V0OworCWNoaXAtPmFoYl93aW5kb3dfc2l6ZSA9IHdpbi0+
c2l6ZTsKKworCS8qCisJICogQWxzbyBhZGp1c3QgbmV4dCBjaGlwIHdpbmRvdyB0byBtYWtlIHN1
cmUgdGhhdCBpdCBkb2VzIG5vdAorCSAqIG92ZXJsYXAgd2l0aCB0aGUgY3VycmVudCB3aW5kb3cu
CisJICovCisJaWYgKGNoaXAtPmNzIDwgYXNwaS0+ZGF0YS0+bWF4X2NzIC0gMSkgeworCQlzdHJ1
Y3QgYXNwZWVkX3NwaV93aW5kb3cgKm5leHQgPSAmd2luZG93c1tjaGlwLT5jcyArIDFdOworCisJ
CS8qIENoYW5nZSBvZmZzZXQgYW5kIHNpemUgdG8ga2VlcCB0aGUgc2FtZSBlbmQgYWRkcmVzcyAq
LworCQlpZiAoKG5leHQtPm9mZnNldCArIG5leHQtPnNpemUpID4gKHdpbi0+b2Zmc2V0ICsgd2lu
LT5zaXplKSkKKwkJCW5leHQtPnNpemUgPSAobmV4dC0+b2Zmc2V0ICsgbmV4dC0+c2l6ZSkgLSAo
d2luLT5vZmZzZXQgKyB3aW4tPnNpemUpOworCQllbHNlCisJCQluZXh0LT5zaXplID0gMDsKKwkJ
bmV4dC0+b2Zmc2V0ID0gd2luLT5vZmZzZXQgKyB3aW4tPnNpemU7CisKKwkJYXNwZWVkX3NwaV9z
ZXRfd2luZG93KGFzcGksIG5leHQpOworCX0KKwlyZXR1cm4gMDsKK30KKwogc3RhdGljIGludCBh
c3BlZWRfc3BpX2Rpcm1hcF9jcmVhdGUoc3RydWN0IHNwaV9tZW1fZGlybWFwX2Rlc2MgKmRlc2Mp
CiB7CiAJc3RydWN0IGFzcGVlZF9zcGkgKmFzcGkgPSBzcGlfY29udHJvbGxlcl9nZXRfZGV2ZGF0
YShkZXNjLT5tZW0tPnNwaS0+bWFzdGVyKTsKQEAgLTQ0MCw2ICs1MjYsOCBAQCBzdGF0aWMgaW50
IGFzcGVlZF9zcGlfZGlybWFwX2NyZWF0ZShzdHJ1Y3Qgc3BpX21lbV9kaXJtYXBfZGVzYyAqZGVz
YykKIAlpZiAob3AtPmRhdGEuZGlyICE9IFNQSV9NRU1fREFUQV9JTikKIAkJcmV0dXJuIC1FT1BO
T1RTVVBQOwogCisJYXNwZWVkX3NwaV9jaGlwX2FkanVzdF93aW5kb3coY2hpcCwgZGVzYy0+aW5m
by5vZmZzZXQsIGRlc2MtPmluZm8ubGVuZ3RoKTsKKwogCWlmIChkZXNjLT5pbmZvLmxlbmd0aCA+
IGNoaXAtPmFoYl93aW5kb3dfc2l6ZSkKIAkJZGV2X3dhcm4oYXNwaS0+ZGV2LCAiQ0UlZCB3aW5k
b3cgKCVkTUIpIHRvbyBzbWFsbCBmb3IgbWFwcGluZyIsCiAJCQkgY2hpcC0+Y3MsIGNoaXAtPmFo
Yl93aW5kb3dfc2l6ZSA+PiAyMCk7Ci0tIAoyLjM0LjEKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFp
bGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbXRkLwo=
