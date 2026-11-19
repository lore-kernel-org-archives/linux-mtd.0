Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C441606A320
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Nov 2026 09:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GLrjcui/;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=iPZwjHka
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Qj6k3pDm+n3J/ff7FDsfT+3/4fLCbZAnn4dOhe004xc=; b=GLrjcui/kNlBNPwWWorCtAK3Je
	3un3WgItDFZOdYDgcyqRkF6zPtpCArBlefGlVMTimRP6K2zevJidPiGuYZ1hSjmqvQvdLapr5hUWS
	bxcj/o3pvGLg4ED3g7aRZJMKfdWcVAGoWIyeDUYvYkoD1gsekaKcfA65Uk5qXUrMfmRA2LItBFeVl
	tsk/9g2CdtBRNhwYDsq8x7GKHXrMxkndQVfbkzXynDHT/ln0zzmJi8o6c5RW6K5peYxBny+NwFKS/
	Nc16ZcC95/pF9JHoUCreVUAlT+kSG2muM5B89DJVbjJKa6H026ReOwL0CqlXS0Ot0Vdh60WBOIsnK
	WmMRXu6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTyn2-0000000BRv1-0v6B;
	Thu, 19 Nov 2026 09:50:48 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTymu-0000000BRtn-2fu2
	for linux-mtd@lists.infradead.org;
	Thu, 19 Nov 2026 09:50:46 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 1E4AE4E415F3;
	Thu, 19 Nov 2026 09:50:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E63F360237;
	Thu, 19 Nov 2026 09:50:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5551B11BC3329;
	Thu, 19 Nov 2026 10:50:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795081833; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=HEoDeaJTImMBawubpaGZWjudv+J8A154zaqaDyONBtM=;
	b=iPZwjHkaQA8GvDXb0be4rEpBVOPWczQwuQVidZe04kZ1axMziW8ctBFUrb6lKv9SpDsox+
	8p/LXCvtERWx05CSoW44NDPEkPGteJMPrZYcSeROxoaS2aKaq4zOvgWyeQ+MHw1Lhj53bv
	E2sU6AD+k+0FEapkgIlQBYJQo/nlPArdRVqfkcVZU+nY6Q7K7ET2iclpyL+8PhLnGNZnd0
	mX1iW4YbeKLFFJ6um3IqO/JoIptnDGJ+CUhS+XesmrcxzCir33sVIP6NxUc/3GfDvhuotT
	aeweWW4eGBhj5gXv63nxTWdKWA9nwsCfjO1VZRsm0e+OYKKETJ3k3YMhieR6+Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "ping.li" <leeonion.muyu@gmail.com>
Cc: richard@nod.at,  vigneshr@ti.com,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 0/1] mtdchar: kvmalloc() for large read/write buffers?
In-Reply-To: <20261119090055.1255028-1-ping.li@horizon.auto> (ping li's
	message of "Thu, 19 Nov 2026 17:00:54 +0800")
References: <20261119090055.1255028-1-ping.li@horizon.auto>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Thu, 19 Nov 2026 10:50:29 +0100
Message-ID: <875wxtf8uy.fsf@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_015040_811064_8E13976A 
X-CRM114-Status: GOOD (  22.67  )
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

