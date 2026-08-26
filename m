Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26FBBC5DF97
	for <linux-mtd@archiver.kernel.org>; Wed, 26 Aug 2026 13:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vAp/Xr0hB22ieaY5vwk7R+6iUe3zSRfctBItJhTK4Xo=; b=iUl6bdEFndoaq0
	CBuWEJyhMiYVjVFz40Q1lSUDWceZLhjg+aRxuGe8SfV4WSlLz6SHoK/ELsLGGccAPa0up1fsGU0QA
	1an9pQQHVkxDGSgc1VWIb7Ce4Qxhogg18oGOGHbG04STnQzROyP7iCqdR8ZI4uR+KZp+oU447bHBu
	D2fA+nVZ+MmV4fhgvExFuIazNiaYEHI3mDAc+k3lAQ4IrOES/+8NtieyQ/BSidSEkWfPgQ+bASqPw
	NA6y4OfGKtiJpN4Xl1bq2bN97i37mLYf6ij7nDsCtUXgcprpg+Vhu1bYtf4o5crOFjAKSbxL0vzeO
	r5v69LUct4QcbPFFJatw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzDMW-00000002U3P-23ll;
	Wed, 26 Aug 2026 13:08:16 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzDMT-00000002U2V-3iVr
	for linux-mtd@lists.infradead.org;
	Wed, 26 Aug 2026 13:08:15 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 740871A183E;
	Wed, 26 Aug 2026 13:08:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4827D604EC;
	Wed, 26 Aug 2026 13:08:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CB79011C78168;
	Wed, 26 Aug 2026 15:08:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787749684; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Gl0A6nv0UKopxLJJ2P0yKQzTeyc2eqLQfvtiThSJ35w=;
	b=rgW3UWylTUDNg4qU4i3FkZBvHmlSoO6x1lB4tlDj5Mnh+tPPzWuMeuh5ql1cojX2+o4gcL
	vUMHMzeYr5qm+GsVAPBcPgQF7lbCMPa0ICm3eHVlIZnE004300sDshpiKSPXZrfMHzCb2z
	aix7QV9Sp/3aLoeiPS5TBZyr45kIkHaxoCCob5uH2LnG/yHUVPLmO+0oSsu2XOZ35W7wk+
	D42N7jSJXUrsd+X/cz8C2zGw6oK30IEFeZ2kfc6Ae6AArXz91CXHFig4g2jbZuSFKd6sqe
	onSVYfbwF36kNZbhl6NSH4+vPavPcQywceKTjZIkdWRfTDlS90h+NBLEnWiIwA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Dominique Martinet <dominique.martinet@atmark-techno.com>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC] mtd: spinand: winbond: enable continuous read for
 W25N04LW
In-Reply-To: <ao6r15CbIMQZZWTB@atmark-techno.com> (Dominique Martinet's
	message of "Wed, 26 Aug 2026 18:03:19 +0900")
References: <20260814-w25n04lw-contread-v1-1-2968b07c962d@atmark-techno.com>
	<871pbmk1ma.fsf@bootlin.com> <ao6r15CbIMQZZWTB@atmark-techno.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Wed, 26 Aug 2026 15:08:02 +0200
Message-ID: <87ik4xf2rx.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260826_060814_089822_C0AB9362 
X-CRM114-Status: GOOD (  23.45  )
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

