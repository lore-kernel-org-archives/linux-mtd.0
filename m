Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8626C61DB4
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Aug 2026 09:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t+CQV2PL0fW8Z41MUA1o+4x3mDxiVZMqicwJZ9bOrLA=; b=SVnSnZ5qcYQHEC
	5H7dzMSqrNMt+5tQlmSJaCjGZhX+jj/qYv1+iuFp56hr/xil9UoKmYncsbd5zYuVHSUNScg6u+sY+
	jY0kW6YBhw72UDG+H6tHozG1ni+qVOogxPF9plcww7QixwJvpzgaQy/zkowJvzbMfYjXJXF7uGogs
	rJwnhN+XCiSigoXQoPPUrdxYLJwSHzrOs/DY48SnwdftbC0to8NfqgR9lDvXk/Wwgr05jShmcSmL8
	O3AsmJg8z6XTis6txt7oHok0IqnK7X25hVIICUcxMWayZ2V/oo6m8+OChUzuJSc/CPOkAMJoMJfek
	zMFJ0sR/0MWolIXKxplA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wynpi-00000000X7o-0tE0;
	Tue, 25 Aug 2026 09:52:42 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wynpf-00000000X7L-2bXJ
	for linux-mtd@lists.infradead.org;
	Tue, 25 Aug 2026 09:52:41 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 3BBB31A17E3;
	Tue, 25 Aug 2026 09:52:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0D410604C4;
	Tue, 25 Aug 2026 09:52:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 327B911C7A36B;
	Tue, 25 Aug 2026 11:52:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787651551; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=qAfIO28YCM1SmDmdE3IhwfvU1TDo5r74vGdtxfX7ZvI=;
	b=VY2F8g/iGVVqY7vf62k9QFFt5YfoEFmi/UUHQ0rdsl7993acOS0EVcvv2rKp+amOO2Hant
	Aa9Jbdsrw4XgqrC2p008HyzM/xp+Nrf66Eixq2emwwRSNxYJqycu5PCngm5/1hXnjFXLpI
	mkf9wtMN4Jjd2Nsba3W7g3QZo74Tb2PirZav0IIp0irWpmorQXPk76jz/N6FHvXO825hdd
	a8T4g5thq938EzOn0NpiNnwqnU3WLwRxWW7ctS4KOBhYjleyWTwxh9NwW1vjZf6qd7rKdQ
	GAe7ELolGFW9Ov0RvWTbZdGY+b+tDT1EUkzTj6sE3R3EbTtSC2LkX4FS0I+P9Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mehmet Fide <mehmet.fide@gmail.com>
Cc: Stefan Agner <stefan@agner.ch>,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>,  Mehmet Fide
 <mehmet.fide@screeningeagle.com>,  Boris Brezillon
 <bbrezillon@kernel.org>,  Frieder Schrempf <frieder.schrempf@kontron.de>,
  Edward Karpicz <webmaster@toradex.com>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  stable@vger.kernel.org
Subject: Re: [PATCH 1/2] mtd: rawnand: vf610_nfc: fix reads on chips with
 more than 64 bytes of OOB
In-Reply-To: <20260818114208.2780311-2-mehmet.fide@gmail.com> (Mehmet Fide's
	message of "Tue, 18 Aug 2026 13:42:07 +0200")
References: <20260818114208.2780311-1-mehmet.fide@gmail.com>
	<20260818114208.2780311-2-mehmet.fide@gmail.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Tue, 25 Aug 2026 11:52:27 +0200
Message-ID: <87mruail2c.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_025239_799839_F8465E59 
X-CRM114-Status: GOOD (  22.40  )
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

