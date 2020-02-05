Return-Path: <SRS0=LKht=3Z=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,URIBL_DBL_ABUSE_MALW,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBCE1C33CA1
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Feb 2020 09:12:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C01682051A
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Feb 2020 09:12:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="F5h5toPr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C01682051A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y7Mpc1yNjzUKYNGi2y2McMdqkcddbD+A0eVQO2MWmGM=; b=F5h5toPrsNImDu
	tSheuh1+mgGNmWDeZ5kK2NJ9J9WiLwrm8fErRIQWbFpqAjq09GexkDxolMiyNg6r4QLDQIoCNazK/
	ZmnL5FZsw9vWrMuM/x34/mT0XDO6On5hjATf3HRlLbICixfgdbZ+MyUoiDy06Yaj0piAzxEK7lZqV
	85wNPGny7FhKzDZqOXPanzfCX+nyBH+lmYAXqnjoxaMQxIOG3hHFspajvb0AJgfrm0QKpqYjL1Keq
	vp5rq/m7UqzvbXCUYB0ZvEFcNwqUtGeBc0JikvaZKR4xvfFTjTyMGqjgBGYDykkbukLgO8q2BMtbC
	1J5LPdZoH3OG093zPsPQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1izGjj-00042m-OL; Wed, 05 Feb 2020 09:12:43 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1izGje-00041m-HB
 for linux-mtd@lists.infradead.org; Wed, 05 Feb 2020 09:12:42 +0000
Received: from xps13 (lfbn-tou-1-1151-102.w90-76.abo.wanadoo.fr
 [90.76.211.102]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id A2733100007;
 Wed,  5 Feb 2020 09:12:24 +0000 (UTC)
Date: Wed, 5 Feb 2020 10:12:23 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH] Revert "mtd: rawnand: denali: get
 ->setup_data_interface() working again"
Message-ID: <20200205101223.21d99d93@xps13>
In-Reply-To: <20200205070834.3087104-1-marex@denx.de>
References: <20200205070834.3087104-1-marex@denx.de>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200205_011238_710218_7E35002B 
X-CRM114-Status: GOOD (  13.63  )
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
Cc: Dinh Nguyen <dinguyen@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>, linux-mtd@lists.infradead.org,
 Tim Sander <tim@krieglstein.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWFyZWssCgpNYXJlayBWYXN1dCA8bWFyZXhAZGVueC5kZT4gd3JvdGUgb24gV2VkLCAgNSBG
ZWIgMjAyMCAwODowODozNCArMDEwMDoKCj4gVGhpcyByZXZlcnRzIGNvbW1pdCBkMzExZTBjMjdi
OGZjYzI3ZjcwN2Y4Y2FjNDhjZDhiZGM0MTU1MjI0LCB3aGljaAo+IGNvbXBsZXRlbHkgYnJlYWtz
IE5BTkQgYWNjZXNzIG9uIEFsdGVyYSBTb0NGUEdBIChkZXRlY3RlZCBvbiBBcnJpYVYKPiBTb0Mp
Lgo+IAo+IE9uIFNvQ0ZQR0EsIGRlbmFsaS0+Y2xrX3JhdGUgPSAzMS4yNSBNSHogYW5kIGRlbmFs
aS0+Y2xrX3hfcmF0ZSA9IDEyNSBNSHosCj4gaGVuY2UgdGhlIGRyaXZlciBzZXRzIE5BTkRfS0VF
UF9USU1JTkdTIGZsYWcuIFRoaXMgZGlkIG5vdCBoYXBwZW4gYmVmb3JlCj4gYW5kIGlzIGFjdHVh
bGx5IGluY29ycmVjdCwgYXMgb24gU29DRlBHQSB3ZSBkbyBub3Qgd2FudCB0byByZXRhaW4gdGlt
aW5ncwo+IGZyb20gcHJldmlvdXMgc3RhZ2UgKHRoZSB0aW1pbmdzIG1pZ2h0IGJlIGluY29ycmVj
dCBvciBvdXRyaWdodCBpbnZhbGlkKS4KPiAKPiBDYzogQm9yaXMgQnJlemlsbG9uIDxib3Jpcy5i
cmV6aWxsb25AY29sbGFib3JhLmNvbT4KPiBDYzogRGluaCBOZ3V5ZW4gPGRpbmd1eWVuQGtlcm5l
bC5vcmc+Cj4gQ2M6IE1hc2FoaXJvIFlhbWFkYSA8bWFzYWhpcm95QGtlcm5lbC5vcmc+Cj4gQ2M6
IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+Cj4gQ2M6IFRpbSBTYW5k
ZXIgPHRpbUBrcmllZ2xzdGVpbi5vcmc+Cj4gVG86IGxpbnV4LW10ZCA8bGludXgtbXRkQGxpc3Rz
LmluZnJhZGVhZC5vcmc+Cj4gLS0tCj4gIGRyaXZlcnMvbXRkL25hbmQvcmF3L2RlbmFsaS5jIHwg
MiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiAK
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvZGVuYWxpLmMgYi9kcml2ZXJzL210
ZC9uYW5kL3Jhdy9kZW5hbGkuYwo+IGluZGV4IGI2YzQ2M2QwMjE2Ny4uNWZlM2M2MmE3NTZlIDEw
MDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L2RlbmFsaS5jCj4gKysrIGIvZHJpdmVy
cy9tdGQvbmFuZC9yYXcvZGVuYWxpLmMKPiBAQCAtMTIwOSw3ICsxMjA5LDcgQEAgaW50IGRlbmFs
aV9jaGlwX2luaXQoc3RydWN0IGRlbmFsaV9jb250cm9sbGVyICpkZW5hbGksCj4gIAl9Cj4gIAo+
ICAJLyogY2xrIHJhdGUgaW5mbyBpcyBuZWVkZWQgZm9yIHNldHVwX2RhdGFfaW50ZXJmYWNlICov
Cj4gLQlpZiAoIWRlbmFsaS0+Y2xrX3JhdGUgfHwgIWRlbmFsaS0+Y2xrX3hfcmF0ZSkKCkkgZG9u
J3QgZ2V0IGl0LCBpZiBib3RoIGNsa19yYXRlIGFuZCBjbGtfeF9yYXRlIGFyZSBzZXQsIHRoZSBp
Zgpjb25kaXRpb24gd2lsbCBub3QgYmUgZW50ZXJlZCwgcmlnaHQ/Cgo+ICsJaWYgKGRlbmFsaS0+
Y2xrX3JhdGUgJiYgZGVuYWxpLT5jbGtfeF9yYXRlKQo+ICAJCWNoaXAtPm9wdGlvbnMgfD0gTkFO
RF9LRUVQX1RJTUlOR1M7CgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFp
bGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbXRkLwo=
