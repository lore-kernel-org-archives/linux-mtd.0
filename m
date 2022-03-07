Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32696C433EF
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Mar 2022 14:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2YFQeRAQmuMl+pS9ryZJ+Gr0csFrvLBSmL0fT7V96qA=; b=IPt/as+Z4/iNp1
	gUAgktMuHRMf7KJtauYMdoruolsrt9qSSJCgK53E3BEbeIV4B82AOfgB3GXBpdJwI4JpO10uL4dk2
	ca5byVxJC8lFkpG5P7iGfG/sCi0iKYPg5iHprWko0Ub+LgnRtoRTbExrx6iHofgbyI7XKFOi9+y2U
	l00HmareNskQsD/Pdq4Vha1xcs6k4yazN/b92EjNtOWm6Jn2vO8WQEi7jFHQvyhIkXrPqFHecoQ2Q
	Z8oyx3fyxwY9ZOwrrVrn6q6Fz43IusfdsvphNUTWM6tVQpMCRECvIjwlW92/E5Svka0pQ/DV+phEQ
	G0rcCTb0JK1CBwc9D6kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRE6b-000Klx-Cr; Mon, 07 Mar 2022 14:12:57 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRE6Y-000Kl4-RT
 for linux-mtd@lists.infradead.org; Mon, 07 Mar 2022 14:12:56 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id A16E8C0004;
 Mon,  7 Mar 2022 14:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1646662371;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f7wRRkaUpdd0FO6MkRSvjWKxffLR4zgrZ4eHm549wd8=;
 b=VjCnIllsUSd/hIxdGPlkxd4MA52ZiTiqynK0N4yYK0WuB/R3+ALfLcfuHsq36T70ijuSBm
 cwS3GyltOb1z4fx8OCmx/fjyS8DlNt5LjXwNiKZx9chWpZVYUNJ1F/A4hp6Dtuw0pYeRyO
 aDc+dqeeC+I4eUKgG4KEXJN7d8yPvZqQNMPCumbyyFxAMlxHng0WKYtr/ycqjRg+xnx4rc
 X/2zFsUVkrFrtFQJaO8ubaxFxeZWsPS86gCCrY0FfItvwQTzR3j0iKb/Xphx22EFHmA1eL
 DJ+am6OB86trVx8vCBAG1wVLp07HlNFRDik21J2P8okqkvR8Te0Or8tARw1HmA==
Date: Mon, 7 Mar 2022 15:12:49 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Roger Quadros <rogerq@kernel.org>
Cc: Randy Dunlap <rdunlap@infradead.org>, Guenter Roeck
 <linux@roeck-us.net>, krzysztof.kozlowski@canonical.com, vigneshr@ti.com,
 nm@ti.com, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: omap2: Actually prevent invalid
 configuration and build error
Message-ID: <20220307151249.7e5b7210@xps13>
In-Reply-To: <c39d64f0-deef-4cae-fab7-555a48e31811@kernel.org>
References: <20220220004415.GA1519274@roeck-us.net>
 <4bbe337e-8cd8-a4d6-303d-d5aa21bee2e0@infradead.org>
 <20220304165451.0129012e@xps13>
 <6c09de15-1ab2-5ca8-7003-69ff3f7c4dc5@kernel.org>
 <20220307110357.20d50176@xps13>
 <c39d64f0-deef-4cae-fab7-555a48e31811@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220307_061255_221261_8CA64643 
X-CRM114-Status: GOOD (  33.15  )
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

