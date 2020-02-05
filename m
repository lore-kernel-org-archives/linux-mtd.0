Return-Path: <SRS0=LKht=3Z=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,URIBL_DBL_ABUSE_MALW,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E170AC33CA1
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Feb 2020 09:51:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B528C2082E
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Feb 2020 09:51:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ONGIRJw7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B528C2082E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wTkGVt9ipJ6hO/LwZUFXPmx7WykcHhpQk/iB9AofQfo=; b=ONGIRJw7e0cO52
	39kQPZ5fJaAp4up8CAmi9VDKGVdXVsr8F6a+LXRJIpNEH+9OqT2/Jc+uLbBztnjsoPwfz6U0V2ulN
	cAUW0ex2sdAyqFrFMj+nkz94Qw3G9tTcxQk6odmOqC2AePTDQGbULPJdF4527vFX5/1QQx477Yiuk
	pfUUWqFlQMUwhjJmdrg5K+tPszLeWDGfzg3Gltc//5nGygrQFzsxqXc2Xcd4SRuRteReUcjB5KsMo
	O42s/BHTqPf93l7UfUTdUiI4rduRhQT5Gzul5xakF5Vt4Z7Rwai1Xbkv5gviUM6OuvN/87Z/s2JJa
	G8V8PHsNk/ivuPWfVExQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1izHKj-0002tX-3W; Wed, 05 Feb 2020 09:50:57 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1izHKg-0002sv-7U
 for linux-mtd@lists.infradead.org; Wed, 05 Feb 2020 09:50:55 +0000
Received: from xps13 (lfbn-tou-1-1151-102.w90-76.abo.wanadoo.fr
 [90.76.211.102]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id C0C55100006;
 Wed,  5 Feb 2020 09:50:45 +0000 (UTC)
Date: Wed, 5 Feb 2020 10:50:45 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH] Revert "mtd: rawnand: denali: get
 ->setup_data_interface() working again"
Message-ID: <20200205105045.6877aca6@xps13>
In-Reply-To: <45a10680-5fe6-7cab-a7ef-f7f7a952e822@denx.de>
References: <20200205070834.3087104-1-marex@denx.de>
 <20200205101223.21d99d93@xps13>
 <45a10680-5fe6-7cab-a7ef-f7f7a952e822@denx.de>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200205_015054_406994_11AADB2A 
X-CRM114-Status: GOOD (  16.41  )
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

