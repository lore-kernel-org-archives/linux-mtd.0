Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EDFBD59F52
	for <linux-mtd@archiver.kernel.org>; Wed,  6 Nov 2024 16:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ANWokSlJ5oxKu+vNi5j929YKi2YDoIKCjR01h1vUpAI=; b=LJIW6zQFnBagsw
	l7j3uUtbDxoRe7Obycc1sIjENxEbm8AohWKPcJJGrTyAQUvQ8GOOKvpqQVO1qRPC9UXRwx6nmENek
	Nzmn8BsI2OAX9bmr/FEFhHtaUQTGloQNLlvXEsm+JHsuknZXBJuiIWLpCkDPBKBkouoEY3Jbp2I64
	IwL/GHE2PViEPTy6P/u2nQVg5xDeLcNt7kslkpa/574w6IoB9dmg7OltktBDmg0AbuBO4pgybeI7e
	YQHZbEP/Xq2hgbx/bj4t1Oy+SLVRcBXo675g0sJGt6naTwNqSs7L+LH4W7JGg0p9mo9kye+Fdklk7
	0pm7p41yEMaiKynwyM+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8ie0-00000003z5m-38NK;
	Wed, 06 Nov 2024 16:12:32 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8idy-00000003z4J-0z0Y
	for linux-mtd@lists.infradead.org;
	Wed, 06 Nov 2024 16:12:31 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 14A4460005;
	Wed,  6 Nov 2024 16:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730909547;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VbHI5Go0cQBSJCMa+bDHACq+Jn9qnFhUWYRTLUOXoVM=;
	b=GxJBm5uK5iksWp7N5LSPUfKZcCq+hGLQvJgj5t1P2JVy4Bkmx87ijVSBNs73xqrlw4doKf
	VSqvn7RqIYTtmxvRmD98Hfw6H+KMSk4c5yrOlfis1CVrkEG6g9hPkmZoVVOiSLTt2oOsnm
	0yOEKtKYJz2VNCxIVRpqdFGmiFJQxRXiZHAtSILlcLFi9c7QuRgAYR9dFKSTEiZrOJIAcT
	EEJ47hUjsaPtDDqorT5ZP5N6ueVAyBMtKWxG+7gCGIYrAS9twFTRRMxaiDgCmr3edZg58O
	gWKKSbbml3TUiOpMrXVIBufUmGBDgOsS8XASWpKON4ibGpA6G5ZLL0RLYLD4yQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
  "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
  "broonie@kernel.org" <broonie@kernel.org>,
  "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: ubifs_recover_master_node: failed to recover master node