SGkgUm9nZXIsCgpyb2dlcnFAa2VybmVsLm9yZyB3cm90ZSBvbiBNb24sIDcgTWFyIDIwMjIgMTQ6
MjU6NDggKzAyMDA6Cgo+IEhpIE1pcXVlbCwKPiAKPiBPbiAwNy8wMy8yMDIyIDEyOjAzLCBNaXF1
ZWwgUmF5bmFsIHdyb3RlOgo+ID4gSGkgUm9nZXIsCj4gPiAKPiA+IHJvZ2VycUBrZXJuZWwub3Jn
IHdyb3RlIG9uIFNhdCwgNSBNYXIgMjAyMiAwMDo1MDoxNCArMDIwMDoKPiA+ICAgCj4gPj4gSGkg
TWlxdWVsLAo+ID4+Cj4gPj4gT24gMDQvMDMvMjAyMiAxNzo1NCwgTWlxdWVsIFJheW5hbCB3cm90
ZTogIAo+ID4+PiBIaSBHdWVudGVyLCBSb2dlciwKPiA+Pj4KPiA+Pj4gcmR1bmxhcEBpbmZyYWRl
YWQub3JnIHdyb3RlIG9uIFNhdCwgMjYgRmViIDIwMjIgMjI6NTU6MjggLTA4MDA6Cj4gPj4+ICAg
ICAKPiA+Pj4+IE9uIDIvMTkvMjIgMTY6NDQsIEd1ZW50ZXIgUm9lY2sgd3JvdGU6ICAgIAo+ID4+
Pj4+IE9uIFNhdCwgRmViIDE5LCAyMDIyIGF0IDA5OjM2OjAwUE0gKzAyMDAsIFJvZ2VyIFF1YWRy
b3Mgd3JvdGU6ICAgICAgCj4gPj4+Pj4+IFRoZSByb290IG9mIHRoZSBwcm9ibGVtIGlzIHRoYXQg
d2UgYXJlIHNlbGVjdGluZyBzeW1ib2xzIHRoYXQgaGF2ZQo+ID4+Pj4+PiBkZXBlbmRlbmNpZXMu
IFRoaXMgY2FuIGNhdXNlIHJhbmRvbSBjb25maWd1cmF0aW9ucyB0aGF0IGNhbiBmYWlsLgo+ID4+
Pj4+PiBUaGUgY2xlYW5lc3Qgc29sdXRpb24gaXMgdG8gYXZvaWQgdXNpbmcgc2VsZWN0Lgo+ID4+
Pj4+Pgo+ID4+Pj4+PiBUaGlzIGRyaXZlciB1c2VzIGludGVyZmFjZXMgZnJvbSB0aGUgT01BUF9H
UE1DIGRyaXZlciBzbyB3ZSBoYXZlIHRvCj4gPj4+Pj4+IGRlcGVuZCBvbiBpdCBpbnN0ZWFkLgo+
ID4+Pj4+Pgo+ID4+Pj4+PiBGaXhlczogNGNkMzM1ZGFlM2NmICgibXRkOiByYXduYW5kOiBvbWFw
MjogUHJldmVudCBpbnZhbGlkIGNvbmZpZ3VyYXRpb24gYW5kIGJ1aWxkIGVycm9yIikKPiA+Pj4+
Pj4gU2lnbmVkLW9mZi1ieTogUm9nZXIgUXVhZHJvcyA8cm9nZXJxQGtlcm5lbC5vcmc+ICAgICAg
Cj4gPj4+Pj4KPiA+Pj4+PiBUZXN0ZWQtYnk6IEd1ZW50ZXIgUm9lY2sgPGxpbnV4QHJvZWNrLXVz
Lm5ldD4gICAgICAKPiA+Pj4+Cj4gPj4+PiBUZXN0ZWQtYnk6IFJhbmR5IER1bmxhcCA8cmR1bmxh
cEBpbmZyYWRlYWQub3JnPiAgICAKPiA+Pj4KPiA+Pj4gU29ycnkgZm9yIG5vdGljaW5nIHRoYXQg
anVzdCBub3csIGJ1dCB0aGVyZSBpcyBzdGlsbCBhIHByb2JsZW0gd2l0aAo+ID4+PiB0aGlzIHBh
dGNoOiB3ZSBub3cgYWx3YXlzIGNvbXBpbGUtaW4gdGhlIE9NQVBfR1BNQyBkcml2ZXIgd2hlbmV2
ZXIgd2UKPiA+Pj4gbmVlZCB0aGUgTkFORCBjb250cm9sbGVyLCBldmVuIHRob3VnaCBpdCBpcyBu
b3QgbmVlZGVkLiBUaGlzIGdyb3dzIHRoZQo+ID4+PiBrZXJuZWwgZm9yIG5vIHJlYXNvbi4gICAg
Cj4gPj4KPiA+PiBTb3JyeSwgSSBkaWQgbm90IHVuZGVyc3RhbmQgd2hhdCB5b3UgbWVhbnQuCj4g
Pj4KPiA+PiBXZSBubyBsb25nZXIgZXhwbGljaXRseSBlbmFibGUgT01BUF9HUE1DIHNpbmNlIHdl
IGRyb3BwZWQgdGhlICJzZWxlY3QiLgo+ID4+IFRoaXMgZml4ZXMgYWxsIGJ1aWxkIGlzc3VlcyB0
aGF0IHdlcmUgcmVwb3J0ZWQgcmVjZW50bHkuCj4gPj4KPiA+PiBNVERfTkFORF9PTUFQMiB3aWxs
IG5vdCBiZSBlbmFibGVkIGlmIE9NQVBfR1BNQyBpcyBub3Qgc2luY2Ugd2UgYWRkZWQKPiA+PiB0
aGUgImRlcGVuZHMgb24iLiBUaGlzIGZpeGVzIHRoZSBvcmlnaW5hbCBidWlsZCBpc3N1ZSB0aGF0
IHdlIHN0YXJ0ZWQgdG8KPiA+PiBmaXggd2l0aCBzZWxlY3QgaW5pdGlhbGx5LiAgCj4gPiAKPiA+
IFllcywgdGhpcyBzaWRlIGlzIGZpbmUuCj4gPiAKPiA+IEluIHRoZSBpbml0aWFsIGNvbW1pdCwg
eW91IHByb3Bvc2VkOgo+ID4gCj4gPiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9LY29uZmln
Cj4gPiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9LY29uZmlnCj4gPiBAQCAtNDIsNyArNDIs
OCBAQCBjb25maWcgTVREX05BTkRfT01BUDIKPiA+ICAgICAgICAgdHJpc3RhdGUgIk9NQVAyLCBP
TUFQMywgT01BUDQgYW5kIEtleXN0b25lIE5BTkQgY29udHJvbGxlciIKPiA+ICAgICAgICAgZGVw
ZW5kcyBvbiBBUkNIX09NQVAyUExVUyB8fCBBUkNIX0tFWVNUT05FIHx8IEFSQ0hfSzMgfHwgQ09N
UElMRV9URVNUCj4gPiAgICAgICAgIGRlcGVuZHMgb24gSEFTX0lPTUVNCj4gPiArICAgICAgIHNl
bGVjdCBPTUFQX0dQTUMgaWYgQVJDSF9LMwo+ID4gCj4gPiBXaGljaCBjcmVhdGVzIGEgZGVwZW5k
ZW5jeSBvdmVyIE9NQVBfR1BNQyBvbmx5IGZvciBhIHNpbmdsZQo+ID4gYXJjaGl0ZWN0dXJlLiBX
aGljaCBtZWFucyB0aGF0IG90aGVyIE9NQVAgcGxhdGZvcm1zIGRvIG5vdCBuZWNlc3NhcmlseQo+
ID4gbmVlZCBPTUFQX0dQTUMgZm9yIHRoZSBOQU5EIGNvbnRyb2xsZXIgdG8gd29yay4gTm93LCB5
b3UgcHJvcG9zZTogIAo+IAo+IE5vIHRoYXQgaXMgbm90IHRydWUuIE90aGVyIHBsYXRmb3JtcyB0
aGF0IG5lZWQgTVREX05BTkRfT01BUDIgYXJlCj4gZXhwbGljaXRseSBzZWxlY3RpbmcgT01BUF9H
UE1DCj4gaS5lLiBpbiBhcmNoL2FybS9tYWNoLW9tYXAyL0tjb25maWcKCk9rYXksIGluIHRoaXMg
Y2FzZSB0aGUgZml4IGlzIGZpbmUgYnV0IHdlIHdpbGwgbmVlZCB0byBjbGVhbiB0aGlzIHVwIGlu
CmEgc2Vjb25kIHRpbWUuCgo+ID4gLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvS2NvbmZpZwo+
ID4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvS2NvbmZpZwo+ID4gQEAgLTQyLDggKzQyLDcg
QEAgY29uZmlnIE1URF9OQU5EX09NQVAyCj4gPiAgCXRyaXN0YXRlICJPTUFQMiwgT01BUDMsIE9N
QVA0IGFuZCBLZXlzdG9uZSBOQU5EIGNvbnRyb2xsZXIiCj4gPiAgCWRlcGVuZHMgb24gQVJDSF9P
TUFQMlBMVVMgfHwgQVJDSF9LRVlTVE9ORSB8fCBBUkNIX0szIHx8IENPTVBJTEVfVEVTVAo+ID4g
IAlkZXBlbmRzIG9uIEhBU19JT01FTQo+ID4gCWRlcGVuZHMgb24gT01BUF9HUE1DCj4gPiAKPiA+
IFRoaXMgbWVhbnMgYW55IG9mIHRoZSBvdGhlciBPTUFQIGFyY2hpdGVjdHVyZXMgd2lsbCBjb21w
aWxlIHRoZSBHUE1DCj4gPiBkcml2ZXIgZXZlbiB0aG91Z2ggdGhleSBtaWdodCBub3QgbmVlZCBp
dCwgd2hpY2ggd291bGQgdW5uZWNlc3NhcmlseQo+ID4gaW5jcmVhc2UgdGhlIGtlcm5lbCBzaXpl
Lgo+ID4gCj4gPiBBbSBJIG1pc3Npbmcgc29tZXRoaW5nPyAgCj4gCj4gTVREX05BTkRfT01BUDIg
TkFORCBjb250cm9sbGVyIGlzIGEgc3VibW9kdWxlIG9mIHRoZSBPTUFQIEdQTUMgSVAuIFNvIGl0
Cj4gY2Fubm90IHdvcmsgd2l0aG91dCBPTUFQX0dQTUMgZHJpdmVyLgoKSSBkaWRuJ3QgcmVtZW1i
ZXIgZXhhY3RseSBidXQgaW4gdGhhdCBjYXNlIGl0J3Mgb2theSwgSSB3YXMganVzdApzdXJwcmlz
ZWQgYnkgdGhlICJzZWxlY3QgR1BNQyBpZiBBUkNIX0szIiBidXQgaW5kZWVkIHdpdGggdGhpcwpl
eHBsYW5hdGlvbiBpdCBtYWtlcyBtb3JlIHNlbnNlLgoKPiBIb3BlIHRoaXMgY2xhcmlmaWVzIHRo
ZSBkb3VidHMuCgpZZXMsIHRoYW5rcy4gSSB3aWxsIHNlbmQgdGhlIGZpeCB0byBMaW51cyB0aGVu
LgoKQ2hlZXJzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