SGkgTWVobWV0LAoKT24gMTgvMDgvMjAyNiBhdCAxMzo0MjowNyArMDIsIE1laG1ldCBGaWRlIDxt
ZWhtZXQuZmlkZUBnbWFpbC5jb20+IHdyb3RlOgoKPiBGcm9tOiBNZWhtZXQgRmlkZSA8bWVobWV0
LmZpZGVAc2NyZWVuaW5nZWFnbGUuY29tPgo+Cj4gVGhlIGRyaXZlciBvbmx5IGltcGxlbWVudHMg
dGhlIDY0LWJ5dGUgT09CIGxheW91dCwgc28gYXR0YWNoX2NoaXAoKQo+IHNocmlua3MgbXRkLT5v
b2JzaXplIHdoZW4gdGhlIGNoaXAgcHJvdmlkZXMgbW9yZS4gCgpFaHIuLi4KCj4gVGhhdCBjbGFt
cCBkb2VzIG5vdAo+IHN1cnZpdmU6IG5hbmRfc2Nhbl90YWlsKCkgcnVucyBuYW5kZGV2X2luaXQo
KSBhZnRlciAtPmF0dGFjaF9jaGlwKCksIGFuZAo+IGl0IHJlc3RvcmVzIG10ZC0+b29ic2l6ZSBm
cm9tIHRoZSBtZW1vcnkgb3JnYW5pemF0aW9uLCB3aGljaCBzdGlsbCBob2xkcwo+IHRoZSB2YWx1
ZSBkZXRlY3RlZCBmcm9tIHRoZSBjaGlwLgoKSSBndWVzcyB0aGF0J3MgZXhwZWN0ZWQuCgo+IFRo
ZSBkcml2ZXIgdGhlcmVmb3JlIHRyYW5zZmVycyB3cml0ZXNpemUgKyB0aGUgY2hpcCdzIGZ1bGwg
T09CIHNpemUsIHNvCj4gdGhlIGhhcmR3YXJlIEVDQyBwYXJpdHkgZW5kcyB1cCBhdCBhIGRpZmZl
cmVudCBvZmZzZXQgdGhhbiB0aGUgbGF5b3V0IHRoZQo+IGNvbnRyb2xsZXIgd2FzIHNldCB1cCBm
b3IsIGFuZCBldmVyeSBFQ0MtcHJvdGVjdGVkIHJlYWQgZmFpbHMgd2l0aAo+IC1FQkFETVNHLgoK
VGhpcyBpcyBjbGVhcmx5IHRoZSBjb3JyZWN04oSiIHdheSA6KQoKPiBNZWFzdXJlZCBvbiBhIENv
bGlicmkgVkY2MSAoTVgzMExGNEcyOEFDLCAyMDQ4LWJ5dGUgcGFnZXMsIDExMiBieXRlcyBvZgo+
IE9PQik6IHdpdGggdGhlIGNsYW1wIGxvc3QsIFVCSSBjYW5ub3QgcmVhZCB0aGUgZXJhc2UgY291
bnRlciBoZWFkZXJzIG9mCj4gdGhlIHBhZ2VzIFUtQm9vdCBoYXMganVzdCB3cml0dGVuLCBhbmQg
dGhlIG9uLWZsYXNoIGJhZCBibG9jayB0YWJsZQo+IHdyaXR0ZW4gYnkgYW4gb2xkZXIga2VybmVs
IHJlYWRzIGJhY2sgd2l0aCBFQ0MgZXJyb3JzLCBzbyB0aGUgYm9hcmQgZG9lcwo+IG5vdCBib290
LiBLZXJuZWxzIGJlZm9yZSBjb21taXQgYTdhYjA4NWQ3YzE2ICgibXRkOiByYXduYW5kOiBJbml0
aWFsaXplCj4gdGhlIG5hbmRfZGV2aWNlIG9iamVjdCIpIGFyZSBub3QgYWZmZWN0ZWQgYmVjYXVz
ZSBub3RoaW5nIG92ZXJ3cm90ZSB0aGUKPiBjbGFtcCB0aGVyZSwgd2hpY2ggaXMgd2h5IHRoZSBz
YW1lIGNoaXAgd29ya3Mgd2l0aCBhIHY0LjQga2VybmVsIGFuZAo+IHdpdGggVS1Cb290LCB3aG9z
ZSBjb3B5IG9mIHRoaXMgZHJpdmVyIGhhcyBubyBtZW1vcnkgb3JnYW5pemF0aW9uIHRvCj4gcmVz
dG9yZSB0aGUgdmFsdWUgZnJvbS4gRWR3YXJkIEthcnBpY3ogcmVwb3J0ZWQgdGhhdCB0aGUgY2xh
bXAgbm8gbG9uZ2VyCj4gdGFrZXMgZWZmZWN0IG9uIHRoaXMgY2hpcDsgc2VlIHRoZSBsaW5rIGJl
bG93LgoKVGhpcyBjb21taXQgaXMgbm90IGluY29ycmVjdCwgd2hhdCB0aGUgZHJpdmVyIGRvZXMg
aXMgaW5jb3JyZWN0LCBhbmQKaXMgbm93IHVuZm9ydHVuYXRlbHkgdmlzaWJsZS4KCj4gQ2xhbXAg
dGhlIG1lbW9yeSBvcmdhbml6YXRpb24gYXMgd2VsbCBzbyB0aGUgZHJpdmVyJ3MgNjQtYnl0ZSBs
YXlvdXQKPiBzdGF5cyBpbiBlZmZlY3QsIGFuZCBsb2cgdGhlIHRydW5jYXRpb24gb25jZSwgYXMg
aXQgZGVjaWRlcyB3aGljaAo+IG9uLWZsYXNoIGxheW91dCB0aGUgc3lzdGVtIHVzZXMuCgpJdCBm
aXhlcyB0aGUgcHJvYmxlbSwgYnV0IGhvbmVzdGx5IG1vZGlmeWluZyB0aGUgbWVtb3JnIGlzIG5v
dApjb3JyZWN0LiBCcm9hZGNvbSBhbmQgbXBjNTEyMSBjb250cm9sbGVyIGRyaXZlcnMgZG8gaXQs
IGJ1dCB0aGF0J3MKbGlrZWx5IHdyb25nLgoKV2hhdCB5b3UgcmVwb3J0IGhlcmUgaXMgYSBVLUJv
b3QgaXNzdWUuIFRoZSBjaGlwcyBoYXMgbW9yZSB0aGFuIDY0IE9PQgpieXRlcywgVS1ib290IGNs
YW1wcyB0aGF0IHZhbHVlLCBMaW51eCBkb2VzIG5vdC4gVS1ib290IGlzIHdyb25nLiBCdXQgSQpn
dWVzcyBpdCdzIG5vdyB0b28gbGF0ZSBhbmQgeW91J2xsIHRlbGwgbWUgbWFueSBkZXZpY2VzIGlu
IHRoZSBmaWVsZAphbHJlYWR5IHVzZSB0aGlzIGJyb2tlbiBsYXlvdXQ/CgpJbiB0aGlzIGNhc2Us
IG1heWJlIHlvdSBzaG91bGQganVzdCBjaGFuZ2UgdGhlIGxheW91dCwgaW5zdGVhZCBvZgpmb3Jj
aW5nIGFuIG9idmlvdXNseSBpbmNvcnJlY3QgbWVtb3J5IGxheW91dC4gSW4gdGhpcyBkcml2ZXIg
dGhlIGxhcmdlCnBhZ2UgZ2VuZXJpYyBPT0IgbGF5b3V0ICh3aGljaCBwdXRzIHRoZSBFQ0MgYnl0
ZXMgYXQgdGhlIGVuZCkgaXMgdXNlZC4gSQpndWVzcyBhIGJldHRlciBhcHByb2FjaCBjb3VsZCBi
ZSB0byBtYWtlIHlvdXIgb3duIDY0LWJ5dGUgY2xhbXBlZCBPT0IKbGF5b3V0IGZvciBiYWNrd2Fy
ZCBjb21wYXRpYmlsaXR5LiBZb3Ugc2hvdWxkIGRyb3AgdGhlIG9vYnNpemUKbW9kaWZpY2F0aW9u
IGFzIHdlbGwuCgo+IFJlcG9ydGVkLWJ5OiBFZHdhcmQgS2FycGljeiA8d2VibWFzdGVyQHRvcmFk
ZXguY29tPgo+IExpbms6IGh0dHBzOi8vY29tbXVuaXR5LnRvcmFkZXguY29tL3QvY29saWJyaS12
ZjUwLXZmNjEtb24tdGhlLWN1cnJlbnQtYnNwLW1haW5saW5lLXUtYm9vdC12MjAyNi0wNy1hbmQt
bGludXgtNi0xOC1sdHMvMzA3MzUKPiBGaXhlczogYTdhYjA4NWQ3YzE2ICgibXRkOiByYXduYW5k
OiBJbml0aWFsaXplIHRoZSBuYW5kX2RldmljZSBvYmplY3QiKQo+IENjOiBzdGFibGVAdmdlci5r
ZXJuZWwub3JnCj4gU2lnbmVkLW9mZi1ieTogTWVobWV0IEZpZGUgPG1laG1ldC5maWRlQHNjcmVl
bmluZ2VhZ2xlLmNvbT4KClRoZXJlIGlzIGF0IGxlYXN0IG9uZSBsZWdpdGltYXRlIFNhc2hpa28g
d2FybmluZyBvbiB0aGlzIHBhdGNoLCBjYW4geW91CnBsZWFzZSBhbHNvIGNoZWNrIGl0PwoKVGhh
bmtzIQpNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
