Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B57E2606A320
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Nov 2026 17:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YHsvJcyR;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=ubvuxvkU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ZVZSWLvFuYtSmHzCoIgL/066IfQ5DbTnmOiHD2Ry3uA=; b=YHsvJcyRb+ly/Th2cfzLBw/9T/
	YWedFaU/lEUOkpJ7ED5Ggg817hAtQTfFZQ6q/ADECJiQjb+O0c2S9yV0jnwe72G1X9cP7x3Lyeo0Q
	CWrbQJJlBNm4AKR44Xn75TuE7pUlaR1n2zFuqw7peM/N101lAIrEhk+90IuLY2d5aZ+E/QjgZ44aC
	bs5Ahk/TG2NQjoDajsMZdK0FduIyj7saOA1NBEp/XZaarYPgKTq2q9bJa9B6kybKMxdbstfyFShIG
	NTaawpDoI6sgEvNPtnKsehs2J7N6uvjC0UiRssmyXjvlA8CoqD0VRH8sxRgJQkNgnUjU8dBvUHu7C
	ckP9w/iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTjGY-00000009kJ4-0XRL;
	Wed, 18 Nov 2026 17:16:14 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTjGT-00000009kIF-0kBA
	for linux-mtd@lists.infradead.org;
	Wed, 18 Nov 2026 17:16:10 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 597A24E40B00;
	Wed, 18 Nov 2026 17:16:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 231C45FE9B;
	Wed, 18 Nov 2026 17:16:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2FFA211BC2A6E;
	Wed, 18 Nov 2026 18:15:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795022162; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=azMjNdYADYprUFTQqXnXRt+Qw7yDyykdEbBxtGqlwkg=;
	b=ubvuxvkUmYhT7rBjFh7+hL3MGn/EZTSrIeC279f/6wUx9rBSNHIkKD93l+HtgnF9zbyz+y
	h6gOmUC7+Cng+BsfY5/UUGXD7EgAVR8ZqQQAloAd08tRmnrDbKC/M1k/IT8K1kR2OOYH2P
	LcBDhHqO+iX8XxgIBsRhlMg/vSQ1WTp9JtnZIFJy/tfCTx9S10g/gqVNytFIzTbWAL4Ej6
	qn6coN94CLK3MSHKKGXt8gol9lLe0ITQAUFMmHo65hANA5yssndwfrVd0tSvXGwKr+GLPa
	u/P8XV6IyRzU+W+/U54Aps6qyZdJYVH70tD6TM077S2B6yGLztzsJ4S+ENvjWA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Boris Brezillon <bbrezillon@kernel.org>,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: propagate timing-mode recovery failures
