Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B815C433F5
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Mar 2022 08:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GaxXOxQIZnrf1foEQjERoCM98htvNBMQHMSOCZ749mw=; b=na1Cy6yVeudydG
	2jdWaT/1WxUB6FaWA+xCjUMEZ7Tx6obz+u0uwIpVp1IOqO1F9rULrTFvIvxKKn5LrmCliRTXnGB6L
	6jdAYPjHuhe20oEvdxEvQrLg9BvAQXaSztgtK84701033uEsrhwUAw/nkDVwMV7PIAx/FRxXWN4wK
	aHTrL5C0Q3aX/1cl0NHG0SSc5QgJk2S/WUGV9oeMcSo4gHRlM3csVvmVtApP5nbN1G23HcE8w5Wzx
	y2RjvRDQaesYxMoTVrytQk+eKL0XOa8PUfm/ajRXWwMcHdsWiTwRAQ09SS0SLyZknw53NLyf8EWN7
	lQhQvWXmjywa/M+U9jBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nQ3k1-0099Yf-Mo; Fri, 04 Mar 2022 08:56:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nQ3RR-00944q-Hl; Fri, 04 Mar 2022 08:37:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
 :MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=DeFIeSAV6wl44eOLwalWMdFJq6LAcwIlFDj82vAPZ3s=; b=mPta9mROvk0Ld1A/5pE7eCJOv/
 3k9clZVFkfhT7ZHpp44pZ8kuwKcXjWC+3n+xASyKoJNP9fMiidMPUZ7gRgAVMGr8eJ+vJWr34UvC6
 4Yzoaca3fx3GQkqyJgQJ4ZuO8DjYP7wd/Mec0gkCVDwPuUP8bYvbITlZ1/PN14PJ05rCMtxGapdJ4
 hjeNETXCXSSCeJab+67xWDhsUHhkd3A3phNyZqZyAvXzGSHnhwTH7gQ3bd3AnmIXM7NwPJoeXxoMr
 IdT4ahDtjhdaMZqs1xnhNv4bQH+KfNHudvTBy0tx3KZhrUJc9PfifLcITzZuiOQh8sWPaclEij4Lv
 seP8JeVw==;
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nQ3RB-00F9Bo-4n; Fri, 04 Mar 2022 08:37:36 +0000
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 2248Nc26021958; 
 Fri, 4 Mar 2022 08:36:55 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ekf7j06t2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Mar 2022 08:36:55 +0000
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 2248X4tO015738;
 Fri, 4 Mar 2022 08:36:54 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ekf7j06s8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Mar 2022 08:36:54 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2248Xlwh010641;
 Fri, 4 Mar 2022 08:36:52 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma04ams.nl.ibm.com with ESMTP id 3ek4kg97h2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Mar 2022 08:36:51 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 2248PowQ41550280
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 4 Mar 2022 08:25:50 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9795FA405B;
 Fri,  4 Mar 2022 08:36:49 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E54B2A4060;
 Fri,  4 Mar 2022 08:36:48 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Fri,  4 Mar 2022 08:36:48 +0000 (GMT)
Received: from yukon.home (unknown [9.171.91.16])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 401832201B4;
 Fri,  4 Mar 2022 09:36:47 +0100 (CET)
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
Subject: [PATCH v3 01/11] mtd: spi-nor: aspeed: Rename Kconfig option
Date: Fri,  4 Mar 2022 09:36:33 +0100
Message-Id: <20220304083643.1079142-2-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220304083643.1079142-1-clg@kaod.org>
References: <20220304083643.1079142-1-clg@kaod.org>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: LnWESykupjq_S7j0EAUU6WBeIH3Is_Lz
X-Proofpoint-ORIG-GUID: oZipzQISZHy2rYXkESpcX2Rhv1ZOI369
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-04_02,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 malwarescore=0 phishscore=0
 spamscore=0 mlxlogscore=907 impostorscore=0 clxscore=1034
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203040044
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220304_083721_550690_ED41D44E 
X-CRM114-Status: GOOD (  16.21  )
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
IG9uZS4KClJldmlld2VkLWJ5OiBKb2VsIFN0YW5sZXkgPGpvZWxAam1zLmlkLmF1PgpUZXN0ZWQt
Ynk6IEpvZWwgU3RhbmxleSA8am9lbEBqbXMuaWQuYXU+ClRlc3RlZC1ieTogVGFvIFJlbiA8cmVu
dGFvLmJ1cHRAZ21haWwuY29tPgpTaWduZWQtb2ZmLWJ5OiBDw6lkcmljIExlIEdvYXRlciA8Y2xn
QGthb2Qub3JnPgotLS0KIGRyaXZlcnMvbXRkL3NwaS1ub3IvY29udHJvbGxlcnMvS2NvbmZpZyAg
fCAyICstCiBkcml2ZXJzL210ZC9zcGktbm9yL2NvbnRyb2xsZXJzL01ha2VmaWxlIHwgMiArLQog
MiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9tdGQvc3BpLW5vci9jb250cm9sbGVycy9LY29uZmlnIGIvZHJpdmVycy9t
dGQvc3BpLW5vci9jb250cm9sbGVycy9LY29uZmlnCmluZGV4IDVjMGUwZWMyZTZkMS4uODc2YTQ3
MDQyZmVjIDEwMDY0NAotLS0gYS9kcml2ZXJzL210ZC9zcGktbm9yL2NvbnRyb2xsZXJzL0tjb25m
aWcKKysrIGIvZHJpdmVycy9tdGQvc3BpLW5vci9jb250cm9sbGVycy9LY29uZmlnCkBAIC0xLDUg
KzEsNSBAQAogIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5Ci1jb25maWcg
U1BJX0FTUEVFRF9TTUMKK2NvbmZpZyBTUElfQVNQRUVEX1NNQ19NVERfU1BJX05PUgogCXRyaXN0
YXRlICJBc3BlZWQgZmxhc2ggY29udHJvbGxlcnMgaW4gU1BJIG1vZGUiCiAJZGVwZW5kcyBvbiBB
UkNIX0FTUEVFRCB8fCBDT01QSUxFX1RFU1QKIAlkZXBlbmRzIG9uIEhBU19JT01FTSAmJiBPRgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvc3BpLW5vci9jb250cm9sbGVycy9NYWtlZmlsZSBiL2Ry
aXZlcnMvbXRkL3NwaS1ub3IvY29udHJvbGxlcnMvTWFrZWZpbGUKaW5kZXggZTdhYmJhNDkxZDk4
Li4xZTI4Mjk3ZmIxZTggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbXRkL3NwaS1ub3IvY29udHJvbGxl
cnMvTWFrZWZpbGUKKysrIGIvZHJpdmVycy9tdGQvc3BpLW5vci9jb250cm9sbGVycy9NYWtlZmls
ZQpAQCAtMSw1ICsxLDUgQEAKICMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAKLW9i
ai0kKENPTkZJR19TUElfQVNQRUVEX1NNQykJKz0gYXNwZWVkLXNtYy5vCitvYmotJChDT05GSUdf
U1BJX0FTUEVFRF9TTUNfTVREX1NQSV9OT1IpCSs9IGFzcGVlZC1zbWMubwogb2JqLSQoQ09ORklH
X1NQSV9ISVNJX1NGQykJKz0gaGlzaS1zZmMubwogb2JqLSQoQ09ORklHX1NQSV9OWFBfU1BJRkkp
CSs9IG54cC1zcGlmaS5vCiBvYmotJChDT05GSUdfU1BJX0lOVEVMX1NQSSkJKz0gaW50ZWwtc3Bp
Lm8KLS0gCjIuMzQuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
