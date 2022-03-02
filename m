Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 778A1C433F5
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Mar 2022 17:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6rb1y7RBjW3k0vFhIIufFK8QD01cTcOqg8R7scq7i5s=; b=xtSsPvU2y2rAQZ
	l4Ixlqm/8nu5WRdaPBvD7UUEcieV0stEvHSFFSaSO1Mdg2BY2jF55iKVk4LelEu326fltMADCSKd+
	SI9UeLCt+KAeotq4cULfXY2iLRh/5PojCp+W2p3GGdwEMLUF7sdWwzrwMop1OjiNOu/OqyS0NNEgs
	623zE5rjHurIE/LYSlMNZgN+IFcnGIKu7Z2xRW3cwutjcHbMDkxOvSnpR4eHebMqMrXLcMga7/Ofh
	0XttNKZV6VXkqYwwIx0kDrQ3WdyI+sPrTqZf44Yhwz7hoaMd5HY22PEXvc2OyoXbhMzeAerqL7slz
	W9kJbJcCCwBtTZzl2MqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPSq1-003ZWL-Pi; Wed, 02 Mar 2022 17:32:34 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPSpJ-003Z5F-DX; Wed, 02 Mar 2022 17:31:52 +0000
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 222HIjQc030946; 
 Wed, 2 Mar 2022 17:31:29 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ejcvcg7nq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 17:31:29 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 222HCnKr027063;
 Wed, 2 Mar 2022 17:31:27 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma04fra.de.ibm.com with ESMTP id 3efbu8wx22-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 17:31:27 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 222HKSAG46137690
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 2 Mar 2022 17:20:28 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7D8BDA404D;
 Wed,  2 Mar 2022 17:31:24 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D4908A4051;
 Wed,  2 Mar 2022 17:31:23 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed,  2 Mar 2022 17:31:23 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.58.125])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 6DD70220294;
 Wed,  2 Mar 2022 18:31:22 +0100 (CET)
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
Subject: [PATCH v2 05/10] spi: aspeed: Add support for direct mapping
Date: Wed,  2 Mar 2022 18:31:09 +0100
Message-Id: <20220302173114.927476-6-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220302173114.927476-1-clg@kaod.org>
References: <20220302173114.927476-1-clg@kaod.org>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: YrwodOc56BQdphnNE7fKZ0a7_Z5eki6X
X-Proofpoint-ORIG-GUID: YrwodOc56BQdphnNE7fKZ0a7_Z5eki6X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-02_12,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0
 mlxlogscore=999 impostorscore=0 clxscore=1034 suspectscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 mlxscore=0 spamscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2203020076
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220302_093149_650707_2EC3F98D 
X-CRM114-Status: GOOD (  23.20  )
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
IGxhdGVyIHdoZW4gdmFsaWRhdGVkLgoKU2lnbmVkLW9mZi1ieTogQ8OpZHJpYyBMZSBHb2F0ZXIg
PGNsZ0BrYW9kLm9yZz4KLS0tCiBkcml2ZXJzL3NwaS9zcGktYXNwZWVkLXNtYy5jIHwgNjcgKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tCiAxIGZpbGUgY2hhbmdlZCwgNjUgaW5z
ZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3NwaS9zcGkt
YXNwZWVkLXNtYy5jIGIvZHJpdmVycy9zcGkvc3BpLWFzcGVlZC1zbWMuYwppbmRleCA2ODhmOTQ3
MmUwZDcuLmI0ODU0YjUyMTQ3NyAxMDA2NDQKLS0tIGEvZHJpdmVycy9zcGkvc3BpLWFzcGVlZC1z
bWMuYworKysgYi9kcml2ZXJzL3NwaS9zcGktYXNwZWVkLXNtYy5jCkBAIC0zMjQsOCArMzI0LDgg
QEAgc3RhdGljIGludCBkb19hc3BlZWRfc3BpX2V4ZWNfb3Aoc3RydWN0IHNwaV9tZW0gKm1lbSwg
Y29uc3Qgc3RydWN0IHNwaV9tZW1fb3AgKm8KIAkJaWYgKCFvcC0+YWRkci5uYnl0ZXMpCiAJCQly
ZXQgPSBhc3BlZWRfc3BpX3JlYWRfcmVnKGNoaXAsIG9wKTsKIAkJZWxzZQotCQkJcmV0ID0gYXNw
ZWVkX3NwaV9yZWFkX3VzZXIoY2hpcCwgb3AsIG9wLT5hZGRyLnZhbCwKLQkJCQkJCSAgIG9wLT5k
YXRhLm5ieXRlcywgb3AtPmRhdGEuYnVmLmluKTsKKwkJCW1lbWNweV9mcm9taW8ob3AtPmRhdGEu
YnVmLmluLCBjaGlwLT5haGJfYmFzZSArIG9wLT5hZGRyLnZhbCwKKwkJCQkgICAgICBvcC0+ZGF0
YS5uYnl0ZXMpOwogCX0gZWxzZSB7CiAJCWlmICghb3AtPmFkZHIubmJ5dGVzKQogCQkJcmV0ID0g
YXNwZWVkX3NwaV93cml0ZV9yZWcoY2hpcCwgb3ApOwpAQCAtNDA1LDEwICs0MDUsNzMgQEAgc3Rh
dGljIGludCBhc3BlZWRfc3BpX2NoaXBfc2V0X2RlZmF1bHRfd2luZG93KHN0cnVjdCBhc3BlZWRf
c3BpX2NoaXAgKmNoaXApCiAJcmV0dXJuIGNoaXAtPmFoYl93aW5kb3dfc2l6ZSA/IDAgOiAtMTsK
IH0KIAorc3RhdGljIGludCBhc3BlZWRfc3BpX2Rpcm1hcF9jcmVhdGUoc3RydWN0IHNwaV9tZW1f
ZGlybWFwX2Rlc2MgKmRlc2MpCit7CisJc3RydWN0IGFzcGVlZF9zcGkgKmFzcGkgPSBzcGlfY29u
dHJvbGxlcl9nZXRfZGV2ZGF0YShkZXNjLT5tZW0tPnNwaS0+bWFzdGVyKTsKKwlzdHJ1Y3QgYXNw
ZWVkX3NwaV9jaGlwICpjaGlwID0gJmFzcGktPmNoaXBzW2Rlc2MtPm1lbS0+c3BpLT5jaGlwX3Nl
bGVjdF07CisJc3RydWN0IHNwaV9tZW1fb3AgKm9wID0gJmRlc2MtPmluZm8ub3BfdG1wbDsKKwl1
MzIgY3RsX3ZhbDsKKwlpbnQgcmV0ID0gMDsKKworCWNoaXAtPmNsa19mcmVxID0gZGVzYy0+bWVt
LT5zcGktPm1heF9zcGVlZF9oejsKKworCS8qIE9ubHkgZm9yIHJlYWRzICovCisJaWYgKG9wLT5k
YXRhLmRpciAhPSBTUElfTUVNX0RBVEFfSU4pCisJCXJldHVybiAtRU9QTk9UU1VQUDsKKworCWlm
IChkZXNjLT5pbmZvLmxlbmd0aCA+IGNoaXAtPmFoYl93aW5kb3dfc2l6ZSkKKwkJZGV2X3dhcm4o
YXNwaS0+ZGV2LCAiQ0UlZCB3aW5kb3cgKCVkTUIpIHRvbyBzbWFsbCBmb3IgbWFwcGluZyIsCisJ
CQkgY2hpcC0+Y3MsIGNoaXAtPmFoYl93aW5kb3dfc2l6ZSA+PiAyMCk7CisKKwkvKiBEZWZpbmUg
dGhlIGRlZmF1bHQgSU8gcmVhZCBzZXR0aW5ncyAqLworCWN0bF92YWwgPSByZWFkbChjaGlwLT5j
dGwpICYgfkNUUkxfSU9fQ01EX01BU0s7CisJY3RsX3ZhbCB8PSBhc3BlZWRfc3BpX2dldF9pb19t
b2RlKG9wKSB8CisJCW9wLT5jbWQub3Bjb2RlIDw8IENUUkxfQ09NTUFORF9TSElGVCB8CisJCUNU
UkxfSU9fRFVNTVlfU0VUKG9wLT5kdW1teS5uYnl0ZXMgLyBvcC0+ZHVtbXkuYnVzd2lkdGgpIHwK
KwkJQ1RSTF9JT19NT0RFX1JFQUQ7CisKKwkvKiBUdW5lIDRCWVRFIGFkZHJlc3MgbW9kZSAqLwor
CWlmIChvcC0+YWRkci5uYnl0ZXMpIHsKKwkJdTMyIGFkZHJfbW9kZSA9IHJlYWRsKGFzcGktPnJl
Z3MgKyBDRV9DVFJMX1JFRyk7CisKKwkJaWYgKG9wLT5hZGRyLm5ieXRlcyA9PSA0KQorCQkJYWRk
cl9tb2RlIHw9ICgweDExIDw8IGNoaXAtPmNzKTsKKwkJZWxzZQorCQkJYWRkcl9tb2RlICY9IH4o
MHgxMSA8PCBjaGlwLT5jcyk7CisJCXdyaXRlbChhZGRyX21vZGUsIGFzcGktPnJlZ3MgKyBDRV9D
VFJMX1JFRyk7CisJfQorCisJLyogUkVBRCBtb2RlIGlzIHRoZSBjb250cm9sbGVyIGRlZmF1bHQg
c2V0dGluZyAqLworCWNoaXAtPmN0bF92YWxbQVNQRUVEX1NQSV9SRUFEXSA9IGN0bF92YWw7CisJ
d3JpdGVsKGNoaXAtPmN0bF92YWxbQVNQRUVEX1NQSV9SRUFEXSwgY2hpcC0+Y3RsKTsKKworCWRl
dl9pbmZvKGFzcGktPmRldiwgIkNFJWQgcmVhZCBidXN3aWR0aDolZCBbMHglMDh4XVxuIiwKKwkJ
IGNoaXAtPmNzLCBvcC0+ZGF0YS5idXN3aWR0aCwgY2hpcC0+Y3RsX3ZhbFtBU1BFRURfU1BJX1JF
QURdKTsKKworCXJldHVybiByZXQ7Cit9CisKK3N0YXRpYyBpbnQgYXNwZWVkX3NwaV9kaXJtYXBf
cmVhZChzdHJ1Y3Qgc3BpX21lbV9kaXJtYXBfZGVzYyAqZGVzYywKKwkJCQkgIHU2NCBvZmZzZXQs
IHNpemVfdCBsZW4sIHZvaWQgKmJ1ZikKK3sKKwlzdHJ1Y3QgYXNwZWVkX3NwaSAqYXNwaSA9IHNw
aV9jb250cm9sbGVyX2dldF9kZXZkYXRhKGRlc2MtPm1lbS0+c3BpLT5tYXN0ZXIpOworCXN0cnVj
dCBhc3BlZWRfc3BpX2NoaXAgKmNoaXAgPSAmYXNwaS0+Y2hpcHNbZGVzYy0+bWVtLT5zcGktPmNo
aXBfc2VsZWN0XTsKKworCS8qIFN3aXRjaCB0byBVU0VSIGNvbW1hbmQgbW9kZSBpZiBtYXBwaW5n
IHdpbmRvdyBpcyB0b28gc21hbGwgKi8KKwlpZiAoY2hpcC0+YWhiX3dpbmRvd19zaXplIDwgb2Zm
c2V0ICsgbGVuKQorCQlhc3BlZWRfc3BpX3JlYWRfdXNlcihjaGlwLCAmZGVzYy0+aW5mby5vcF90
bXBsLCBvZmZzZXQsIGxlbiwgYnVmKTsKKwllbHNlCisJCW1lbWNweV9mcm9taW8oYnVmLCBjaGlw
LT5haGJfYmFzZSArIG9mZnNldCwgbGVuKTsKKworCXJldHVybiBsZW47Cit9CisKIHN0YXRpYyBj
b25zdCBzdHJ1Y3Qgc3BpX2NvbnRyb2xsZXJfbWVtX29wcyBhc3BlZWRfc3BpX21lbV9vcHMgPSB7
CiAJLnN1cHBvcnRzX29wID0gYXNwZWVkX3NwaV9zdXBwb3J0c19vcCwKIAkuZXhlY19vcCA9IGFz
cGVlZF9zcGlfZXhlY19vcCwKIAkuZ2V0X25hbWUgPSBhc3BlZWRfc3BpX2dldF9uYW1lLAorCS5k
aXJtYXBfY3JlYXRlID0gYXNwZWVkX3NwaV9kaXJtYXBfY3JlYXRlLAorCS5kaXJtYXBfcmVhZCA9
IGFzcGVlZF9zcGlfZGlybWFwX3JlYWQsCiB9OwogCiBzdGF0aWMgdm9pZCBhc3BlZWRfc3BpX2No
aXBfc2V0X3R5cGUoc3RydWN0IGFzcGVlZF9zcGkgKmFzcGksIHVuc2lnbmVkIGludCBjcywgaW50
IHR5cGUpCi0tIAoyLjM0LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
