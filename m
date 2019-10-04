Return-Path: <SRS0=3ySE=X5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4A21C4360C
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Oct 2019 12:13:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7ECAD2070B
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Oct 2019 12:13:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Qme4MiLx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7ECAD2070B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kaod.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:MIME-Version:References:
	In-Reply-To:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sKH3kGkL+VZt9WI0VeY/OkRQDD4XjRNEdFljVe9s6TM=; b=Qme4MiLx0BB4GW
	5Wcln2N/tYXGDo+XfL0/XkAWP5YTX8b+mc3iyxIONghOqrz0DDVTuNISTMe8VmLkGQtXQB0+O53C5
	30YiLW+YwTLe/ntvp2PFqIGCCqwtdqsreX1A9/qwKscJgTLs4TO3OifeQp+XeWEYu6G6u7Ywk9TD0
	zvMmAs0YGEWZpilhdfWjWG3mrKqRST/MLt30Lqrv2bNLRFXYnIsVv29Btdo7vhqP2dSV23qv4Zrua
	203pNV8dUKHyFMJQi7rkxP/YzOs8HiWTinNcIbO0iv0QWm0Om+xea2u7zV3J1SqFzrsFe0vFymW1G
	4/jWc8aQTRdxlO2CLNLA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iGMT1-0003sV-K6; Fri, 04 Oct 2019 12:13:51 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iGMP6-0007d5-5N
 for linux-mtd@lists.infradead.org; Fri, 04 Oct 2019 12:09:51 +0000
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x94C7OGF144309
 for <linux-mtd@lists.infradead.org>; Fri, 4 Oct 2019 08:09:46 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2ve2x3ycja-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linux-mtd@lists.infradead.org>; Fri, 04 Oct 2019 08:09:46 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linux-mtd@lists.infradead.org> from <clg@kaod.org>;
 Fri, 4 Oct 2019 13:09:44 +0100
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 4 Oct 2019 13:09:39 +0100
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x94C9cbv50528396
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 4 Oct 2019 12:09:38 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 11B7911C04C;
 Fri,  4 Oct 2019 12:09:38 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E7C0611C04A;
 Fri,  4 Oct 2019 12:09:37 +0000 (GMT)
Received: from smtp.tls.ibm.com (unknown [9.101.4.1])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  4 Oct 2019 12:09:37 +0000 (GMT)
Received: from yukon.kaod.org.com (sig-9-145-169-184.de.ibm.com
 [9.145.169.184])
 by smtp.tls.ibm.com (Postfix) with ESMTP id D21952201B7;
 Fri,  4 Oct 2019 14:09:36 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: linux-mtd@lists.infradead.org, Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: [PATCH 14/16] mtd: spi-nor: aspeed: Introduce training operations per
 platform
Date: Fri,  4 Oct 2019 14:09:32 +0200
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191004115919.20788-1-clg@kaod.org>
References: <20191004115919.20788-1-clg@kaod.org>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
x-cbid: 19100412-0020-0000-0000-00000374FF71
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19100412-0021-0000-0000-000021CB0E95
Message-Id: <20191004120934.21662-1-clg@kaod.org>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-10-04_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1034 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=646 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1910040113
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191004_050948_430470_40C9A4DA 
X-CRM114-Status: GOOD (  23.26  )
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

