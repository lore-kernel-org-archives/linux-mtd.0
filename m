Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E30DC433EF
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Mar 2022 09:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e0+fxzb7nRcNh9J40gIwbU+2z0hLpKSBeKbIsZcF140=; b=uUZmlyvG98fvNS
	B9jgUE2y5IgY7bxJYvIOetMVlkqT5wzjzyAR3dl70nVBfmMTzPKJeeK6j3BTijlUrHR29fvQioPb9
	xuxV7zy9psVdBYS09JkNvOthIWi9FAgogjuYK2EjSEJQJGTGu2coWrz/aXamo5i/+w3/wiH0R53Py
	ulC6zjFQbj6sjdk6Iq7zckEfUOa+q6VXa+vbwRPM6kWTKZvAGnycJ8mP3MfcfbkS9fiTNoqaV1Ndu
	cyhL5Tz+JGjJR61EVD4cek6M0EUHiAY1tqw6krLhmWQavX5XrC8GoZz/hoDF+3WbYrhK3FuQ9Y3mT
	RQJ7g+jf4vUOf7UYPDkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nQ3nJ-009ANE-88; Fri, 04 Mar 2022 09:00:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nQ3RR-00944v-O7; Fri, 04 Mar 2022 08:37:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
 :MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=RgLbOWB6cjoVe/Slzn78Rb9mX2mqIF9xhl6eJlqe4SM=; b=hII9nCAPzRUAiFc6tDAfn1KHOm
 Te4OWT9EL0absCMpbWT8uA8+cZgMzo3wLu+PU4IbtSXo1aTacH+nf8ObyJ0X1/JXqBx6fxzy7YKqV
 acxSF5tWanbP8nJFIJl4HpDfHwe5Ji5MSF39dmMWIAWyxPvc9G99JnaMCOZN/HNLReS9xxMTdkLGr
 BrXL03g7izWUTRYwdGgiEY2wKGCyzjzXHki7hNK5YxQ5bPFi83izMYmvqaPMozNgJTIhtNOYD1GgD
 XPk5Su0tsr9+Ih/zzwhYm0btYRHf+wmL0yhj5RtinUNgqrT3znQXY35d+IQgjquAg7pJl/N2ExPrn
 U0iuibPA==;
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nQ3RB-00F9Br-AU; Fri, 04 Mar 2022 08:37:36 +0000
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 2247ChgT003272; 
 Fri, 4 Mar 2022 08:37:01 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ek78b8447-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Mar 2022 08:37:01 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 2248AKHu012078;
 Fri, 4 Mar 2022 08:37:00 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ek78b843s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Mar 2022 08:37:00 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2248X3S1013595;
 Fri, 4 Mar 2022 08:36:58 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma03ams.nl.ibm.com with ESMTP id 3ek4k417h9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Mar 2022 08:36:58 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2248aumf57672142
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 4 Mar 2022 08:36:56 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5853BAE053;
 Fri,  4 Mar 2022 08:36:56 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AF4B3AE04D;
 Fri,  4 Mar 2022 08:36:55 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Fri,  4 Mar 2022 08:36:55 +0000 (GMT)
Received: from yukon.home (unknown [9.171.91.16])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id D96B72201B4;
 Fri,  4 Mar 2022 09:36:53 +0100 (CET)
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
Subject: [PATCH v3 05/11] spi: aspeed: Add support for direct mapping
Date: Fri,  4 Mar 2022 09:36:37 +0100
Message-Id: <20220304083643.1079142-6-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220304083643.1079142-1-clg@kaod.org>
References: <20220304083643.1079142-1-clg@kaod.org>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 6yY8G907jljsVK9o6RAwlcASsDP6EnNq
X-Proofpoint-GUID: j1K9uRvHqhRRW72XmpctzbGXoo-UJhJ2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-04_02,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 impostorscore=0 bulkscore=0 spamscore=0 suspectscore=0 adultscore=0
 phishscore=0 clxscore=1034 malwarescore=0 lowpriorityscore=0
 mlxlogscore=999 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203040044
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220304_083721_692466_B36B2E8B 
X-CRM114-Status: GOOD (  21.81  )
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
