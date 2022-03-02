Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99253C433F5
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Mar 2022 17:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Yeedh35Mp9waUNddfAigzeb0oxpv8eZsb2rB9Z55JjM=; b=hZKdJblavG2ZXu
	wrjXQjOJjA2ZDMGPJ8AZtjKIw3/XVL2h2S6Tp0HLSE8Gn15XVn2WsKUN0N1WEnkkFWvUsdH6EaSGc
	PypLUne4BDEvKo9Lk8mmgtoaDLM1ebfYTTRC24mx3t6je3OKFs79Ik72fhe5WetN7zqVkNzVFXxXw
	BNVz/7MpOxB1FmfESA73bkPwA7iFg+rCuY939qiuJfhd4ohjRYxTuJppRGbcpZt6vWuZ496GyErqf
	bbERJX1O2aSEwfvHKh/ocGqDq2ydwG2YtQLzDQEoDk9C1KJcpyCOpIJ9IEbjJka972UvQIgU93vUG
	6wVGoK//RH5TT7tnV0dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPSwE-003bmV-33; Wed, 02 Mar 2022 17:38:58 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPSpN-003Z6s-Le; Wed, 02 Mar 2022 17:31:55 +0000
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 222FZWUA014056; 
 Wed, 2 Mar 2022 17:31:33 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ej9std0k6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 17:31:32 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 222HDPte008081;
 Wed, 2 Mar 2022 17:31:31 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma04ams.nl.ibm.com with ESMTP id 3egbj1amg7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 17:31:30 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 222HVS6H55312846
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 2 Mar 2022 17:31:28 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8E0BBAE045;
 Wed,  2 Mar 2022 17:31:28 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EA411AE04D;
 Wed,  2 Mar 2022 17:31:27 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed,  2 Mar 2022 17:31:27 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.58.125])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 83E802200FE;
 Wed,  2 Mar 2022 18:31:26 +0100 (CET)
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
Subject: [PATCH v2 08/10] spi: aspeed: Add support for the AST2400 SPI
 controller