VGhlIHJlYWQgdGltaW5nIGNvbXBlbnNhdGlvbiByZWdpc3RlciByZWNvcmRzIHRoZSByZWFkIGRl
bGF5IHNldHRpbmdzCmZvciBhIHJhbmdlIG9mIEhDTEsuIEl0cyBlbmNvZGluZyBpcyBkaWZmZXJl
bnQgb24gdGhlIEFTVDI2MDAgYW5kIHRoZQpyZWFkIHRyYWluaW5nIHdpbGwgYmUgc2xpZ2h0bHkg
bW9yZSBjb21wbGV4LgoKU2lnbmVkLW9mZi1ieTogQ8OpZHJpYyBMZSBHb2F0ZXIgPGNsZ0BrYW9k
Lm9yZz4KUmV2aWV3ZWQtYnk6IEFuZHJldyBKZWZmZXJ5IDxhbmRyZXdAYWouaWQuYXU+Ci0tLQog
ZHJpdmVycy9tdGQvc3BpLW5vci9hc3BlZWQtc21jLmMgfCAyMyArKysrKysrKysrKysrKysrKysr
Ky0tLQogMSBmaWxlIGNoYW5nZWQsIDIwIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvc3BpLW5vci9hc3BlZWQtc21jLmMgYi9kcml2ZXJzL210
ZC9zcGktbm9yL2FzcGVlZC1zbWMuYwppbmRleCBmYWQwODczOGU1MzQuLjg1YjdmZjNiY2M5MSAx
MDA2NDQKLS0tIGEvZHJpdmVycy9tdGQvc3BpLW5vci9hc3BlZWQtc21jLmMKKysrIGIvZHJpdmVy
cy9tdGQvc3BpLW5vci9hc3BlZWQtc21jLmMKQEAgLTQxLDkgKzQxLDEzIEBAIHN0cnVjdCBhc3Bl
ZWRfc21jX2luZm8gewogCXU4IHdlMDsJCQkvKiBzaGlmdCBmb3Igd3JpdGUgZW5hYmxlIGJpdCBm
b3IgQ0UwICovCiAJdTggY3RsMDsJCS8qIG9mZnNldCBpbiByZWdzIG9mIGN0bCBmb3IgQ0UwICov
CiAJdTggdGltaW5nOwkJLyogb2Zmc2V0IGluIHJlZ3Mgb2YgdGltaW5nICovCisJdTMyIGhkaXZf
bWF4OyAgICAgICAgICAgLyogTWF4IEhDTEsgZGl2aXNvciBvbiByZWFkIHRpbWluZyByZWcgKi8K
IAogCXZvaWQgKCpzZXRfNGIpKHN0cnVjdCBhc3BlZWRfc21jX2NoaXAgKmNoaXApOwogCWludCAo
Km9wdGltaXplX3JlYWQpKHN0cnVjdCBhc3BlZWRfc21jX2NoaXAgKmNoaXAsIHUzMiBtYXhfZnJl
cSk7CisJaW50ICgqY2FsaWJyYXRlKShzdHJ1Y3QgYXNwZWVkX3NtY19jaGlwICpjaGlwLCB1MzIg
aGRpdiwKKwkJCSBjb25zdCB1OCAqZ29sZGVuX2J1ZiwgdTggKnRlc3RfYnVmKTsKKwogCXUzMiAo
KnNlZ21lbnRfc3RhcnQpKHN0cnVjdCBhc3BlZWRfc21jX2NvbnRyb2xsZXIgKmNvbnRyb2xsZXIs
IHUzMiByZWcpOwogCXUzMiAoKnNlZ21lbnRfZW5kKShzdHJ1Y3QgYXNwZWVkX3NtY19jb250cm9s
bGVyICpjb250cm9sbGVyLCB1MzIgcmVnKTsKIAl1MzIgKCpzZWdtZW50X3JlZykoc3RydWN0IGFz
cGVlZF9zbWNfY29udHJvbGxlciAqY29udHJvbGxlciwKQEAgLTU0LDYgKzU4LDggQEAgc3RhdGlj
IHZvaWQgYXNwZWVkX3NtY19jaGlwX3NldF80Yl9zcGlfMjQwMChzdHJ1Y3QgYXNwZWVkX3NtY19j
aGlwICpjaGlwKTsKIHN0YXRpYyB2b2lkIGFzcGVlZF9zbWNfY2hpcF9zZXRfNGIoc3RydWN0IGFz
cGVlZF9zbWNfY2hpcCAqY2hpcCk7CiBzdGF0aWMgaW50IGFzcGVlZF9zbWNfb3B0aW1pemVfcmVh
ZChzdHJ1Y3QgYXNwZWVkX3NtY19jaGlwICpjaGlwLAogCQkJCSAgICB1MzIgbWF4X2ZyZXEpOwor
c3RhdGljIGludCBhc3BlZWRfc21jX2NhbGlicmF0ZV9yZWFkcyhzdHJ1Y3QgYXNwZWVkX3NtY19j
aGlwICpjaGlwLCB1MzIgaGRpdiwKKwkJCQkgICAgICBjb25zdCB1OCAqZ29sZGVuX2J1ZiwgdTgg
KnRlc3RfYnVmKTsKIAogc3RhdGljIHUzMiBhc3BlZWRfc21jX3NlZ21lbnRfc3RhcnQoc3RydWN0
IGFzcGVlZF9zbWNfY29udHJvbGxlciAqY29udHJvbGxlciwKIAkJCQkgICAgdTMyIHJlZyk7CkBA
IC02OSw4ICs3NSwxMCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGFzcGVlZF9zbWNfaW5mbyBmbWNf
MjQwMF9pbmZvID0gewogCS53ZTAgPSAxNiwKIAkuY3RsMCA9IDB4MTAsCiAJLnRpbWluZyA9IDB4
OTQsCisJLmhkaXZfbWF4ID0gMSwKIAkuc2V0XzRiID0gYXNwZWVkX3NtY19jaGlwX3NldF80YiwK
IAkub3B0aW1pemVfcmVhZCA9IGFzcGVlZF9zbWNfb3B0aW1pemVfcmVhZCwKKwkuY2FsaWJyYXRl
ID0gYXNwZWVkX3NtY19jYWxpYnJhdGVfcmVhZHMsCiAJLnNlZ21lbnRfc3RhcnQgPSBhc3BlZWRf
c21jX3NlZ21lbnRfc3RhcnQsCiAJLnNlZ21lbnRfZW5kID0gYXNwZWVkX3NtY19zZWdtZW50X2Vu
ZCwKIAkuc2VnbWVudF9yZWcgPSBhc3BlZWRfc21jX3NlZ21lbnRfcmVnLApAQCAtODMsOCArOTEs
MTAgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBhc3BlZWRfc21jX2luZm8gc3BpXzI0MDBfaW5mbyA9
IHsKIAkud2UwID0gMCwKIAkuY3RsMCA9IDB4MDQsCiAJLnRpbWluZyA9IDB4MTQsCisJLmhkaXZf
bWF4ID0gMSwKIAkuc2V0XzRiID0gYXNwZWVkX3NtY19jaGlwX3NldF80Yl9zcGlfMjQwMCwKIAku
b3B0aW1pemVfcmVhZCA9IGFzcGVlZF9zbWNfb3B0aW1pemVfcmVhZCwKKwkuY2FsaWJyYXRlID0g
YXNwZWVkX3NtY19jYWxpYnJhdGVfcmVhZHMsCiAJLyogTm8gc2VnbWVudCByZWdpc3RlcnMgKi8K
IH07CiAKQEAgLTk1LDggKzEwNSwxMCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGFzcGVlZF9zbWNf
aW5mbyBmbWNfMjUwMF9pbmZvID0gewogCS53ZTAgPSAxNiwKIAkuY3RsMCA9IDB4MTAsCiAJLnRp
bWluZyA9IDB4OTQsCisJLmhkaXZfbWF4ID0gMSwKIAkuc2V0XzRiID0gYXNwZWVkX3NtY19jaGlw
X3NldF80YiwKIAkub3B0aW1pemVfcmVhZCA9IGFzcGVlZF9zbWNfb3B0aW1pemVfcmVhZCwKKwku
Y2FsaWJyYXRlID0gYXNwZWVkX3NtY19jYWxpYnJhdGVfcmVhZHMsCiAJLnNlZ21lbnRfc3RhcnQg
PSBhc3BlZWRfc21jX3NlZ21lbnRfc3RhcnQsCiAJLnNlZ21lbnRfZW5kID0gYXNwZWVkX3NtY19z
ZWdtZW50X2VuZCwKIAkuc2VnbWVudF9yZWcgPSBhc3BlZWRfc21jX3NlZ21lbnRfcmVnLApAQCAt
MTA5LDggKzEyMSwxMCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGFzcGVlZF9zbWNfaW5mbyBzcGlf
MjUwMF9pbmZvID0gewogCS53ZTAgPSAxNiwKIAkuY3RsMCA9IDB4MTAsCiAJLnRpbWluZyA9IDB4
OTQsCisJLmhkaXZfbWF4ID0gMSwKIAkuc2V0XzRiID0gYXNwZWVkX3NtY19jaGlwX3NldF80YiwK
IAkub3B0aW1pemVfcmVhZCA9IGFzcGVlZF9zbWNfb3B0aW1pemVfcmVhZCwKKwkuY2FsaWJyYXRl
ID0gYXNwZWVkX3NtY19jYWxpYnJhdGVfcmVhZHMsCiAJLnNlZ21lbnRfc3RhcnQgPSBhc3BlZWRf
c21jX3NlZ21lbnRfc3RhcnQsCiAJLnNlZ21lbnRfZW5kID0gYXNwZWVkX3NtY19zZWdtZW50X2Vu
ZCwKIAkuc2VnbWVudF9yZWcgPSBhc3BlZWRfc21jX3NlZ21lbnRfcmVnLApAQCAtMTAyMiw2ICsx
MDM2LDggQEAgc3RhdGljIHUzMiBhc3BlZWRfc21jX2RlZmF1bHRfcmVhZChzdHJ1Y3QgYXNwZWVk
X3NtY19jaGlwICpjaGlwKQogc3RhdGljIGludCBhc3BlZWRfc21jX29wdGltaXplX3JlYWQoc3Ry
dWN0IGFzcGVlZF9zbWNfY2hpcCAqY2hpcCwKIAkJCQkgICAgdTMyIG1heF9mcmVxKQogeworCXN0
cnVjdCBhc3BlZWRfc21jX2NvbnRyb2xsZXIgKmNvbnRyb2xsZXIgPSBjaGlwLT5jb250cm9sbGVy
OworCWNvbnN0IHN0cnVjdCBhc3BlZWRfc21jX2luZm8gKmluZm8gPSBjb250cm9sbGVyLT5pbmZv
OwogCXU4ICpnb2xkZW5fYnVmLCAqdGVzdF9idWY7CiAJaW50IGksIHJjLCBiZXN0X2RpdiA9IC0x
OwogCXUzMiBzYXZlX3JlYWRfdmFsID0gY2hpcC0+Y3RsX3ZhbFtzbWNfcmVhZF07CkBAIC0xMDU0
LDcgKzEwNzAsOCBAQCBzdGF0aWMgaW50IGFzcGVlZF9zbWNfb3B0aW1pemVfcmVhZChzdHJ1Y3Qg
YXNwZWVkX3NtY19jaGlwICpjaGlwLAogCX0KIAogCS8qIE5vdyB3ZSBpdGVyYXRlIHRoZSBIQ0xL
IGRpdmlkZXJzIHVudGlsIHdlIGZpbmQgb3VyIGJyZWFraW5nIHBvaW50ICovCi0JZm9yIChpID0g
QVJSQVlfU0laRShhc3BlZWRfc21jX2hjbGtfZGl2cyk7IGkgPiAwOyBpLS0pIHsKKwlmb3IgKGkg
PSBBUlJBWV9TSVpFKGFzcGVlZF9zbWNfaGNsa19kaXZzKTsKKwkgICAgIGkgPiBpbmZvLT5oZGl2
X21heCAtIDE7IGktLSkgewogCQl1MzIgdHYsIGZyZXE7CiAKIAkJLyogQ29tcGFyZSB0aW1pbmcg
dG8gbWF4ICovCkBAIC0xMDY1LDggKzEwODIsOCBAQCBzdGF0aWMgaW50IGFzcGVlZF9zbWNfb3B0
aW1pemVfcmVhZChzdHJ1Y3QgYXNwZWVkX3NtY19jaGlwICpjaGlwLAogCQkvKiBTZXQgdGhlIHRp
bWluZyAqLwogCQl0diA9IGNoaXAtPmN0bF92YWxbc21jX3JlYWRdIHwgQVNQRUVEX1NNQ19IQ0xL
X0RJVihpKTsKIAkJd3JpdGVsKHR2LCBjaGlwLT5jdGwpOwotCQlkZXZfZGJnKGNoaXAtPm5vci5k
ZXYsICJUcnlpbmcgSENMSy8lZC4uLiIsIGkpOwotCQlyYyA9IGFzcGVlZF9zbWNfY2FsaWJyYXRl
X3JlYWRzKGNoaXAsIGksIGdvbGRlbl9idWYsIHRlc3RfYnVmKTsKKwkJZGV2X2RiZyhjaGlwLT5u
b3IuZGV2LCAiVHJ5aW5nIEhDTEsvJWQgWyUwOHhdIC4uLiIsIGksIHR2KTsKKwkJcmMgPSBpbmZv
LT5jYWxpYnJhdGUoY2hpcCwgaSwgZ29sZGVuX2J1ZiwgdGVzdF9idWYpOwogCQlpZiAocmMgPT0g
MCkKIAkJCWJlc3RfZGl2ID0gaTsKIAl9Ci0tIAoyLjIxLjAKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24g
bWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbXRkLwo=
