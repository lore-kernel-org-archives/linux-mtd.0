Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B5C4C433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Mar 2022 10:16:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6vmC6kKXopW2Bt8zesB0hJRTBDskWk+sS7pszlspxdg=; b=NkXfRSMpnHMOmF
	78sBZzukGVB6WrkVU2Ig6gJVPHCLgm+f6OYUfl/cL6FAx1LFcufnW78ykGmbc/RppGk6+Kc0gSwLf
	HSO7NJp4+j9tUsWTuVkN6zJe7J/RzPqGszODLDJTgYUG52ap5Zdal0y5tzKwz3r+/KnZIi0x7RMsH
	afgp/T+vnMjthUEoVC/4Lf9FjTzAif3KkFF9l61BV0bq4NWNZtGf/hvCWnFy6nUOIU9KjdBuyduxM
	aORmewQaimAtj48zY6K80RTv7Gjp2+7vmSHkI6aFXT5PTDnjIHfICqU9TXbjay13cccf/DsN/somH
	Nivx6W5Sc1iLtpwEZN4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nXgzH-001fBj-J4; Fri, 25 Mar 2022 10:16:07 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nXgsw-001cUt-Bh; Fri, 25 Mar 2022 10:09:38 +0000
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22P9kZa3012005; 
 Fri, 25 Mar 2022 10:09:12 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3f0sd4e335-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Mar 2022 10:09:12 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 22P9pttB003878;
 Fri, 25 Mar 2022 10:09:11 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3f0sd4e327-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Mar 2022 10:09:10 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22P9xLML008133;
 Fri, 25 Mar 2022 10:09:08 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma04ams.nl.ibm.com with ESMTP id 3ew6t94x3f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Mar 2022 10:09:08 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 22PA99gB45547832
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 25 Mar 2022 10:09:09 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5E68C42042;
 Fri, 25 Mar 2022 10:09:05 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B085A4203F;
 Fri, 25 Mar 2022 10:09:04 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Fri, 25 Mar 2022 10:09:04 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.95.248])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 1EC0C220158;
 Fri, 25 Mar 2022 11:09:03 +0100 (CET)
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
Subject: [PATCH v4 07/11] spi: aspeed: Add support for the AST2400 SPI
 controller
