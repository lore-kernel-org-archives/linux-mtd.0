Return-Path: <SRS0=r5sn=OE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 516E0C433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 14 Sep 2021 17:31:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1012F60555
	for <linux-mtd@archiver.kernel.org>; Tue, 14 Sep 2021 17:31:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1012F60555
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DGCT1OcCeMZ4uTvNCm3kHPMzHocze8DtitihSFafQ2g=; b=H4XYDXSUzaClnN
	BidDVcRDwnZr29Wf0JWBWTWcasymb4dl1W/IZZ0PM62xvmaFbzdjS72blLPlRXYrizlzf0lyfnyL8
	zrIZadVpcZ6QU9qcHDZh2ChsZIP7orIHSGBa8qgd4LxR1kHWAAK/QM9ly3he9IN2QQz2pxlk8NXTY
	QTcCFSUtCE+vjk7viFEXNqif/Hp2B94MAFAmEa7bWrKR7/vdSTBjN3JXTWNbVshFtbyGwdk7ngg2p
	YKKw+0qD8mDEHKPg3ZFxoSjejf8HaRNayrAR+fm5UcejnSxdVVtWzf0npyuypPD3vVdYsK4ig1znu
	Qj1bfLdsUpS4qpsUcyIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQCH8-006ZHU-2P; Tue, 14 Sep 2021 17:31:18 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQCH4-006ZGx-T0
 for linux-mtd@lists.infradead.org; Tue, 14 Sep 2021 17:31:16 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 59185E0008;
 Tue, 14 Sep 2021 17:31:09 +0000 (UTC)
Date: Tue, 14 Sep 2021 19:31:08 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>
Cc: Bert Vermeulen <bert@biot.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>, Boris Brezillon
 <boris.brezillon@collabora.com>, Christophe Kerello
 <christophe.kerello@foss.st.com>, Mark Brown <broonie@kernel.org>,
 Alexander Lobakin <alobakin@pm.me>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2] mtd: spinand: Add support for Etron EM73D044VCx
Message-ID: <20210914193108.78df5367@xps13>
In-Reply-To: <20210908201624.237634-1-bert@biot.com>
References: <20210908201624.237634-1-bert@biot.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210914_103115_113961_EF27F6F9 
X-CRM114-Status: GOOD (  17.47  )
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

SGkgQmVydCwKClJpY2hhcmQsIGEgcXVlc3Rpb24gZm9yIHlvdSBiZWxvdyEKCmJlcnRAYmlvdC5j
b20gd3JvdGUgb24gV2VkLCAgOCBTZXAgMjAyMSAyMjoxNjoxOSArMDIwMDoKCj4gVGhpcyBhZGRz
IGEgbmV3IHZlbmRvciBFdHJvbiwgYW5kIHN1cHBvcnQgZm9yIGEgMkdiIGNoaXAuCj4gCj4gVGhl
IGRhdGFzaGVldCBpcyBhdmFpbGFibGUgYXQKPiBodHRwczovL3d3dy5ldHJvbi5jb20vY24vcHJv
ZHVjdHMvRU03MyU1QjglNURDJTVCRF9FX0YlNURWQyUyMFNQSSUyME5BTkQlMjBGbGFzaF9Qcm9t
b3Rpb25fUmV2JTIwMV8wMEEucGRmCj4gCj4gU2lnbmVkLW9mZi1ieTogQmVydCBWZXJtZXVsZW4g
PGJlcnRAYmlvdC5jb20+Cj4gLS0tCj4gdjI6Cj4gLSBNYWRlIG9vYmxheW91dF9mcmVlL19lY2Mg
ZGVwZW5kIG9uIGNoaXAtc3BlY2lmaWMgcGFyYW1ldGVycywgaW5zdGVhZCBvZgo+ICAgaGFyZGNv
ZGVkIHRvIHRoaXMgMkdiIGNoaXAgb25seQo+IC0gRml4ZWQgbWFudWZhY3R1cmVyIG9yZGVyaW5n
Cj4gLSBGaXhlZCBtaW5vciBmb3JtYXR0aW5nIGlzc3VlcyBhcyByZXBvcnRlZAo+IC0gUmVtb3Zl
ZCBkZWJ1ZyBjb21tZW50Cj4gCj4gIGRyaXZlcnMvbXRkL25hbmQvc3BpL01ha2VmaWxlIHwgICAy
ICstCj4gIGRyaXZlcnMvbXRkL25hbmQvc3BpL2NvcmUuYyAgIHwgICAxICsKPiAgZHJpdmVycy9t
dGQvbmFuZC9zcGkvZXRyb24uYyAgfCAxMDQgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKwo+ICBpbmNsdWRlL2xpbnV4L210ZC9zcGluYW5kLmggICB8ICAgMSArCj4gIDQgZmlsZXMg
Y2hhbmdlZCwgMTA3IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiAgY3JlYXRlIG1vZGUg
MTAwNjQ0IGRyaXZlcnMvbXRkL25hbmQvc3BpL2V0cm9uLmMKClsuLi5dCgo+ICtzdGF0aWMgaW50
IGV0cm9uX2VjY19nZXRfc3RhdHVzKHN0cnVjdCBzcGluYW5kX2RldmljZSAqc3BpbmFuZCwgdTgg
c3RhdHVzKQo+ICt7Cj4gKwlzd2l0Y2ggKHN0YXR1cyAmIFNUQVRVU19FQ0NfTUFTSykgewo+ICsJ
Y2FzZSBTVEFUVVNfRUNDX05PX0JJVEZMSVBTOgo+ICsJCXJldHVybiAwOwo+ICsKPiArCWNhc2Ug
U1RBVFVTX0VDQ19IQVNfQklURkxJUFM6Cj4gKwkJLyogQmV0d2VlbiAxLTcgYml0ZmxpcHMgd2Vy
ZSBjb3JyZWN0ZWQgKi8KPiArCQlyZXR1cm4gNzsKCk1tbWggdGhpcyBpcyBhIGJpdCBwcm9ibGVt
YXRpYywgaGF2aW5nIG5vIGludGVybWVkaWF0ZSB2YWx1ZSBtZWFucyBhCnNpbmdsZSBiaXRmbGlw
IHdpbGwgdHJpZ2dlciBVQkkgdG8gbW92ZSB0aGUgZGF0YSBhcm91bmQgYXMgaXRzCnRocmVzaG9s
ZCB3aWxsIGJlIHJlYWNoZWQuIFJpY2hhcmQsIGFueSBmZWVkYmFjayBvbiB0aGlzPwoKPiArCj4g
KwljYXNlIFNUQVRVU19FQ0NfTUFTSzoKPiArCQkvKiBNYXhpbXVtIGJpdGZsaXBzIHdlcmUgY29y
cmVjdGVkICovCj4gKwkJcmV0dXJuIDg7Cj4gKwo+ICsJY2FzZSBTVEFUVVNfRUNDX1VOQ09SX0VS
Uk9SOgo+ICsJCXJldHVybiAtRUJBRE1TRzsKPiArCX0KPiArCj4gKwlyZXR1cm4gLUVJTlZBTDsK
PiArfQoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
