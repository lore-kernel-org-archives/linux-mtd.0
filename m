Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7BE2C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Feb 2022 10:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CXmwum//8m/eTmo8SO114evXG3zu29GAqpkCCV7aoLk=; b=hF4E0W84pThrRA
	uX+JjT2lHJEM6qJgpnCG/DmqsimeFqI3PM6pbsf3q1X9zj9wN50dQXxRJ+wMRqDmJNwCsbsW1eM+R
	0eiF43jta1U5yQKozOVesGkvT3pdTCOfVu30RCQJDtAz+Nm41rz0coU19mJgX1NFQLLUVF0Ra5387
	73IMTDmikURcQhYIQKKo7hd06fpp2MkX4Qsabqom9EG+6Btq/5rIDwXaKuAF6gM4hecN5IZfHj9kW
	JSpJXboxpNKEWao56M/2MEJUVs74cmJ50WXtYvs0rcpp9xf/wOa9LPiPuPMww8bcrLHZmX9CwqOov
	SdmJVmL6rJdamoHL4bPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJYHD-00EPwe-T6; Mon, 14 Feb 2022 10:08:12 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJXt3-00EJ2U-VZ; Mon, 14 Feb 2022 09:43:16 +0000
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21E7I6ln012418; 
 Mon, 14 Feb 2022 09:42:49 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e7c4dscne-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Feb 2022 09:42:48 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21E9biMZ021915;
 Mon, 14 Feb 2022 09:42:47 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma06ams.nl.ibm.com with ESMTP id 3e645jbjsw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Feb 2022 09:42:47 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21E9giSe32112926
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 14 Feb 2022 09:42:44 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4A3244C05C;
 Mon, 14 Feb 2022 09:42:44 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AAEEA4C058;
 Mon, 14 Feb 2022 09:42:43 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Mon, 14 Feb 2022 09:42:43 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.60.190])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 450A22201DE;
 Mon, 14 Feb 2022 10:42:42 +0100 (CET)
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
Subject: [PATCH 04/10] spi: aspeed: Add support for direct mapping
Date: Mon, 14 Feb 2022 10:42:25 +0100
Message-Id: <20220214094231.3753686-5-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220214094231.3753686-1-clg@kaod.org>
References: <20220214094231.3753686-1-clg@kaod.org>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: RDI0kDGsSi27dmJvpa1XfnlHaaH83rG_
X-Proofpoint-ORIG-GUID: RDI0kDGsSi27dmJvpa1XfnlHaaH83rG_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-14_01,2022-02-14_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 adultscore=0 clxscore=1034 lowpriorityscore=0 impostorscore=0
 suspectscore=0 mlxlogscore=999 priorityscore=1501 mlxscore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202140058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_014314_230398_48AEF7DD 
