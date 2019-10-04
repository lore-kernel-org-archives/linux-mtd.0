Return-Path: <SRS0=3ySE=X5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55EE5C47404
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Oct 2019 12:14:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1BD0D2070B
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Oct 2019 12:14:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RzLITm5c"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1BD0D2070B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kaod.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:MIME-Version:References:
	In-Reply-To:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B1yjq9vkLRaN+4V+CAF64+4NnIS/2niXpjpJamd8MOw=; b=RzLITm5cyENb07
	h/pgdfvTaUohIKZekbJZ3qIqXql+oyrGj9zDYfJu5tSoCW/m1pjwK2V+TBc8Yz60RSS2Vu+5x/B+z
	2kaf1sd9B6DQYXXXnJ1zRaT8wNEYXUwf0LE6gXijS7DmYvbRMtpRVeRR9Ma+WWb7UVIM+/afzTYv0
	jSszmz6O8U07CPOeKuOeLRAqb4kVU/VsZlm2bskfen/FU+lp1pWNx7igPPSI6+r78HZIF9cryafjr
	hTAf6MsmMgR4aUbHoNWVskPwbWTMe/xeB8i8s4wUPrjhhQwGD31OZaHOoshvY6DxU3Bkcl7CcbI+z
	uszcMNl/fwziTDVUsJIg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iGMTC-00043g-LC; Fri, 04 Oct 2019 12:14:02 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iGMP6-0007d4-5O
 for linux-mtd@lists.infradead.org; Fri, 04 Oct 2019 12:09:50 +0000
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x94C7coW019833
 for <linux-mtd@lists.infradead.org>; Fri, 4 Oct 2019 08:09:46 -0400
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ve46pvbpx-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linux-mtd@lists.infradead.org>; Fri, 04 Oct 2019 08:09:46 -0400
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linux-mtd@lists.infradead.org> from <clg@kaod.org>;
 Fri, 4 Oct 2019 13:09:44 +0100
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 4 Oct 2019 13:09:40 +0100
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x94C9dQO53870610
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 4 Oct 2019 12:09:39 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0BA02AE051;
 Fri,  4 Oct 2019 12:09:39 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E984CAE055;
 Fri,  4 Oct 2019 12:09:38 +0000 (GMT)
Received: from smtp.tls.ibm.com (unknown [9.101.4.1])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  4 Oct 2019 12:09:38 +0000 (GMT)
Received: from yukon.kaod.org.com (sig-9-145-169-184.de.ibm.com
 [9.145.169.184])
 by smtp.tls.ibm.com (Postfix) with ESMTP id D932F220204;
 Fri,  4 Oct 2019 14:09:37 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: linux-mtd@lists.infradead.org, Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: [PATCH 15/16] mtd: spi-nor: aspeed: Introduce a HCLK mask for training
Date: Fri,  4 Oct 2019 14:09:33 +0200
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191004120934.21662-1-clg@kaod.org>
References: <20191004115919.20788-1-clg@kaod.org>
 <20191004120934.21662-1-clg@kaod.org>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
