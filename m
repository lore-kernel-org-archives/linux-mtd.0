Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F98FCAC587
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Sep 2025 08:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u/+cyySkhr56bGdxoBa35UjEmC7/ZzuZa8gt2JVSKrY=; b=zPSNbmuBkq3Il5
	U8XmHdrFUFPwItDn39UccGNNueB3vte6ziZXaHzD7A8RxCDgsJLXlPGnIedokeqEMeAF75oS05nlT
	qCu44xX/DGdG7StbcDN+K+XtN2QBqoG0uimhnW8OJEvPa+4OqMdaxQwnjQTmyeAxtYf0IZVN44k/y
	G9qawk+ue1iNVZO8bqK4TDeUekDdDbuQeczIC1MWllCZFge0cCer11dIY8HxWGzxja7t1NVd4HfTt
	zRumGf3bN4EcAaCE7/kWiBNVhUDE/R00eYHdk8+TvNoUZrPc694gErrU8d5PwQSPpiR8nNmzx/tkX
	zcnd8akXDyUXgjGQSDow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwcDp-00000001g7h-1Dhw;
	Thu, 11 Sep 2025 08:00:01 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwcDl-00000001g5C-2b7q
	for linux-mtd@lists.infradead.org;
	Thu, 11 Sep 2025 07:59:59 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 9E3C5C8F1EF;
	Thu, 11 Sep 2025 07:59:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6DCE8606BB;
	Thu, 11 Sep 2025 07:59:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9DC48102F1CF1;
	Thu, 11 Sep 2025 09:59:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1757577591; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=es+sEVgukOs1NicYrB8M0ntFbdAfgIvPPIW71WcySzY=;
	b=WcR3VfbKRLNqbQIw7MIemI9ciMf/zEO6KbpsW+KFvJX/v84ksBicJrkYDn0P1u1cFUJNnK
	fnNCHo0x0bUDV+qOzwbznLoeCl4MbqfegF/NCxsT87wdY3TKn8qwjUW4nim0oe7+i++Gpy
	NcgTjAbizueLUw4aBQezDYggz7+D3RBnjqKzT560ZIX5EtxUal7QO2PUEJhSJZbIhSJBMQ
	zQTmxFvJ3cOceLdDtJ15u8xpiM9avMjzSb+S0y5UHfelR0vliWl5xAZeQUKFTd5sNhfESv
	o1b0rdYhlGeZ2ej8faIHOid44ofgpmFXf/YT3bJqom8h17jMx9rcMMfJiT4vbQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Cheng Ming Lin <linchengming884@gmail.com>
Cc: richard@nod.at,  vigneshr@ti.com,  robh@kernel.org,  krzk+dt@kernel.org,
  conor+dt@kernel.org,  tudor.ambarus@linaro.org,
  mmkurbanov@salutedevices.com,  Takahiro.Kuwano@infineon.com,
  pratyush@kernel.org,  linux-mtd@lists.infradead.org,
  devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,
  alvinzhou@mxic.com.tw,  Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: Re: [PATCH v2 1/3] dt-bindings: mtd: spi-nand: Add
 enable-randomizer-otp property
