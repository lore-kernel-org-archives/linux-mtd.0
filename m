Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E219FCEACEF
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Nov 2025 19:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kEC2isR7f7mo6EoxL7gHwmLfUHa4D8fL7iQHHOO0FVo=; b=YsV4euGndhMC6n
	OUyfy7O08CAY5W/m1smG93i5IkOkRHA6lx/EvpHontI+kyMWsYp16eiTzJVjT+B+gut3HIVU6+hLn
	/1TBBYkUpuwwsflMtNrcd/JSbOEE3NFXNZeuVc5VYOVDu0qrmNAA0MZMDEYAteuk9BZJ0WzMjmcct
	lW7dqKz7ZH0HbiYEM7GTgcLxynfba4eCQUxYr1Uv616EYJ2E2zKI2Jqe2CwPJL9gBrncB7Ln4CXA5
	qaX9Mt6CPwfPcena4s28An6fauIQC+7jFObVMKqYnozOAuLfdd1gCYAHAyH+rJbtjDigfYi3QZAyM
	2Ir+6CjBKH3WMk3oIg+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL4bJ-0000000Ghe3-40j5;
	Mon, 17 Nov 2025 19:09:21 +0000
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL4bH-0000000Ghdj-3LQO;
	Mon, 17 Nov 2025 19:09:19 +0000
Message-ID: <5fadee48-4a35-40ef-aac2-eb307e2ee869@infradead.org>
Date: Mon, 17 Nov 2025 11:09:19 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mtd: docg3: fix kernel-doc warnings
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: linux-kernel@vger.kernel.org, Robert Jarzmik <robert.jarzmik@free.fr>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org
References: <20251116070944.84071-1-rdunlap@infradead.org>
 <874iqtf576.fsf@bootlin.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <874iqtf576.fsf@bootlin.com>
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