Date: Wed,  2 Mar 2022 18:31:12 +0100
Message-Id: <20220302173114.927476-9-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220302173114.927476-1-clg@kaod.org>
References: <20220302173114.927476-1-clg@kaod.org>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: QvKns0BNX4Dkfkm0M9ehrUPHiVJGXvHR
X-Proofpoint-ORIG-GUID: QvKns0BNX4Dkfkm0M9ehrUPHiVJGXvHR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-02_12,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 mlxscore=0 adultscore=0
 clxscore=1034 impostorscore=0 lowpriorityscore=0 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2203020076
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220302_093153_900445_A5AD5383 
X-CRM114-Status: GOOD (  22.78  )
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
ZWQtc21jLmMgYi9kcml2ZXJzL3NwaS9zcGktYXNwZWVkLXNtYy5jCmluZGV4IGUxMzM5ODRkM2M5
NS4uOGM2ZDdmNzlkOTdmIDEwMDY0NAotLS0gYS9kcml2ZXJzL3NwaS9zcGktYXNwZWVkLXNtYy5j
CisrKyBiL2RyaXZlcnMvc3BpL3NwaS1hc3BlZWQtc21jLmMKQEAgLTMyLDYgKzMyLDcgQEAKICNk
ZWZpbmUgICBDVFJMX0lPX0RVQUxfREFUQQkJQklUKDI5KQogI2RlZmluZSAgIENUUkxfSU9fUVVB
RF9EQVRBCQlCSVQoMzApCiAjZGVmaW5lICAgQ1RSTF9DT01NQU5EX1NISUZUCQkxNgorI2RlZmlu
ZSAgIENUUkxfSU9fQUREUkVTU180QgkJQklUKDEzKQkvKiBBU1QyNDAwIFNQSSBvbmx5ICovCiAj
ZGVmaW5lICAgQ1RSTF9JT19EVU1NWV9TRVQoZHVtbXkpCQkJCQlcCiAJKCgoKChkdW1teSkgPj4g
MikgJiAweDEpIDw8IDE0KSB8ICgoKGR1bW15KSAmIDB4MykgPDwgNikpCiAjZGVmaW5lICAgQ1RS
TF9DRV9TVE9QX0FDVElWRQkJQklUKDIpCkBAIC0yNzIsNiArMjczLDggQEAgc3RhdGljIGJvb2wg
YXNwZWVkX3NwaV9zdXBwb3J0c19vcChzdHJ1Y3Qgc3BpX21lbSAqbWVtLCBjb25zdCBzdHJ1Y3Qg
c3BpX21lbV9vcAogCXJldHVybiBzcGlfbWVtX2RlZmF1bHRfc3VwcG9ydHNfb3AobWVtLCBvcCk7
CiB9CiAKK3N0YXRpYyBjb25zdCBzdHJ1Y3QgYXNwZWVkX3NwaV9kYXRhIGFzdDI0MDBfc3BpX2Rh
dGE7CisKIHN0YXRpYyBpbnQgZG9fYXNwZWVkX3NwaV9leGVjX29wKHN0cnVjdCBzcGlfbWVtICpt
ZW0sIGNvbnN0IHN0cnVjdCBzcGlfbWVtX29wICpvcCkKIHsKIAlzdHJ1Y3QgYXNwZWVkX3NwaSAq
YXNwaSA9IHNwaV9jb250cm9sbGVyX2dldF9kZXZkYXRhKG1lbS0+c3BpLT5tYXN0ZXIpOwpAQCAt
MzAxLDYgKzMwNCw5IEBAIHN0YXRpYyBpbnQgZG9fYXNwZWVkX3NwaV9leGVjX29wKHN0cnVjdCBz
cGlfbWVtICptZW0sIGNvbnN0IHN0cnVjdCBzcGlfbWVtX29wICpvCiAJCQlhZGRyX21vZGUgfD0g
KDB4MTEgPDwgY2hpcC0+Y3MpOwogCQllbHNlCiAJCQlhZGRyX21vZGUgJj0gfigweDExIDw8IGNo
aXAtPmNzKTsKKworCQlpZiAob3AtPmFkZHIubmJ5dGVzID09IDQgJiYgY2hpcC0+YXNwaS0+ZGF0
YSA9PSAmYXN0MjQwMF9zcGlfZGF0YSkKKwkJCWN0bF92YWwgfD0gQ1RSTF9JT19BRERSRVNTXzRC
OwogCX0KIAogCWlmIChvcC0+ZHVtbXkuYnVzd2lkdGggJiYgb3AtPmR1bW15Lm5ieXRlcykKQEAg
LTM5Miw3ICszOTgsMTMgQEAgc3RhdGljIGludCBhc3BlZWRfc3BpX2NoaXBfc2V0X2RlZmF1bHRf
d2luZG93KHN0cnVjdCBhc3BlZWRfc3BpX2NoaXAgKmNoaXApCiAJc3RydWN0IGFzcGVlZF9zcGlf
d2luZG93IHdpbmRvd3NbQVNQRUVEX1NQSV9NQVhfTlVNX0NTXSA9IHsgMCB9OwogCXN0cnVjdCBh
c3BlZWRfc3BpX3dpbmRvdyAqd2luID0gJndpbmRvd3NbY2hpcC0+Y3NdOwogCi0JYXNwZWVkX3Nw
aV9nZXRfd2luZG93cyhhc3BpLCB3aW5kb3dzKTsKKwkvKiBObyBzZWdtZW50IHJlZ2lzdGVycyBm
b3IgdGhlIEFTVDI0MDAgU1BJIGNvbnRyb2xsZXIgKi8KKwlpZiAoYXNwaS0+ZGF0YSA9PSAmYXN0
MjQwMF9zcGlfZGF0YSkgeworCQl3aW4tPm9mZnNldCA9IDA7CisJCXdpbi0+c2l6ZSA9IGFzcGkt
PmFoYl93aW5kb3dfc2l6ZTsKKwl9IGVsc2UgeworCQlhc3BlZWRfc3BpX2dldF93aW5kb3dzKGFz
cGksIHdpbmRvd3MpOworCX0KIAogCWNoaXAtPmFoYl9iYXNlID0gYXNwaS0+YWhiX2Jhc2UgKyB3
aW4tPm9mZnNldDsKIAljaGlwLT5haGJfd2luZG93X3NpemUgPSB3aW4tPnNpemU7CkBAIC00NTUs
NiArNDY3LDEwIEBAIHN0YXRpYyBpbnQgYXNwZWVkX3NwaV9jaGlwX2FkanVzdF93aW5kb3coc3Ry
dWN0IGFzcGVlZF9zcGlfY2hpcCAqY2hpcCwKIAlzdHJ1Y3QgYXNwZWVkX3NwaV93aW5kb3cgKndp
biA9ICZ3aW5kb3dzW2NoaXAtPmNzXTsKIAlpbnQgcmV0OwogCisJLyogTm8gc2VnbWVudCByZWdp
c3RlcnMgZm9yIHRoZSBBU1QyNDAwIFNQSSBjb250cm9sbGVyICovCisJaWYgKGFzcGktPmRhdGEg
PT0gJmFzdDI0MDBfc3BpX2RhdGEpCisJCXJldHVybiAwOworCiAJLyoKIAkgKiBEdWUgdG8gYW4g
SFcgaXNzdWUgb24gdGhlIEFTVDI1MDAgU1BJIGNvbnRyb2xsZXIsIHRoZSBDRTAKIAkgKiB3aW5k
b3cgc2l6ZSBzaG91bGQgYmUgc21hbGxlciB0aGFuIHRoZSBtYXhpbXVtIDEyOE1CLgpAQCAtNTM5
LDYgKzU1NSwxMiBAQCBzdGF0aWMgaW50IGFzcGVlZF9zcGlfZGlybWFwX2NyZWF0ZShzdHJ1Y3Qg
c3BpX21lbV9kaXJtYXBfZGVzYyAqZGVzYykKIAkJZWxzZQogCQkJYWRkcl9tb2RlICY9IH4oMHgx
MSA8PCBjaGlwLT5jcyk7CiAJCXdyaXRlbChhZGRyX21vZGUsIGFzcGktPnJlZ3MgKyBDRV9DVFJM
X1JFRyk7CisKKwkJLyogQVNUMjQwMCBTUEkgY29udHJvbGxlciBzZXRzIDRCWVRFIGFkZHJlc3Mg
bW9kZSBpbgorCQkgKiBDRTAgQ29udHJvbCBSZWdpc3RlcgorCQkgKi8KKwkJaWYgKG9wLT5hZGRy
Lm5ieXRlcyA9PSA0ICYmIGNoaXAtPmFzcGktPmRhdGEgPT0gJmFzdDI0MDBfc3BpX2RhdGEpCisJ
CQljdGxfdmFsIHw9IENUUkxfSU9fQUREUkVTU180QjsKIAl9CiAKIAkvKiBSRUFEIG1vZGUgaXMg
dGhlIGNvbnRyb2xsZXIgZGVmYXVsdCBzZXR0aW5nICovCkBAIC04MDUsNiArODI3LDE0IEBAIHN0
YXRpYyBjb25zdCBzdHJ1Y3QgYXNwZWVkX3NwaV9kYXRhIGFzdDI0MDBfZm1jX2RhdGEgPSB7CiAJ
LnNlZ21lbnRfcmVnICAgPSBhc3BlZWRfc3BpX3NlZ21lbnRfcmVnLAogfTsKIAorc3RhdGljIGNv
bnN0IHN0cnVjdCBhc3BlZWRfc3BpX2RhdGEgYXN0MjQwMF9zcGlfZGF0YSA9IHsKKwkubWF4X2Nz
CSAgICAgICA9IDEsCisJLmhhc3R5cGUgICAgICAgPSBmYWxzZSwKKwkud2UwCSAgICAgICA9IDAs
CisJLmN0bDAJICAgICAgID0gMHgwNCwKKwkvKiBObyBzZWdtZW50IHJlZ2lzdGVycyAqLworfTsK
Kwogc3RhdGljIGNvbnN0IHN0cnVjdCBhc3BlZWRfc3BpX2RhdGEgYXN0MjUwMF9mbWNfZGF0YSA9
IHsKIAkubWF4X2NzCSAgICAgICA9IDMsCiAJLmhhc3R5cGUgICAgICAgPSB0cnVlLApAQCAtODQ5
LDYgKzg3OSw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgYXNwZWVkX3NwaV9kYXRhIGFzdDI2MDBf
c3BpX2RhdGEgPSB7CiAKIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIGFzcGVlZF9z
cGlfbWF0Y2hlc1tdID0gewogCXsgLmNvbXBhdGlibGUgPSAiYXNwZWVkLGFzdDI0MDAtZm1jIiwg
LmRhdGEgPSAmYXN0MjQwMF9mbWNfZGF0YSB9LAorCXsgLmNvbXBhdGlibGUgPSAiYXNwZWVkLGFz
dDI0MDAtc3BpIiwgLmRhdGEgPSAmYXN0MjQwMF9zcGlfZGF0YSB9LAogCXsgLmNvbXBhdGlibGUg
PSAiYXNwZWVkLGFzdDI1MDAtZm1jIiwgLmRhdGEgPSAmYXN0MjUwMF9mbWNfZGF0YSB9LAogCXsg
LmNvbXBhdGlibGUgPSAiYXNwZWVkLGFzdDI1MDAtc3BpIiwgLmRhdGEgPSAmYXN0MjUwMF9zcGlf
ZGF0YSB9LAogCXsgLmNvbXBhdGlibGUgPSAiYXNwZWVkLGFzdDI2MDAtZm1jIiwgLmRhdGEgPSAm
YXN0MjYwMF9mbWNfZGF0YSB9LAotLSAKMi4zNC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxp
bmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW10ZC8K
