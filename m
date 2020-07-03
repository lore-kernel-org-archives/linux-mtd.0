Return-Path: <SRS0=VtTp=AO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3B53C433E0
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Jul 2020 08:17:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9BB2F206A1
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Jul 2020 08:17:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="wWFRY+Nk";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="0OYjRNRG";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="nmAsIXvF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9BB2F206A1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xbdxjtTKETCT6td+6U3PUy6knhRmom14bN2OR0shxDM=; b=wWFRY+Nkd68c/Bj4+mWxJFd/B
	nm5akT4NzKGrWayPZ7CaFWmsvdyj3XeHhf4mI6c1fWRheTgOzK89tZmjmwrVGrQKx8VdnCWHxf8uo
	E+9Yg3KUtfXyCqOuPkmeagkMgA666vqpUaRnjGsMmHsxF1CYi807tpTIB8VidjHuswCwI3jLyffWP
	UsYXzmMXCMOI4TOBEmXkxyiGdcY4+bhFvEQOTDD6Uoj0yRzanBccECcxUSvjS+jj5MOG1zle9JMZk
	c6k/CxYqn5VKucFH8T9osROezQJOYBudtv1hRyoCfq7BX1upci+n5VzASb7S4NDt2DGI2kmHYqCZV
	2s5hojjkg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jrGs8-0005xH-6t; Fri, 03 Jul 2020 08:16:36 +0000
Received: from galois.linutronix.de ([193.142.43.55])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jrGs1-0005sn-Ke
 for linux-mtd@lists.infradead.org; Fri, 03 Jul 2020 08:16:30 +0000
Date: Fri, 3 Jul 2020 10:16:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1593764188;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yDtTOYapr6ULwDNQUTlcinU2aIqnRuC6WMu8roJhzP8=;
 b=0OYjRNRGKROadnSMSfaIg+Z/KB7+Xg+VP6A+js3fAGKHbnWanC5M3w8Ur4d0uteQWdR1VD
 GVSUEC5GS0MeREBjufeQxN3+fxfdwUPHQKpYbHRZ9K391hjkW/cbWmyfvdDloPxco12t7Z
 A1IYTq5Efhtsak3SHLEV+AqASXwdf+1YML104TJuCgB32wnEyr4RT9XpPEHaVA/6NOM9LU
 rLBgsP1YQuVgGlUO1c4fwtU8I5FKxDQueQt8ZR+2aQ74oKKy3TMeBMZouZOBOai0iei24s
 dA93CaqIin2YXGJabhtw+3aigCtt2avY8T/beqwOFN9JXa8jU5oI/hvMu3GJmA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1593764188;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yDtTOYapr6ULwDNQUTlcinU2aIqnRuC6WMu8roJhzP8=;
 b=nmAsIXvFNLiW/MnePjiQNflEEk1dPzEaJ4UpTlubH3bMP6QuA12usF/zbzKas5DxOmHgue
 8tB1ITiJ9bbx4NDA==
From: bigeasy <bigeasy@linutronix.de>
To: Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH v2 0/4] ubifs: support authentication without hmac
Message-ID: <20200703081627.pifi4rwafza6ii7n@linutronix.de>
References: <20200625155927.28430-1-torben.hohn@linutronix.de>
 <20200626112907.13201-1-torben.hohn@linutronix.de>
 <1644538308.62483.1593181011127.JavaMail.zimbra@nod.at>
 <20200629090734.GB17241@linutronix.de>
 <1031805083.71374.1593427612787.JavaMail.zimbra@nod.at>
 <875zb6t1yf.fsf@nanos.tec.linutronix.de>
 <1142766008.83787.1593702042460.JavaMail.zimbra@nod.at>
 <87wo3lsqg6.fsf@nanos.tec.linutronix.de>
 <1162063436.84431.1593716634407.JavaMail.zimbra@nod.at>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1162063436.84431.1593716634407.JavaMail.zimbra@nod.at>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200703_041629_845031_6C8EB770 
