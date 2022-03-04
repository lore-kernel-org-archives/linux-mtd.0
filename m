Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66FCCC433EF
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Mar 2022 15:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xWTBkqoh8o2IafmVXywc34vOHutzWEg5cDjckYYgr+8=; b=Q9TM6c/Oqi2+WX
	MGoTbi6DsBXnAPwLW8FUUR5qFlvt8TuppGZazCwcla/1etEegsM5vdtNp1p0qxkiaRR/tEDPYwCwy
	w0RJChyjAR5Qss8yBX3Nser1w0Br7mHL/qU5q6VblDU0emms9ktnw4P5X7WEyBXjN5I0A/vVU7J5/
	Pwb2JZ+tBNGtyRHMLfi1c2r9qJFcMNeW1RYkvgyw5Hs8AAIHUpA2jMK6AcxYHo1/ar/q2KhJZ9tUt
	fPJ+BAwJElh74g01ioQpEhbvc5GE85Zp9Qbrr29UgAb3iSxgwByy+44BeBMhkIuHbzFhXjjR2S1uB
	a7XtYB2r1NxqYYHeLUGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nQAGj-00AsL5-DQ; Fri, 04 Mar 2022 15:55:01 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nQAGg-00AsJW-Nz
 for linux-mtd@lists.infradead.org; Fri, 04 Mar 2022 15:55:00 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E0AE16000C;
 Fri,  4 Mar 2022 15:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1646409294;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ec6eYE2jjP5qQ4uc1Qr8kOb9YqX2txQlHqrAKoDAs98=;
 b=bCwmt7vcHr3YmtgJ6VDG9Y8RiLR6PNFDLjLoemJQm3u3lLhbs4iAvsJ3nRJxoiynpIzA3j
 aG41ugctm8E5NR5eXVYngAbKr6r2hK/pmqkwnIt0jwAkEmVLIDV13nbsN39qWgR8Olq0zy
 dp6V/8lChs14am4+czPHrGVm5NM2eJ+JvPYfWwY/IaqbldUwx60/pZys/P3NbLoCdINO5C
 Uq+NezG1maz5gwxfreJhij20JZKWHXQDYB00MrTSLXzRHQVqWA3oiopv/M/wSqOJ8vG+51
 csuEdx5kG4sZQNX01GOoSAf8wIXrTLZLhuYPZO7SbjtGCpAqukDpD6Pskqz8Lw==
Date: Fri, 4 Mar 2022 16:54:51 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Guenter Roeck <linux@roeck-us.net>, Roger Quadros <rogerq@kernel.org>,
 krzysztof.kozlowski@canonical.com, vigneshr@ti.com, nm@ti.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: omap2: Actually prevent invalid
 configuration and build error
Message-ID: <20220304165451.0129012e@xps13>
In-Reply-To: <4bbe337e-8cd8-a4d6-303d-d5aa21bee2e0@infradead.org>
References: <20220220004415.GA1519274@roeck-us.net>
 <4bbe337e-8cd8-a4d6-303d-d5aa21bee2e0@infradead.org>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220304_075458_961694_697A584D 
X-CRM114-Status: GOOD (  23.57  )
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

