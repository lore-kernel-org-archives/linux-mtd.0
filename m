Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DE04EFB7F9
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Feb 2026 08:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pPSWgASDFJkPuE9Vso0PSH941k0hgoXb4GH+/90tTfQ=; b=lfpnX5LimF68y1
	iCzJT7Zs3ctTErwSNvSpZBjCtvSfymYjcASKiBLxwvm0QUy9W5jGucfSvfNa+ExPl7+oI6FbptQ1+
	xpWJ/Lx3D8HS8EK7lbf/nhesyillJmUW9x4o5kHkeTx1x9OIGuoECN3W+lKnwXDshD0sJoIkq5Eqq
	gH1ZO53OjRz3kHHetQ4LAXgc8ltTJY5WdFq2AcEYL4cLasxThR16fF4be3F0egvANhb2D8sTO0nqr
	pyA+B/OQt8bR/uqnqxbOxF3PvwBc/lZlgd71K++LInsm7oDjpZZauQ67De6XEVXzT1RWHhmO3MolS
	HLg9Gvol/ui2T77DK2Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vunSj-00000001cQR-3XFZ;
	Tue, 24 Feb 2026 08:08:09 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vunSc-00000001cQ5-3yYl
	for linux-mtd@lists.infradead.org;
	Tue, 24 Feb 2026 08:08:05 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id CE5D44E41053;
	Tue, 24 Feb 2026 08:07:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9BE915FD9D;
	Tue, 24 Feb 2026 08:07:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 815A510368B61;
	Tue, 24 Feb 2026 09:07:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1771920478; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=TaJCoEzyy8/qyHP+aY5MjoQOqpny2lOYc4aC6Qi5m7o=;
	b=FMoMg+TevYPvQOPakVZImQMcGYsIhOLaSJm+4y+ceQm8niOg7tOHpd3aIX520FYMRCN/iU
	55pED53fwapJTbHJZWy9HZgwSdsxPoGdjdFAqUdYF2foeQ47nbMymvSqTI6C7qQKDL0Thv
	7JkGDTKBd1HKBpVYJeaU3+X667Uv0p30UTMkrh1clzfbfw/2/ymxHSaz7/gIyGwClKMneZ
	cYwotoSPZd6YpoD/hU4JQP2ZgGo4rScexYf0sJ020nS866Q0qiZUKX3xzRbQH+Lxkw4XN5
	CmQr2Xr7wtnoVV4k1yAmHIcnmYIYT84ouAc51ec1ggCJGrgw3EchhQkTQ7Jt2Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Andrea Scian <andrea.scian@dave.eu>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
  "michal.simek@amd.com" <michal.simek@amd.com>,  "richard@nod.at"
 <richard@nod.at>,  "vigneshr@ti.com" <vigneshr@ti.com>,
  "amit.kumar-mahapatra@amd.com" <amit.kumar-mahapatra@amd.com>
Subject: Re: PL353 NAND Controller - SW vs HW ECC
In-Reply-To: <f6a240d3-2447-4edf-9314-347160878d9a@dave.eu> (Andrea Scian's
	message of "Mon, 23 Feb 2026 17:39:50 +0100")
References: <MI2P293MB02644DC5515E56A2539C65739765A@MI2P293MB0264.ITAP293.PROD.OUTLOOK.COM>
	<87v7g4zz36.fsf@bootlin.com>
	<f05f27ac-abaf-43fc-8f77-8f729741d03f@dave.eu>
	<87wm0ixn16.fsf@bootlin.com>
	<f6a240d3-2447-4edf-9314-347160878d9a@dave.eu>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Tue, 24 Feb 2026 09:07:54 +0100
Message-ID: <87jyw2r2cl.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_000803_362966_577CEF55 
X-CRM114-Status: GOOD (  16.81  )
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