In-Reply-To: <94ffb58b-3242-4ab4-b09a-686116ced781@alliedtelesis.co.nz> (Chris
	Packham's message of "Wed, 30 Oct 2024 10:13:45 +1300")
References: <826c4456-461c-424b-88de-a36e77fd7475@alliedtelesis.co.nz>
	<94ffb58b-3242-4ab4-b09a-686116ced781@alliedtelesis.co.nz>
User-Agent: mu4e 1.12.1; emacs 29.4
Date: Wed, 06 Nov 2024 17:12:26 +0100
Message-ID: <87ses4ibo5.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_081230_600088_AD621316 
X-CRM114-Status: GOOD (  19.95  )
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

CkhpIENocmlzLAoKT24gMzAvMTAvMjAyNCBhdCAxMDoxMzo0NSArMTMsIENocmlzIFBhY2toYW0g
PGNocmlzLnBhY2toYW1AYWxsaWVkdGVsZXNpcy5jby5uej4gd3JvdGU6Cgo+IE9uIDI5LzEwLzI0
IDEzOjM4LCBDaHJpcyBQYWNraGFtIHdyb3RlOgo+PiAocmVzZW5kIGFzIHBsYWludGV4dCkKPj4K
Pj4gSGksCj4+Cj4+IEkgcmVjZW50bHkgYWRkZWQgc3VwcG9ydCBmb3IgdGhlIFNQSS1OQU5EIGNv
bnRyb2xsZXIgb24gdGhlIFJUTDkzMDJDCj4+IFNvQ1sxXS4gSSBkaWQgbW9zdCBvZiB0aGUgd29y
ayBhZ2FpbnN0IExpbnV4IDYuMTEgYW5kIGl0J3Mgd29ya2luZwo+PiBmaW5lIHRoZXJlLiBJIHJl
Y2VudGx5IHJlYmFzZWQgYWdhaW5zdCB0aGUgdGlwIG9mIExpbnVzJ3MgdHJlZQo+PiAoNi4xMi1y
YzUpIGFuZCBmb3VuZCBJIHdhcyBnZXR0aW5nIHViaWZzIGVycm9ycyB3aGVuIG1vdW50aW5nOgo+
Pgo+PiBbwqDCoMKgIDEuMjU1MTkxXSBzcGktbmFuZCBzcGkxLjA6IE1hY3Jvbml4IFNQSSBOQU5E
IHdhcyBmb3VuZC4KPj4gW8KgwqDCoCAxLjI2MTI4M10gc3BpLW5hbmQgc3BpMS4wOiAyNTYgTWlC
LCBibG9jayBzaXplOiAxMjggS2lCLCBwYWdlCj4+IHNpemU6IDIwNDgsIE9PQiBzaXplOiA2NAo+
PiBbwqDCoMKgIDEuMjcxMTM0XSAyIGZpeGVkLXBhcnRpdGlvbnMgcGFydGl0aW9ucyBmb3VuZCBv
biBNVEQgZGV2aWNlIHNwaTEuMAo+PiBbwqDCoMKgIDEuMjc4MjQ3XSBDcmVhdGluZyAyIE1URCBw
YXJ0aXRpb25zIG9uICJzcGkxLjAiOgo+PiBbwqDCoMKgIDEuMjgzNjMxXSAweDAwMDAwMDAwMDAw
MC0weDAwMDAwZjAwMDAwMCA6ICJ1c2VyIgo+PiBbwqDCoCAyMC40ODExMDhdIDB4MDAwMDBmMDAw
MDAwLTB4MDAwMDEwMDAwMDAwIDogIlJlc2VydmVkIgo+PiBbwqDCoCA3Mi4yNDAzNDddIHViaTA6
IHNjYW5uaW5nIGlzIGZpbmlzaGVkCj4+IFvCoMKgIDcyLjI3MDU3N10gdWJpMDogYXR0YWNoZWQg
bXRkMyAobmFtZSAidXNlciIsIHNpemUgMjQwIE1pQikKPj4gW8KgwqAgNzIuMjc2ODE1XSB1Ymkw
OiBQRUIgc2l6ZTogMTMxMDcyIGJ5dGVzICgxMjggS2lCKSwgTEVCIHNpemU6Cj4+IDEyNjk3NiBi
eXRlcwo+PiBbwqDCoCA3Mi4yODQ1MzddIHViaTA6IG1pbi4vbWF4LiBJL08gdW5pdCBzaXplczog
MjA0OC8yMDQ4LCBzdWItcGFnZQo+PiBzaXplIDIwNDgKPj4gW8KgwqAgNzIuMjkyMTMyXSB1Ymkw
OiBWSUQgaGVhZGVyIG9mZnNldDogMjA0OCAoYWxpZ25lZCAyMDQ4KSwgZGF0YQo+PiBvZmZzZXQ6
IDQwOTYKPj4gW8KgwqAgNzIuMjk5ODg1XSB1YmkwOiBnb29kIFBFQnM6IDE5MjAsIGJhZCBQRUJz
OiAwLCBjb3JydXB0ZWQgUEVCczogMAo+PiBbwqDCoCA3Mi4zMDY2ODldIHViaTA6IHVzZXIgdm9s
dW1lOiAxLCBpbnRlcm5hbCB2b2x1bWVzOiAxLCBtYXguIHZvbHVtZXMKPj4gY291bnQ6IDEyOAo+
PiBbwqDCoCA3Mi4zMTQ3NDddIHViaTA6IG1heC9tZWFuIGVyYXNlIGNvdW50ZXI6IDEvMCwgV0wg
dGhyZXNob2xkOiA0MDk2LAo+PiBpbWFnZSBzZXF1ZW5jZSBudW1iZXI6IDI1MjY0MjIzMAo+PiBb
wqDCoCA3Mi4zMjQ4NTBdIHViaTA6IGF2YWlsYWJsZSBQRUJzOiAwLCB0b3RhbCByZXNlcnZlZCBQ
RUJzOiAxOTIwLAo+PiBQRUJzIHJlc2VydmVkIGZvciBiYWQgUEVCIGhhbmRsaW5nOiA0MAo+PiBb
wqDCoCA3Mi4zNzAxMjNdIHViaTA6IGJhY2tncm91bmQgdGhyZWFkICJ1YmlfYmd0MGQiIHN0YXJ0
ZWQsIFBJRCAxNDEKPj4gW8KgwqAgNzIuNDcwNzQwXSBVQklGUyAodWJpMDowKTogTW91bnRpbmcg
aW4gdW5hdXRoZW50aWNhdGVkIG1vZGUKPj4gW8KgwqAgNzIuNDkwMjQ2XSBVQklGUyAodWJpMDow
KTogYmFja2dyb3VuZCB0aHJlYWQgInViaWZzX2JndDBfMCIKPj4gc3RhcnRlZCwgUElEIDE0NAo+
PiBbwqDCoCA3Mi41MjgyNzJdIFVCSUZTIGVycm9yICh1YmkwOjAgcGlkIDE0Myk6Cj4+IHViaWZz
X3JlY292ZXJfbWFzdGVyX25vZGU6IGZhaWxlZCB0byByZWNvdmVyIG1hc3RlciBub2RlCj4+IFvC
oMKgIDcyLjU1MDEyMl0gVUJJRlMgKHViaTA6MCk6IGJhY2tncm91bmQgdGhyZWFkICJ1Ymlmc19i
Z3QwXzAiIHN0b3BzCj4+IFvCoMKgIDcyLjcxMDcyMF0gVUJJRlMgKHViaTA6MCk6IE1vdW50aW5n
IGluIHVuYXV0aGVudGljYXRlZCBtb2RlCj4+IFvCoMKgIDcyLjcxNzQ0N10gVUJJRlMgKHViaTA6
MCk6IGJhY2tncm91bmQgdGhyZWFkICJ1Ymlmc19iZ3QwXzAiCj4+IHN0YXJ0ZWQsIFBJRCAxNDkK
Pj4gW8KgwqAgNzIuNzc3NjAyXSBVQklGUyBlcnJvciAodWJpMDowIHBpZCAxNDgpOgo+PiB1Ymlm
c19yZWNvdmVyX21hc3Rlcl9ub2RlOiBmYWlsZWQgdG8gcmVjb3ZlciBtYXN0ZXIgbm9kZQo+PiBb
wqDCoCA3Mi43ODc3OTJdIFVCSUZTICh1YmkwOjApOiBiYWNrZ3JvdW5kIHRocmVhZCAidWJpZnNf
Ymd0MF8wIiBzdG9wcwo+Pgo+PiBGdWxsIGRtZXNnIG91dHB1dCBpcyBhdFsyXQo+Pgo+PiBnaXQg
YmlzZWN0IGxlYWQgbWUgdG8gY29tbWl0IDExODEzODU3ODY0ZiAoIm10ZDogc3BpLW5hbmQ6IG1h
Y3Jvbml4Ogo+PiBDb250aW51b3VzIHJlYWQgc3VwcG9ydCIpLiBSZXZlcnRpbmcgdGhlIGJsYW1l
ZCBjb21taXQgZnJvbSA2LjEyLXJjNQo+PiBzZWVtcyB0byBhdm9pZCB0aGUgcHJvYmxlbS4gVGhl
IGZsYXNoIGNoaXAgb24gbXkgYm9hcmQgaXMgYQo+PiBNWDMwTEYyRzI4QUQtVEkuIEknbSBub3Qg
c3VyZSBpZiB0aGVyZSBpcyBhIHByb2JsZW0gd2l0aCAxMTgxMzg1Nzg2NGYKPj4gb3Igd2l0aCBt
eSBzcGktbWVtIGRyaXZlciB0aGF0IGlzIGV4cG9zZWQgYWZ0ZXIgc3VwcG9ydCBmb3IgY29udGlu
dW91cwo+PiByZWFkIGlzIGVuYWJsZWQuCj4+Cj4gQSBiaXQgb2YgYW4gdXBkYXRlLiBUaGUgdWJp
ZnMgZmFpbHVyZSBpcyBmcm9tIHRoZSBpc19lbXB0eSgpIGNoZWNrIGluCj4gZ2V0X21hc3Rlcl9u
b2RlKCkuIEl0IGxvb2tzIGxpa2UgcG9ydGlvbnMgb2YgdGhlIExFQiBhcmUgMCBpbnN0ZWFkIG9m
Cj4gMHhmZi4gSSd2ZSBhbHNvIGZvdW5kIGlmIEkgYXZvaWQgdXNlIHRoZSBub24tRE1BIHBhdGgg
aW4gbXkgZHJpdmVyIEkKPiBkb24ndCBoYXZlIHN1Y2ggYSBwcm9ibGVtLiBJIHRoaW5rIHRoZXJl
IGlzIGF0IGxlYXN0IG9uZSBwcm9ibGVtIGluIG15Cj4gZHJpdmVyIGJlY2F1c2UgSSBkb24ndCBo
YW5kbGUgRE1BaW5nIG1vcmUgdGhhbiAweGZmZmYgYnl0ZXMuCgpJIGFtIGdvaW5nIHRocm91Z2gg
bXkgbWFpbHMgaW4gYSBjaHJvbm9sb2dpY2FsIG9yZGVyIDotKQoKR2xhZCB0byBzZWUgeW91IGZv
dW5kIGEgbGVhZC4gSSB3YXMgYWxyZWFkeSBhIGJpdCBzdXNwaWNpb3VzIGFib3V0IHRoZQpETUEg
cGF0aCwgZ2xhZCB0byBzZWUgd2UgbWlnaHQgbmFycm93IGRvd24gdGhlIHByb2JsZW0uCgpJcyB0
aGUgMHhmZmZmIGxpbWl0YXRpb24gYSBoYXJkIGNvbnN0cmFpbnQgb3IgaXMgaXQganVzdCBhIHB1
cmUgc29mdHdhcmUKY29uc3RyYWludD8gSWYgd2UgcmVhY2ggYSBoYXJkIGNvbnN0cmFpbnQsIG1h
eWJlIHlvdSBzaG91bGQgY2hlY2sgdGhhdAp3aGVuIHlvdSBkZWNpZGUgd2hpY2ggcGF0aCB5b3Ug
dGFrZS4KCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