SGkgR3VlbnRlciwgUm9nZXIsCgpyZHVubGFwQGluZnJhZGVhZC5vcmcgd3JvdGUgb24gU2F0LCAy
NiBGZWIgMjAyMiAyMjo1NToyOCAtMDgwMDoKCj4gT24gMi8xOS8yMiAxNjo0NCwgR3VlbnRlciBS
b2VjayB3cm90ZToKPiA+IE9uIFNhdCwgRmViIDE5LCAyMDIyIGF0IDA5OjM2OjAwUE0gKzAyMDAs
IFJvZ2VyIFF1YWRyb3Mgd3JvdGU6ICAKPiA+PiBUaGUgcm9vdCBvZiB0aGUgcHJvYmxlbSBpcyB0
aGF0IHdlIGFyZSBzZWxlY3Rpbmcgc3ltYm9scyB0aGF0IGhhdmUKPiA+PiBkZXBlbmRlbmNpZXMu
IFRoaXMgY2FuIGNhdXNlIHJhbmRvbSBjb25maWd1cmF0aW9ucyB0aGF0IGNhbiBmYWlsLgo+ID4+
IFRoZSBjbGVhbmVzdCBzb2x1dGlvbiBpcyB0byBhdm9pZCB1c2luZyBzZWxlY3QuCj4gPj4KPiA+
PiBUaGlzIGRyaXZlciB1c2VzIGludGVyZmFjZXMgZnJvbSB0aGUgT01BUF9HUE1DIGRyaXZlciBz
byB3ZSBoYXZlIHRvCj4gPj4gZGVwZW5kIG9uIGl0IGluc3RlYWQuCj4gPj4KPiA+PiBGaXhlczog
NGNkMzM1ZGFlM2NmICgibXRkOiByYXduYW5kOiBvbWFwMjogUHJldmVudCBpbnZhbGlkIGNvbmZp
Z3VyYXRpb24gYW5kIGJ1aWxkIGVycm9yIikKPiA+PiBTaWduZWQtb2ZmLWJ5OiBSb2dlciBRdWFk
cm9zIDxyb2dlcnFAa2VybmVsLm9yZz4gIAo+ID4gCj4gPiBUZXN0ZWQtYnk6IEd1ZW50ZXIgUm9l
Y2sgPGxpbnV4QHJvZWNrLXVzLm5ldD4gIAo+IAo+IFRlc3RlZC1ieTogUmFuZHkgRHVubGFwIDxy
ZHVubGFwQGluZnJhZGVhZC5vcmc+CgpTb3JyeSBmb3Igbm90aWNpbmcgdGhhdCBqdXN0IG5vdywg
YnV0IHRoZXJlIGlzIHN0aWxsIGEgcHJvYmxlbSB3aXRoCnRoaXMgcGF0Y2g6IHdlIG5vdyBhbHdh
eXMgY29tcGlsZS1pbiB0aGUgT01BUF9HUE1DIGRyaXZlciB3aGVuZXZlciB3ZQpuZWVkIHRoZSBO
QU5EIGNvbnRyb2xsZXIsIGV2ZW4gdGhvdWdoIGl0IGlzIG5vdCBuZWVkZWQuIFRoaXMgZ3Jvd3Mg
dGhlCmtlcm5lbCBmb3Igbm8gcmVhc29uLgoKSW4gZmFjdCwgUm9nZXIgb25jZSBzYWlkOgoKCSJX
ZSB3aWxsIGZpZ3VyZSBvdXQgaG93IHRvIGVuYWJsZSBPTUFQX0dQTUMgZm9yIEszIGFyY2hpdGVj
dHVyZQoJc29tZSBvdGhlciB3YXkuIgoKSXQgdHVybnMgb3V0IHRoaXMgaXMgbm90IHdoYXQgd2Fz
IGZpbmFsbHkgcHJvcG9zZWQuIENvdWxkIHdlIHRyeSB5ZXQKYW5vdGhlciBzb2x1dGlvbj8KCj4g
Cj4gVGhhbmtzLgo+IAo+ID4gICAKPiA+PiAtLS0KPiA+PiAgZHJpdmVycy9tdGQvbmFuZC9yYXcv
S2NvbmZpZyB8IDMgKy0tCj4gPj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMiBk
ZWxldGlvbnMoLSkKPiA+Pgo+ID4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9L
Y29uZmlnIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvS2NvbmZpZwo+ID4+IGluZGV4IDM2ZTY5NzQ1
NmVjNC4uOWIwNzhlNzhmM2ZhIDEwMDY0NAo+ID4+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3
L0tjb25maWcKPiA+PiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9LY29uZmlnCj4gPj4gQEAg
LTQyLDggKzQyLDcgQEAgY29uZmlnIE1URF9OQU5EX09NQVAyCj4gPj4gIAl0cmlzdGF0ZSAiT01B
UDIsIE9NQVAzLCBPTUFQNCBhbmQgS2V5c3RvbmUgTkFORCBjb250cm9sbGVyIgo+ID4+ICAJZGVw
ZW5kcyBvbiBBUkNIX09NQVAyUExVUyB8fCBBUkNIX0tFWVNUT05FIHx8IEFSQ0hfSzMgfHwgQ09N
UElMRV9URVNUCj4gPj4gIAlkZXBlbmRzIG9uIEhBU19JT01FTQo+ID4+IC0Jc2VsZWN0IE1FTU9S
WQo+ID4+IC0Jc2VsZWN0IE9NQVBfR1BNQwo+ID4+ICsJZGVwZW5kcyBvbiBPTUFQX0dQTUMKPiA+
PiAgCWhlbHAKPiA+PiAgCSAgU3VwcG9ydCBmb3IgTkFORCBmbGFzaCBvbiBUZXhhcyBJbnN0cnVt
ZW50cyBPTUFQMiwgT01BUDMsIE9NQVA0Cj4gPj4gIAkgIGFuZCBLZXlzdG9uZSBwbGF0Zm9ybXMu
Cj4gPj4gLS0gCj4gPj4gMi4xNy4xCj4gPj4gIAo+IAoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVRE
IGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbXRkLwo=
