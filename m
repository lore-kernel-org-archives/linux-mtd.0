Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B287C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Feb 2022 10:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v21o+kGUBKzALtxdTEpHL6yVoP0Y7I25gq6DG9PV/PQ=; b=EExUvN9MQq++6N
	r/sXEyozRdAtgzjsivi7QFtcwU1h956cVmlN9J160rb930qZsNEOniZfoFIbKt25UdNSRNxUOpUrk
	x4BC02YE6IPm/O0+xRAercUeOoLCNUfti9ckqk2ah6N9o0Ee16ZNPZJwDIV8JgiEAlpQGppY5c6dM
	ys95yNu1RjQI8yQ51kjaBMskXwZhDyI8ft5lpqf1h+/D+CPOfbPKs+LJaAiNMLfpN22EG4l9OIPa+
	WJRqb2RrElj5yU/yJFVDb09mdSG1FctYWcPXKDMsb36ngTAWI8VpoPwtYKPJIhHkvvIyivr7tAv0v
	dgHY1HdSzBTBciL1H/aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJYJS-00EQY0-6o; Mon, 14 Feb 2022 10:10:30 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJXt5-00EJ2x-Ix; Mon, 14 Feb 2022 09:43:17 +0000
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21E8UM9r022252; 
 Mon, 14 Feb 2022 09:42:45 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e6rt10krx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Feb 2022 09:42:44 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21E9aDv8025445;
 Mon, 14 Feb 2022 09:42:42 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma01fra.de.ibm.com with ESMTP id 3e64h92qwy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Feb 2022 09:42:42 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 21E9gee032047572
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 14 Feb 2022 09:42:40 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E2D43AE053;
 Mon, 14 Feb 2022 09:42:39 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 49CD8AE051;
 Mon, 14 Feb 2022 09:42:39 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Mon, 14 Feb 2022 09:42:39 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.60.190])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id D05AE2201E5;
 Mon, 14 Feb 2022 10:42:37 +0100 (CET)
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
Subject: [PATCH 01/10] mtd: spi-nor: aspeed: Rename Kconfig option
Date: Mon, 14 Feb 2022 10:42:22 +0100
Message-Id: <20220214094231.3753686-2-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220214094231.3753686-1-clg@kaod.org>
References: <20220214094231.3753686-1-clg@kaod.org>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: gX7JK45671uxdo1i3RwU_vYpKq31PP3t
X-Proofpoint-ORIG-GUID: gX7JK45671uxdo1i3RwU_vYpKq31PP3t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-14_01,2022-02-14_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=703
 impostorscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 clxscore=1034 mlxscore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 bulkscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202140058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_014315_691631_DCE870E6 
X-CRM114-Status: GOOD (  16.75  )
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