In-Reply-To: <CADvTj4or-XBJCp3oUh2T438Tf5kB0vfecNzOV+haisVrLKW9vA@mail.gmail.com>
	(James Hilliard's message of "Wed, 18 Nov 2026 09:49:52 -0700")
References: <20261103-submit-rawnand-timing-recovery-v1-v1-1-1cc33723e052@gmail.com>
	<874idejux6.fsf@bootlin.com>
	<CADvTj4or-XBJCp3oUh2T438Tf5kB0vfecNzOV+haisVrLKW9vA@mail.gmail.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Wed, 18 Nov 2026 18:15:58 +0100
Message-ID: <871p8igiwh.fsf@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_091609_356008_A6A97343 
X-CRM114-Status: GOOD (  20.61  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gMTgvMTEvMjAyNiBhdCAwOTo0OTo1MiAtMDcsIEphbWVzIEhpbGxpYXJkIDxqYW1lcy5oaWxs
aWFyZDFAZ21haWwuY29tPiB3cm90ZToKCj4gT24gV2VkLCBOb3YgMTgsIDIwMjYgYXQgMzoyOOKA
r0FNIE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+IHdyb3RlOgo+Pgo+
PiBPbiAwMy8xMS8yMDI2IGF0IDIzOjEzOjE4IC0wNywgSmFtZXMgSGlsbGlhcmQgPGphbWVzLmhp
bGxpYXJkMUBnbWFpbC5jb20+IHdyb3RlOgo+Pgo+PiA+IFdoZW4gR0VUX0ZFQVRVUkVTIHN1Y2Nl
ZWRzIGJ1dCB0aGUgY2hpcCBkb2VzIG5vdCBhY2tub3dsZWRnZSB0aGUgcmVxdWVzdGVkCj4+ID4g
dGltaW5nIG1vZGUsIG5hbmRfc2V0dXBfaW50ZXJmYWNlKCkgZmFsbHMgYmFjayB0byBtb2RlIDAu
IEJvdGggdGhlCj4+ID4gY29udHJvbGxlci1pbnRlcmZhY2UgcmVzZXQgYW5kIHRoZSBOQU5EIFJF
U0VUIGNvbW1hbmQgY2FuIGZhaWwsIGJ1dCB0aGVpcgo+PiA+IHJldHVybiB2YWx1ZXMgYXJlIGRp
c2NhcmRlZC4gVGhlIGZ1bmN0aW9uIHRoZW4gcmV0dXJucyB0aGUgc3VjY2Vzc2Z1bAo+PiA+IEdF
VF9GRUFUVVJFUyBzdGF0dXMgZXZlbiB0aG91Z2ggdGhlIGZhbGxiYWNrIGRpZCBub3QgY29tcGxl
dGUuCj4+ID4KPj4gPiBDaGVjayB0aGUgY29udHJvbGxlciByZXNldCBiZWZvcmUgaXNzdWluZyBS
RVNFVCBhbmQgcHJvcGFnYXRlIGVpdGhlcgo+PiA+IHJlY292ZXJ5IGVycm9yIHdoZW4gdGhlcmUg
d2FzIG5vIGVhcmxpZXIgZXJyb3IuIFByZXNlcnZlIGFuIGVhcmxpZXIKPj4gPiBHRVRfRkVBVFVS
RVMgZmFpbHVyZSBhbmQga2VlcCByZXR1cm5pbmcgc3VjY2VzcyB3aGVuIGEgdGltaW5nIG1pc21h
dGNoCj4+ID4gaXMgcmVjb3ZlcmVkIGJ5IGEgc3VjY2Vzc2Z1bCBtb2RlLTAgZmFsbGJhY2suCj4+
Cj4+IFlvdSBhcmUgY2FycnlpbmcgYSByZXR1cm4gdmFsdWUgaW4gYW4gZXJyb3IgcGF0aCBvZiBh
biBlcnJvciBwYXRoLiBJZgo+PiB0aGUgcmVzZXQgYWN0dWFsbHkgZmFpbHMsIHRoZSB2ZXJ5IG5l
eHQgYXR0ZW1wdCB3aWxsIGZhaWwgYW5kIHByb2JlIHdpbGwKPj4gYmUgYWJvcnRlZCBhbnl3YXku
IFNvIHdoaWxlIHRoZSBmaXggaXMgbm90IGluaGVyZW50bHkgd3JvbmcsIHRoZSB0aXRsZQo+PiBh
bmQgY29tbWl0IGxvZyBvdmVyc3RhdGUgdGhlIHByb2JsZW0uCj4+Cj4+IE15IHByb3Bvc2FsOgo+
Pgo+PiBtdGQ6IHJhd25hbmQ6IHByb3BhZ2F0ZSBtb2RlLTAgZmFsbGJhY2sgZmFpbHVyZXMKPj4K
Pj4gV2hlbiBhIGNoaXAgZG9lcyBub3QgYWNrbm93bGVkZ2UgdGhlIHJlcXVlc3RlZCB0aW1pbmcg
bW9kZSwKPj4gbmFuZF9zZXR1cF9pbnRlcmZhY2UoKSBmYWxscyBiYWNrIHRvIG1vZGUgMCBieSBy
ZXNldHRpbmcgdGhlIGNvbnRyb2xsZXIKPj4gaW50ZXJmYWNlIGFuZCBpc3N1aW5nIGEgTkFORCBS
RVNFVC4gRWl0aGVyIHN0ZXAgY2FuIGZhaWw7IHJldHVybmluZwo+PiBzdWNjZXNzIHdpbGwgbGlr
ZWx5IGxlYWQgdG8gYW55IGxhdGVyIGF0dGVtcHQgYXQgdGFsa2luZyB0byB0aGUgY2hpcCB0bwo+
PiBmYWlsLgo+Pgo+PiBNYWtlIHN1cmUgdGhlIGVycm9yIHBhdGggcHJvcGFnYXRlcyB0aG9zZSBm
YWlsdXJlcyBpbiB0aGUgbW9kZS0wCj4+IGZhbGxiYWNrIGNhc2UuCj4KPiBUaGVyZSBpcyBhbHNv
IGEgY2FsbGVyIG91dHNpZGUgcHJvYmU6IG5hbmRfZG9fd3JpdGVfb29iKCkgY2FsbHMKPiBuYW5k
X3Jlc2V0KCksIHdoaWNoIGNhbGxzIG5hbmRfc2V0dXBfaW50ZXJmYWNlKCkuIElmIEdFVF9GRUFU
VVJFUwo+IHJlcG9ydHMgYSBkaWZmZXJlbnQgdGltaW5nIG1vZGUgYW5kIHRoZSBmYWxsYmFjayBm
YWlscywgbmFuZF9yZXNldCgpCj4gY3VycmVudGx5IHJldHVybnMgc3VjY2VzcyBhbmQgdGhlIE9P
QiB3cml0ZSBjb250aW51ZXMgcGFzdCBpdHMgcmVzZXQKPiBjaGVjay4gUHJvcGFnYXRpbmcgdGhl
IGZhbGxiYWNrIGVycm9yIGxldHMgdGhlIHdyaXRlIHN0b3AgdGhlcmUuCgpJZiB5b3UgYXJlIGF0
IHVzaW5nIG5hbmRfZG9fd3JpdGVfb29iKCkgdGhlcmUgaXMgbm8gcmVhc29uIHlvdSB3b3VsZCBl
bmQKdXAgaW4gdGhlIGVycm9yIHBhdGggb2YgdGhlIHNldHVwIGludGVyZmFjZSBzdGVwLiBUaGlz
IHJlc2V0IGlzIHN1cGVyCmxlZ2FjeSBhbnl3YXksIHRoZSBjb21tZW50IHNheXMgQXVndXN0IDE5
OTkuIFRoaXMgcGF0aCBpcyBhbHNvIG5vdCBzbwp1c2VmdWwgYW55bW9yZS4gWW91IGNhbiBtZW50
aW9uIGl0IGF0IHRoZSBlbmQgb2YgdGhlIGNvbW1pdCBsb2cgdGhvdWdoLgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNj
dXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LW10ZC8K
