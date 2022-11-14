Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 187DDC433FE
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Nov 2022 08:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rKmvBts4isxGtpBsubG69tcKfE/YdMPBrkvYr0Akb9c=; b=CtHwJynuxx4gIy
	UemkpWNpJEFgDsd9vbUlQ9Osu51+MJXDUjTkI473Kz8euUdjb6e2O3oHOGeoyYOXhCmi4rtxsbXIm
	rZZL02l8QJGL2X+P4wJSWjYyTWtP82AsCYuOasgj/B7Xf5JHzVLnXlkYpEjVzkCLL+r/Lq1eAxRCd
	+Emm0T67ieWfDLUrOt1rVr54AZ91eo50sjsxrSnEZ0QzL3Bb7+grZJyM6g9S2dVyALvy184tBuriM
	uSUIOsp0GtayWAWvUhVKhHqGGRNQAPrOPWXcdduOfaGHl58/mJLv4mjNkW2rhS1Br/f3kCxpSk1GT
	ZJYSWEaPm+YGYGuj1goA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouUS5-00Gep3-EP; Mon, 14 Nov 2022 08:04:21 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouUS2-00Geip-ED
	for linux-mtd@lists.infradead.org; Mon, 14 Nov 2022 08:04:20 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 54E31240010;
	Mon, 14 Nov 2022 08:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1668413052;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cvKVGnbTF4i/qSpcUrTjr5cPePLfjlEgnVYVKtrHHPM=;
	b=TqDNsDAceBd8e2E8Jea/mSZZE3E50Rt2olFVg+yu/1KrHOvo4YNL5Kk9COOL/bv9tyJxHC
	1FXTDCr+U6OeBv4quKeO4+nYYpOTv1789rOqQr5kM7TFivHBYlj5KyrHizQaIB9FFcp3Hy
	JDZmsjseXSgJFbr/HMQxqzpIxtWkGdIF9LYj6emoL7fSgBBEfUdCZMSrcKbTX069fU7M4D
	zv0xFEcgCbWotA8E5xtcFRKGt/F1f0YUvnRR9WvOwIIrEQlL4LGkIJ8C2rfJvM75mhS4t/
	U1Vxdvb2tRS6L55D3imCZRjHo3EYuoMQOyjv2K5vDDF+NjZWyJd1bOOLhF49tg==
Date: Mon, 14 Nov 2022 09:04:08 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Hui Tang <tanghui20@huawei.com>
Cc: <richard@nod.at>, <vigneshr@ti.com>, <u.kleine-koenig@pengutronix.de>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <weiyongjun1@huawei.com>, <yusongping@huawei.com>
Subject: Re: [PATCH] mtd: lpddr2_nvm: i2c: mux: reg: Fix possible
 null-ptr-deref
Message-ID: <20221114090408.7ed0e7c1@xps-13>
In-Reply-To: <20221114020141.28138-1-tanghui20@huawei.com>
References: <20221114020141.28138-1-tanghui20@huawei.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221114_000418_647105_F3CA65EA 
X-CRM114-Status: GOOD (  12.27  )
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

SGkgSHVpLAoKdGFuZ2h1aTIwQGh1YXdlaS5jb20gd3JvdGUgb24gTW9uLCAxNCBOb3YgMjAyMiAx
MDowMTo0MSArMDgwMDoKCj4gSXQgd2lsbCBjYXVzZSBudWxsLXB0ci1kZXJlZiB3aGVuIHJlc291
cmNlX3NpemUoYWRkX3JhbmdlKSBpbnZva2VkLAo+IGlmIHBsYXRmb3JtX2dldF9yZXNvdXJjZSgp
IHJldHVybnMgTlVMTC4KPiAKPiBGaXhlczogOTZiYTlkZDY1Nzg4ICgibXRkOiBscGRkcjogYWRk
IGRyaXZlciBmb3IgTFBERFIyLU5WTSBQQ00gbWVtb3JpZXMiKQo+IFNpZ25lZC1vZmYtYnk6IEh1
aSBUYW5nIDx0YW5naHVpMjBAaHVhd2VpLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9tdGQvbHBkZHIv
bHBkZHIyX252bS5jIHwgMiArKwo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCj4g
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL2xwZGRyL2xwZGRyMl9udm0uYyBiL2RyaXZlcnMv
bXRkL2xwZGRyL2xwZGRyMl9udm0uYwo+IGluZGV4IDM2N2UyZDkwNmRlMC4uY2Y4ZTg2ZWI0YjJj
IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL2xwZGRyL2xwZGRyMl9udm0uYwo+ICsrKyBiL2Ry
aXZlcnMvbXRkL2xwZGRyL2xwZGRyMl9udm0uYwo+IEBAIC00MzMsNiArNDMzLDggQEAgc3RhdGlj
IGludCBscGRkcjJfbnZtX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gIAo+
ICAJLyogbHBkZHIyX252bSBhZGRyZXNzIHJhbmdlICovCj4gIAlhZGRfcmFuZ2UgPSBwbGF0Zm9y
bV9nZXRfcmVzb3VyY2UocGRldiwgSU9SRVNPVVJDRV9NRU0sIDApOwo+ICsJaWYgKElTX0VSUihh
ZGRfcmFuZ2UpKQoKcGxhdGZvcm1fZ2V0X3Jlc291cmNlKCkganVzdCByZXR1cm5zIE5VTEwgdXBv
biBlcnJvci4KCj4gKwkJcmV0dXJuIC1FTk9ERVY7Cj4gIAo+ICAJLyogUG9wdWxhdGUgbWFwX2lu
Zm8gZGF0YSBzdHJ1Y3R1cmUgKi8KPiAgCSptYXAgPSAoc3RydWN0IG1hcF9pbmZvKSB7CgoKVGhh
bmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
