Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D233EC7EE29
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Jun 2023 08:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6LbbcmCTTlPS8/wv5HSe3vfgcaoeS8s8SzdEaqTGnVk=; b=VX8/oqpfMc1kNq
	7i5JXH7v3NEIJMi6sDHIHxms8ch3bdpKw4yrPww/7/DlMtUoYIiYOri94gccV8LbfJ2vPn6TPNgvV
	dlvKYNfy3ze54lwc9kni8roZtLLNGCtwVbAcqMXNvm3jrousUd/zllP6O1snl2DBdWX+dlYjjAbY7
	T1UQL1FU/4BJ8O3L3384D19i8w6M7hfyuB8S6EYaWewKI4fINB1dLDSfIPpNUrjv2bDLoZQ6+7p7v
	G3dlkyEOG0p3RNCRMVNdnKP/nyF6MxMNuWaXgEeDgCDiICr2yt+c325JdizbhHgHMDYL9JQ9LGUGV
	yoIeCE4+ymUHSC+aFS5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7XpL-00CHxy-0n;
	Fri, 09 Jun 2023 08:50:35 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7XpG-00CHwW-2x;
	Fri, 09 Jun 2023 08:50:33 +0000
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1686300626;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gyp9wfGBHF8ywDwJ2so3K18RV8Zlylx9c1qCnhYw4jA=;
	b=bJz3CsbRvhGSTkXKPQRp5RHyEPp119tabplJTLwF4m3JaVYJ3rruw7e5SRlCbDMIJhiSkN
	2PasiRxoaw+LTLj4uNWWALLJYgQZjhUFf3Zbhh1ArvXIINmyCfpzg4hr2TDnWNcjBXU0JA
	X8zyYNT3TRpIw+1L1nNXnli8iiUehZVsuOUxo9lyDP3xNni4s2AN2EjL++jwTDw1fh9WXQ
	KCcQuk4Df4GqCCSHh98eu6Bz4cSHP9M6XeMJpbx6PvIcw01sMUfxE5/Tx9QyZb0jNNXQMy
	H+mXtShwoR5GfiF9qGps3mhuOpoB3lo+WTiDAP2GQ6PRHPYkzdgJiVMkfLVT4w==
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5EC6560009;
	Fri,  9 Jun 2023 08:50:24 +0000 (UTC)
Date: Fri, 9 Jun 2023 10:50:23 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Johan Jonker <jbx6244@gmail.com>
Cc: richard@nod.at, vigneshr@ti.com, heiko@sntech.de,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 yifeng.zhao@rock-chips.com
Subject: Re: [PATCH v1 3/5] mtd: nand: raw: rockchip-nand-controller: fix
 nand timing default
Message-ID: <20230609105023.5b629705@xps-13>
In-Reply-To: <f8a10a00-c3e4-9749-789d-39fba7944646@gmail.com>
References: <19bf714a-43f9-c30a-8197-91aaaf4a6e5d@gmail.com>
	<f8a10a00-c3e4-9749-789d-39fba7944646@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230609_015031_110351_CCCD26C2 
X-CRM114-Status: GOOD (  18.49  )
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

SGkgSm9oYW4sCgpqYng2MjQ0QGdtYWlsLmNvbSB3cm90ZSBvbiBUaHUsIDggSnVuIDIwMjMgMTg6
MzA6NDAgKzAyMDA6Cgo+IFNvbWVob3cgbm90IGFsbCBOQU5EIGNoaXBzIGdpdmUgYSB2YWxpZCB0
aW1pbmcgc2V0dGluZyB3aXRoIHRoZQo+IG5hbmRfZ2V0X3Nkcl90aW1pbmdzKCkgZnVuY3Rpb24u
CgpuYW5kX2dldF9zZHJfdGltaW5ncygpIGlzIGEgY29yZSBmdW5jdGlvbiBhbmQgaXMgbm90IHBh
cnRpY3VsYXJseQpjbGV2ZXIuIEFsbCBjaGlwcyBhcmUgc3VwcG9zZWQgdG8gc3VwcG9ydCBTRFIg
bW9kZSAwIHNvIGlmIHlvdSBjaGlwCmRvZXMgbm90IGFkdmVydGlzZXMgdGhhdCB0aGUgY2hpcCBp
cyBicm9rZW4sIG5vdCB0aGUgY29udHJvbGxlci4gVGhpcwptdXN0IGJlIGZpeGVkIGluIHRoZSBj
aGlwIG1hbnVmYWN0dXJlciBkcml2ZXIsIG5vdCBpbiB0aGUgY29udHJvbGxlcgpkcml2ZXIuCgo+
IERvbid0IGNvbnNpZGVyIGl0IGFzIGFuIGVycm9yLAo+IGJ1dCBmYWxsIGJhY2sgdG8gdGhlIGRl
ZmF1bHQgdmFsdWUgaW4gb3JkZXIgdG8gY29udGludWUgdG8gdXNlCj4gdGhlIGRyaXZlci4KPiAK
PiBTaWduZWQtb2ZmLWJ5OiBKb2hhbiBKb25rZXIgPGpieDYyNDRAZ21haWwuY29tPgo+IC0tLQo+
ICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9yb2NrY2hpcC1uYW5kLWNvbnRyb2xsZXIuYyB8IDYgKysr
Ky0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4g
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L3JvY2tjaGlwLW5hbmQtY29udHJv
bGxlci5jIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvcm9ja2NoaXAtbmFuZC1jb250cm9sbGVyLmMK
PiBpbmRleCBmNTY0MzBmNmMuLmUzOTQzMWNmYSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL210ZC9u
YW5kL3Jhdy9yb2NrY2hpcC1uYW5kLWNvbnRyb2xsZXIuYwo+ICsrKyBiL2RyaXZlcnMvbXRkL25h
bmQvcmF3L3JvY2tjaGlwLW5hbmQtY29udHJvbGxlci5jCj4gQEAgLTQyOSw4ICs0MjksMTAgQEAg
c3RhdGljIGludCBya19uZmNfc2V0dXBfaW50ZXJmYWNlKHN0cnVjdCBuYW5kX2NoaXAgKmNoaXAs
IGludCB0YXJnZXQsCj4gIAkJcmV0dXJuIDA7Cj4gCj4gIAl0aW1pbmdzID0gbmFuZF9nZXRfc2Ry
X3RpbWluZ3MoY29uZik7Cj4gLQlpZiAoSVNfRVJSKHRpbWluZ3MpKQo+IC0JCXJldHVybiAtRU9Q
Tk9UU1VQUDsKPiArCWlmIChJU19FUlIodGltaW5ncykpIHsKPiArCQlya25hbmQtPnRpbWluZyA9
IDB4MTA4MTsKClRoaXMgaXMgd2F5IHRvIG1hZ2ljYWwgYW55d2F5IDopCgo+ICsJCXJldHVybiAw
Owo+ICsJfQo+IAo+ICAJaWYgKElTX0VSUihuZmMtPm5mY19jbGspKQo+ICAJCXJhdGUgPSBjbGtf
Z2V0X3JhdGUobmZjLT5haGJfY2xrKTsKPiAtLQo+IDIuMzAuMgo+IAoKClRoYW5rcywKTWlxdcOo
bAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
