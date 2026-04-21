Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99763F327B5
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Apr 2026 07:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=95vUFaw9yC+8UTbAXuFj6bHngtaaBTXsWsQj7VIeSUY=; b=xHwquak48qlqRO
	yJbYqpQwOUhdx0ytY0CstVhrjV1zJxw6EJ8gS/Su7gqL2ywtsrBEwvKBstL/AYU+y3U6h3jOwxmBp
	UblHbHgBA1kpQVTMEV5765SVgTv9FKgxS5oC5HrrhmqCQC+i/ql4hpm2guk6iPo0wTs7trFnsyrui
	+tpt0IqmWFmsoL1bd/mGWj2rxjTWC9a0/8vA7a0FhBTo0Ae0a+kuAIchrzPiWj3T49mLe95gGic7M
	4Fa8rLSJ3zbO5hLlMtgeIM+zj64YMzbgKnKBR7Fef5jUHogdu5Qls8XxHjkhJUrUuOqc+kPaWrEbs
	r7dfC2BjMXs6sLu3bR6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF5ag-00000008BjT-3FtD;
	Tue, 21 Apr 2026 07:32:14 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF5ac-00000008Bie-1v1j
	for linux-mtd@lists.infradead.org;
	Tue, 21 Apr 2026 07:32:13 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 2B25BC5C9A5
	for <linux-mtd@lists.infradead.org>; Tue, 21 Apr 2026 07:32:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DC40E600D2;
	Tue, 21 Apr 2026 07:32:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B3A1110460969;
	Tue, 21 Apr 2026 09:32:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776756725; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=3kTU3kTa+ixYcpktW0hrWE8mmmnIo0ZXlgjghpDA6WE=;
	b=nWkTs/xrJNQIVsHqTPyDs62q/vyf0p8Oo73TuyqxuJy+/8cXRaDP9FUIxeDKy7h4w0S8XA
	WpInCieYMyb8DD7JevlO6Zw31MbbIOdjSQ420559lapqP0MneEVdyGJBJr1P3ryW1m6M9m
	kY90751etruk8f807Kcf+00R7tDOOJc1mA5rBrBPBisDFClajN6NLdn0Nohho424DCEvGz
	Sd6tpmiP9nIAAMhiHMEenAY9Te5yQe38EiXBmlUIK3pdKXMXQsbaBIeSTDDJOmVsLMPGH4
	5k9DyllfULEBcpbYgK/eDWK5X6LsnTI4ZPMDZOK6DJ9328lgSoje/sxShM3vmQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Boris Brezillon <bbrezillon@kernel.org>,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: nand: bbt: clamp GENMASK high bit to word boundary
In-Reply-To: <adzL_tlZTntTVPD-@makrotopia.org> (Daniel Golle's message of
	"Mon, 13 Apr 2026 11:57:02 +0100")
References: <2a62dc1a58f2f8467d95444fa4b37a0af27aeb45.1775951973.git.daniel@makrotopia.org>
	<871pgjnusl.fsf@bootlin.com> <adzL_tlZTntTVPD-@makrotopia.org>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Tue, 21 Apr 2026 09:32:02 +0200
Message-ID: <87pl3s7or1.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_003210_950732_39DD46FD 
X-CRM114-Status: GOOD (  16.68  )
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

