Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D83EE606A320
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Nov 2026 08:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LegluMVl;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=b8hUMxM1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=hMBVUBCkg1eK77pcEmigpjvsIDHDkhwxwOl4Z/DLyCY=; b=LegluMVls8+xVwQs4fRAinXtSa
	sVMuqPuF6wzzgHugjYRRG6MOzHOovcs9jz96tkMs8mHmmGTWD03aP1xfdyqb73bH+NCGvpGO3AWUq
	AP3AuM+ZYzH8TFEblOGIyHGX5ERETsMhDJTBxwpT2jniLPsW0iMKVDyZaLs1tj8/tumbcWCeDGhDC
	5nPPw3wC0Tnp3bdLS364ac67xwU9xWvRmk1Jl1G1tnGH8Gf6fIFDLA44zzNgSiIBUeyv9er8urlTv
	FGCfqT6NREkOZ1Lzi1OiheCSidPXu69Pmo07GD7U7/Ft2Rs7ltLMH2ZzvdaG/3mxk6r02hnpIrz2V
	bLXhs5Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTxf7-0000000BCG0-4BsH;
	Thu, 19 Nov 2026 08:38:34 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTxf6-0000000BCFV-0jAU
	for linux-mtd@lists.infradead.org;
	Thu, 19 Nov 2026 08:38:33 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id EFBE01A1708;
	Thu, 19 Nov 2026 08:38:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C3E9360237;
	Thu, 19 Nov 2026 08:38:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4F48511BC31E4;
	Thu, 19 Nov 2026 09:38:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795077505; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=y7giRJK3oXv6VpWz+JWM+SHr02QwlAVQHEppMzZGWGk=;
	b=b8hUMxM1GUNq2+W5SyznPCQr6RSQ485GHmvjqSy42XakEY4U5SYETUB/wUFOPN1qkrOfU+
	/0oD8pctkLmW2Q5dt+p3NyDbpHRMUUo/joNGKxeIIDbFxBdlOrequYK8aGj1IVLOdiomwV
	SmKH0TTiSlukX5/Z/TIPfAjbwIPM7QDRW2Jg4agUCQLxjHRr1ehKaieoXn5TcZrvt+t20J
	5pOO2cm4Gl0Ul62pRPP8X1xdzohuITi/7YaRMci6wHkdlQiZ/1Ip1xlAvmPhTpIjP1j2U5
	a8Kq2WVWtWqK83iZ+jNADB+RmnLcpf3hTlO62RK8HSFeM59+UUSo598fDYlWAQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Thomas Gleixner <tglx@kernel.org>,  "Artem B.
 Bityuckiy" <dedekind@infradead.org>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: stop BBT creation when the marker scan fails