In-Reply-To: <CAAyq3SbXiPUjZE7OCAe1=uw4h82bFN7DSU4bLx1dhKe_XFtu=w@mail.gmail.com>
	(Cheng Ming Lin's message of "Thu, 11 Sep 2025 15:24:35 +0800")
References: <20250910030301.1368372-1-linchengming884@gmail.com>
	<20250910030301.1368372-2-linchengming884@gmail.com>
	<87wm66d67k.fsf@bootlin.com>
	<CAAyq3SbXiPUjZE7OCAe1=uw4h82bFN7DSU4bLx1dhKe_XFtu=w@mail.gmail.com>
User-Agent: mu4e 1.12.7; emacs 30.1
Date: Thu, 11 Sep 2025 09:59:34 +0200
Message-ID: <878qilbes9.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_005957_851838_AE1748AB 
X-CRM114-Status: GOOD (  30.52  )
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

SGkgQ2hlbmcgTWluZywKCk9uIDExLzA5LzIwMjUgYXQgMTU6MjQ6MzUgKzA4LCBDaGVuZyBNaW5n
IExpbiA8bGluY2hlbmdtaW5nODg0QGdtYWlsLmNvbT4gd3JvdGU6Cgo+IEhpIE1pcXVlbCwKPgo+
IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+IOaWvCAyMDI15bm0Oeac
iDEw5pelIOmAseS4iSDkuIvljYg1OjEw5a+r6YGT77yaCj4+Cj4+IEhlbGxvIENoZW5nIE1pbmcs
Cj4+Cj4+IE9uIDEwLzA5LzIwMjUgYXQgMTE6MDI6NTkgKzA4LCBDaGVuZyBNaW5nIExpbiA8bGlu
Y2hlbmdtaW5nODg0QGdtYWlsLmNvbT4gd3JvdGU6Cj4+Cj4+ID4gRnJvbTogQ2hlbmcgTWluZyBM
aW4gPGNoZW5nbWluZ2xpbkBteGljLmNvbS50dz4KPj4gPgo+PiA+IEFkZCBhIG5ldyBib29sZWFu
IHByb3BlcnR5ICJlbmFibGUtcmFuZG9taXplci1vdHAiIHRvIGVuYWJsZSB0aGUKPj4gPiByYW5k
b21pemVyIGZlYXR1cmUgb24gc3VwcG9ydGVkIFNQSS1OQU5EIGRldmljZXMuCj4+ID4KPj4gPiBT
aWduZWQtb2ZmLWJ5OiBDaGVuZyBNaW5nIExpbiA8Y2hlbmdtaW5nbGluQG14aWMuY29tLnR3Pgo+
PiA+IC0tLQo+PiA+ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3NwaS1u
YW5kLnlhbWwgfCA0ICsrKysKPj4gPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQo+
PiA+Cj4+ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9t
dGQvc3BpLW5hbmQueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQv
c3BpLW5hbmQueWFtbAo+PiA+IGluZGV4IDc3YTg3MjdjNy4uNDMyYmM3OWU5IDEwMDY0NAo+PiA+
IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvc3BpLW5hbmQueWFt
bAo+PiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvc3BpLW5h
bmQueWFtbAo+PiA+IEBAIC0yMSw2ICsyMSwxMCBAQCBwcm9wZXJ0aWVzOgo+PiA+ICAgICAgZGVz
Y3JpcHRpb246IEVuY29kZSB0aGUgY2hpcC1zZWxlY3QgbGluZSBvbiB0aGUgU1BJIGJ1cwo+PiA+
ICAgICAgbWF4SXRlbXM6IDEKPj4gPgo+PiA+ICsgIGVuYWJsZS1yYW5kb21pemVyLW90cDoKPj4K
Pj4gVGhpcyBpcyBhIE5BTkQgd2lkZSBmZWF0dXJlLCBzbyB3ZSBzaG91bGQgcHJvYmFibHkgYWRk
IGEgcHJlZml4LCBzdWNoIGFzCj4+ICJuYW5kLCIuCj4+Cj4+IE5vdywgd2hhdCBhYm91dCB0aGlz
ICJvdHAiIHN1ZmZpeD8gTWFueSAoaWYgbm90IGFsbCkgY2hpcHMgaGF2ZSBhCj4+IHZvbGF0aWxl
IHNldHRpbmcgZm9yIHRoYXQuIEFib3V0IHRoZSBuYW1pbmcsICJvdHAiIG9mdGVuIHJlZmxlY3Rz
IHRvIHRoZQo+PiBPVFAgYXJlYSwgd2hpY2ggaXMgbm90IHdoYXQgeW91IGltcGx5IGhlcmUsIGFz
IHlvdSB3YW50IHRvIGluc2lzdAo+PiAocmlnaHRmdWxseSkgb24gdGhlIGZhY3QgdGhhdCB0aGlz
IGZlYXR1cmUgY2Fubm90IGJlIGRpc2FibGVkLgo+Cj4gWWVzLCBteSBpbnRlbnRpb24gaXMgdGhh
dCBvbmNlIHRoZSByYW5kb21pemVyIGZlYXR1cmUgaXMgZW5hYmxlZCwgaXQKPiBzaG91bGQgbm90
IGJlIGRpc2FibGVkIGFnYWluLgoKSSBiZWxpZXZlIHRoZSBtb3RpdmF0aW9uIGJlaGluZCB0aGlz
IGNob2ljZSBpcyBpbmNvcnJlY3QgYW5kIGRvZXMgbm90CmZpdCBzdWNoIGFuIE9TIGFzIExpbnV4
LiBXZSB3YW50IHRvIGdpdmUgdGhlIHN5c3RlbSBhZG1pbmlzdHJhdG9yIHRoZQpjaG9pY2UgdG8g
c2VsZWN0IGFuZCB1bnNlbGVjdCBmZWF0dXJlcyBhcyBpdCBzZWVzIGZpdC4gU28gaWYgdGhlcmUg
aXMgYQp2b2xhdGlsZSB3YXkgdG8gZW5hYmxlIHNvbWV0aGluZywgd2Ugc2hvdWxkIGdvIGZvciBp
dCBhbmQgd2Ugd2lsbCBwYXkKdGhlIGV4dHJhIHBlbmFsdHkgb2YgYSBzZXRfZmVhdHVyZSgpIChv
ciB3aGF0ZXZlcikgY29tbWFuZCBhZnRlciBlYWNoCmJvb3QuIE1ha2luZyB0aGlzIHR5cGUgb2Yg
Y2hhbmdlIHBlcm1hbmVudCBtYWtlcyBkZXZlbG9wbWVudCBhbmQKZGVidWdnaW5nIG11Y2ggbW9y
ZSBwYWluZnVsLiBUaGVyZSBhcmUgcGxlbnR5IG9mIGNvbmZpZ3VyYXRpb25zIHRoYXQgd2UKcmVm
dXNlIHRvIGFwcGx5IHdpdGggbm9uIHZvbGF0aWxlIGNvbmZpZ3VyYXRpb25zLiBJbiBnZW5lcmFs
LCBzdGF0ZWZ1bAptb2RlcyBhcmUgcHJvYmxlbWF0aWMgaWYgdGhleSBhcmUga2VwdCBhZnRlciBh
IHJlYm9vdCBhbmQgd2UgdHJ5IG91cgpiZXN0IHRvIGF2b2lkIHRoZW0uCgpPbmNlIHRoaXMgZmVh
dHVyZSBpcyBlbmFibGVkLCBmb3IgdGhlIGxpZmV0aW1lIG9mICJhIHByb2R1Y3QiLCBpdCBkb2Vz
Cm5vdCBtYWtlIHNlbnNlIHRvIGRpc2FibGUgaXQgaW5kZWVkLiBBbmQgdGhlIERUIG11c3QgcmVt
YWluIGNvcnJlY3QsIGlmCml0IGlzIGNoYW5nZWQgaW4gYSBub24gY29tcGF0aWJsZSB3YXksIHRo
YXQncyB0aGUgYWRtaW5pc3RyYXRvcgpyZXNwb25zaWJpbGl0eS4KClNvIGFyZSB0aGVyZSB3YXlz
IHRvIGVuYWJsZSB0aGlzIGZlYXR1cmUgaW4gYSB3YXkgdGhhdCByZXR1cm5zIHRvIHRoZQpkZWZh
dWx0IHN0YXRlIGFmdGVyIGEgcmVzZXQ/Cgo+IFlvdSBhcmUgY29ycmVjdCB0aGF0IHRoaXMgYml0
IGRvZXMgbm90Cj4gYmVsb25nIHRvIHRoZSBPVFAgYXJlYSwgYnV0IHJhdGhlciB0byB0aGUgdjIg
dm9sYXRpbGUgcmVnaXN0ZXIuIFRoZSB2Mgo+IHZvbGF0aWxlIHJlZ2lzdGVyIGhhcyBhIGRlZmF1
bHQgdmFsdWUgdGhhdCBjYW4gYmUgY2hhbmdlZCB0aHJvdWdoIGEKPiBzcGVjaWFsIE9UUCBjb25m
aWd1cmF0aW9uIHJlZ2lzdGVyIHByb2dyYW0gb3BlcmF0aW9uLiBSZWdhcmRpbmcgdGhlCj4gIm90
cCIgc3VmZml4LCBJIHdpbGwgcmVtb3ZlIGl0IHRvIGF2b2lkIG1pc3VuZGVyc3RhbmRpbmcuCj4K
Pj4KPj4gQWxzbywgdGhpcyBpcyBhIHBlci1jaGlwIGNvbmZpZ3VyYXRpb24sIHdoaWxlIEkgd291
bGQgaGF2ZSB3ZWxjb21lZCBhCj4+IHBlci1wYXJ0aXRpb24gY29uZmlndXJhdGlvbi4gSSBjYW4g
ZWFzaWx5IGltYWdpbmUgdHdvIGNhc2VzOgo+Pgo+PiAtIFRoZSBib290IFJPTSwgZm9yIGxvbmdl
dml0eSBwdXJwb3NlcywgZXhwZWN0cyB0aGUgZmlyc3QgYmxvY2tzCj4+ICAgY29udGFpbmluZyB0
aGUgYm9vdGxvYWRlciB0byBiZSBzY3JhbWJsZWQuIEhvd2V2ZXIgdGhlIHJlc3Qgb2YgdGhlCj4+
ICAgc3lzdGVtIGRvZXMgbm90IHJlYWxseSBjYXJlIGFuZCBkaXNhYmxlcyByYW5kb21pemF0aW9u
Lgo+Pgo+PiAtIFRoZSBib290IFJPTSBpcyBub3QgY2FwYWJsZSBvZiBkZS1zY3JhbWJsaW5nLCBo
b3dldmVyIHRoZSByZXN0IG9mIHRoZQo+PiAgIHN5c3RlbSByZWxpZXMgb24gdGhlIChwcm9iYWJs
eSkgbW9yZSByb2J1c3Qgc2NyYW1ibGluZyBmZWF0dXJlLgo+Pgo+PiBJbiBib3RoIGNhc2VzIGEg
Y2hpcCB3aWRlIHZhcmlhYmxlIGlzIG5vdCByZWxldmFudC4KPgo+IFRoZSBzY3JhbWJsaW5nIGFu
ZCBkZXNjcmFtYmxpbmcgYXJlIGhhbmRsZWQgYnkgdGhlIE5BTkQgZmxhc2ggaGFyZHdhcmUKPiBp
dHNlbGYuIFRoZXJlZm9yZSwgdGhlIGJvb3QgUk9NIGRvZXMgbm90IG5lZWQgdG8gc3VwcG9ydCBh
IGRlc2NyYW1ibGluZwo+IGZlYXR1cmUuCj4KPiBJbiB0aGUgY2FzZSBvZiBNYWNyb25peCBwYXJ0
cywgdGhlIHJhbmRvbWl6ZXIgaXMgY29udHJvbGxlZCB0aHJvdWdoIGEKPiBjb25maWd1cmF0aW9u
IHJlZ2lzdGVyLCBhbmQgb25jZSBpdCBpcyBlbmFibGVkIGl0IGNvdmVycyB0aGUgZW50aXJlIGNo
aXAKPiAobWFpbiBhbmQvb3Igc3BhcmUgZGVwZW5kaW5nIG9uIHRoZSByYW5kb3B0IGJpdCkuIFRo
ZXJlIGlzIG5vIGhhcmR3YXJlCj4gbWVjaGFuaXNtIHRvIGVuYWJsZSBpdCBvbmx5IG9uIGNlcnRh
aW4gcmFuZ2VzLgoKQWZ0ZXIgdGhpbmtpbmcgb25jZSBhZ2FpbiwgSSBhbSBubyBsb25nZXIgYWxp
Z25lZCB3aXRoIG15c2VsZiBmcm9tIHRoZQpwYXN0LiBUaGlzIGlzIHBlcmhhcHMgdG9vIE1hY3Jv
bml4IHNwZWNpZmljIGluIHRoZSBlbmQgYW5kIGlmIGl0IGlzIGEKZnVsbHkgdHJhbnNwYXJlbnQg
ZmVhdHVyZSwgdGhlbiB3aHkgbm90LgoKQXJlIHRoZXJlIGFueSB3YXlzIHdlIGNhbiByZWFkIHRo
ZSByYXcgZGF0YSAodW5zY3JhbWJsZWQpIG9uY2UKc2NyYW1ibGluZyBoYXMgYmVlbiBlbmFibGVk
PyAoSSBtZWFuLCB3aXRob3V0IGNoYW5naW5nIHRoZSB1c2VyIGRlZmF1bHQKT1RQIHN0YXRlKS4g
TWF5YmUgb25lIGJpZyBkaWZmZXJlbmNlIHdpdGggdGhlIHJhdyBOQU5EIHdvcmxkIHRoYXQgbmVl
ZHMKdG8gYmUgdGFrZW4gaW50byBhY2NvdW50IGlzIHRoYXQgdGhlIGNoaXAgaXRzZWxmIGFsd2F5
cyByZXR1cm4KdW5zY3JhbWJsZWQgZGF0YSwgaGVuY2Ugd2UgcHJvYmFibHkgZG8gbm90IGNhcmUg
bXVjaCwgZnJvbSBhIExpbnV4CnBlcnNwZWN0aXZlLgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVRE
IGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbXRkLwo=
