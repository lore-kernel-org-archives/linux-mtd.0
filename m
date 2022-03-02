Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D44D8C433EF
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Mar 2022 17:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g7tAwhqfBOLlFrPo24puNf+5bdr7wiFw/XQGpPVpFh4=; b=dmLANk79hw4MA0
	+Sy7FZJEilXMEz4EcLjKZmY9253yKF/i3VIdiNWOQYpByA6CvzVZUtluHOs9zdKpJpzwBIHQ7xKjR
	75ycEMEdnk/TmbTrj0GQhFnGs9fMiIVcaS+QWEtQ7U+hv6tg9Lnyzdw1fEu/rozlDvQPpK3dOCAds
	GbCQ4r8p+c58Coc/JrLD9j6gMMmtIQprbxkN6NfHy3q/tPC9hPA4K8NJmFZwexmYI4h9bp46Fj3/q
	rWBGax1SW3owAmlUqG53MsumqQYIQ0sJRHUe9asYfhdTzaKPCycu4qyZ/0nYOHtBxgrAsj9A/5vkY
	Pe3EVrZh+x2ya4GnyoDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPSsf-003ai9-3H; Wed, 02 Mar 2022 17:35:17 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPSpL-003Z69-DP; Wed, 02 Mar 2022 17:31:54 +0000
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 222GN1Vd006806; 
 Wed, 2 Mar 2022 17:31:24 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ejc28se3y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 17:31:24 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 222HD6eq001668;
 Wed, 2 Mar 2022 17:31:21 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma03fra.de.ibm.com with ESMTP id 3efbu9dy38-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 17:31:21 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 222HVJ6n55771424
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 2 Mar 2022 17:31:19 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 11E6811C050;
 Wed,  2 Mar 2022 17:31:19 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6CB8711C054;
 Wed,  2 Mar 2022 17:31:18 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed,  2 Mar 2022 17:31:18 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.58.125])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 07645220294;
 Wed,  2 Mar 2022 18:31:16 +0100 (CET)
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
Subject: [PATCH v2 01/10] mtd: spi-nor: aspeed: Rename Kconfig option
Date: Wed,  2 Mar 2022 18:31:05 +0100
Message-Id: <20220302173114.927476-2-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220302173114.927476-1-clg@kaod.org>
References: <20220302173114.927476-1-clg@kaod.org>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 5kqQgAyvQhzzbyqq2PnBEY-w7m14ksG1
X-Proofpoint-GUID: 5kqQgAyvQhzzbyqq2PnBEY-w7m14ksG1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-02_12,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 spamscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 clxscore=1034 mlxscore=0 suspectscore=0
 mlxlogscore=694 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2203020076
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220302_093151_619175_FCC095D2 
X-CRM114-Status: GOOD (  18.92  )
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
LQogZHJpdmVycy9tdGQvc3BpLW5vci9jb250cm9sbGVycy9LY29uZmlnICB8IDIgKy0KIGRyaXZl
cnMvbXRkL3NwaS1ub3IvY29udHJvbGxlcnMvTWFrZWZpbGUgfCAyICstCiAyIGZpbGVzIGNoYW5n
ZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L210ZC9zcGktbm9yL2NvbnRyb2xsZXJzL0tjb25maWcgYi9kcml2ZXJzL210ZC9zcGktbm9yL2Nv
bnRyb2xsZXJzL0tjb25maWcKaW5kZXggNWMwZTBlYzJlNmQxLi44NzZhNDcwNDJmZWMgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvbXRkL3NwaS1ub3IvY29udHJvbGxlcnMvS2NvbmZpZworKysgYi9kcml2
ZXJzL210ZC9zcGktbm9yL2NvbnRyb2xsZXJzL0tjb25maWcKQEAgLTEsNSArMSw1IEBACiAjIFNQ
RFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkKLWNvbmZpZyBTUElfQVNQRUVEX1NN
QworY29uZmlnIFNQSV9BU1BFRURfU01DX01URF9TUElfTk9SCiAJdHJpc3RhdGUgIkFzcGVlZCBm
bGFzaCBjb250cm9sbGVycyBpbiBTUEkgbW9kZSIKIAlkZXBlbmRzIG9uIEFSQ0hfQVNQRUVEIHx8
IENPTVBJTEVfVEVTVAogCWRlcGVuZHMgb24gSEFTX0lPTUVNICYmIE9GCmRpZmYgLS1naXQgYS9k
cml2ZXJzL210ZC9zcGktbm9yL2NvbnRyb2xsZXJzL01ha2VmaWxlIGIvZHJpdmVycy9tdGQvc3Bp
LW5vci9jb250cm9sbGVycy9NYWtlZmlsZQppbmRleCBlN2FiYmE0OTFkOTguLjFlMjgyOTdmYjFl
OCAxMDA2NDQKLS0tIGEvZHJpdmVycy9tdGQvc3BpLW5vci9jb250cm9sbGVycy9NYWtlZmlsZQor
KysgYi9kcml2ZXJzL210ZC9zcGktbm9yL2NvbnRyb2xsZXJzL01ha2VmaWxlCkBAIC0xLDUgKzEs
NSBAQAogIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMAotb2JqLSQoQ09ORklHX1NQ
SV9BU1BFRURfU01DKQkrPSBhc3BlZWQtc21jLm8KK29iai0kKENPTkZJR19TUElfQVNQRUVEX1NN
Q19NVERfU1BJX05PUikJKz0gYXNwZWVkLXNtYy5vCiBvYmotJChDT05GSUdfU1BJX0hJU0lfU0ZD
KQkrPSBoaXNpLXNmYy5vCiBvYmotJChDT05GSUdfU1BJX05YUF9TUElGSSkJKz0gbnhwLXNwaWZp
Lm8KIG9iai0kKENPTkZJR19TUElfSU5URUxfU1BJKQkrPSBpbnRlbC1zcGkubwotLSAKMi4zNC4x
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
