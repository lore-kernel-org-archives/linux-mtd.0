Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FBA0606A328
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Nov 2026 04:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=H+qVpbsU;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Fd3/8wLb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=UqH+nhpTjOjO99mLgPfo2YIABPTIfDgvfeteenA8UCU=; b=H+qVpbsUECKCrOy06KJ0R/xMiT
	sL/KCM0Bmrze9fpfGG/vUUKoi7pB++nbYVDPnyH/CS5TBv6cD+QhZAT7rB95qHnYg6MedNLyipyNU
	UVbCPzfYSjisB3kWFG6c4nYOkuhVfaomjncTIy2i+CHuXpOao4AXTXcLYLfv3smFQku5vaHa+sE6k
	rwPr5+4F+4FPBYgBwBEVRMUqXyOSP4n3uAGE+BzobkLrOda7xwcaKRGXjyrIqp6xNdWG2pDoBMNW4
	e7wNQOGuoPGAUriPFxtWGQC4QkukiJEfWYEhDvIBCH0OhhKlEX74MrBBv79AnVLjopm2VRCFJ8se9
	4UgJBfOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOooW-00000007kN2-2jgW;
	Thu, 05 Nov 2026 04:11:00 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOooV-00000007kMt-0pk2
	for linux-mtd@lists.infradead.org;
	Thu, 05 Nov 2026 04:10:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5F33A601DE;
	Thu,  5 Nov 2026 04:10:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4B381F000C1;
	Thu,  5 Nov 2026 04:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793851858;
	bh=Xes1+X/qi6GRSAiogOoY8FMtp2mJblm72NreviMpcnk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Fd3/8wLbljI9UoHRWqY0DmTF0Bx2Th2srJIIySPUlmuMlgvf1QYr4OpkGHIPyo4OX
	 7Sqisp0/zHpxkEDWp2qr1De8IuBgst31pJkRSf4T/ZwczEXRXjOHms5xDxsQuFBD4k
	 p60nF5mQQ3W95wxi1m6A0gUPk1n6zkTW+GjysNKctuqfuLLPnUKDStihAKkczmZHFU
	 cDxqVBD9bzplzYDU3RQr2LAePaAyf0e+dfHW27h0qIlmZ4EhDqA5G3GqzSgWo9Zznf
	 IXJ49b8u312v9WOjLIMwjP29cejyGfkoFVWSPrMeb+PJIzmijBdRzJq532dUuR3nkN
	 WxIkI18wN+7Ow==
Message-ID: <sashiko-outbox-198542@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] mtd: rawnand: ingenic: validate BCH error index in
 jz4725b_correct()
To: "Guanglei Zhu" <zhugl3@xiaopeng.com>, "Paul Cercueil" <paul@crapouillou.net>, "Harvey
 Hunt" <harveyhuntnexus@gmail.com>, "Miquel Raynal" <miquel.raynal@bootlin.com>
Cc: "Richard Weinberger" <richard@nod.at>, "Vignesh Raghavendra" <vigneshr@ti.com>, linux-mtd@lists.infradead.org, "Weibin
 Liu" <liuwb@xiaopeng.com>