SGkgQW5kcmVhLAoKPj4+PiBUaGlzIGlzIG9idmlvdXNseSBqdXN0IHNwZWN1bGF0aW9uLCBtYXli
ZSB0aGUgZXJyYXRhIHlvdSBtZW50aW9uZWQgYWJvdmUKPj4+PiB3aWxsIGJyaW5nIGFuIG9idmlv
dXMgaGFyZHdhcmUgZmFpbHVyZSB0byBvdXIgYXR0ZW50aW9uLiBUaGUgQXJhc2FuIElQCj4+Pj4g
dXNlZCBvbiBaeW5xTVAgYWxzbyBzdWZmZXJzIGZyb20gYSBzaW1pbGFyIGxpbWl0YXRpb24gKG5v
dCBhYmxlIHRvCj4+Pj4gY29ycmVjdGx5IHJlcG9ydCBmYWlsdXJlcykgYW5kIEkgZGVjaWRlZCB0
byBpbXBsZW1lbnQgb25lIHBhdGggdXNpbmcgdGhlCj4+Pj4gc29mdHdhcmUgQkNIIGVuZ2luZSwg
d2l0aCBhIHRpbWUgcGVuYWx0eSBvZiBjb3Vyc2UuCj4+Pgo+Pj4gU28gdGhhdCdzIG5lYXJseSB0
aGUgc2FtZSByZXN1bHQgSSdtIHRyeWluZyB0byBnZXQgd2l0aCBaeW5xN2sKPj4+IHBsYXRmb3Jt
IDstKQo+PiBJbiB0aGlzIGNhc2UsIEkgY2FuIG9ubHkgcmVjb21tZW5kIHRoZSBibG9nIHBvc3Qg
SSB3cm90ZSBmb3IgdGhlCj4+IEFyYXNhbgo+PiBjb250cm9sbGVyLiBJIGJlbGlldmUgaXQgc2hv
dWxkIGJlIGVhc2llciB0byBkbyBhcyB5b3Ugd29uJ3QgbmVlZCB0aGUKPj4gcG9seW5vbWlhbCBy
ZXRyby1lbmdpbmVlcmluZy4KPj4gTGluazoKPj4gaHR0cHM6Ly9ib290bGluLmNvbS9ibG9nL3N1
cHBvcnRpbmctYS1taXNiZWhhdmluZy1uYW5kLWVjYy1lbmdpbmUvCj4KPiBUaGFua3MgZm9yIHRo
aXMgZGV0YWlsZWQgYXJ0aWNsZSEKPiBJIHRoaW5rIEknbGwgbW92ZSB0byBoYW1taW5nIGNvZGUg
KGlmIEkgbWFrZSBpdCB3b3JrIGluIHUtYm9vdCkgb3IgQkNICj4gKGFmdGVyIGV2YWx1YXRpbmcg
dGhlIHBlcmZvcm1hbmNlIGltcGFjdCkKCkVpdGhlciB5b3Ugd2FudCB0byBsZXZlcmFnZSB0aGUg
ZW5naW5lIGluIHRoZSB3cml0ZSBwYXRoIChiZWNhdXNlIGl0IGlzCmZhc3RlciB0aGFuIGRvaW5n
IGl0IHdpdGggdGhlIENQVSkgYW5kIHlvdSBtdXN0IGltcGxlbWVudCBIYW1taW5nIGFzCnRoYXQn
cyB0aGUgb25seSBjYXBhYmlsaXR5IG9mIHRoZSBjb250cm9sbGVyLCBvciB5b3Ugd2FudCBiZXR0
ZXIKc3RyZW5ndGggYW5kIGluIHRoaXMgY2FzZSB5b3UgZG8gbm90IGhhdmUgYW55dGhpbmcgdG8g
ZG8gZXhjZXB0CmNvbmZpZ3VyaW5nIGZvciBzb2Z0d2FyZSBFQ0MgZW5naW5lcyBpbiB0aGUgRFQu
CgpCdXQgZm9yIGFuIHVwc3RyZWFtIGZpeCwgd2hpY2ggSSB3b3VsZCB3ZWxjb21lLCB5b3UgbmVl
ZCB0byB1c2UgdGhlCkhhbW1pbmcgaGFyZHdhcmUgZm9yIHRoZSB3cml0ZSBwYXRoIGFuZCBzb2Z0
d2FyZSBpbiB0aGUgcmVhZCBwYXRoLgoKPiBJIGhhdmUgc29tZSBpc3N1ZSB3aXRoIExpbnV4IHRv
IFUtQm9vdCBpbnRlcm9wZXJhYmlsaXR5IChzaW5nbGUgYml0Cj4gZXJyb3IgYXJlIG5vdCBjb3Jy
ZWN0bHkgaGFuZGxlZCBpbiB1LWJvb3QgaGFtbWluZyBpbXBsZW1lbnRhdGlvbiksIGlzCj4gdGhp
cyB0aGUgcmlnaHQgbWFpbGluZyBsaXN0IHRvIGFzayBmb3IgYWR2aWNlIG9yIHNob3VsZCBJIG1v
dmUgdG8KPiB1LWJvb3QgTUw/CgpZb3UgY291bGQgY3JlYXRlIGEgdGhyZWFkIHdpdGggYm90aCwg
SSBndWVzcywgaWYgdGhlcmUgaXMgYW4KaW50ZXJvcGVyYWJpbGl0eSBpc3N1ZS4KClRoYW5rcywK
TWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