SGkgRG9taW5pcXVlLAoKPj4gPiBGdW4gZmFjdDoKPj4gPiBuYW5kZHVtcCAtQyBpcyBhYm91dCA5
JSBmYXN0ZXIgdGhhbiBuYW5kZHVtcCBvbiBsYXJnZSBkYXRhICh0cmllZCAxME1CKQo+PiA+IGV2
ZW4gaWYgY29udGludW91cyByZWFkIGlzIG5vdCBzdXBwb3J0ZWQuCj4+IAo+PiBUaGF0IGlzIHN0
cmFuZ2UuIElzIHRoaXMgcmVhbGx5IHJlcHJvZHVjaWJsZT8gQ2FuIHlvdSBkaXNhYmxlIENQVSBQ
TSBhbmQKPj4gdHJ5IGFnYWluPyBUaGVyZSBzaG91bGQgYmUgbm8gaW1wYWN0IGlmIGNvbnRpbnVv
dXMgcmVhZCBpcyBkaXNhYmxlZC4KPgo+IFRoaXMgc3lzdGVtIGhhcyBubyBrbm9iIHRoYXQgSSdt
IGF3YXJlIG9mIChubyBjcHVmcmVxIGluCj4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUgYXQgbGVh
c3QpLCBidXQgSSd2ZSBzaG92ZWQgdGhlIElSUXMgYXNpZGUgZXhjZXB0Cj4gZm9yIHRoZSBzcGkg
b25lcyBhbmQgaXQgYXBwZWFycyBwcmV0dHkgc3RhYmxlIChtdGQxIGlzIGEgOE1CIHBhcnRpdGlv
bikKPgo+IC0tLS0tLQo+IGxvY2FsaG9zdDovbW50L210ZC11dGlscyMgdGFza3NldCAtYyAxIGh5
cGVyZmluZSAtLXdhcm11cCAzIC1yIDIwICAnLi9uYW5kZHVtcCAtZiAvZGV2L251bGwgL2Rldi9t
dGQxJyAnLi9uYW5kZHVtcCAtQyAtCj4gZiAvZGV2L251bGwgL2Rldi9tdGQxJwo+IEJlbmNobWFy
ayAxOiAuL25hbmRkdW1wIC1mIC9kZXYvbnVsbCAvZGV2L210ZDEKPiAgIFRpbWUgKG1lYW4gwrEg
z4MpOiAgICAgNTExLjEgbXMgwrEgICAwLjUgbXMgICAgW1VzZXI6IDcuOCBtcywgU3lzdGVtOiA0
MTkuOCBtc10KPiAgIFJhbmdlIChtaW4g4oCmIG1heCk6ICAgNTEwLjQgbXMg4oCmIDUxMi4wIG1z
ICAgIDIwIHJ1bnMKPiAgCj4gQmVuY2htYXJrIDI6IC4vbmFuZGR1bXAgLUMgLWYgL2Rldi9udWxs
IC9kZXYvbXRkMQo+ICAgVGltZSAobWVhbiDCsSDPgyk6ICAgICA0ODAuOSBtcyDCsSAgIDAuOSBt
cyAgICBbVXNlcjogMC41IG1zLCBTeXN0ZW06IDM5OS42IG1zXQo+ICAgUmFuZ2UgKG1pbiDigKYg
bWF4KTogICA0ODAuMSBtcyDigKYgNDgzLjMgbXMgICAgMjAgcnVucwo+ICAKPiAgIFdhcm5pbmc6
IFN0YXRpc3RpY2FsIG91dGxpZXJzIHdlcmUgZGV0ZWN0ZWQuIENvbnNpZGVyIHJlLXJ1bm5pbmcg
dGhpcyBiZW5jaG1hcmsgb24gYSBxdWlldCBzeXN0ZW0gd2l0aG91dCBhbnkgaW50ZXJmZXJlbmNl
cyBmcm9tIG90aGVyIHByb2dyYW1zLiBJdCBtaWdodCBoZWxwIHRvIHVzZSB0aGUgJy0td2FybXVw
JyBvciAnLS1wcmVwYXJlJyBvcHRpb25zLgo+ICAKPiBTdW1tYXJ5Cj4gICAuL25hbmRkdW1wIC1D
IC1mIC9kZXYvbnVsbCAvZGV2L210ZDEgcmFuCj4gICAgIDEuMDYgwrEgMC4wMCB0aW1lcyBmYXN0
ZXIgdGhhbiAuL25hbmRkdW1wIC1mIC9kZXYvbnVsbCAvZGV2L210ZDEKPiAtLS0tLS0KPiAodGhp
cyBpcyBvbiBvdXIgNi4xMiB0cmVlIGFuZCBub3Qgb24gdGhlIDcuMi1yYyBJIHdhcyBvbiBlYXJs
aWVyLCBzbwo+IHltbXYsIGJ1dCBpaXJjIHRoZSA5JSBmaWd1cmUgd2FzIHRha2VuIG9uIDcuMiB3
aXRoIGh5cGVyZmluZSBzbyB0aGlzCj4gc2hvdWxkIGJlIHJlcHJvZHVjaWJsZSB3aXRoIHRoZSBs
YXRlc3QgYW5kIGdyZWF0ZXN0KQoKTm8gYmlnIGNoYW5nZSBpcyBleHBlY3RlZCBiZXR3ZWVuIHRo
b3NlIHZlcnNpb25zLCBleGNlcHQgcG9zc2libGUKKGltcG9ydGFudCkgZml4ZXMuIE1ha2Ugc3Vy
ZSB5b3UgaGF2ZSB0aGVtLgoKPiBJIGhhdmUgbXVjaCBtb3JlIGltcG9ydGFudCB0aGluZ3MgdG8g
ZG8gc28gSSBvYnZpb3VzbHkgaGFkIHRvIGxvb2sKPiBmdXJ0aGVyIGludG8gdGhpcyBteXN0ZXJ5
IDotKSwgYnV0IEkgZGlkbid0IHNlZSBhbnl0aGluZyBvYnZpb3VzLi4uCgo6LSkKCj4gRm9yIHNv
bWUgcmVhc29uIHRoZSBjb250aWd1b3VzIHJlYWQgdmFyaWFudCBzZWVtcyB0byBzcGVuZCBsZXNz
IHRpbWUgaW4KPiBzcGluYW5kX3dhaXQoKSBiZXR3ZWVuIHRoZSBsb2FkIHBhZ2UgYW5kIHJlYWQg
ZnJvbSBjYWNoZSBvcCAobG9va2luZyBhdAo+IGEgZmxhbWVncmFwaCksIGJ1dCBkdW1waW5nIHRo
ZSBhY3R1YWwgb3BzIHVzZWQgSSBzZWUgdmVyeSBzaW1pbGFyCj4gc2VxdWVuY2VzIG9mIGxvYWQg
cGFnZSAoMHgxMyksIHBvbGwgc3RhdHVzICgweGYpLCBkaXJtYXBfcmVhZCAoMHhlYiksCj4gc28g
dGhhdCBkb2Vzbid0IGV4cGxhaW4gdGhlIGRpZmZlcmVuY2UuLi4KCkkgZG8gbm90IHVuZGVyc3Rh
bmQgd2h5LiBEaWQgeW91IGNvbXBhcmUgdGhlIG91dHB1dD8gRG8geW91IGdldCB0aGUgc2FtZQpj
b3JyZWN0IGRhdGEgaW4gYm90aCBjYXNlcz8KCk1heWJlIHRoZXJlIGlzIHNvbWUga2luZCBvZiBy
dW50aW1lIFBNIGdldHRpbmcgaW4gdGhlIHdheT8KCj4gVGhlIG1haW4gZGlmZmVyZW5jZSBJIHNl
ZSBpcyB0aGF0IG5hbmRkdW1wIC1DIHBhc3NlcyBhIG11Y2ggbGFyZ2VyCj4gYnVmZmVyIHRvIHJl
YWQgKG9ic2VydmFibGUgd2l0aCBzdHJhY2UgLWMpLCBzbyBsb29wcyBmb3IgcmVhZGluZyBpbnNp
ZGUKPiB0aGUga2VybmVsLCBhbmQgd2l0aG91dCAtQyBsb29wcyBpbiB1c2Vyc3BhY2U6IEkgZG8g
bm90IHNlZSB0aGUgc3lzY2FsbAo+IG92ZXJoZWFkIGluIG15IHBlcmYgcmVjb3JkIGZsYW1lZ3Jh
cGggYnV0IHBlcmhhcHMgdGhhdCBjaGFuZ2VzIHRoZQo+IHRpbWluZyBqdXN0IGVub3VnaCBmb3Ig
dGhlIG5hbmQgdG8gYmVoYXZlIGRpZmZlcmVudGx5IG9yIHNvbWV0aGluZyBsaWtlCj4gdGhhdD8K
CldoaWxlIG5hbmRkdW1wIC1DIGlzIG5pY2UsIGFzIHlvdSBzYWlkIGl0IGJlaGF2ZXMgZGlmZmVy
ZW50bHkuIEkgd291bGQKaW5zdGVhZCBzdWdnZXN0IHRvIHJ1biBmbGFzaF9zcGVlZCB3aGljaCBo
YXMgYSBjb250aW51b3VzIHJlYWQKb3B0aW9uLiBZb3Ugc2hvdWxkIG9ic2VydmUgbm8gZGlmZmVy
ZW5jZSBiZXR3ZWVuIHRoZSBkaWZmZXJlbnQgcnVucy4KClRoZW4geW91IGNhbiBoYWNrIGludG8g
dGhlIGNvcmUsIGVuYWJsZSBjb250aW51b3VzIHJlYWRzIGRlc3BpdGUgdGhlIHVzZQpvZiBkaXJt
YXBzIChhcyBhIGhhY2spIGFuZCB0aGVuIG9ic2VydmUgYSBkaWZmZXJlbmNlLiBZb3UgbWF5IG9y
IG1heSBub3QKZ2V0IGNvcnJlY3QgZGF0YSBkZXBlbmRpbmcgb24gd2hldGhlciB0aGUgY29udHJv
bGxlciBtYXkgZGVhc3NlcnQgdGhlCkNTLCBidXQgd2UgaGF2ZSBubyBjb250cm9sIG92ZXIgdGhp
cywgYnV0IHRoYXQgZG9lc24ndCBtYXR0ZXIgbXVjaCBmb3IKdGhlIGN1cnJlbnQgaW52ZXN0aWdh
dGlvbi4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