In-Reply-To: <20261105040153.66597-1-zhugl3@xiaopeng.com>
References: <20261105040153.66597-1-zhugl3@xiaopeng.com>
Date: Thu, 05 Nov 2026 04:10:56 +0000
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Reply-To: sashiko-reviews@lists.linux.dev
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIG10ZDogcmF3bmFuZDog
aW5nZW5pYzogano0NzI1Yl9jb3JyZWN0KCkgcmVqZWN0cyBwYXJpdHkgYml0ZmxpcHMgd2l0aCAt
RUJBRE1TRwotLQoKY29tbWl0IDJlYzZmMWNkYmRhNzEzN2Q1NmJkYTkwYzFkNDIyYWQ4Zjk1NWQx
ZGYKQXV0aG9yOiBXZWliaW4gTGl1IDxsaXV3YkB4aWFvcGVuZy5jb20+CgptdGQ6IHJhd25hbmQ6
IGluZ2VuaWM6IHZhbGlkYXRlIEJDSCBlcnJvciBpbmRleCBpbiBqejQ3MjViX2NvcnJlY3QoKQoK
VGhpcyBjb21taXQgYWRkcyBhIGJvdW5kcyBjaGVjayBvbiB0aGUgZGVjb2RlZCBiaXQgZXJyb3Ig
aW5kZXggaW4Kano0NzI1Yl9jb3JyZWN0KCkgdG8gcHJldmVudCB3cml0aW5nIHBhc3QgdGhlIGVu
ZCBvZiB0aGUgZGF0YSBidWZmZXIgd2hlbiB0aGUKQkNIIGNvbnRyb2xsZXIgcmVwb3J0cyBhbiBp
bmRleCA+PSBwYXJhbXMtPnNpemUgKiA4LCByZXR1cm5pbmcgLUVCQURNU0cKaW5zdGVhZC4KCj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L2luZ2VuaWMvano0NzI1Yl9iY2guYyBi
L2RyaXZlcnMvbXRkL25hbmQvcmF3L2luZ2VuaWMvano0NzI1Yl9iY2guYwo+IGluZGV4IDJkMGUw
YTIxOTJhZTQuLjcyN2YxMzVmMzgxZTQgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9y
YXcvaW5nZW5pYy9qejQ3MjViX2JjaC5jCj4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvaW5n
ZW5pYy9qejQ3MjViX2JjaC5jCj4gQEAgLTI1OSw2ICsyNTksMTEgQEAgc3RhdGljIGludCBqejQ3
MjViX2NvcnJlY3Qoc3RydWN0IGluZ2VuaWNfZWNjICpiY2gsCj4gIAkJCWJpdCA9IChyZWcgJiBC
Q0hfQkhFUlJfSU5ERVgwX01BU0spID4+IEJDSF9CSEVSUl9JTkRFWDBfU0hJRlQ7Cj4gIAkJfQo+
ICAKPiArCQlpZiAoYml0ID49IHBhcmFtcy0+c2l6ZSAqIDgpIHsKPiArCQkJcmV0ID0gLUVCQURN
U0c7Cj4gKwkJCWdvdG8gb3V0Owo+ICsJCX0KCltTZXZlcml0eTogSGlnaF0KRG9lcyByZXR1cm5p
bmcgLUVCQURNU0cgd2hlbiBiaXQgPj0gcGFyYW1zLT5zaXplICogOCBjYXVzZSB2YWxpZCBwYWdl
cyB3aXRoIGEKY29ycmVjdGFibGUgYml0ZmxpcCBpbiB0aGUgT09CIEVDQyBwYXJpdHkgYnl0ZXMg
dG8gZmFpbCB3aXRoIGFuIHVuY29ycmVjdGFibGUKRUNDIGVycm9yPwoKSW4gano0NzI1Yl9iY2hf
cmVzZXQoKSwgdGhlIGhhcmR3YXJlIGRlY29kZSBjb3VudCBpcyBwcm9ncmFtbWVkIHRvIGNvdmVy
IGJvdGgKdGhlIGRhdGEgYXJlYSBhbmQgdGhlIEVDQyBwYXJpdHkgYXJlYToKCmRyaXZlcnMvbXRk
L25hbmQvcmF3L2luZ2VuaWMvano0NzI1Yl9iY2guYzpqejQ3MjViX2JjaF9yZXNldCgpIHsKCS4u
LgoJcmVnID0gcGFyYW1zLT5zaXplIDw8IEJDSF9CSENOVF9FTkNfQ09VTlRfU0hJRlQ7CglyZWcg
fD0gKHBhcmFtcy0+c2l6ZSArIHBhcmFtcy0+Ynl0ZXMpIDw8IEJDSF9CSENOVF9ERUNfQ09VTlRf
U0hJRlQ7Cgl3cml0ZWwocmVnLCBiY2gtPmJhc2UgKyBCQ0hfQkhDTlQpOwoJLi4uCn0KCkFuZCBq
ejQ3MjViX2NvcnJlY3QoKSBmZWVkcyBib3RoIGJ1ZiBhbmQgZWNjX2NvZGUgaW50byB0aGUgQkNI
IGVuZ2luZSBhcyBhCnNpbmdsZSBjb2Rld29yZCBvZiAocGFyYW1zLT5zaXplICsgcGFyYW1zLT5i
eXRlcykgKiA4IGJpdHM6Cgpkcml2ZXJzL210ZC9uYW5kL3Jhdy9pbmdlbmljL2p6NDcyNWJfYmNo
LmM6ano0NzI1Yl9jb3JyZWN0KCkgewoJLi4uCglqejQ3MjViX2JjaF93cml0ZV9kYXRhKGJjaCwg
YnVmLCBwYXJhbXMtPnNpemUpOwoJano0NzI1Yl9iY2hfd3JpdGVfZGF0YShiY2gsIGVjY19jb2Rl
LCBwYXJhbXMtPmJ5dGVzKTsKCS4uLgp9CgpXaGVuIGEgbm9ybWFsLCBjb3JyZWN0YWJsZSBiaXRm
bGlwIG9jY3VycyBvbiBmbGFzaCB3aXRoaW4gdGhlIEVDQyBwYXJpdHkgYnl0ZXMKdGhlbXNlbHZl
cywgdGhlIGhhcmR3YXJlIHJlcG9ydHMgYSBiaXQgaW5kZXggaW4gdGhlIHJhbmdlCltwYXJhbXMt
PnNpemUgKiA4LCAocGFyYW1zLT5zaXplICsgcGFyYW1zLT5ieXRlcykgKiA4KSB3aXRob3V0IHNl
dHRpbmcKQkNIX0JISU5UX1VOQ09SLgoKV2l0aCB0aGlzIGNoZWNrLCBhIGJpdGZsaXAgaW4gdGhl
IHBhcml0eSByZWdpb24gY2F1c2VzIGp6NDcyNWJfY29ycmVjdCgpIHRvCmFib3J0IHRoZSBjb3Jy
ZWN0aW9uIGxvb3AgZWFybHkgKHBvdGVudGlhbGx5IGxlYXZpbmcgcmVtYWluaW5nIGRhdGEgYml0
ZmxpcHMKaW4gbGF0ZXIgQkNIX0JIRVJSbiBlbnRyaWVzIHVuY29ycmVjdGVkKSBhbmQgcmV0dXJu
IC1FQkFETVNHIHRvCmluZ2VuaWNfbmFuZF9lY2NfY29ycmVjdCgpLCBpbmNyZW1lbnRpbmcgbXRk
LT5lY2Nfc3RhdHMuZmFpbGVkLgoKU2hvdWxkIGJpdCBpbmRpY2VzIGluIHRoZSBwYXJpdHkgcmVn
aW9uIHNpbXBseSBza2lwIG1vZGlmeWluZyBidWYgKHdoaWxlIHN0aWxsCmNvdW50aW5nIHRoZSBi
aXRmbGlwIG9yIGNvbnRpbnVpbmcgdGhlIGxvb3AsIHNpbWlsYXIgdG8gano0NzQwX2VjY19jb3Jy
ZWN0KCkpLApvciBvbmx5IHJldHVybiAtRUJBRE1TRyBpZiBiaXQgPj0gKHBhcmFtcy0+c2l6ZSAr
IHBhcmFtcy0+Ynl0ZXMpICogOD8KCi0tIApTYXNoaWtvIEFJIHJldmlldyDCtyBodHRwczovL3Nh
c2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjExMDUwNDAxNTMuNjY1OTctMS16aHVnbDNAeGlhb3Bl
bmcuY29tP3BhcnQ9MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