CgpPbiAxMS8xNy8yNSAxMjoxMiBBTSwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiBIaSBSYW5keSwK
PiAKPiBPbiAxNS8xMS8yMDI1IGF0IDIzOjA5OjQ0IC0wOCwgUmFuZHkgRHVubGFwIDxyZHVubGFw
QGluZnJhZGVhZC5vcmc+IHdyb3RlOgo+IAo+PiBGaXgga2VybmVsLWRvYyB3YXJuaW5ncyBpbiBk
b2NnMy5oIHRvIGF2b2lkIGJ1aWxkIHdhcm5pbmdzIGFuZCB0bwo+PiBpbXByb3ZlIGFuZCBkb2N1
bWVudGF0aW9uOgo+IAo+ICJ0byBpbXByb3ZlIGFuZCBkb2N1bWVudGF0aW9uIiBpcyBpbmNvcnJl
Y3QsIGNhbiB5b3UgcGxlYXNlIGZpeD8KCnVnaC4gWWVzLCB3aWxsIGZpeC4KCj4+IFdhcm5pbmc6
IC4uL2RyaXZlcnMvbXRkL2RldmljZXMvZG9jZzMuaDoyNzYgYmFkIGxpbmU6Cj4+IFdhcm5pbmc6
IGRyaXZlcnMvbXRkL2RldmljZXMvZG9jZzMuaDoyOTkgc3RydWN0IG1lbWJlciAnbWF4X2Jsb2Nr
JyBub3QKPj4gIGRlc2NyaWJlZCBpbiAnZG9jZzMnCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFJhbmR5
IER1bmxhcCA8cmR1bmxhcEBpbmZyYWRlYWQub3JnPgo+PiAtLS0KPj4gQ2M6IFJvYmVydCBKYXJ6
bWlrIDxyb2JlcnQuamFyem1pa0BmcmVlLmZyPgo+PiBDYzogTWlxdWVsIFJheW5hbCA8bWlxdWVs
LnJheW5hbEBib290bGluLmNvbT4KPj4gQ2M6IFJpY2hhcmQgV2VpbmJlcmdlciA8cmljaGFyZEBu
b2QuYXQ+Cj4+IENjOiBWaWduZXNoIFJhZ2hhdmVuZHJhIDx2aWduZXNockB0aS5jb20+Cj4+IENj
OiBsaW51eC1tdGRAbGlzdHMuaW5mcmFkZWFkLm9yZwo+PiAtLS0KPj4gIGRyaXZlcnMvbXRkL2Rl
dmljZXMvZG9jZzMuaCB8ICAgIDMgKystCj4+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25z
KCspLCAxIGRlbGV0aW9uKC0pCj4+Cj4+IC0tLSBsaW51eC1uZXh0LTIwMjUxMTE0Lm9yaWcvZHJp
dmVycy9tdGQvZGV2aWNlcy9kb2NnMy5oCj4+ICsrKyBsaW51eC1uZXh0LTIwMjUxMTE0L2RyaXZl
cnMvbXRkL2RldmljZXMvZG9jZzMuaAo+PiBAQCAtMjc0LDExICsyNzQsMTIgQEAgc3RydWN0IGRv
Y2czX2Nhc2NhZGUgewo+PiAgICogQGNhc2NhZGU6IHRoZSBjYXNjYWRlIHRoaXMgZGV2aWNlIGJl
bG9uZ3MgdG8KPj4gICAqIEBkZXZpY2VfaWQ6IG51bWJlciBvZiB0aGUgY2FzY2FkZWQgRG9DRzMg
ZGV2aWNlICgwLCAxLCAyIG9yIDMpCj4+ICAgKiBAaWZfY2ZnOiBpZiB0cnVlLCByZWFkcyBhcmUg
b24gMTZiaXRzLCBlbHNlIHJlYWRzIGFyZSBvbiA4Yml0cwo+PiAtCj4+ICsgKgo+IAo+IFdyb25n
IGZpeCBJIGJlbGlldmUuIFdoYXQgbWFrZSB5b3UgdGhpbmsgYSBzcGFjZSBpcyByZWxldmFudCBo
ZXJlPwoKVGhlICcqJyBpcyByZWxldmFudCBoZXJlLiBBIGJsYW5rIGxpbmUgb2Yga2VybmVsLWRv
YyBzaG91bGQgaGF2ZSBhCmJlZ2lubmluZyBhc3RlcmlzazoKICoKCj4+ICAgKiBAcmVsaWFibGU6
IGlmIDAsIGRvY2czIGluIG5vcm1hbCBtb2RlLCBpZiAxIGRvY2czIGluIGZhc3QgbW9kZSwgaWYg
MiBpbgo+PiAgICogICAgICAgICAgICByZWxpYWJsZSBtb2RlCj4+ICAgKiAgICAgICAgICAgIEZh
c3QgbW9kZSBpbXBsaWVzIG1vcmUgZXJyb3JzIHRoYW4gbm9ybWFsIG1vZGUuCj4+ICAgKiAgICAg
ICAgICAgIFJlbGlhYmxlIG1vZGUgaW1wbGllcyB0aGF0IHBhZ2UgMipuIGFuZCAyKm4rMSBhcmUg
Y2xvbmVzLgo+PiArICogQG1heF9ibG9jazogbWF4aW11bSBibG9jayBudW1iZXIgZm9yIHRoaXMg
ZGV2aWNlCj4+ICAgKiBAYmJ0OiBiYWQgYmxvY2sgdGFibGUgY2FjaGUKPj4gICAqIEBvb2Jfd3Jp
dGVfb2ZzOiBvZmZzZXQgb2YgdGhlIE1URCB3aGVyZSB0aGlzIE9PQiBzaG91bGQgYmVsb25nIChp
ZS4gaW4gbmV4dAo+PiAgICogICAgICAgICAgICAgICAgIHBhZ2Vfd3JpdGUpCj4gCj4gVGhhbmtz
LAo+IE1pcXXDqGwKCi0tIAp+UmFuZHkKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
