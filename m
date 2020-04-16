Return-Path: <SRS0=O+nk=6A=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80FC4C2D0EF
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Apr 2020 10:43:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 45A3E21D95
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Apr 2020 10:43:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="R/CQHil5";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="OjObj45x"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 45A3E21D95
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=samsung.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:Mime-Version:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UzsPUp3jMs0piopCY5glTG+/urDVlpNpz5ePqMfSqc0=; b=R/CQHil5weE+OI
	nG8O4YPX8NlSsP0IQ8L7ru/gJTgtV63WPkKSAXnPsqN2autrbcjgfvtVUs+5+8fbIalvs9R3OqieO
	8/OOxXHzXU0cXlyykTbb9h3tvm8LLx/VgbAcA18hgS1aNHjBAyTiH9ug5NXuVxSCrg6XCrPiYRUpL
	qW0zlJIFpBY+LB2wGmfHkEJ8/M+al1tsUvgmPGel2ssks/giyfQke+WkloUiD5s+9XNmlCGTJ8JJX
	XzlZdW99VR2mkmo1+ExcRk6ch0lijLtDktAttZdsTOnLlRtVCJnpA3hGJxXmwDfyyAzXlsQGd5Egp
	ARTUlLjObQHyXuI6PkVA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jP1zV-0004z5-AM; Thu, 16 Apr 2020 10:43:29 +0000
Received: from mailout2.samsung.com ([203.254.224.25])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jP1zR-0004yC-Ir
 for linux-mtd@lists.infradead.org; Thu, 16 Apr 2020 10:43:27 +0000
Received: from epcas1p3.samsung.com (unknown [182.195.41.47])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20200416104322epoutp0219a011d815fa66f98877bc3ba5009faa~GRtWiii5v1618716187epoutp02F
 for <linux-mtd@lists.infradead.org>; Thu, 16 Apr 2020 10:43:22 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20200416104322epoutp0219a011d815fa66f98877bc3ba5009faa~GRtWiii5v1618716187epoutp02F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1587033802;
 bh=JbJ8+RTuvZZmIKcrimxU2gE0P9tTy5SENTPTxhBQGwM=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=OjObj45xjJemNqpuTi1lCPqCK080JKxgNcvSup1ZhCUpi/KxxKtoIx0UOX889u7OC
 2Zw9gP3AEpm4fW1nVXAmMKaAV3GMsNugvojHoju5JXwKwd7KHvuurHqOqCdw1IVKpt
 da6X8FEWBIfHurCd1KHgRM3cWBynNe1+bdikUvtU=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200416104321epcas1p145eb7f3e98f880e576357b88b94fcba1~GRtWWGUHk0657806578epcas1p1R;
 Thu, 16 Apr 2020 10:43:21 +0000 (GMT)
