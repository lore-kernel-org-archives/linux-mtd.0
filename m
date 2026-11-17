Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 573B4606A8A4
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Nov 2026 10:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=il6ADV/k;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=QxWe2OfE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=4mHH/iFj160/JyGuCIKX8iwTVpipXoAkluWt3xxIlmE=; b=il6ADV/kddII8QeyhHgGypejF7
	eZZpfMPiwztI+DYVx+KEz65mnBaNpnLc9OstBzKG8/JWyXDwu70g9Mc8lAy9KjFmxDf+BrA4CELLL
	pg2cyRJbBBbSqUr0W0bn5o7KTDn13yyBLVwn55cMTvZMcnMbYu00meeTiJ0q5sGnSvwz+ZYxBYX2a
	4/8UD3XywVIqJprhCGCXijlo0qBVo1OdepO/weGJGFH9mCxJSoTH6avmtGg5mbbNpMUCzD8/p+FNw
	TRcRCnmI0akI1Cq/QeDrnkMk02q1vJsnlik+0xB8x87nJr6oGTh1ScDEab+cKZwGfBQFXTobA2bQ9
	uuK9tSGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTGX7-00000005HXx-1V8B;
	Tue, 17 Nov 2026 10:35:25 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTGX4-00000005HXE-0fPV
	for linux-mtd@lists.infradead.org;
	Tue, 17 Nov 2026 10:35:24 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 4F3571A15C0;
	Tue, 17 Nov 2026 10:35:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 22AF95FC81;
	Tue, 17 Nov 2026 10:35:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5EFD811BC0617;
	Tue, 17 Nov 2026 11:35:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794911719; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ozaSRCF3ns3TdfwuqLcS/RvJouUC669txRlTVKR2W6g=;
	b=QxWe2OfEZduMRFK8iuJ33wTHUQ31LgA/8plpVXIdkJj9bJfw1hlcJqXj/gpxFHc4L6QGib
	qBT8M8dB+F8A3trB+m9QhZMc7lOUi8iQ4U48NwGMllM7kRHJJJOXX83M5MB8BLTVIXoPQN
	5ykuzy6jHRSrt61HMhQc/4IPwp+L6B1R5lDh94vanFbnT+J9hip+hSjzMRx1+SJ/1j6Wkz
	v1L3Zl96OQtHZGuOEioBMNev/Lok6dlt5D59cctVeNvMfkT3iYzEhlW8hBxJ4WeFfXJQia
	1pBAcP2svtfVac06AUvQ5AOqR33SBOB9+zWsgeoRpaEUCvF5vWh6zHBTiNZrkQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Simon Wunderlich <sw@simonwunderlich.de>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  linux-mtd@lists.infradead.org,  Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor
 Dooley <conor+dt@kernel.org>,  devicetree@vger.kernel.org,  Thomas
 Bogendoerfer <tsbogend@alpha.franken.de>,  linux-mips@vger.kernel.org,
  Hauke Mehrtens <hauke@hauke-m.de>,  Aleksander Jan Bajkowski
 <olek2@wp.pl>,  John Crispin <john@phrozen.org>,  Sebastien Decourriere
 <sebtx452@gmail.com>,  Yangtao Li <frank.li@vivo.com>,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] dt-bindings: mtd: Add lantiq,nor