In-Reply-To: <CADvTj4rY=fN5=RYbhL_X56O5kbim-NZWRoRMQJAndZAxUZUo+w@mail.gmail.com>
	(James Hilliard's message of "Wed, 18 Nov 2026 12:11:19 -0700")
References: <20261103-submit-rawnand-bbt-scan-error-v1-v1-1-0bef8334198c@gmail.com>
	<87fqwyjwvk.fsf@bootlin.com>
	<CADvTj4rY=fN5=RYbhL_X56O5kbim-NZWRoRMQJAndZAxUZUo+w@mail.gmail.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Thu, 19 Nov 2026 09:38:22 +0100
Message-ID: <87ld6pfc75.fsf@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_003832_367969_F3F9ADF3 
X-CRM114-Status: GOOD (  26.07  )
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gMTgvMTEvMjAyNiBhdCAxMjoxMToxOSAtMDcsIEphbWVzIEhpbGxpYXJkIDxqYW1lcy5oaWxs
aWFyZDFAZ21haWwuY29tPiB3cm90ZToKCj4gT24gV2VkLCBOb3YgMTgsIDIwMjYgYXQgMjo0NeKA
r0FNIE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+IHdyb3RlOgo+Pgo+
PiBPbiAwMy8xMS8yMDI2IGF0IDIyOjUyOjM5IC0wNywgSmFtZXMgSGlsbGlhcmQgPGphbWVzLmhp
bGxpYXJkMUBnbWFpbC5jb20+IHdyb3RlOgo+Pgo+PiA+IGNyZWF0ZV9iYnQoKSByZXR1cm5zIGFu
IGVycm9yIGlmIHJlYWRpbmcgYSBiYWQtYmxvY2sgbWFya2VyIGZhaWxzLAo+Pgo+PiBUaGlzIHNl
bnRlbmNlIGRvZXMgbm90IG1lYW4gYW55dGhpbmcuCj4+Cj4+ID4gYnV0Cj4+ID4gY2hlY2tfY3Jl
YXRlKCkgaWdub3JlcyB0aGF0IHJlc3VsdC4gSXQgY2FuIGFzc2lnbiB2ZXJzaW9uIDEgdG8gdGhl
Cj4+Cj4+IFRoYXQncyBhbHNvIHVuY2xlYXIuCj4KPiBJdCdzIGp1c3Qgc3RhdGluZyB3aGVyZSBh
biB1bmNoZWNrZWQgcmV0dXJuIGV4aXN0cyBhbG9uZyB3aXRoIHRoZQo+IHBvdGVudGlhbCBjb25z
ZXF1ZW5jZXMgb2YgY29udGludWluZyB3aXRob3V0IGNoZWNraW5nIHRoZSByZXR1cm4uCj4gQXQg
bGVhc3QgdGhhdCB3YXMgaG93IEkgcmVhZCBpdC4KPgo+IElzIHRoaXMgY29tbWl0IG1lc3NhZ2Ug
cGhyYXNpbmcvc3R5bGUgd2VpcmQgb3Igc29tZXRoaW5nPwoKU2VlIGp1c3QgYmVsb3cgb25lIGV4
YW1wbGU6Cgo+PiA+IGluY29tcGxldGUgUkFNIHRhYmxlIGFuZCB3cml0ZSBpdCB0byB0aGUgcHJp
bWFyeSBhbmQgbWlycm9yCj4+bG9jYXRpb25zLgoKInRoZSBwcmltYXJ5IGFuZCBtaXJyb3IgbG9j
YXRpb25zIiAtPiB0aGlzIGlzIGEgZGV0YWlsLCB0aGF0J3Mgbm90IHdoYXQKbWF0dGVycy4KCj4+
ID4gVW5zY2FubmVkIGZhY3RvcnktYmFkIGJsb2NrcyB0aGVuIGFwcGVhciBnb29kIGluIHRoZSBw
ZXJzaXN0ZWQKPj4gPiB0YWJsZXMuCj4+Cj4+IEhlcmUgaXMgYSBwcm9wb3NhbCB3aGljaCBJIGJl
bGlldmUgbWFrZXMgbW9yZSBzZW5zZToKPj4KPj4gbXRkOiByYXduYW5kOiBhYm9ydCBCQlQgY3Jl
YXRpb24gb24gc2NhbiBmYWlsdXJlCj4+Cj4+IGNyZWF0ZV9iYnQoKSBjYW4gZmFpbCBvbiBhIG5v
bi1FQ0MgT09CIHJlYWQgZXJyb3IsIGxlYXZpbmcgdGhlIFJBTSBCQlQKPj4gcGFydGlhbGx5IHBv
cHVsYXRlZC4gSXQgaXMgcHJlZmVyYWJsZSB0byBiYWlsIG91dCBlYXJseSByYXRoZXIgdGhhbiBi
dW1wCj4+IHRoZSB0YWJsZSB2ZXJzaW9ucyBhbmQgd3JpdGUgaW5jb21wbGV0ZSBwcmltYXJ5IGFu
ZCBtaXJyb3IgdGFibGVzLCB3aGljaAo+PiB3b3VsZCBtYXJrIHRoZSB1bnNjYW5uZWQgZmFjdG9y
eS1iYWQgYmxvY2tzIGFzIGdvb2QuCj4KPiBQZXJzb25hbGx5IEkgdHJ5IHRvIGF2b2lkIHRlcm1p
bm9sb2d5IGxpa2UgInByZWZlcmFibGUiIHdoZW4KPiBkZXNjcmliaW5nCgpZZXMsIGZpbmUuCgo+
IGNvZGUgYmVoYXZpb3IgdGhhdCdzIGNsZWFybHkgd3JvbmcsIGFzICJwcmVmZXJhYmxlIiB0byBt
ZSBhdCBsZWFzdCB3ZWFrbHkKPiBpbXBsaWVzIHRoYXQgdGhlIGNvZGUgaXNzdWUgYmVpbmcgZml4
ZWQgY291bGQgYmUgbW9yZSBvZiBhIHN0eWxlIGlzc3VlCj4gcmF0aGVyIHRoYW4gYSBjb3JyZWN0
bmVzcyBpc3N1ZS4KPgo+IFRvIG1lIGJvdGggY29tbWl0IG1lc3NhZ2VzIHNlZW0gdG8gYmUgZXF1
YWxseSB1bmRlcnN0YW5kYWJsZS4KPgo+Pgo+PiA+IFByb3BhZ2F0ZSB0aGUgc2NhbiBmYWlsdXJl
IGJlZm9yZSBjaGFuZ2luZyB0YWJsZSB2ZXJzaW9ucyBvciB3cml0aW5nCj4+ID4gZWl0aGVyIGNv
cHkuIEtlZXAgZXhwbGljaXQgTkFORF9CQlRfQ1JFQVRFX0VNUFRZIGluaXRpYWxpemF0aW9uIHVu
Y2hhbmdlZC4KPj4gPgo+PiA+IEZpeGVzOiBlZWFkYTI0ZGE4YmQgKCJbTVREXSBOQU5EOiBSZWFk
IG9ubHkgT09CIGJ5dGVzIGR1cmluZyBiYWQgYmxvY2sgc2NhbiIpCj4+ID4gU2lnbmVkLW9mZi1i
eTogSmFtZXMgSGlsbGlhcmQgPGphbWVzLmhpbGxpYXJkMUBnbWFpbC5jb20+Cj4+Cj4+IEkgd291
bGQgcHJlZmVyIGlmIHlvdSBjb3VsZCB3cml0ZSB5b3VyIG93biBjb21taXQgbG9ncywgZ2l2aW5n
IHVzIG1vcmUKPj4gY29uZmlkZW5jZSBvbiB0aGUgd29yayB0aGF0IGhhcyBiZWVuIGFza2VkLiBZ
b3UgY2FuIHVzZSBhbiBMTE0gdG8KPj4gaW1wcm92ZS9lbmhhbmNlIGl0IG9idmlvdXNseS4KPgo+
IFRvIGJlIGhvbmVzdCBJJ3ZlIG5ldmVyIGJlZW4gZ3JlYXQgYXQgd3JpdGluZyBjb21taXQgbWVz
c2FnZXMgaW4KPiBnZW5lcmFsIGFuZCBoYXZlIGdvdHRlbiBhIGxvdCBtb3JlIGNvbXBsYWludHMg
YWJvdXQgY29tbWl0IG1lc3NhZ2VzCj4gbWlzc2luZyBpbXBvcnRhbnQgZGV0YWlscyBwcmlvciB0
byB1c2luZyBMTE0ncy4gSSBjYW4gYmFyZWx5IHRlbGwgdGhlCgpGb3IgbWUgdGhlIGNvZGUgaXMg
Z2V0dGluZyBiZXR0ZXIgYnV0IHRoZSBjb21taXQgbG9ncyBhcmUgdW5jbGVhci4gU29tZQpkZXRh
aWxzIHdoaWNoIGRvbid0IG5lZWQgKGltbykgdG8gYmUgd3JpdHRlbiBhcmUgdGhlcmUsIGFuZCB0
aGUgYmlnCnBpY3R1cmUgaXMgb2Z0ZW4gbWlzc2luZyBvciBub3QgY2xlYXJseSBzdGF0ZWQgYmVm
b3JlIHRoZSBkZXRhaWxzLgoKRG9uJ3QgZ2V0IG1lIHdyb25nLCB1c2luZyBhbiBMTE0gdG8gcmVm
aW5lL3Jld29yZC9yZW9yZ2FuaXplIGlzIGZpbmUsCmJ1dCBsZXR0aW5nIHRoZSBMTE0gd3JpdGUg
aXQgZW50aXJlbHkgaXMgbm90IHdvcmtpbmcgd2VsbC4KClRoYW5rcywKTWlxdcOobAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1U
RCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