SGkgRGFuaWVsLAoKPj4gPiBXaGVuIGEgQkJUIGVudHJ5IHN0cmFkZGxlcyBhbiB1bnNpZ25lZCBs
b25nIGJvdW5kYXJ5LCB0aGUgR0VOTUFTSyBpbgo+PiA+IG5hbmRkZXZfYmJ0X3NldF9ibG9ja19z
dGF0dXMoKSBjYW4gcG90ZW50aWFsbHkgb3ZlcmZsb3cgYmVjYXVzZQo+PiA+IG9mZnMgKyBiaXRz
X3Blcl9ibG9jayAtIDEgY2FuIHRoZW9yZXRpY2FsbHkgZXhjZWVkIEJJVFNfUEVSX0xPTkcgLSAx
Lgo+PiA+IENsYW1wIHRoZSBoaWdoIGJpdCBzbyBvbmx5IGJpdHMgd2l0aGluIHRoZSBjdXJyZW50
IHdvcmQgYXJlIG1hc2tlZC4KPj4gPiBUaGUgY3Jvc3Mtd29yZCBwb3J0aW9uIGlzIGFscmVhZHkg
aGFuZGxlZCBieSB0aGUgcG9zWzFdIGJsb2NrIGJlbG93Lgo+PiA+Cj4+ID4gRGlzY292ZXJlZCBi
eSBVQlNBTjogc2hpZnQtb3V0LW9mLWJvdW5kcyBpbgo+PiA+IGRyaXZlcnMvbXRkL25hbmQvYmJ0
LmM6MTE2OjEzCj4+ID4gc2hpZnQgZXhwb25lbnQgMTg0NDY3NDQwNzM3MDk1NTE2MTQgaXMgdG9v
IGxhcmdlIGZvciA2NC1iaXQgdHlwZQo+PiA+ICdsb25nIHVuc2lnbmVkIGludCcKPj4gCj4+IEhv
dyBsaWtlbHkgaXMgdGhhdD8gSXQgZG9lc24ndCBtYXR0ZXIgaG93IG1hbnkgYml0cyB5b3UgdXNl
IHBlciBibG9ja3MKPj4gKHRvZGF5IGlzIDIpLCBpdCB3b3VsZCByZXF1aXJlIGEgTkFORCBjaGlw
IHRoYXQgY292ZXJzIGFuIGVudGlyZSBjb3VudHJ5Cj4+IHRvIHJlYWNoIHRoYXQgbnVtYmVyIG9m
IGJsb2Nrcy4gSWYgYW4gYXR0YWNrZXIgcGxheXMgd2l0aCB0aGF0IHZhbHVlLAo+PiBkb2VzIGl0
IHJlYWxseSBtYXR0ZXI/IEFwYXJ0IGZyb20gd3JpdGluZyBvdXQgb2YgYm91bmRzIC13aGljaCBp
cwo+PiBwaHlzaWNhbGx5IGltcG9zc2libGUsIHdlIGFyZSBub3QgdGFsa2luZyBhYm91dCB2aXJ0
dWFsIG1lbW9yeSBoZXJlLSBhbmQKPj4gZ2V0IGFuIGVycm9yIGxhdGVyIG9uLCBJIGRvIG5vdCBz
ZWUgYSBnb29kIHJlYXNvbiBmb3IgdGhpcy4KPj4gCj4+IEhvbmVzdGx5LCBJIGZpbmQgdGhlIGZp
bmFsIHJlc3VsdCBtdWNoIGxlc3MgcmVhZGFibGUgdGhhbiBiZWZvcmUgZm9yIG5vCj4+IG9idmlv
dXMgYWRkZWQgdmFsdWUgSU1PLiBCdXQgbWF5YmUgSSBhbSBsb29raW5nIGF0IHRoaXMgdGhlIHdy
b25nIHdheT8KPgo+IEl0J3MganVzdCB0aGUgb25seSBVQlNBTiB3YXJuaW5nIEkgZ2V0IHRvIHNl
ZSBvbiBhIHJlY2VudCBrZXJuZWwgYW5kIG15Cj4gcHJpbWFyeSBnb2FsIGhlcmUgd2FzIHRvIG1h
a2UgdGhlIHdhcm5pbmcgZ28gYXdheS4gQWRkaW5nIGFuIGFzc2VydGlvbgo+IHRvIGVuc3VyZSAn
b2ZmcycgaXMgY2xhbXBlZCB0byB3aWxsIGxpa2VseSBhbHNvIG1ha2UgdGhlIHdhcm5pbmcgZ28K
PiBhd2F5LgoKSSBiZWxpZXZlIHRoYXQncyBhIG1vcmUgYXBwcm9wcmlhdGUgYXBwcm9hY2gsIGlm
IHlvdSBkb24ndCBtaW5kLgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFp
bGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbXRkLwo=
