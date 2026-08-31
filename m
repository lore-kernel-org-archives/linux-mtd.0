Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A08AC624A5
	for <linux-mtd@archiver.kernel.org>; Mon, 31 Aug 2026 07:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bZ9ojcuN5kMu2xrFbRR2BkU6/utVOpZflBcJi1Xwu+o=; b=2rYjeseFmckpJ1
	3qU3x/R0zE+yIXIgUCbsmCcfu5xsVRwogAt5H3Fw6YBqaTYhYl/sACWApLvteXFZrAoyW50lqWYbB
	CxjbIDed6unmrNMl15W32XWQie7qT1iR5BRL3Lrv/HBc482LoZod3lpfle9qd4Mfvd8pibNgIyrbn
	IBwGfydNX7ntaNAbZXhS7rZmpmHnBJjvfjaOB0P0EWp1Wom4Xwv1F1N6d36jy1AcqKnH5ri1cY2VU
	LinpKcM95xiqZcFnD0Bxv+3IHRX/I6Z4Ju6W0RqBuzpzNaUdqxBWLlqOb3+HhV9nc9KUw5XazAxfY
	X1+UD/aVxVgzfoPD41zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0wuY-00000008m73-0UXV;
	Mon, 31 Aug 2026 07:58:34 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0wuV-00000008m63-34MV
	for linux-mtd@lists.infradead.org;
	Mon, 31 Aug 2026 07:58:33 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id E7CF71A18E2;
	Mon, 31 Aug 2026 07:58:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B0402601E1;
	Mon, 31 Aug 2026 07:58:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 105B611C78A49;
	Mon, 31 Aug 2026 09:58:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788163103; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=6VS9OukhDHvRVzwm93zgb5rouKPCZo0HPtpOPRmhdLk=;
	b=v00XwBUuYsXjS0hTypk0UzN1sZBpQmBAva1i/EA6PSYqSbN2/057iAcEIqkGug25ImYD6Q
	taa8ADbooE41B94CWGlf6kONQWrSN7al1SXG2ec2TeVwH95O+xDJoIAao+rY7YhcnOCxuw
	4Qfq/SqWloqgPq2tNoOgYSEUnmTcw7KtseRaZm1dwSt7ERzxpk5HDg55jbD8xlO7pvptjB
	x2eiMKuVPq8l3QINNrI6mOd8Z856HnW9/2VqhMl0T8SzzcLvCrWkwCgLA6IyL+Y3kSfthp
	0G6t5t6yot2q0ly2o6LasCX7Pop/TcLTGlbRcyKIy493Vq7tGLT0cNyB4+f/Aw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mehmet Fide <mehmet.fide@gmail.com>
Cc: Stefan Agner <stefan@agner.ch>,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>,  Boris Brezillon
 <bbrezillon@kernel.org>,  Frieder Schrempf <frieder.schrempf@kontron.de>,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] mtd: rawnand: vf610_nfc: fix false bitflips on
 reads of erased pages
In-Reply-To: <20260828085337.3916199-3-mehmet.fide@gmail.com> (Mehmet Fide's
	message of "Fri, 28 Aug 2026 10:53:37 +0200")
References: <20260828085337.3916199-1-mehmet.fide@gmail.com>
	<20260828085337.3916199-3-mehmet.fide@gmail.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Mon, 31 Aug 2026 09:58:19 +0200
Message-ID: <871pbed8mc.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_005831_915375_924DBBFD 
X-CRM114-Status: GOOD (  27.63  )
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