SGkgUGluZyBMaSwKCk9uIDE5LzExLzIwMjYgYXQgMTc6MDA6NTQgKzA4LCAicGluZy5saSIgPGxl
ZW9uaW9uLm11eXVAZ21haWwuY29tPiB3cm90ZToKCj4gRnJvbTogUGluZyBMaSA8bGVlb25pb24u
bXV5dUBnbWFpbC5jb20+Cj4KPiBXaGlsZSBpbnZlc3RpZ2F0aW5nIGEgdGhyb3VnaHB1dCByZWdy
ZXNzaW9uIG9uIG9uZSBvZiBvdXIgcGxhdGZvcm1zCj4gKGxvbmcgdXB0aW1lLCBmcmFnbWVudGVk
IG1lbW9yeSwgbGFyZ2UgcmVhZCgpL3dyaXRlKCkgb24gL2Rldi9tdGRYKQo+IEkgbm90aWNlZCBh
biBpbmNvbnNpc3RlbmN5IGluc2lkZSBtdGRjaGFyOgo+Cj4gICAtIHRoZSBpb2N0bCBwYXRocyAo
TUVNUkVBRC9NRU1XUklURSkgYWxsb2NhdGUgdGhlaXIgYm91bmNlCj4gICAgIGJ1ZmZlcnMgd2l0
aCBrdm1hbGxvYygpICg4MzIwOGUxMDZhOGU4KSwKPiAgIC0gYnV0IHRoZSByZWFkKCkvd3JpdGUo
KSBwYXRocyBzdGlsbCB1c2UgbXRkX2ttYWxsb2NfdXBfdG8oKSwKPiAgICAgd2hpY2ggaGFsdmVz
IHRoZSBidWZmZXIgc2l6ZSB1bnRpbCBrbWFsbG9jKCkgc3VjY2VlZHMuCj4KPiBUaGUgaGFsdmlu
ZyBiZWhhdmlvciBpcyBub3QgYSBjb3JyZWN0bmVzcyBwcm9ibGVtOiB0aGUgbG9vcCBpbgo+IG10
ZGNoYXJfcmVhZCgpL210ZGNoYXJfd3JpdGUoKSBtYWtlcyBwcm9ncmVzcyB3aXRoIHdoYXRldmVy
IGNodW5rCj4gc2l6ZSBpdCBnZXRzLiAgQnV0IHVuZGVyIGZyYWdtZW50YXRpb24gYSBtdWx0aS1t
ZWdhYnl0ZSB0cmFuc2Zlcgo+IHNpbGVudGx5IGRlZ3JhZGVzIGludG8gbWFueSBzbWFsbCBtdGRf
cmVhZCgpL210ZF93cml0ZSgpIGNhbGxzLAo+IHdoaWNoIGlzIHZpc2libGUgd2hlbiB0aGUgbG93
LWxldmVsIGRyaXZlciBjb3N0IHNjYWxlcyB3aXRoIHRoZQo+IG51bWJlciBvZiB0cmFuc2FjdGlv
bnMgKGUuZy4gZHJpdmVycyB0aGF0IGZvcndhcmQgZWFjaCBjYWxsIHRvIGEKPiByZW1vdGUgY29u
dHJvbGxlciBvdmVyIGEgYnVzKS4KPgo+IFRoaXMgUkZDIHByb3Bvc2VzIHRvIGFsaWduIHRoZSBy
ZWFkKCkvd3JpdGUoKSBwYXRocyB3aXRoIHRoZSBpb2N0bAo+IHBhdGhzIGJ5IHVzaW5nIGt2bWFs
bG9jKCksIGtlZXBpbmcgdGhlIEtNQUxMT0NfTUFYX1NJWkUgY2FwLgo+Cj4gVGhlIG9wZW4gcXVl
c3Rpb24gSSB3b3VsZCBsaWtlIHRvIHNvcnQgb3V0IGJlZm9yZSBzdWJtaXR0aW5nIGEKPiBwcm9w
ZXIgcGF0Y2g6Cj4KPiAgIEhvdyBjb25jZXJuZWQgc2hvdWxkIHdlIGJlIGFib3V0IGxvdy1sZXZl
bCBkcml2ZXJzIHJlY2VpdmluZyBhCj4gICB2bWFsbG9jJ2QgYnVmZmVyPwo+Cj4gTG9va2luZyBh
dCB0aGUgdHJlZSwgbW9zdCBkcml2ZXJzIG9ubHkgbWVtY3B5KCkgdGhlIGJ1ZmZlciwgYW5kCj4g
dGhlIGNvbnRyb2xsZXJzIHRoYXQgRE1BIGRpcmVjdGx5IGludG8gaXQgKGJyY21uYW5kLCBncG1p
LAo+IGNhZGVuY2UsIGF0bWVsLCAuLi4pIGFscmVhZHkgY2hlY2sgaXNfdm1hbGxvY19hZGRyKCkv
Cj4gdmlydF9hZGRyX3ZhbGlkKCkgYW5kIGZhbGwgYmFjayB0byBhIGJvdW5jZSBwYXRoLiAgU28g
dm1hbGxvYydkCj4gYnVmZmVycyBhcmUgc3VwcG9ydGVkIGV2ZXJ5d2hlcmUgdG9kYXkgLS0ganVz
dCBzbG93ZXIgb24gdGhvc2UKPiBjb250cm9sbGVycy4gIFdpdGggbXRkX2ttYWxsb2NfdXBfdG8o
KSB0aGUgc2FtZSBjb250cm9sbGVycyBnZXQgYQo+IGttYWxsb2MnZCAoc21hbGxlcikgYnVmZmVy
IGluc3RlYWQsIHNvIGVpdGhlciB3YXkgdGhlcmUgaXMgYQo+IHNsb3dkb3duOyBpdCBpcyBtb3N0
bHkgYSBxdWVzdGlvbiBvZiB3aGljaCBvbmUgdXNlcnNwYWNlIHByZWZlcnM6Cj4gZmV3IGxhcmdl
IHRyYW5zYWN0aW9ucyB0aHJvdWdoIGEgYm91bmNlIHBhdGgsIG9yIG1hbnkgc21hbGwKPiB0cmFu
c2FjdGlvbnMgd2l0aG91dCBvbmUuCj4KPiBJZiB0aGUgZGlyZWN0aW9uIGlzIGFncmVlZCwgSSB3
aWxsIGZvbGxvdyB1cCB3aXRoIGEgcHJvcGVyIHBhdGNoCj4gYW5kIG51bWJlcnMgZnJvbSBvdXIg
cGxhdGZvcm0uCgpJIHdvdWxkIGJlIGN1cmlvdXMgdG8ga25vdyBob3cgdGhpcyBnZXRzIGZhc3Rl
ciBhbmQgd2h5PyBCZWNhdXNlIHRoZQpwcmVmZXJyZWQgcGF0aCBpcyBvYnZpb3VzbHkgdmlhIERN
QSB0byBhdm9pZCBrZWVwaW5nIHRoZSBDUFUgYnVzeSBmb3IKc3VjaCB0cmFuc2ZlcnMsIGluIHdo
aWNoIGNhc2UgeW91IGhhdmUgbm8gb3RoZXIgY2hvaWNlIHRoYW4ga21hbGxvYydpbmcKeW91ciBi
dWZmZXIgZm9yIHRoZSBsb3ctbGV2ZWwgZHJpdmVyLgoKSSBhbSBub3QgZ2VuZXJhbGx5IG9wcG9z
ZWQgdG8gdGhlIGlkZWEuIEkgYWN0dWFsbHkgdGhpbmsgaXQncyBiZXN0IHRvCmhhdmUgYSB1bmlm
aWVkIGFsbG9jYXRpb24gbWV0aG9kIGlmIHRoYXQgaXMgcG9zc2libGUgKHdpdGhvdXQgc3Ryb25n
CnByZWZlcmVuY2UgbXlzZWxmLCBidXQgcGVyaGFwcyBSaWNoYXJkIHdpbGwgc2hhcmUgYSBtb3Jl
IGVkdWNhdGVkCm9waW5pb24/KS4gVGhlIG1haW4gcHJvYmxlbSBpcyBob3cgdG8gaGFuZGxlIHRo
ZSBsZWdhY3kgY2FzZXMuIFR5cGljYWxseQpTYXNoaWtvIHJhaXNlZCB0aGF0IHNvbWUgZGV2aWNl
cyB1c2UgX19wYSgpIG92ZXIgdGhlIGJ1ZmZlciB2aXJ0dWFsCmFkZHJlc3MsIHdoaWNoIGlzIGFi
c29sdXRlbHkgaG9ycmlibGUgaW4gMjAyNy4gVGhvc2Ugd2lsbCBoYXZlIHRvIGJlCmZpeGVkIGlu
IHlvdXIgc2VyaWUgKGFzIHByZXJlcXVpc2l0ZXMpLiBTbyBiZSBhd2FyZSB0aGF0IHRoZSBzZXJp
ZXMgaXMKZ29ubmEgYmUgbGFyZ2VyIHRoYW4gd2hhdCB5b3UgZXhwZWN0LgoKSWRlYWxseSwgSSBi
ZWxpZXZlIHRoZSBsb3ctbGV2ZWwgZHJpdmVycyBzaG91bGQgdGVsbCB0aGUgTVREIGxheWVyCndo
ZXRoZXIgdGhleSBleHBlY3QgY29udGludW91cyBidWZmZXJzID4gUEFHRV9TSVpFIG9yIG5vdC4g
V2UgY291bGQKdGhlcmVmb3JlIGhhdmUgb3VyIG93biBkZXZtX210ZF9rdm1hbGxvYyhtdGQsIC4u
Likgd2hpY2ggYXR0YWNoZXMgdGhlCmJ1ZmZlciB0byB0aGUgTVREIGRldmljZSwgdHJpZXMga3ph
bGxvYygpIGlmIHJlcXVlc3RlZCBieSB0aGUgbXRkIGRldmljZQooc29tZSBraW5kIG9mIG10ZC0+
ZXhwZWN0c19kbWFfYnVmcyBib29sZWFuIHNldCBkdXJpbmcgcHJvYmUsIHR5cGljYWxseQpiYXNl
ZCBvbiB0aGUgYXZhaWxhYmlsaXR5IG9mIERNQSBjYWxsYmFja3MpLCBmYWxsYmFja3MgdG8gdm1h
bGxvYygpCm90aGVyd2lzZS4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1h
aWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW10ZC8K