x-cbid: 19100412-4275-0000-0000-0000036E030C
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19100412-4276-0000-0000-000038810CF5
Message-Id: <20191004120934.21662-2-clg@kaod.org>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-10-04_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1034 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=725 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1910040113
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191004_050948_356660_E2E84E2F 
X-CRM114-Status: GOOD (  22.56  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-aspeed@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>,
 Richard Weinberger <richard@nod.at>, Marek Vasut <marek.vasut@gmail.com>,
 Joel Stanley <joel@jms.id.au>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

VGhlIEFTVDI2MDAgaGFuZGxlcyBtb3JlIEhDTEsgZGl2aXNvcnMgdGhhbiBpdHMgcHJlZGVjZXNz
b3JzLgoKU2lnbmVkLW9mZi1ieTogQ8OpZHJpYyBMZSBHb2F0ZXIgPGNsZ0BrYW9kLm9yZz4KUmV2
aWV3ZWQtYnk6IEFuZHJldyBKZWZmZXJ5IDxhbmRyZXdAYWouaWQuYXU+Ci0tLQogZHJpdmVycy9t
dGQvc3BpLW5vci9hc3BlZWQtc21jLmMgfCA3ICsrKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCA2IGlu
c2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9zcGkt
bm9yL2FzcGVlZC1zbWMuYyBiL2RyaXZlcnMvbXRkL3NwaS1ub3IvYXNwZWVkLXNtYy5jCmluZGV4
IDg1YjdmZjNiY2M5MS4uNWZhOTk1NmQxODNlIDEwMDY0NAotLS0gYS9kcml2ZXJzL210ZC9zcGkt
bm9yL2FzcGVlZC1zbWMuYworKysgYi9kcml2ZXJzL210ZC9zcGktbm9yL2FzcGVlZC1zbWMuYwpA
QCAtNDEsNiArNDEsNyBAQCBzdHJ1Y3QgYXNwZWVkX3NtY19pbmZvIHsKIAl1OCB3ZTA7CQkJLyog
c2hpZnQgZm9yIHdyaXRlIGVuYWJsZSBiaXQgZm9yIENFMCAqLwogCXU4IGN0bDA7CQkvKiBvZmZz
ZXQgaW4gcmVncyBvZiBjdGwgZm9yIENFMCAqLwogCXU4IHRpbWluZzsJCS8qIG9mZnNldCBpbiBy
ZWdzIG9mIHRpbWluZyAqLworCXUzMiBoY2xrX21hc2s7ICAgICAgICAgIC8qIGNsb2NrIGZyZXF1
ZW5jeSBtYXNrIGluIENFeCBDb250cm9sIHJlZyAqLwogCXUzMiBoZGl2X21heDsgICAgICAgICAg
IC8qIE1heCBIQ0xLIGRpdmlzb3Igb24gcmVhZCB0aW1pbmcgcmVnICovCiAKIAl2b2lkICgqc2V0
XzRiKShzdHJ1Y3QgYXNwZWVkX3NtY19jaGlwICpjaGlwKTsKQEAgLTc1LDYgKzc2LDcgQEAgc3Rh
dGljIGNvbnN0IHN0cnVjdCBhc3BlZWRfc21jX2luZm8gZm1jXzI0MDBfaW5mbyA9IHsKIAkud2Uw
ID0gMTYsCiAJLmN0bDAgPSAweDEwLAogCS50aW1pbmcgPSAweDk0LAorCS5oY2xrX21hc2sgPSAw
eGZmZmZmMGZmLAogCS5oZGl2X21heCA9IDEsCiAJLnNldF80YiA9IGFzcGVlZF9zbWNfY2hpcF9z
ZXRfNGIsCiAJLm9wdGltaXplX3JlYWQgPSBhc3BlZWRfc21jX29wdGltaXplX3JlYWQsCkBAIC05
MSw2ICs5Myw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgYXNwZWVkX3NtY19pbmZvIHNwaV8yNDAw
X2luZm8gPSB7CiAJLndlMCA9IDAsCiAJLmN0bDAgPSAweDA0LAogCS50aW1pbmcgPSAweDE0LAor
CS5oY2xrX21hc2sgPSAweGZmZmZmMGZmLAogCS5oZGl2X21heCA9IDEsCiAJLnNldF80YiA9IGFz
cGVlZF9zbWNfY2hpcF9zZXRfNGJfc3BpXzI0MDAsCiAJLm9wdGltaXplX3JlYWQgPSBhc3BlZWRf
c21jX29wdGltaXplX3JlYWQsCkBAIC0xMDUsNiArMTA4LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVj
dCBhc3BlZWRfc21jX2luZm8gZm1jXzI1MDBfaW5mbyA9IHsKIAkud2UwID0gMTYsCiAJLmN0bDAg
PSAweDEwLAogCS50aW1pbmcgPSAweDk0LAorCS5oY2xrX21hc2sgPSAweGZmZmZmMGZmLAogCS5o
ZGl2X21heCA9IDEsCiAJLnNldF80YiA9IGFzcGVlZF9zbWNfY2hpcF9zZXRfNGIsCiAJLm9wdGlt
aXplX3JlYWQgPSBhc3BlZWRfc21jX29wdGltaXplX3JlYWQsCkBAIC0xMjEsNiArMTI1LDcgQEAg
c3RhdGljIGNvbnN0IHN0cnVjdCBhc3BlZWRfc21jX2luZm8gc3BpXzI1MDBfaW5mbyA9IHsKIAku
d2UwID0gMTYsCiAJLmN0bDAgPSAweDEwLAogCS50aW1pbmcgPSAweDk0LAorCS5oY2xrX21hc2sg
PSAweGZmZmZmMGZmLAogCS5oZGl2X21heCA9IDEsCiAJLnNldF80YiA9IGFzcGVlZF9zbWNfY2hp
cF9zZXRfNGIsCiAJLm9wdGltaXplX3JlYWQgPSBhc3BlZWRfc21jX29wdGltaXplX3JlYWQsCkBA
IC0xMDU4LDcgKzEwNjMsNyBAQCBzdGF0aWMgaW50IGFzcGVlZF9zbWNfb3B0aW1pemVfcmVhZChz
dHJ1Y3QgYXNwZWVkX3NtY19jaGlwICpjaGlwLAogCW1lbWNweV9mcm9taW8oZ29sZGVuX2J1Ziwg
Y2hpcC0+YWhiX2Jhc2UsIENBTElCUkFURV9CVUZfU0laRSk7CiAKIAkvKiBFc3RhYmxpc2ggb3Vy
IHJlYWQgbW9kZSB3aXRoIGZyZXEgZmllbGQgc2V0IHRvIDAgKEhDTEsvMTYpICovCi0JY2hpcC0+
Y3RsX3ZhbFtzbWNfcmVhZF0gPSBzYXZlX3JlYWRfdmFsICYgMHhmZmZmZjBmZjsKKwljaGlwLT5j
dGxfdmFsW3NtY19yZWFkXSA9IHNhdmVfcmVhZF92YWwgJiBpbmZvLT5oY2xrX21hc2s7CiAKIAkv
KiBDaGVjayBpZiBjYWxpYnJhdGlvbiBkYXRhIGlzIHN1aXRhYmxlICovCiAJaWYgKCFhc3BlZWRf
c21jX2NoZWNrX2NhbGliX2RhdGEoZ29sZGVuX2J1ZiwgQ0FMSUJSQVRFX0JVRl9TSVpFKSkgewot
LSAKMi4yMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