VG8gcHJlcGFyZSB0cmFuc2l0aW9uIHRvIHRoZSBuZXcgQXNwZWVkIFNNQyBTUEkgY29udHJvbGxl
ciBkcml2ZXIgdXNpbmcKdGhlIHNwaS1tZW0gaW50ZXJmYWNlLCBjaGFuZ2UgdGhlIGtlcm5lbCBD
T05GSUcgb3B0aW9uIG9mIHRoZSBjdXJyZW50CmRyaXZlciB0byByZWZsZWN0IHRoYXQgdGhlIGlt
cGxlbWVudGF0aW9uIHVzZXMgdGhlIE1URCBTUEktTk9SIGludGVyZmFjZS4KT25jZSB0aGUgbmV3
IGRyaXZlciBpcyBzdWZmaWNpZW50bHkgZXhwb3NlZCwgd2Ugc2hvdWxkIHJlbW92ZSB0aGUgb2xk
IG9uZS4KClNpZ25lZC1vZmYtYnk6IEPDqWRyaWMgTGUgR29hdGVyIDxjbGdAa2FvZC5vcmc+Ci0t
LQogYXJjaC9hcm0vY29uZmlncy9hc3BlZWRfZzRfZGVmY29uZmlnICAgICB8IDIgKy0KIGFyY2gv
YXJtL2NvbmZpZ3MvYXNwZWVkX2c1X2RlZmNvbmZpZyAgICAgfCAyICstCiBhcmNoL2FybS9jb25m
aWdzL211bHRpX3Y1X2RlZmNvbmZpZyAgICAgIHwgMiArLQogYXJjaC9hcm0vY29uZmlncy9tdWx0
aV92N19kZWZjb25maWcgICAgICB8IDIgKy0KIGRyaXZlcnMvbXRkL3NwaS1ub3IvY29udHJvbGxl
cnMvS2NvbmZpZyAgfCAyICstCiBkcml2ZXJzL210ZC9zcGktbm9yL2NvbnRyb2xsZXJzL01ha2Vm
aWxlIHwgMiArLQogNiBmaWxlcyBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vY29uZmlncy9hc3BlZWRfZzRfZGVmY29uZmlnIGIv
YXJjaC9hcm0vY29uZmlncy9hc3BlZWRfZzRfZGVmY29uZmlnCmluZGV4IGI0YTFiMmVkMWExNy4u
OTY0NTM2NDQ0Y2Q3IDEwMDY0NAotLS0gYS9hcmNoL2FybS9jb25maWdzL2FzcGVlZF9nNF9kZWZj
b25maWcKKysrIGIvYXJjaC9hcm0vY29uZmlncy9hc3BlZWRfZzRfZGVmY29uZmlnCkBAIC02NCw3
ICs2NCw3IEBAIENPTkZJR19NVERfQkxPQ0s9eQogQ09ORklHX01URF9QQVJUSVRJT05FRF9NQVNU
RVI9eQogQ09ORklHX01URF9TUElfTk9SPXkKICMgQ09ORklHX01URF9TUElfTk9SX1VTRV80S19T
RUNUT1JTIGlzIG5vdCBzZXQKLUNPTkZJR19TUElfQVNQRUVEX1NNQz15CitDT05GSUdfU1BJX0FT
UEVFRF9TTUNfTVREX1NQSV9OT1I9eQogQ09ORklHX01URF9VQkk9eQogQ09ORklHX01URF9VQklf
RkFTVE1BUD15CiBDT05GSUdfTVREX1VCSV9CTE9DSz15CmRpZmYgLS1naXQgYS9hcmNoL2FybS9j
b25maWdzL2FzcGVlZF9nNV9kZWZjb25maWcgYi9hcmNoL2FybS9jb25maWdzL2FzcGVlZF9nNV9k
ZWZjb25maWcKaW5kZXggY2NjNDI0MGVlNGI1Li5lODA5MjM2Y2E4OGIgMTAwNjQ0Ci0tLSBhL2Fy
Y2gvYXJtL2NvbmZpZ3MvYXNwZWVkX2c1X2RlZmNvbmZpZworKysgYi9hcmNoL2FybS9jb25maWdz
L2FzcGVlZF9nNV9kZWZjb25maWcKQEAgLTEwMyw3ICsxMDMsNyBAQCBDT05GSUdfTVREX0JMT0NL
PXkKIENPTkZJR19NVERfUEFSVElUSU9ORURfTUFTVEVSPXkKIENPTkZJR19NVERfU1BJX05PUj15
CiAjIENPTkZJR19NVERfU1BJX05PUl9VU0VfNEtfU0VDVE9SUyBpcyBub3Qgc2V0Ci1DT05GSUdf
U1BJX0FTUEVFRF9TTUM9eQorQ09ORklHX1NQSV9BU1BFRURfU01DX01URF9TUElfTk9SPXkKIENP
TkZJR19NVERfVUJJPXkKIENPTkZJR19NVERfVUJJX0ZBU1RNQVA9eQogQ09ORklHX01URF9VQklf
QkxPQ0s9eQpkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vY29uZmlncy9tdWx0aV92NV9kZWZjb25maWcg
Yi9hcmNoL2FybS9jb25maWdzL211bHRpX3Y1X2RlZmNvbmZpZwppbmRleCA4MGEzYWUwMmQ3NTku
LjQ5MDgzZWYwNWZiMCAxMDA2NDQKLS0tIGEvYXJjaC9hcm0vY29uZmlncy9tdWx0aV92NV9kZWZj
b25maWcKKysrIGIvYXJjaC9hcm0vY29uZmlncy9tdWx0aV92NV9kZWZjb25maWcKQEAgLTEwMyw3
ICsxMDMsNyBAQCBDT05GSUdfTVREX1JBV19OQU5EPXkKIENPTkZJR19NVERfTkFORF9BVE1FTD15
CiBDT05GSUdfTVREX05BTkRfT1JJT049eQogQ09ORklHX01URF9TUElfTk9SPXkKLUNPTkZJR19T
UElfQVNQRUVEX1NNQz15CitDT05GSUdfU1BJX0FTUEVFRF9TTUNfTVREX1NQSV9OT1I9eQogQ09O
RklHX01URF9VQkk9eQogQ09ORklHX0JMS19ERVZfTE9PUD15CiBDT05GSUdfQVRNRUxfU1NDPW0K
ZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2NvbmZpZ3MvbXVsdGlfdjdfZGVmY29uZmlnIGIvYXJjaC9h
cm0vY29uZmlncy9tdWx0aV92N19kZWZjb25maWcKaW5kZXggMzM1NzI5OThkYmJlLi5mYzFiNjky
NTZiNjQgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtL2NvbmZpZ3MvbXVsdGlfdjdfZGVmY29uZmlnCisr
KyBiL2FyY2gvYXJtL2NvbmZpZ3MvbXVsdGlfdjdfZGVmY29uZmlnCkBAIC0yMTcsNyArMjE3LDcg
QEAgQ09ORklHX01URF9OQU5EX0RBVklOQ0k9eQogQ09ORklHX01URF9OQU5EX1NUTTMyX0ZNQzI9
eQogQ09ORklHX01URF9OQU5EX1BMMzVYPXkKIENPTkZJR19NVERfU1BJX05PUj15Ci1DT05GSUdf
U1BJX0FTUEVFRF9TTUM9bQorQ09ORklHX1NQSV9BU1BFRURfU01DX01URF9TUElfTk9SPW0KIENP
TkZJR19NVERfVUJJPXkKIENPTkZJR19CTEtfREVWX0xPT1A9eQogQ09ORklHX0JMS19ERVZfUkFN
PXkKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL3NwaS1ub3IvY29udHJvbGxlcnMvS2NvbmZpZyBi
L2RyaXZlcnMvbXRkL3NwaS1ub3IvY29udHJvbGxlcnMvS2NvbmZpZwppbmRleCA1YzBlMGVjMmU2
ZDEuLjg3NmE0NzA0MmZlYyAxMDA2NDQKLS0tIGEvZHJpdmVycy9tdGQvc3BpLW5vci9jb250cm9s
bGVycy9LY29uZmlnCisrKyBiL2RyaXZlcnMvbXRkL3NwaS1ub3IvY29udHJvbGxlcnMvS2NvbmZp
ZwpAQCAtMSw1ICsxLDUgQEAKICMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25s
eQotY29uZmlnIFNQSV9BU1BFRURfU01DCitjb25maWcgU1BJX0FTUEVFRF9TTUNfTVREX1NQSV9O
T1IKIAl0cmlzdGF0ZSAiQXNwZWVkIGZsYXNoIGNvbnRyb2xsZXJzIGluIFNQSSBtb2RlIgogCWRl
cGVuZHMgb24gQVJDSF9BU1BFRUQgfHwgQ09NUElMRV9URVNUCiAJZGVwZW5kcyBvbiBIQVNfSU9N
RU0gJiYgT0YKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL3NwaS1ub3IvY29udHJvbGxlcnMvTWFr
ZWZpbGUgYi9kcml2ZXJzL210ZC9zcGktbm9yL2NvbnRyb2xsZXJzL01ha2VmaWxlCmluZGV4IGU3
YWJiYTQ5MWQ5OC4uMWUyODI5N2ZiMWU4IDEwMDY0NAotLS0gYS9kcml2ZXJzL210ZC9zcGktbm9y
L2NvbnRyb2xsZXJzL01ha2VmaWxlCisrKyBiL2RyaXZlcnMvbXRkL3NwaS1ub3IvY29udHJvbGxl
cnMvTWFrZWZpbGUKQEAgLTEsNSArMSw1IEBACiAjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBH
UEwtMi4wCi1vYmotJChDT05GSUdfU1BJX0FTUEVFRF9TTUMpCSs9IGFzcGVlZC1zbWMubworb2Jq
LSQoQ09ORklHX1NQSV9BU1BFRURfU01DX01URF9TUElfTk9SKQkrPSBhc3BlZWQtc21jLm8KIG9i
ai0kKENPTkZJR19TUElfSElTSV9TRkMpCSs9IGhpc2ktc2ZjLm8KIG9iai0kKENPTkZJR19TUElf
TlhQX1NQSUZJKQkrPSBueHAtc3BpZmkubwogb2JqLSQoQ09ORklHX1NQSV9JTlRFTF9TUEkpCSs9
IGludGVsLXNwaS5vCi0tIAoyLjM0LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