SGkgTWFyZWssCgpNYXJlayBWYXN1dCA8bWFyZXhAZGVueC5kZT4gd3JvdGUgb24gV2VkLCA1IEZl
YiAyMDIwIDEwOjQxOjA1ICswMTAwOgoKPiBPbiAyLzUvMjAgMTA6MTIgQU0sIE1pcXVlbCBSYXlu
YWwgd3JvdGU6Cj4gPiBIaSBNYXJlaywKPiA+IAo+ID4gTWFyZWsgVmFzdXQgPG1hcmV4QGRlbngu
ZGU+IHdyb3RlIG9uIFdlZCwgIDUgRmViIDIwMjAgMDg6MDg6MzQgKzAxMDA6Cj4gPiAgIAo+ID4+
IFRoaXMgcmV2ZXJ0cyBjb21taXQgZDMxMWUwYzI3YjhmY2MyN2Y3MDdmOGNhYzQ4Y2Q4YmRjNDE1
NTIyNCwgd2hpY2gKPiA+PiBjb21wbGV0ZWx5IGJyZWFrcyBOQU5EIGFjY2VzcyBvbiBBbHRlcmEg
U29DRlBHQSAoZGV0ZWN0ZWQgb24gQXJyaWFWCj4gPj4gU29DKS4KPiA+Pgo+ID4+IE9uIFNvQ0ZQ
R0EsIGRlbmFsaS0+Y2xrX3JhdGUgPSAzMS4yNSBNSHogYW5kIGRlbmFsaS0+Y2xrX3hfcmF0ZSA9
IDEyNSBNSHosCj4gPj4gaGVuY2UgdGhlIGRyaXZlciBzZXRzIE5BTkRfS0VFUF9USU1JTkdTIGZs
YWcuIFRoaXMgZGlkIG5vdCBoYXBwZW4gYmVmb3JlCj4gPj4gYW5kIGlzIGFjdHVhbGx5IGluY29y
cmVjdCwgYXMgb24gU29DRlBHQSB3ZSBkbyBub3Qgd2FudCB0byByZXRhaW4gdGltaW5ncwo+ID4+
IGZyb20gcHJldmlvdXMgc3RhZ2UgKHRoZSB0aW1pbmdzIG1pZ2h0IGJlIGluY29ycmVjdCBvciBv
dXRyaWdodCBpbnZhbGlkKS4KPiA+Pgo+ID4+IENjOiBCb3JpcyBCcmV6aWxsb24gPGJvcmlzLmJy
ZXppbGxvbkBjb2xsYWJvcmEuY29tPgo+ID4+IENjOiBEaW5oIE5ndXllbiA8ZGluZ3V5ZW5Aa2Vy
bmVsLm9yZz4KPiA+PiBDYzogTWFzYWhpcm8gWWFtYWRhIDxtYXNhaGlyb3lAa2VybmVsLm9yZz4K
PiA+PiBDYzogTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4KPiA+PiBD
YzogVGltIFNhbmRlciA8dGltQGtyaWVnbHN0ZWluLm9yZz4KPiA+PiBUbzogbGludXgtbXRkIDxs
aW51eC1tdGRAbGlzdHMuaW5mcmFkZWFkLm9yZz4KPiA+PiAtLS0KPiA+PiAgZHJpdmVycy9tdGQv
bmFuZC9yYXcvZGVuYWxpLmMgfCAyICstCj4gPj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKSwgMSBkZWxldGlvbigtKQo+ID4+Cj4gPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25h
bmQvcmF3L2RlbmFsaS5jIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvZGVuYWxpLmMKPiA+PiBpbmRl
eCBiNmM0NjNkMDIxNjcuLjVmZTNjNjJhNzU2ZSAxMDA2NDQKPiA+PiAtLS0gYS9kcml2ZXJzL210
ZC9uYW5kL3Jhdy9kZW5hbGkuYwo+ID4+ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L2RlbmFs
aS5jCj4gPj4gQEAgLTEyMDksNyArMTIwOSw3IEBAIGludCBkZW5hbGlfY2hpcF9pbml0KHN0cnVj
dCBkZW5hbGlfY29udHJvbGxlciAqZGVuYWxpLAo+ID4+ICAJfQo+ID4+ICAKPiA+PiAgCS8qIGNs
ayByYXRlIGluZm8gaXMgbmVlZGVkIGZvciBzZXR1cF9kYXRhX2ludGVyZmFjZSAqLwo+ID4+IC0J
aWYgKCFkZW5hbGktPmNsa19yYXRlIHx8ICFkZW5hbGktPmNsa194X3JhdGUpICAKPiA+IAo+ID4g
SSBkb24ndCBnZXQgaXQsIGlmIGJvdGggY2xrX3JhdGUgYW5kIGNsa194X3JhdGUgYXJlIHNldCwg
dGhlIGlmCj4gPiBjb25kaXRpb24gd2lsbCBub3QgYmUgZW50ZXJlZCwgcmlnaHQ/ICAKPiAKPiBF
cnIsIHRoZW4gaXQncyB0aGUgb3RoZXIgd2F5IGFyb3VuZCBhbmQgSSBuZWVkIHRvIGtlZXAgdGhl
IHRpbWluZ3Mgb24KPiBzb2NmcGdhID8KCk9rLgoKRG8geW91IGhhdmUgYSBkaWZmZXJlbnQgY29t
cGF0aWJsZT8gT3IgYSByZWdpc3RlciB0byBjaGVjaz8gSG93IGRvIHlvdQpkaXNjcmltaW5hdGUg
dGhlIGRpZmZlcmVudCBwbGF0Zm9ybXMgYnkgc29mdHdhcmU/IFRoZSBxdWljayBhbmQgZGlydHkK
c29sdXRpb24gaXMgdG8gYWRkIGEgc3BlY2lhbCBjYXNlIGZvciB5b3VyIHBsYXRmb3JtIGFuZCBz
cGVjaWZpY2FsbHkKdXNlIHRoZSBOQU5EX0tFRVBfVElNSU5HUyBob3Jyb3IuCgpCdXQgSSB0aGlu
ayB1c2luZyAtPnNvZnR3YXJlX2RhdGFfaW50ZXJmYWNlIGlzIHRoZSByaWdodCBzb2x1dGlvbi4g
U28KSSB3b3VsZCBoaWdobHkgcmVjb21tZW5kIGZpeGluZyB0aGUgaW1wbGVtZW50YXRpb24gb2Yg
dGhpcyBob29rCmZvciB5b3VyIHBsYXRmb3JtIGFuZCBpbiB0aGlzIGNhc2UgdGhlIGNvbW1pdCBy
ZXZlcnRlZCBpcyBub3QgdGhlCmN1bHByaXQsIHRoZSBvbmUgaW50cm9kdWNpbmcgc2V0dXBfZGF0
YV9pbnRlcmZhY2UgaXMgKGZvciB0aGUgRml4ZXM6CnRhZykuCgo+IAo+ID4+ICsJaWYgKGRlbmFs
aS0+Y2xrX3JhdGUgJiYgZGVuYWxpLT5jbGtfeF9yYXRlKQo+ID4+ICAJCWNoaXAtPm9wdGlvbnMg
fD0gTkFORF9LRUVQX1RJTUlOR1M7ICAKPiAKPiBbLi4uXQoKVGhhbmtzLApNaXF1w6hsCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgg
TVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