X-CRM114-Status: GOOD (  20.81  )
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
dWdoLCBmYWxsIGJhY2sgdG8gdGhlICJVc2VyIG1vZGUiIHRvCnBlcmZvcm0gdGhlIHJlYWQuCgpE
aXJlY3QgbWFwcGluZyBmb3Igd3JpdGVzIHdpbGwgY29tZSBsYXRlciB3aGVuIHZhbGlkYXRlZC4K
ClNpZ25lZC1vZmYtYnk6IEPDqWRyaWMgTGUgR29hdGVyIDxjbGdAa2FvZC5vcmc+Ci0tLQogZHJp
dmVycy9zcGkvc3BpLWFzcGVlZC1zbWMuYyB8IDY3ICsrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKystLQogMSBmaWxlIGNoYW5nZWQsIDY1IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9zcGkvc3BpLWFzcGVlZC1zbWMuYyBiL2RyaXZlcnMv
c3BpL3NwaS1hc3BlZWQtc21jLmMKaW5kZXggMGFlZmY2ZjQ2OGFmLi44ZDMzZmNiNzczNmEgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvc3BpL3NwaS1hc3BlZWQtc21jLmMKKysrIGIvZHJpdmVycy9zcGkv
c3BpLWFzcGVlZC1zbWMuYwpAQCAtMzQ1LDggKzM0NSw4IEBAIHN0YXRpYyBpbnQgZG9fYXNwZWVk
X3NwaV9leGVjX29wKHN0cnVjdCBzcGlfbWVtICptZW0sIGNvbnN0IHN0cnVjdCBzcGlfbWVtX29w
ICpvCiAJCWlmICghb3AtPmFkZHIubmJ5dGVzKQogCQkJcmV0ID0gYXNwZWVkX3NwaV9yZWFkX3Jl
ZyhjaGlwLCBvcCk7CiAJCWVsc2UKLQkJCXJldCA9IGFzcGVlZF9zcGlfcmVhZF91c2VyKGNoaXAs
IG9wLCBvcC0+YWRkci52YWwsCi0JCQkJCQkgICBvcC0+ZGF0YS5uYnl0ZXMsIG9wLT5kYXRhLmJ1
Zi5pbik7CisJCQltZW1jcHlfZnJvbWlvKG9wLT5kYXRhLmJ1Zi5pbiwgY2hpcC0+YWhiX2Jhc2Ug
KyBvcC0+YWRkci52YWwsCisJCQkJICAgICAgb3AtPmRhdGEubmJ5dGVzKTsKIAl9IGVsc2Ugewog
CQlpZiAoIW9wLT5hZGRyLm5ieXRlcykKIAkJCXJldCA9IGFzcGVlZF9zcGlfd3JpdGVfcmVnKGNo
aXAsIG9wKTsKQEAgLTQyNiwxMCArNDI2LDczIEBAIHN0YXRpYyBpbnQgYXNwZWVkX3NwaV9jaGlw
X3NldF9kZWZhdWx0X3dpbmRvdyhzdHJ1Y3QgYXNwZWVkX3NwaV9jaGlwICpjaGlwKQogCXJldHVy
biBjaGlwLT5haGJfd2luZG93X3NpemUgPyAwIDogLTE7CiB9CiAKK3N0YXRpYyBpbnQgYXNwZWVk
X3NwaV9kaXJtYXBfY3JlYXRlKHN0cnVjdCBzcGlfbWVtX2Rpcm1hcF9kZXNjICpkZXNjKQorewor
CXN0cnVjdCBhc3BlZWRfc3BpICphc3BpID0gc3BpX2NvbnRyb2xsZXJfZ2V0X2RldmRhdGEoZGVz
Yy0+bWVtLT5zcGktPm1hc3Rlcik7CisJc3RydWN0IGFzcGVlZF9zcGlfY2hpcCAqY2hpcCA9ICZh
c3BpLT5jaGlwc1tkZXNjLT5tZW0tPnNwaS0+Y2hpcF9zZWxlY3RdOworCXN0cnVjdCBzcGlfbWVt
X29wICpvcCA9ICZkZXNjLT5pbmZvLm9wX3RtcGw7CisJdTMyIGN0bF92YWw7CisJaW50IHJldCA9
IDA7CisKKwljaGlwLT5jbGtfZnJlcSA9IGRlc2MtPm1lbS0+c3BpLT5tYXhfc3BlZWRfaHo7CisK
KwkvKiBPbmx5IGZvciByZWFkcyAqLworCWlmIChvcC0+ZGF0YS5kaXIgIT0gU1BJX01FTV9EQVRB
X0lOKQorCQlyZXR1cm4gLUVPUE5PVFNVUFA7CisKKwlpZiAoZGVzYy0+aW5mby5sZW5ndGggPiBj
aGlwLT5haGJfd2luZG93X3NpemUpCisJCWRldl93YXJuKGFzcGktPmRldiwgIkNFJWQgd2luZG93
ICglZE1CKSB0b28gc21hbGwgZm9yIG1hcHBpbmciLAorCQkJIGNoaXAtPmNzLCBjaGlwLT5haGJf
d2luZG93X3NpemUgPj4gMjApOworCisJLyogRGVmaW5lIHRoZSBkZWZhdWx0IElPIHJlYWQgc2V0
dGluZ3MgKi8KKwljdGxfdmFsID0gcmVhZGwoY2hpcC0+Y3RsKSAmIH5DVFJMX0lPX0NNRF9NQVNL
OworCWN0bF92YWwgfD0gYXNwZWVkX3NwaV9nZXRfaW9fbW9kZShvcCkgfAorCQlvcC0+Y21kLm9w
Y29kZSA8PCBDVFJMX0NPTU1BTkRfU0hJRlQgfAorCQlDVFJMX0lPX0RVTU1ZX1NFVChvcC0+ZHVt
bXkubmJ5dGVzIC8gb3AtPmR1bW15LmJ1c3dpZHRoKSB8CisJCUNUUkxfSU9fTU9ERV9SRUFEOwor
CisJLyogVHVuZSA0QllURSBhZGRyZXNzIG1vZGUgKi8KKwlpZiAob3AtPmFkZHIubmJ5dGVzKSB7
CisJCXUzMiBhZGRyX21vZGUgPSByZWFkbChhc3BpLT5yZWdzICsgQ0VfQ1RSTF9SRUcpOworCisJ
CWlmIChvcC0+YWRkci5uYnl0ZXMgPT0gNCkKKwkJCWFkZHJfbW9kZSB8PSAoMHgxMSA8PCBjaGlw
LT5jcyk7CisJCWVsc2UKKwkJCWFkZHJfbW9kZSAmPSB+KDB4MTEgPDwgY2hpcC0+Y3MpOworCQl3
cml0ZWwoYWRkcl9tb2RlLCBhc3BpLT5yZWdzICsgQ0VfQ1RSTF9SRUcpOworCX0KKworCS8qIFJF
QUQgbW9kZSBpcyB0aGUgY29udHJvbGxlciBkZWZhdWx0IHNldHRpbmcgKi8KKwljaGlwLT5jdGxf
dmFsW0FTUEVFRF9TUElfUkVBRF0gPSBjdGxfdmFsOworCXdyaXRlbChjaGlwLT5jdGxfdmFsW0FT
UEVFRF9TUElfUkVBRF0sIGNoaXAtPmN0bCk7CisKKwlkZXZfaW5mbyhhc3BpLT5kZXYsICJDRSVk
IHJlYWQgYnVzd2lkdGg6JWQgWzB4JTA4eF1cbiIsCisJCSBjaGlwLT5jcywgb3AtPmRhdGEuYnVz
d2lkdGgsIGNoaXAtPmN0bF92YWxbQVNQRUVEX1NQSV9SRUFEXSk7CisKKwlyZXR1cm4gcmV0Owor
fQorCitzdGF0aWMgaW50IGFzcGVlZF9zcGlfZGlybWFwX3JlYWQoc3RydWN0IHNwaV9tZW1fZGly
bWFwX2Rlc2MgKmRlc2MsCisJCQkJICB1NjQgb2Zmc2V0LCBzaXplX3QgbGVuLCB2b2lkICpidWYp
Cit7CisJc3RydWN0IGFzcGVlZF9zcGkgKmFzcGkgPSBzcGlfY29udHJvbGxlcl9nZXRfZGV2ZGF0
YShkZXNjLT5tZW0tPnNwaS0+bWFzdGVyKTsKKwlzdHJ1Y3QgYXNwZWVkX3NwaV9jaGlwICpjaGlw
ID0gJmFzcGktPmNoaXBzW2Rlc2MtPm1lbS0+c3BpLT5jaGlwX3NlbGVjdF07CisKKwkvKiBTd2l0
Y2ggdG8gVVNFUiBjb21tYW5kIG1vZGUgaWYgbWFwcGluZyB3aW5kb3cgaXMgdG9vIHNtYWxsICov
CisJaWYgKGNoaXAtPmFoYl93aW5kb3dfc2l6ZSA8IG9mZnNldCArIGxlbikKKwkJYXNwZWVkX3Nw
aV9yZWFkX3VzZXIoY2hpcCwgJmRlc2MtPmluZm8ub3BfdG1wbCwgb2Zmc2V0LCBsZW4sIGJ1Zik7
CisJZWxzZQorCQltZW1jcHlfZnJvbWlvKGJ1ZiwgY2hpcC0+YWhiX2Jhc2UgKyBvZmZzZXQsIGxl
bik7CisKKwlyZXR1cm4gbGVuOworfQorCiBzdGF0aWMgY29uc3Qgc3RydWN0IHNwaV9jb250cm9s
bGVyX21lbV9vcHMgYXNwZWVkX3NwaV9tZW1fb3BzID0gewogCS5zdXBwb3J0c19vcCA9IGFzcGVl
ZF9zcGlfc3VwcG9ydHNfb3AsCiAJLmV4ZWNfb3AgPSBhc3BlZWRfc3BpX2V4ZWNfb3AsCiAJLmdl
dF9uYW1lID0gYXNwZWVkX3NwaV9nZXRfbmFtZSwKKwkuZGlybWFwX2NyZWF0ZSA9IGFzcGVlZF9z
cGlfZGlybWFwX2NyZWF0ZSwKKwkuZGlybWFwX3JlYWQgPSBhc3BlZWRfc3BpX2Rpcm1hcF9yZWFk
LAogfTsKIAogc3RhdGljIHZvaWQgYXNwZWVkX3NwaV9jaGlwX3NldF90eXBlKHN0cnVjdCBhc3Bl
ZWRfc3BpX2NoaXAgKmNoaXAsIGludCB0eXBlKQotLSAKMi4zNC4xCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNz
aW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW10ZC8K