X-CRM114-Status: GOOD (  15.70  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: tglx <tglx@linutronix.de>, linux-mtd <linux-mtd@lists.infradead.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, david <david@sigma-star.at>,
 Torben Hohn <torben.hohn@linutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gMjAyMC0wNy0wMiAyMTowMzo1NCBbKzAyMDBdLCBSaWNoYXJkIFdlaW5iZXJnZXIgd3JvdGU6
Cj4gLS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+ID4+Pj4gQW55d2F5LCBsaWtlIHNh
aWQgaW4gdGhlIG90aGVyIG1haWwsIEkgdGhpbmsgaWYgd2UgY2hhbmdlIHRoZSBmZWF0dXJlIHRv
Cj4gPj4+PiAia2VlcCBvZmZsaW5lIHNpZ24ga2V5IGFuZCBpbXBseSBybyBtb3VudCIgdGhpbmdz
IHdpbGwgYmUgbW9yZSBzbW9vdGggd2l0aCBsZXNzCj4gPj4+PiBjb3JuZXIKPiA+Pj4+IGNhc2Vz
Lgo+ID4+PiAKPiA+Pj4gSSBkb24ndCB0aGluayBzby4gVGhlIGRlc2lyZWQgbW9kZSBpcyB0byBw
cmV2ZW50IFJXIG1vdW50cyBmb3IgYSBmYWN0b3J5Cj4gPj4+IHNpZ25lZCBpbWFnZSB3aGljaCBp
bXBsaWVzIHRoZSBwcmV2ZW50aW9uIG9mIHJld3JpdGluZyB0aGUgc3VwZXJibG9jay4KPiA+Pgo+
ID4+IFRoaXMgaXMgZXhhY3RseSB3aGF0IEknbSBhc2tpbmcgZm9yLgo+ID4+IEtlZXAgdGhlIGZh
Y3Rvcnkgc2lnbmVkIHN1cGVyIGJsb2NrIGFuZCBpbXBseSByZWFkLW9ubHkgbW9kZS4KPiA+IAo+
ID4gQW5kIHRoYXQncyB3aGF0IFRvcmJlbiBpbXBsZW1lbnRlZCB1bmxlc3MgSSdtIG1pc3Npbmcg
c29tZXRoaW5nLgo+IAo+IFRvcmJlbiBpbXBsZW1lbnRlZCBpdCB0aGUgb3RoZXIgd2F5IGFyb3Vu
ZCwgaGUgYWxsb3dzIG1vdW50aW5nIHdpdGhvdXQKPiB0aGUgSE1BQyBpZiBVQklGUyBtb3VudCBp
cyByZWFkLW9ubHkuCj4gVGhpcyBjb3ZlcnMgYWxzbyB0aGUgcHJvcG9zZWQgdXNlLWNhc2UgYnV0
IGFzIEkgc3RhdGVkIGl0IGhhcyBpc3N1ZXMgd2l0aAo+IHJlbW91bnRpbmcgYW5kIG1ha2VzIHRo
ZSBpbXBsZW1lbnRhdGlvbiBtb3JlIGNvbXBsaWNhdGVkIHRoYW4gaXQgc2hvdWxkIGJlLgo+IAo+
IFRoYXQncyB3aHkgSSBwcm9wb3NlZCBhZGRpbmcgYSBuZXcgbW91bnQgb3B0aW9uIGxpa2UgImtl
ZXBfb2ZmbGluZV9zaWduYXR1cmUiIG9yCj4gd2hhdCBuYW1lIGZpdHMgYmV0dGVyLiBUaGF0IGdp
dmVzIHVzIHRoZSBmb2xsb3dpbmcgcHJvczoKCnNvIHlvdSB3YW50IGFuIGV4dHJhIG9wdGlvbiBp
bnN0ZWFkIG9mIHNldHRpbmcgU0JfUkRPTkxZIG9uIFJPIG1vdW50cwp3aXRob3V0IHRoZSBrZXkg
YW5kIG5vdCBhbGxvd2luZyBSVyBtb3VudHMgaW4gdGhpcyBjYXNlPwoKPiAxLiBNYWtlcyB0aGUg
aW1wbGVtZW50YXRpb24gc3VwZXIgc2ltcGxlLgo+ICAgIElmIGtlZXBfb2ZmbGluZV9zaWduYXR1
cmUgaXMgc2V0IGFuZCBydyBtb3VudCByZXF1ZXN0ZWQsIHJlamVjdC4KPiAgICBSVyByZW1vdW50
IGNhbiByZWplY3RlZCB2ZXJ5IGVhc2lseSwgc3RvcmUga2VlcF9vZmZsaW5lX3NpZ25hdHVyZSBp
biB0aGUgdWJpZnMgY29udGV4dC4KPiAKPiAyLiBJZiB0aGUgc3VwZXIgYmxvY2sgZ290IGFscmVh
ZHkgcmUtd3JpdHRlbiwgcmVqZWN0Lgo+ICAgIFlvdSBjYW4gY2hlY2sgc3ViLT5obWFjW10gZm9y
IGJlaW5nIG5vbi16ZXJvLgo+ICAgIFRoYXQgd2F5IHdlIGNhbiBnaXZlIHRoZSB1c2VyIGEgZGVj
ZW50IGVycm9yIG1lc3NhZ2UgaW4gY2FzZSB0aGV5IGRvIHN0dXBpZCB0aGluZ3MuCgpyZS13cml0
dGVuIGFzIGluIGEgcHJpb3IgUlcgbW91bnQgd2l0aCB0aGUga2V5PwoKPiAzLiBVc2Vyc3BhY2Ug
Y2FuIHZlcmlmeSB3aGV0aGVyIHRoZSBVQklGUyBmcyBpcyBwcmlzdGluZSBieSBjaGVja2luZwo+
ICAgIGZvciB0aGUga2VlcF9vZmZsaW5lX3NpZ25hdHVyZSBtb3VudCBmbGFnIGluIC9wcm9jL3Nl
bGYvbW91bnRpbmZvLgoKQ291bGQgdGhpcyBpbmZvcm1hdGlvbiBiZSBkdWJpb3VzIGlmIHRoZSBV
QklGUyB3YXMgbW91bnRlZCBSVyBvbmNlICh3aXRoCnRoZSBrZXkgYXJvdW5kKSBhbmQgdGhlbiBt
b3VudGVkIFJPLGtlZXBfb2ZmbGluZV9zaWduYXR1cmUgPyBTbyB5b3UKd291bGQgaGF2ZSB0byBv
bmx5IGFsbG93IGtlZXBfb2ZmbGluZV9zaWduYXR1cmUgaWYgeW91ciBwb2ludCAoMikgaXMKdHJ1
ZT8KCj4gVGhhbmtzLAo+IC8vcmljaGFyZAoKU2ViYXN0aWFuCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24g
bWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbXRkLwo=