In-Reply-To: <20261114100608.3432120-3-sw@simonwunderlich.de> (Simon
	Wunderlich's message of "Sat, 14 Nov 2026 11:06:04 +0100")
References: <20261114100608.3432120-1-sw@simonwunderlich.de>
	<20261114100608.3432120-3-sw@simonwunderlich.de>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Tue, 17 Nov 2026 11:35:13 +0100
Message-ID: <87fqwzn3tq.fsf@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_023522_778205_E8CE4B5B 
X-CRM114-Status: GOOD (  16.34  )
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

SGkgU2ltb24sCgpPbiAxNC8xMS8yMDI2IGF0IDExOjA2OjA0ICswMSwgU2ltb24gV3VuZGVybGlj
aCA8c3dAc2ltb253dW5kZXJsaWNoLmRlPiB3cm90ZToKCj4gVGhlIE5PUiBmbGFzaCBvbiB0aGUg
RXh0ZXJuYWwgQnVzIFVuaXQgKEVCVSkgb2YgTGFudGlxIFNvQ3MgaXMgaGFuZGxlZAo+IGJ5IHRo
ZSBsYW50aXEtZmxhc2ggZHJpdmVyIGFuZCB1c2VkIGJ5IGRhbnViZV9lYXN5NTA3MTIuZHRzLCBi
dXQgaXRzCj4gYmluZGluZyB3YXMgbmV2ZXIgZG9jdW1lbnRlZC4KPgo+IEFkZCBhIHNjaGVtYSBm
b3IgaXQsIGluY2x1ZGluZyBhIG5ldyBvcHRpb25hbCBsYW50aXEsZWJ1LXN3YXAtY2hlY2sKPiBw
cm9wZXJ0eS4gU29tZSBib290IGxvYWRlcnMsIGxpa2UgdGhlIEJPU1MgYm9vdG1vbml0b3Igb24g
dGhlIGJpbnRlYwo+IGVsbWVnIFJTMTIzIGFuZCBSUzM1MywgZW5hYmxlIHRoZSBFQlUncyBvd24g
ZW5kaWFubmVzcyBzd2FwcGluZyBmb3IgdGhlCj4gZmxhc2ggY2hpcCBzZWxlY3QgKEVCVV9CVVND
T04wIGJpdCAzMCksIGFuZCB0aGUgZmxhc2ggdGhlbiBhcHBlYXJzIGF0Cj4gaXRzIHVuc3dhcHBl
ZCBhZGRyZXNzZXMuIFdoZXRoZXIgdGhhdCBiaXQgY2FuIGJlIHRydXN0ZWQgZGVwZW5kcyBvbiB0
aGUKPiBTb0M6IGl0IG9ubHkgd29ya3Mgb24gVlI5ICh4UlgyMDApIGZyb20gcmV2aXNpb24gMS4y
IGFuZCBvbiBBUjEwCj4gKHhSWDMwMCksIGFuZCBGYWxjb24gaGFzIG5vIHN1Y2ggcmVnaXN0ZXIu
IEEgYm9hcmQgcHJvcGVydHkgaW5zdGVhZCBvZgo+IGEgbGlzdCBvZiBTb0MgcmV2aXNpb25zIGlu
IHRoZSBkcml2ZXIgd2FzIHJlcXVlc3RlZCBpbiB0aGUgcmV2aWV3IG9mIGFuCj4gZWFybGllciBh
dHRlbXB0IGF0IHRoaXMuIFRoZSBwcm9wZXJ0eSBkb2VzIG5vdCBzdGF0ZSB0aGUgYml0J3MgdmFs
dWUsCj4gc28gYSBib2FyZCBrZWVwcyB3b3JraW5nIHdpdGggZWl0aGVyIGJvb3QgbG9hZGVyIHNl
dHRpbmcuCj4KPiBMaW5rOiBodHRwczovL2xpc3RzLmluZnJhZGVhZC5vcmcvcGlwZXJtYWlsL2xp
bnV4LW10ZC8yMDE3LUphbnVhcnkvMDcxNzQ5Lmh0bWwKPiBMaW5rOiBodHRwczovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvcGlwZXJtYWlsL2xpbnV4LW10ZC8yMDE3LUphbnVhcnkvMDcxODE4Lmh0bWwK
PiBTaWduZWQtb2ZmLWJ5OiBTaW1vbiBXdW5kZXJsaWNoIDxzd0BzaW1vbnd1bmRlcmxpY2guZGU+
CgpMZXQncyBiZSBob25lc3QsIEkgYW0gbm90IHZlcnkgZmFtaWxpYXIgd2l0aCB0aGF0IE1URCBh
cmVhIGFuZCBhbGwgdGhlCmxlZ2FjeSBjb250ZW50IGlzIGhhcywgYnV0IHdvdWxkIGl0IGJlIGEg
bG90IG1vcmUgd29yayB0byBhZGQgbGFudGlxIGFzCmEgcGh5c21hcCB2YXJpYW50PyBJIGRvbid0
IGxpa2UgbXVjaCB0aGUgZmFjdCB0aGF0IHlvdSBkZXNjcmliZSB0aGUKZmxhc2ggd2l0aG91dCBk
ZXNjcmliaW5nIHRoZSBFQlUuIFBoeXNtYXAgdmVyc2lvbnMgdHlwaWNhbGx5IGFyZSBtYXRjaGVk
CnVzaW5nIHRoZSBtb3JlIHNwZWNpZmljIGNvbXBhdGlibGUgKGxhbnRpcSxlYnU/KSBhbmQgdGhl
IGNmaS1mbGFzaApmYWxsYmFjay4gQWxsIHlvdXIgdHdlYWtzIGFyZSBFQlUvbWFjaGluZS9pbnRl
Z3JhdGlvbiBkZXRhaWxzLCBub3QKcmVsYXRlZCB0byB0aGUgZmxhc2ggaXRzZWxmLgoKT25lIGNv
bnNlcXVlbmNlIG9mIG5vdCBtb2RlbGluZyB0aGUgY29udHJvbGxlciBpcyB5b3VyIG5lZWQgZm9y
CkVYUE9SVF9TWU1CT0xfR1BMKGx0cV9lYnVfbWVtYmFzZSkgaW4gcGF0Y2ggMy81LCB3aGljaCBp
cyBxdWl0ZSBhIGhhY2suCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWls
aW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1tdGQvCg==