Date: Fri, 25 Mar 2022 11:08:45 +0100
Message-Id: <20220325100849.2019209-8-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220325100849.2019209-1-clg@kaod.org>
References: <20220325100849.2019209-1-clg@kaod.org>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: bLx3DTGnnb3_0mbTsof4KGwop6tvumau
X-Proofpoint-ORIG-GUID: W3tqwvmxnvUuDUaKidCdY2oFBQ6Phc8j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-25_02,2022-03-24_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0
 suspectscore=0 mlxlogscore=999 bulkscore=0 priorityscore=1501
 clxscore=1034 impostorscore=0 phishscore=0 mlxscore=0 lowpriorityscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203250057
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220325_030934_544441_82D246F6 
X-CRM114-Status: GOOD (  21.86  )
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
ICAuIHNpbmdsZSwgZHVhbCBtb2RlLgoKUmV2aWV3ZWQtYnk6IEpvZWwgU3RhbmxleSA8am9lbEBq
bXMuaWQuYXU+ClRlc3RlZC1ieTogSm9lbCBTdGFubGV5IDxqb2VsQGptcy5pZC5hdT4KVGVzdGVk
LWJ5OiBUYW8gUmVuIDxyZW50YW8uYnVwdEBnbWFpbC5jb20+ClNpZ25lZC1vZmYtYnk6IEPDqWRy
aWMgTGUgR29hdGVyIDxjbGdAa2FvZC5vcmc+Ci0tLQogZHJpdmVycy9zcGkvc3BpLWFzcGVlZC1z
bWMuYyB8IDMzICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLQogMSBmaWxlIGNoYW5n
ZWQsIDMyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L3NwaS9zcGktYXNwZWVkLXNtYy5jIGIvZHJpdmVycy9zcGkvc3BpLWFzcGVlZC1zbWMuYwppbmRl
eCBhYjZmYTVjZmFkOWMuLjdmMzA2ZGE3YzQ0ZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9zcGkvc3Bp
LWFzcGVlZC1zbWMuYworKysgYi9kcml2ZXJzL3NwaS9zcGktYXNwZWVkLXNtYy5jCkBAIC0zMCw2
ICszMCw3IEBACiAjZGVmaW5lICAgQ1RSTF9JT19EVUFMX0RBVEEJCUJJVCgyOSkKICNkZWZpbmUg
ICBDVFJMX0lPX1FVQURfREFUQQkJQklUKDMwKQogI2RlZmluZSAgIENUUkxfQ09NTUFORF9TSElG
VAkJMTYKKyNkZWZpbmUgICBDVFJMX0lPX0FERFJFU1NfNEIJCUJJVCgxMykJLyogQVNUMjQwMCBT
UEkgb25seSAqLwogI2RlZmluZSAgIENUUkxfSU9fRFVNTVlfU0VUKGR1bW15KQkJCQkJXAogCSgo
KCgoZHVtbXkpID4+IDIpICYgMHgxKSA8PCAxNCkgfCAoKChkdW1teSkgJiAweDMpIDw8IDYpKQog
I2RlZmluZSAgIENUUkxfQ0VfU1RPUF9BQ1RJVkUJCUJJVCgyKQpAQCAtMjcwLDYgKzI3MSw4IEBA
IHN0YXRpYyBib29sIGFzcGVlZF9zcGlfc3VwcG9ydHNfb3Aoc3RydWN0IHNwaV9tZW0gKm1lbSwg
Y29uc3Qgc3RydWN0IHNwaV9tZW1fb3AKIAlyZXR1cm4gc3BpX21lbV9kZWZhdWx0X3N1cHBvcnRz
X29wKG1lbSwgb3ApOwogfQogCitzdGF0aWMgY29uc3Qgc3RydWN0IGFzcGVlZF9zcGlfZGF0YSBh
c3QyNDAwX3NwaV9kYXRhOworCiBzdGF0aWMgaW50IGRvX2FzcGVlZF9zcGlfZXhlY19vcChzdHJ1
Y3Qgc3BpX21lbSAqbWVtLCBjb25zdCBzdHJ1Y3Qgc3BpX21lbV9vcCAqb3ApCiB7CiAJc3RydWN0
IGFzcGVlZF9zcGkgKmFzcGkgPSBzcGlfY29udHJvbGxlcl9nZXRfZGV2ZGF0YShtZW0tPnNwaS0+
bWFzdGVyKTsKQEAgLTI5OSw2ICszMDIsOSBAQCBzdGF0aWMgaW50IGRvX2FzcGVlZF9zcGlfZXhl
Y19vcChzdHJ1Y3Qgc3BpX21lbSAqbWVtLCBjb25zdCBzdHJ1Y3Qgc3BpX21lbV9vcCAqbwogCQkJ
YWRkcl9tb2RlIHw9ICgweDExIDw8IGNoaXAtPmNzKTsKIAkJZWxzZQogCQkJYWRkcl9tb2RlICY9
IH4oMHgxMSA8PCBjaGlwLT5jcyk7CisKKwkJaWYgKG9wLT5hZGRyLm5ieXRlcyA9PSA0ICYmIGNo
aXAtPmFzcGktPmRhdGEgPT0gJmFzdDI0MDBfc3BpX2RhdGEpCisJCQljdGxfdmFsIHw9IENUUkxf
SU9fQUREUkVTU180QjsKIAl9CiAKIAlpZiAob3AtPmR1bW15LmJ1c3dpZHRoICYmIG9wLT5kdW1t
eS5uYnl0ZXMpCkBAIC0zOTAsNyArMzk2LDEzIEBAIHN0YXRpYyBpbnQgYXNwZWVkX3NwaV9jaGlw
X3NldF9kZWZhdWx0X3dpbmRvdyhzdHJ1Y3QgYXNwZWVkX3NwaV9jaGlwICpjaGlwKQogCXN0cnVj
dCBhc3BlZWRfc3BpX3dpbmRvdyB3aW5kb3dzW0FTUEVFRF9TUElfTUFYX05VTV9DU10gPSB7IDAg
fTsKIAlzdHJ1Y3QgYXNwZWVkX3NwaV93aW5kb3cgKndpbiA9ICZ3aW5kb3dzW2NoaXAtPmNzXTsK
IAotCWFzcGVlZF9zcGlfZ2V0X3dpbmRvd3MoYXNwaSwgd2luZG93cyk7CisJLyogTm8gc2VnbWVu
dCByZWdpc3RlcnMgZm9yIHRoZSBBU1QyNDAwIFNQSSBjb250cm9sbGVyICovCisJaWYgKGFzcGkt
PmRhdGEgPT0gJmFzdDI0MDBfc3BpX2RhdGEpIHsKKwkJd2luLT5vZmZzZXQgPSAwOworCQl3aW4t
PnNpemUgPSBhc3BpLT5haGJfd2luZG93X3NpemU7CisJfSBlbHNlIHsKKwkJYXNwZWVkX3NwaV9n
ZXRfd2luZG93cyhhc3BpLCB3aW5kb3dzKTsKKwl9CiAKIAljaGlwLT5haGJfYmFzZSA9IGFzcGkt
PmFoYl9iYXNlICsgd2luLT5vZmZzZXQ7CiAJY2hpcC0+YWhiX3dpbmRvd19zaXplID0gd2luLT5z
aXplOwpAQCAtNDUzLDYgKzQ2NSwxMCBAQCBzdGF0aWMgaW50IGFzcGVlZF9zcGlfY2hpcF9hZGp1
c3Rfd2luZG93KHN0cnVjdCBhc3BlZWRfc3BpX2NoaXAgKmNoaXAsCiAJc3RydWN0IGFzcGVlZF9z
cGlfd2luZG93ICp3aW4gPSAmd2luZG93c1tjaGlwLT5jc107CiAJaW50IHJldDsKIAorCS8qIE5v
IHNlZ21lbnQgcmVnaXN0ZXJzIGZvciB0aGUgQVNUMjQwMCBTUEkgY29udHJvbGxlciAqLworCWlm
IChhc3BpLT5kYXRhID09ICZhc3QyNDAwX3NwaV9kYXRhKQorCQlyZXR1cm4gMDsKKwogCS8qCiAJ
ICogRHVlIHRvIGFuIEhXIGlzc3VlIG9uIHRoZSBBU1QyNTAwIFNQSSBjb250cm9sbGVyLCB0aGUg
Q0UwCiAJICogd2luZG93IHNpemUgc2hvdWxkIGJlIHNtYWxsZXIgdGhhbiB0aGUgbWF4aW11bSAx
MjhNQi4KQEAgLTUzNyw2ICs1NTMsMTIgQEAgc3RhdGljIGludCBhc3BlZWRfc3BpX2Rpcm1hcF9j
cmVhdGUoc3RydWN0IHNwaV9tZW1fZGlybWFwX2Rlc2MgKmRlc2MpCiAJCWVsc2UKIAkJCWFkZHJf
bW9kZSAmPSB+KDB4MTEgPDwgY2hpcC0+Y3MpOwogCQl3cml0ZWwoYWRkcl9tb2RlLCBhc3BpLT5y
ZWdzICsgQ0VfQ1RSTF9SRUcpOworCisJCS8qIEFTVDI0MDAgU1BJIGNvbnRyb2xsZXIgc2V0cyA0
QllURSBhZGRyZXNzIG1vZGUgaW4KKwkJICogQ0UwIENvbnRyb2wgUmVnaXN0ZXIKKwkJICovCisJ
CWlmIChvcC0+YWRkci5uYnl0ZXMgPT0gNCAmJiBjaGlwLT5hc3BpLT5kYXRhID09ICZhc3QyNDAw
X3NwaV9kYXRhKQorCQkJY3RsX3ZhbCB8PSBDVFJMX0lPX0FERFJFU1NfNEI7CiAJfQogCiAJLyog
UkVBRCBtb2RlIGlzIHRoZSBjb250cm9sbGVyIGRlZmF1bHQgc2V0dGluZyAqLwpAQCAtODAzLDYg
KzgyNSwxNCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGFzcGVlZF9zcGlfZGF0YSBhc3QyNDAwX2Zt
Y19kYXRhID0gewogCS5zZWdtZW50X3JlZyAgID0gYXNwZWVkX3NwaV9zZWdtZW50X3JlZywKIH07
CiAKK3N0YXRpYyBjb25zdCBzdHJ1Y3QgYXNwZWVkX3NwaV9kYXRhIGFzdDI0MDBfc3BpX2RhdGEg
PSB7CisJLm1heF9jcwkgICAgICAgPSAxLAorCS5oYXN0eXBlICAgICAgID0gZmFsc2UsCisJLndl
MAkgICAgICAgPSAwLAorCS5jdGwwCSAgICAgICA9IDB4MDQsCisJLyogTm8gc2VnbWVudCByZWdp
c3RlcnMgKi8KK307CisKIHN0YXRpYyBjb25zdCBzdHJ1Y3QgYXNwZWVkX3NwaV9kYXRhIGFzdDI1
MDBfZm1jX2RhdGEgPSB7CiAJLm1heF9jcwkgICAgICAgPSAzLAogCS5oYXN0eXBlICAgICAgID0g
dHJ1ZSwKQEAgLTg0Nyw2ICs4NzcsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGFzcGVlZF9zcGlf
ZGF0YSBhc3QyNjAwX3NwaV9kYXRhID0gewogCiBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2Rldmlj
ZV9pZCBhc3BlZWRfc3BpX21hdGNoZXNbXSA9IHsKIAl7IC5jb21wYXRpYmxlID0gImFzcGVlZCxh
c3QyNDAwLWZtYyIsIC5kYXRhID0gJmFzdDI0MDBfZm1jX2RhdGEgfSwKKwl7IC5jb21wYXRpYmxl
ID0gImFzcGVlZCxhc3QyNDAwLXNwaSIsIC5kYXRhID0gJmFzdDI0MDBfc3BpX2RhdGEgfSwKIAl7
IC5jb21wYXRpYmxlID0gImFzcGVlZCxhc3QyNTAwLWZtYyIsIC5kYXRhID0gJmFzdDI1MDBfZm1j
X2RhdGEgfSwKIAl7IC5jb21wYXRpYmxlID0gImFzcGVlZCxhc3QyNTAwLXNwaSIsIC5kYXRhID0g
JmFzdDI1MDBfc3BpX2RhdGEgfSwKIAl7IC5jb21wYXRpYmxlID0gImFzcGVlZCxhc3QyNjAwLWZt
YyIsIC5kYXRhID0gJmFzdDI2MDBfZm1jX2RhdGEgfSwKLS0gCjIuMzQuMQoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlz
Y3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tdGQvCg==