Received: from epsmges1p4.samsung.com (unknown [182.195.40.163]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 492wml4gslzMqYkV; Thu, 16 Apr
 2020 10:43:19 +0000 (GMT)
Received: from epcas1p4.samsung.com ( [182.195.41.48]) by
 epsmges1p4.samsung.com (Symantec Messaging Gateway) with SMTP id
 40.06.04744.7C6389E5; Thu, 16 Apr 2020 19:43:19 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTPA id
 20200416104318epcas1p4931f0747b68a4ea640f92221d4309948~GRtTZMcbR0043800438epcas1p4W;
 Thu, 16 Apr 2020 10:43:18 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200416104318epsmtrp13d5da3b490f682dec9353e79676f30c6~GRtTYc4bt3201532015epsmtrp1R;
 Thu, 16 Apr 2020 10:43:18 +0000 (GMT)
X-AuditID: b6c32a38-26bff70000001288-eb-5e9836c7052a
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 57.FF.04024.6C6389E5; Thu, 16 Apr 2020 19:43:18 +0900 (KST)
Received: from asdf (unknown [10.88.100.192]) by epsmtip1.samsung.com
 (KnoxPortal) with ESMTPA id
 20200416104318epsmtip1a6e6c064b6ff8b512afe422598c1ad39~GRtTPOTNm2431024310epsmtip1s;
 Thu, 16 Apr 2020 10:43:18 +0000 (GMT)
Message-ID: <6183ebde31712ed29d0422ad8c34de99cb030f42.camel@samsung.com>
Subject: Re: [PATCH] mtd: spi-nor: Enable locking for n25q128a11
From: Jungseung Lee <js07.lee@samsung.com>
To: "chenxiang (M)" <chenxiang66@hisilicon.com>, michael@walle.cc,
 vigneshr@ti.com
Date: Thu, 16 Apr 2020 19:43:12 +0900
In-Reply-To: <6d329b9b-153f-74fa-f94d-1f223b3ee767@hisilicon.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA02SbUhTURjHO7vb7p20uE3Lh0G1LvRBS92cm7fS0l7kQgWCSdAH523epnT3
 wu4W2ZdkWyJlr6SIIkhYZlHmKtMsKrXWm2ZQKmqRWqHRLHsnHbV5jfr2e875/8//ec45BKaq
 kauJIpuLc9pYnpJHSVs647QJAWNVnrb8DEb39z1HtP+2R0a3e87idGfzEwkdfHwZp6fqM+jf
 3Z/wDJwZq23GGV9XUMZcqT/ADP88g5jAwHUJc+eWT54t38mnFXJsAefUcDazvaDIZkmntuSY
 NpoMRq0uQbeaTqU0NtbKpVObtmYnZBXx4VYozV6Wd4eXsllBoJLWpTntbhenKbQLrnSKcxTw
 Dp3WkSiwVsFtsySa7dY1Oq022RBW5vOFDYFhzOFV7vvkeScvQTOKQ0hBAJkCg00j6BCKIlRk
 K4LK0KRULD4j8J4bl0dUKvI7gpoW6q+jy/sUF0W3EIz0dmFiMYpgpvenJKJSkgzU1/mlEY4m
 M+DHmwpZhOVkPAxM+2c5htwOoZunZ/UYyYN/4DAWYSm5AsZDDXiEFWQmdFd2SsXkVRB8dDTM
 RPj8hRBqjRaty8B7rWa2ByCH5DD4IiCJaIDcBPeDS0VrNLwPXMVFVsPEsdI5FqCt8QQuen0I
 Rhvq5zb0MBm8iEXOwcg4aLqRJC4vh7bpWiTmLoDJb+UyMUoJZaUqUULBh9e+uY4BeseOyERm
 oKfSKxHv8wWCobYlx5Gm+t8w1f8NU/0vtw5h59FiziFYLZygc6T8/7x+NPsx4+lWdLNnawci
 CUTNV2onKvNUMnavUGztQEBgVIxygaEqT6UsYIv3c067yenmOaEDGcJXfQJTLzLbw9/c5jLp
 DMl6vZ5OMaYaDXoqVlnRz+epSAvr4vZwnINz/vVJCIW6BNE7Hq31rLBTH2cavc2/ss2lJXEJ
 OdPHNrhbX12aePuyr/HBhbvzxjg+2TMQ6ok6aMw9JVP4hp7ZplZG4zGl34OZ92RHsjS7Rk7H
 UoZyaWYKEfiR+0v9Nb/FMRjMWh9ky3ZXfTluSYyvG+d1my+Y200P+6D22UMmtsJksJzs3kZJ
 hUJWF485BfYPka1GIq4DAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrHLMWRmVeSWpSXmKPExsWy7bCSnO4xsxlxBtefqVpcv3aF0WLT/iZW
 i91Ny9gtDm88w2Tx9vQGdouPSxws/p/9wO7A7vF47kZ2j5Yjb1k9Ni+p97jzYymjx/Eb25k8
 DuxtYQtgi+KySUnNySxLLdK3S+DKWH78DnNBM2/Fh6ZnbA2Mfzi7GDk5JARMJI40n2fvYuTi
 EBLYzSgxc+VPJoiEhMSjnV9Yuhg5gGxhicOHiyFqHjBKPL2zlhmkhlfAQ2LJgk0sILawgIPE
 9ydTWUFsNgEtiRu/N4HZIgKhEi97LoLNZBbIlfi8ejM7iM0ioCrx4u9yMJtTwFHi7LTDLBAL
 rjNKNH94zAjRoCnRuv03O8RBOhJvT/WBHcQrICjxd4cwRIm8RPPW2cwTGAVnIemYhVA1C0nV
 AkbmVYySqQXFuem5xYYFhnmp5XrFibnFpXnpesn5uZsYwbGgpbmD8fKS+EOMAhyMSjy8Bi+n
 xQmxJpYVV+YeYpTgYFYS4eUznREnxJuSWFmVWpQfX1Sak1p8iFGag0VJnPdp3rFIIYH0xJLU
 7NTUgtQimCwTB6dUA6PVwrJLsz4zvvlcZJOb79W47rz1jlvtEzZNncnxe5ls58f3W2rOM6p+
 yLN5t/02c7hHtPIbu8NJjWzrxf+l1asEnvdpvx+kIRq7v3Hxh0f+fidz96lHbYrb/8VcrG8y
 W5u5zj332htHr1TGTpr6JaakZ3JSo8R/lbb7HV/OCx1uyHiubuaqOkmJpTgj0VCLuag4EQAn
 z2cBgQIAAA==
X-CMS-MailID: 20200416104318epcas1p4931f0747b68a4ea640f92221d4309948
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200414011621epcas1p2255b9ff1e7616caf5f226f663058d8aa
References: <1585105663-199127-1-git-send-email-chenxiang66@hisilicon.com>
 <CGME20200414011621epcas1p2255b9ff1e7616caf5f226f663058d8aa@epcas1p2.samsung.com>
 <6d329b9b-153f-74fa-f94d-1f223b3ee767@hisilicon.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200416_034326_037983_6386A89B 
X-CRM114-Status: GOOD (  16.93  )
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
Cc: john.garry@huawei.com, linux-mtd@lists.infradead.org, linuxarm@huawei.com,
 Tudor.Ambarus@microchip.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGksIGNoZW54aWFuZwoKT24gVHVlLCAyMDIwLTA0LTE0IGF0IDA5OjE2ICswODAwLCBjaGVueGlh
bmcgKE0pIHdyb3RlOgo+IFBpbmcuLi4KPiAKPiDlnKggMjAyMC8zLzI1IDExOjA3LCBjaGVueGlh
bmcg5YaZ6YGTOgo+ID4gRnJvbTogWGlhbmcgQ2hlbiA8Y2hlbnhpYW5nNjZAaGlzaWxpY29uLmNv
bT4KPiA+IAo+ID4gQXMgNGJpdCBibG9jayBwcm90ZWN0aW9uIHBhdGhzZXQgZm9yIHNvbWUgbWlj
cm9uIG1vZGVscyBhcmUgbWVyZ2VkLAoKeW91IG1lYW4gcGF0Y2hzZXQ/Cgo+ID4gbjI1cTEyOGEx
MSBhbHNvIHVzZXMgNCBiaXQgQmxvY2sgUHJvdGVjdGlvbiBzY2hlbWUsIHNvIGVuYWJsZQo+ID4g
bG9ja2luZwo+ID4gZm9yIGl0LiBUZXN0ZWQgaXQgb24gbjI1cTEyOGExMSwgdGhlIGxvY2tpbmcg
ZnVuY3Rpb25zIHdvcmsgd2VsbC4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogWGlhbmcgQ2hlbiA8
Y2hlbnhpYW5nNjZAaGlzaWxpY29uLmNvbT4KPiA+IC0tLQo+ID4gICBkcml2ZXJzL210ZC9zcGkt
bm9yL21pY3Jvbi1zdC5jIHwgNCArKystCj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlv
bnMoKyksIDEgZGVsZXRpb24oLSkKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL3Nw
aS1ub3IvbWljcm9uLXN0LmMgYi9kcml2ZXJzL210ZC9zcGktCj4gPiBub3IvbWljcm9uLXN0LmMK
PiA+IGluZGV4IDZjMDM0YjkuLjAyYzBiNTMgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL210ZC9z
cGktbm9yL21pY3Jvbi1zdC5jCj4gPiArKysgYi9kcml2ZXJzL210ZC9zcGktbm9yL21pY3Jvbi1z
dC5jCj4gPiBAQCAtMjksNyArMjksOSBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGZsYXNoX2luZm8g
c3RfcGFydHNbXSA9IHsKPiA+ICAgCXsgIm4yNXEwNjRhIiwgICAgSU5GTygweDIwYmIxNywgMCwg
NjQgKiAxMDI0LCAgMTI4LAo+ID4gICAJCQkgICAgICBTRUNUXzRLIHwgU1BJX05PUl9RVUFEX1JF
QUQpIH0sCj4gPiAgIAl7ICJuMjVxMTI4YTExIiwgIElORk8oMHgyMGJiMTgsIDAsIDY0ICogMTAy
NCwgIDI1NiwKPiA+IC0JCQkgICAgICBTRUNUXzRLIHwgVVNFX0ZTUiB8IFNQSV9OT1JfUVVBRF9S
RUFEKSB9LAo+ID4gKwkJCSAgICAgIFNFQ1RfNEsgfCBVU0VfRlNSIHwgU1BJX05PUl9RVUFEX1JF
QUQgfAo+ID4gKwkJCSAgICAgIFNQSV9OT1JfSEFTX0xPQ0sgfCBTUElfTk9SX0hBU19UQiB8Cj4g
PiArCQkJICAgICAgU1BJX05PUl80QklUX0JQIHwgU1BJX05PUl9CUDNfU1JfQklUNikgfSwKPiA+
ICAgCXsgIm4yNXExMjhhMTMiLCAgSU5GTygweDIwYmExOCwgMCwgNjQgKiAxMDI0LCAgMjU2LAo+
ID4gICAJCQkgICAgICBTRUNUXzRLIHwgVVNFX0ZTUiB8IFNQSV9OT1JfUVVBRF9SRUFEKSB9LAo+
ID4gICAJeyAibXQyNXFsMjU2YSIsICBJTkZPNigweDIwYmExOSwgMHgxMDQ0MDAsIDY0ICogMTAy
NCwgIDUxMiwKCkkndmUgY2hlY2tlZCB0aGUgZmxhZ3MgYWNjb3JkaW5nIHRvIGl0J3MgZGF0YXNo
ZWV0LiBJdCBzZWVtcyBnb29kLgpZb3UgY2FuIGFkZCBteSByZXZpZXcgdGFnIGFmdGVyIHVwZGF0
ZSB0aGUgdHlwby4KClJldmlld2VkLWJ5OiBKdW5nc2V1bmcgTGVlIDxqczA3LmxlZUBzYW1zdW5n
LmNvbT4KClRoYW5rcywKCj4gCj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