SGkgTWVobWV0LAoKT24gMjgvMDgvMjAyNiBhdCAxMDo1MzozNyArMDIsIE1laG1ldCBGaWRlIDxt
ZWhtZXQuZmlkZUBnbWFpbC5jb20+IHdyb3RlOgoKPiBGcm9tOiBNZWhtZXQgRmlkZSA8bWVobWV0
LmZpZGVAc2NyZWVuaW5nZWFnbGUuY29tPgo+Cj4gV2hlbiB0aGUgRUNDIGVuZ2luZSBmYWlscyB0
byBkZWNvZGUgYSBwYWdlLCB0aGUgZHJpdmVyIHJlLXJlYWRzIHRoZSBPT0IKPiBhcmVhIHdpdGgg
dGhlIGVuZ2luZSBieXBhc3NlZCwgYnV0IHJ1bnMgdGhlIGVyYXNlZC1wYWdlIGNoZWNrIGZvciB0
aGUKPiBkYXRhIGFyZWEgb24gdGhlIGJ1ZmZlciBsZWZ0IGluIHRoZSBjb250cm9sbGVyIFNSQU0g
YnkgdGhlIGZhaWxlZAo+IHRyYW5zZmVyLgo+Cj4gVGhhdCBidWZmZXIgZG9lcyBub3QgaG9sZCB3
aGF0IGlzIG9uIHRoZSBmbGFzaDogdGhlIGZhaWxpbmcgZW5naW5lCj4gd3JpdGVzIGEgYm9ndXMg
c2luZ2xlLWJpdCAiY29ycmVjdGlvbiIgaW50byBpdC4gSW4gdGhlIDYwLWJ5dGUgRUNDIG1vZGUK
PiB0aGUgYWxsLTB4ZmYgY29udGVudCBvZiBhbiBlcmFzZWQgcGFnZSBhbHdheXMgZGVjb2RlcyB0
byB0aGUgc2FtZSBlcnJvcgo+IGxvY2F0aW9uLCBzbyBldmVyeSBlcmFzZWQgcGFnZSBzaG93cyBv
bmUgc3RhbGUgemVybyBiaXQgYXQgZGF0YSBvZmZzZXQKPiAweDVGRCwgd2hpY2ggdGhlIGVyYXNl
ZC1wYWdlIGNoZWNrIHRoZW4gcmVwb3J0cyBhcyBhIGNvcnJlY3RlZCBiaXRmbGlwLgo+Cj4gRWR3
YXJkIEthcnBpY3ogZGlzY292ZXJlZCB0aGlzIGJlaGF2aW91ciBhbmQgaWRlbnRpZmllZCB0aGUg
b2Zmc2V0IG9uIGEKPiBDb2xpYnJpIFZGNjE7IHRoZSBhbmFseXNpcyBhbmQgdGhlIGZpeCBidWls
ZCBvbiBoaXMgZmluZGluZy4gTWVhc3VyZWQKPiB3aXRoIGFuIGluc3RydW1lbnRlZCBkcml2ZXIg
b24gYSBDb2xpYnJpIFZGNTAgKE1YMzBMRjFHMThBQywgMzItYml0Cj4gRUNDKTogcmVhZGluZyBh
IDEyNiBNaUIgcGFydGl0aW9uIHdpdGggbmFuZGR1bXAgaW5jcmVhc2VkIHRoZSBjb3JyZWN0ZWQK
PiBjb3VudGVyIGJ5IDE4MDM1LCBleGFjdGx5IG9uZSBwZXIgZXJhc2VkIHBhZ2UsIHdoaWxlIHJh
dyByZWFkcyBvZiB0aGUKPiBzYW1lIHBhZ2VzIHJldHVybiBjbGVhbiAweGZmLiBBIHY0LjQga2Vy
bmVsIG9uIHRoZSBWRjYxIChNWDMwTEY0RzI4QUMpCj4gYWNjdW11bGF0ZXMgdGhlIHNhbWUgZmFs
c2UgY291bnRzLCBzbyB0aGUgYmVoYXZpb3VyIGZvbGxvd3MgdGhlCj4gY29udHJvbGxlciByYXRo
ZXIgdGhhbiB0aGUgY2hpcCBvciB0aGUgZHJpdmVyIGdlbmVyYXRpb24uIE5laXRoZXIgdGhlCj4g
VnlicmlkIHJlZmVyZW5jZSBtYW51YWwgbm9yIHRoZSBwdWJsaXNoZWQgbWFzayBzZXQgZXJyYXRh
IChWRlhYWF8yTjAyRykKPiBkb2N1bWVudCBpdC4gVGhlIDQ1LWJ5dGUgRUNDIG1vZGUgaXMgbm90
IGFmZmVjdGVkLgo+Cj4gUmVzdG9yaW5nIHRoZSBrbm93biBieXRlIGlzIG5vdCBlbm91Z2g6IG9u
IHBhZ2VzIHRoYXQgZmFpbCB0byBkZWNvZGUKPiB3aXRoIGNvbnRlbnQgb3RoZXIgdGhhbiBhbGwt
MHhmZiB0aGUgZW5naW5lIHdyaXRlcyBpdHMgY29ycmVjdGlvbgo+IHdoZXJldmVyIHRoZSBzeW5k
cm9tZSBwb2ludHMgKG1lYXN1cmVkIGF0IGEgZGlmZmVyZW50IG9mZnNldCBvbiBzdWNoIGEKPiBw
YWdlKSwgc28gdGhlIGNoZWNrIGhhcyB0byBydW4gb24gd2hhdCB0aGUgZmxhc2ggaG9sZHMuIFJl
LXJlYWQgdGhlIGRhdGEKPiBhcmVhIHdpdGggdGhlIEVDQyBlbmdpbmUgYnlwYXNzZWQsIGV4YWN0
bHkgYXMgYWxyZWFkeSBkb25lIGZvciB0aGUgT09CCj4gYXJlYS4gVGhlIGNvcnJlY3RlZCBjb3Vu
dGVyIHRoZW4gc3RheXMgYXQgemVybyBvbiBib3RoIGJvYXJkcy4KPgo+IFJlcG9ydGVkLWJ5OiBF
ZHdhcmQgS2FycGljeiA8d2VibWFzdGVyQHRvcmFkZXguY29tPgo+IExpbms6IGh0dHBzOi8vY29t
bXVuaXR5LnRvcmFkZXguY29tL3QvY29saWJyaS12ZjUwLXZmNjEtb24tdGhlLWN1cnJlbnQtYnNw
LW1haW5saW5lLXUtYm9vdC12MjAyNi0wNy1hbmQtbGludXgtNi0xOC1sdHMvMzA3MzUKPiBTaWdu
ZWQtb2ZmLWJ5OiBNZWhtZXQgRmlkZSA8bWVobWV0LmZpZGVAc2NyZWVuaW5nZWFnbGUuY29tPgo+
IC0tLQo+IHYyOgo+ICAtIHRoZSBuby1FQ0MgcmUtcmVhZCBhbmQgdGhlIGVyYXNlZC1wYWdlIGNo
ZWNrIHVzZSB0aGUgY2xhbXBlZCBzcGFyZQo+ICAgIHNpemUgaW5zdGVhZCBvZiBtdGQtPm9vYnNp
emUKPiAgLSBjb25kZW5zZSB0aGUgcmUtcmVhZCBjb21tZW50IHRvIG9uZSBsaW5lCj4gIC0gUmVw
b3J0ZWQtYnkvTGluayB0cmFpbGVyIG9yZGVyIGZpeGVkIChjaGVja3BhdGNoKQo+Cj4gIGRyaXZl
cnMvbXRkL25hbmQvcmF3L3ZmNjEwX25mYy5jIHwgOSArKysrKysrKy0KPiAgMSBmaWxlIGNoYW5n
ZWQsIDggaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvbXRkL25hbmQvcmF3L3ZmNjEwX25mYy5jIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvdmY2MTBf
bmZjLmMKPiBpbmRleCA5MTA0ZGIxOWRkMjkuLmZmY2Y2NmY5NmM3ZiAxMDA2NDQKPiAtLS0gYS9k
cml2ZXJzL210ZC9uYW5kL3Jhdy92ZjYxMF9uZmMuYwo+ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQv
cmF3L3ZmNjEwX25mYy5jCj4gQEAgLTUyMCw2ICs1MjAsNyBAQCBzdGF0aWMgaW5saW5lIGludCB2
ZjYxMF9uZmNfY29ycmVjdF9kYXRhKHN0cnVjdCBuYW5kX2NoaXAgKmNoaXAsIHVpbnQ4X3QgKmRh
dCwKPiAgCXU4IGVjY19zdGF0dXM7Cj4gIAl1OCBlY2NfY291bnQ7Cj4gIAlpbnQgZmxpcHNfdGhy
ZXNob2xkID0gbmZjLT5jaGlwLmVjYy5zdHJlbmd0aCAvIDI7Cj4gKwlpbnQgcmV0Owo+ICAKPiAg
CWVjY19zdGF0dXMgPSB2ZjYxMF9uZmNfcmVhZChuZmMsIGVjY19zdGF0dXNfb2ZmKSAmIDB4ZmY7
Cj4gIAllY2NfY291bnQgPSBlY2Nfc3RhdHVzICYgRUNDX1NUQVRVU19FUlJfQ09VTlQ7Cj4gQEAg
LTUyNyw5ICs1MjgsMTUgQEAgc3RhdGljIGlubGluZSBpbnQgdmY2MTBfbmZjX2NvcnJlY3RfZGF0
YShzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwLCB1aW50OF90ICpkYXQsCj4gIAlpZiAoIShlY2Nfc3Rh
dHVzICYgRUNDX1NUQVRVU19NQVNLKSkKPiAgCQlyZXR1cm4gZWNjX2NvdW50Owo+ICAKPiArCS8q
IFRoZSBmYWlsZWQgZGVjb2RlIGxlYXZlcyBhIGJvZ3VzIGNvcnJlY3Rpb24gaW4gU1JBTTsgcmUt
cmVhZCB3aXRob3V0IEVDQyAqLwo+ICAJbmZjLT5kYXRhX2FjY2VzcyA9IHRydWU7Cj4gLQluYW5k
X3JlYWRfb29iX29wKCZuZmMtPmNoaXAsIHBhZ2UsIDAsIG9vYiwgdmY2MTBfbmZjX3NwYXJlX3Np
emUobXRkKSk7Cj4gKwlyZXQgPSBuYW5kX3JlYWRfcGFnZV9vcCgmbmZjLT5jaGlwLCBwYWdlLCAw
LCBkYXQsCj4gbmZjLT5jaGlwLmVjYy5zaXplKTsKCmNoaXAuZWNjLnNpemUgaXMgbm90IGNvdmVy
aW5nIHRoZSB3aG9sZSBkYXRhIGJ1ZmZlci4gWW91IHNob3VsZCBiZQpyZWFkaW5nIG10ZC0+d3Jp
dGVzaXplICsgbXRkLT5vb2JzaXplLCBubz8gT3RoZXJ3aXNlIHlvdSBvbmx5IG92ZXJ3cml0ZQp0
aGUgZmlyc3QgRUNDIHN0ZXAgKG91dCBvZiAyLzQvOCBkZXBlbmRpbmcgb24gdGhlIGNvbmZpZ3Vy
YXRpb24gb2YKdGhlIEVDQyBlbmdpbmUpLgoKPiArCWlmICghcmV0KQo+ICsJCXJldCA9IG5hbmRf
cmVhZF9vb2Jfb3AoJm5mYy0+Y2hpcCwgcGFnZSwgMCwgb29iLAo+ICsJCQkJICAgICAgIHZmNjEw
X25mY19zcGFyZV9zaXplKG10ZCkpOwo+ICAJbmZjLT5kYXRhX2FjY2VzcyA9IGZhbHNlOwo+ICsJ
aWYgKHJldCkKPiArCQlyZXR1cm4gcmV0Owo+ICAKPiAgCS8qCj4gIAkgKiBPbiBhbiBlcmFzZWQg
cGFnZSwgYml0IGNvdW50IChpbmNsdWRpbmcgT09CKSBzaG91bGQgYmUgemVybwo+ICAJb3IKClVu
cmVsYXRlZCwgYnV0IHRoaXMgY29tbWVudCBpcyB3cm9uZywgd2UgYWNjZXB0IHVwIHRvIDxzdHJl
bmd0aD4KYml0ZmxpcHMuIE5vdCBhIGJpZyBkZWFsIHRob3VnaCwgdGhlIGltcGFjdCBpcyB2ZXJ5
IGxpbWl0ZWQuCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxp
c3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQv
Cg==
