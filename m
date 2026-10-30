Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2619606A339
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Oct 2026 16:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xQ5dyBIZ;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IjvECOsR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=PnOqwRMeYmp6yvMFRl49Ma+GWNaSajmVebt1So43oqE=; b=xQ5dyBIZPnQukS/RwuR66PV1Ud
	R884KMazG2HNtVzdpxeR16+Bj+72IZDqfcWvrTazuwEIhNWKk3EzGp5EN25Pmib54kaiue9Kxw43A
	XBX0Jyguk2iv7czFak9LF3sESbiHGsnSd+lXVoV4TBqbFQqLHAXjNGgCcN5X/0X9xJaeQ48UiVNkF
	IyZq9hoZ5qtB7HUa61huOKScQWdioAk7+7y4/ylJSIG/Fb+YZPHsUK6jaPv+9Rnp26RXvMtkFfMLz
	04yTh3im7X+AupIdj0wQscU1/P+erseRPYYcjDkrzw9Ivdu9zqVH9BzoEuI7+9PUIUkwJWTinRsZZ
	fEs450kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMpB2-0000000C5gp-1eD3;
	Fri, 30 Oct 2026 16:10:00 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMpB1-0000000C5ep-1vFt
	for linux-mtd@lists.infradead.org;
	Fri, 30 Oct 2026 16:09:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E1EDB602CA;
	Fri, 30 Oct 2026 16:09:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 166301F00A15;
	Fri, 30 Oct 2026 16:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793376598;
	bh=4f6c50MfKRylF6izNPl1SWtjUxb1UX+AC8qxKNq77dA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IjvECOsR6+cnwW+krKeqX6TWhRgnEw9YrQrOV40dgHGPIARR3NcGCDrCO8QmiyCTp
	 NU4YH/77lOTvaxi5pAjiJbATh+MA87TeI//mtDuR3M15qQBq6MLFYWpjzkg7cxNo1F
	 RDP4/uHtg6C/SfjJE5m0lya+LI8G6mipsibVliUbT+rLKJrjEn0q7YFtOAlR/+WNBG
	 gugCjVV7pCiYzTEAEgZfKDnxClW6QVjCbSHi4iZF/94oRuVLUfJlL+fWm3B7TWhHQN
	 3zSPIyAuaDdvu2VVfvm2KPlCyUdQxO973uAa2inK4Tl4yKoomQIlqFcssrisdcSKAH
	 aJMmtl3Xtmedg==
Message-ID: <sashiko-outbox-191230@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 11/34] hfs: don't set SB_RDONLY after MDB write
 errors
To: "Christian Brauner" <brauner@kernel.org>, "Jan Kara" <jack@suse.com>
Cc: "Al Viro" <viro@zeniv.linux.org.uk>, linux-ext4@vger.kernel.org, linux-mm@kvack.org, linux-efi@vger.kernel.org, linux-mtd@lists.infradead.org, "Viacheslav
 Dubeyko" <slava@dubeyko.com>, dsterba@suse.cz, tytso@mit.edu, "Mark Fasheh" <mark@fasheh.com>, "Joel
 Becker" <jlbec@evilplan.org>, "Joseph Qi" <joseph.qi@linux.alibaba.com>
In-Reply-To: <20261029-work-fs-sb_rdonly-v2-11-2f44f64f0b66@kernel.org>
References: <20261029-work-fs-sb_rdonly-v2-0-2f44f64f0b66@kernel.org>
 <20261029-work-fs-sb_rdonly-v2-11-2f44f64f0b66@kernel.org>
Date: Fri, 30 Oct 2026 16:09:57 +0000
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW01lZGl1bV0gaGZzOiBoZnNfZmls
ZV90cnVuY2F0ZSgpIGVhcmx5IHJldHVybiBsZWF2ZXMgaW4tbWVtb3J5IGlub2RlIHNpemVzIGlu
Y29uc2lzdGVudAotLQoKY29tbWl0IGE2ZTc0M2YwNmFmOWVkYjU5ZDk0MzY3Y2MxODliYmRiNWI4
YmQ4ODMKQXV0aG9yOiBDaHJpc3RpYW4gQnJhdW5lciA8YnJhdW5lckBrZXJuZWwub3JnPgoKaGZz
OiBkb24ndCBzZXQgU0JfUkRPTkxZIGFmdGVyIE1EQiB3cml0ZSBlcnJvcnMKCkluc3RlYWQgb2Yg
c2V0dGluZyBTQl9SRE9OTFkgd2l0aG91dCBob2xkaW5nIHNfdW1vdW50IHdoZW4gYW4gTURCIHdy
aXRlIGZhaWxzLAp0aGlzIGNvbW1pdCByZWNvcmRzIHRoZSBlcnJvciBpbiBhIG5ldyBIRlNfRkxH
X0VNRVJHRU5DWV9STyBmbGFnIGFuZCByZWplY3RzCnN1YnNlcXVlbnQgZmlsZXN5c3RlbSBtb2Rp
ZmljYXRpb25zIHdpdGggRVJPRlMuCgo+IGRpZmYgLS1naXQgYS9mcy9oZnMvZXh0ZW50LmMgYi9m
cy9oZnMvZXh0ZW50LmMKPiBpbmRleCAyNjM1NzA4NjUxN2ZjLi5kYWNmN2NlMWZmZTRhIDEwMDY0
NAo+IC0tLSBhL2ZzL2hmcy9leHRlbnQuYwo+ICsrKyBiL2ZzL2hmcy9leHRlbnQuYwoKWyAuLi4g
XQoKPiBAQCAtNDkxLDYgKzQ5NCw4IEBAIHZvaWQgaGZzX2ZpbGVfdHJ1bmNhdGUoc3RydWN0IGlu
b2RlICppbm9kZSkKPiAgCWhmc19kYmcoImlubyAlbGx1LCBwaHlzX3NpemUgJWxsdSAtPiBpX3Np
emUgJWxsdVxuIiwKPiAgCQlpbm9kZS0+aV9pbm8sIChsb25nIGxvbmcpSEZTX0koaW5vZGUpLT5w
aHlzX3NpemUsCj4gIAkJaW5vZGUtPmlfc2l6ZSk7Cj4gKwlpZiAodW5saWtlbHkoaGZzX2VtZXJn
ZW5jeV9ybyhzYikpKQo+ICsJCXJldHVybjsKPiAgCWlmIChpbm9kZS0+aV9zaXplID4gSEZTX0ko
aW5vZGUpLT5waHlzX3NpemUpIHsKPiAgCQlzdHJ1Y3QgYWRkcmVzc19zcGFjZSAqbWFwcGluZyA9
IGlub2RlLT5pX21hcHBpbmc7Cj4gIAkJdm9pZCAqZnNkYXRhID0gTlVMTDsKCltTZXZlcml0eTog
TWVkaXVtXQpDYW4gcmV0dXJuaW5nIGF0IHRoZSB0b3Agb2YgaGZzX2ZpbGVfdHJ1bmNhdGUoKSBp
biBmcy9oZnMvZXh0ZW50LmMgbGVhdmUKaW4tbWVtb3J5IGlub2RlIHNpemUgbWV0YWRhdGEgaW5j
b25zaXN0ZW50IHdoZW4gSEZTX0ZMR19FTUVSR0VOQ1lfUk8gKG9yClNCX1NUQVRFX0VNRVJHRU5D
WV9STyBpbiB0aGUgZm9sbG93LXVwIGNvbW1pdCAiaGZzOiB1c2UgdGhlIGdlbmVyaWMKZW1lcmdl
bmN5IHJlYWQtb25seSBzdGF0ZSIpIGlzIHNldCBjb25jdXJyZW50bHkgYnkgdGhlIG1kYl93b3Jr
IHdvcmtlciBvcgpzeW5jX2ZzKCk/CgpGaXJzdCwgaW4gdGhlIGV4cGFuZGluZyB0cnVuY2F0ZSBw
YXRoIHZpYSBoZnNfaW5vZGVfc2V0YXR0cigpIGluCmZzL2hmcy9pbm9kZS5jIChvciBub3RpZnlf
Y2hhbmdlKCkgaW4gdGhlIGZvbGxvdy11cCBjb21taXQpOgoKICAgIGlmICgoYXR0ci0+aWFfdmFs
aWQgJiBBVFRSX1NJWkUpICYmCiAgICAgICAgYXR0ci0+aWFfc2l6ZSAhPSBpX3NpemVfcmVhZChp
bm9kZSkpIHsKICAgICAgICAgICAgaW5vZGVfZGlvX3dhaXQoaW5vZGUpOwoKICAgICAgICAgICAg
ZXJyb3IgPSBpbm9kZV9uZXdzaXplX29rKGlub2RlLCBhdHRyLT5pYV9zaXplKTsKICAgICAgICAg
ICAgaWYgKGVycm9yKQogICAgICAgICAgICAgICAgICAgIHJldHVybiBlcnJvcjsKCiAgICAgICAg
ICAgIHRydW5jYXRlX3NldHNpemUoaW5vZGUsIGF0dHItPmlhX3NpemUpOwogICAgICAgICAgICBo
ZnNfZmlsZV90cnVuY2F0ZShpbm9kZSk7CgpJZiBIRlNfRkxHX0VNRVJHRU5DWV9STyBpcyBzZXQg
YWZ0ZXIgdGhlIGluaXRpYWwgcmVhZC1vbmx5IGNoZWNrIChmb3IKZXhhbXBsZSwgd2hpbGUgd2Fp
dGluZyBpbiBpbm9kZV9kaW9fd2FpdCgpKSwgdHJ1bmNhdGVfc2V0c2l6ZSgpIHVwZGF0ZXMKaW5v
ZGUtPmlfc2l6ZSBhbmQgdGhlbiBoZnNfZmlsZV90cnVuY2F0ZSgpIHJldHVybnMgZWFybHkgYmVm
b3JlIHJlYWNoaW5nCnRoZSBleHBhbnNpb24gYmxvY2s6CgogICAgaWYgKGlub2RlLT5pX3NpemUg
PiBIRlNfSShpbm9kZSktPnBoeXNfc2l6ZSkgewogICAgICAgICAgICAuLi4KICAgICAgICAgICAg
cmVzID0gaGZzX3dyaXRlX2JlZ2luKE5VTEwsIG1hcHBpbmcsIHNpemUgKyAxLCAwLCAmZm9saW8s
CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAmZnNkYXRhKTsKICAgICAgICAgICAgLi4uCiAg
ICAgICAgICAgIGlmIChyZXMpCiAgICAgICAgICAgICAgICAgICAgaW5vZGUtPmlfc2l6ZSA9IEhG
U19JKGlub2RlKS0+cGh5c19zaXplOwogICAgICAgICAgICByZXR1cm47CiAgICB9CgpXaXRob3V0
IHRoZSBlYXJseSByZXR1cm4sIGhmc193cml0ZV9iZWdpbigpIGZhaWxzIHdpdGggLUVST0ZTIGFu
ZCByZXZlcnRzCmlub2RlLT5pX3NpemUgYmFjayB0byBIRlNfSShpbm9kZSktPnBoeXNfc2l6ZS4g
V2l0aCB0aGUgZWFybHkgcmV0dXJuLApoZnNfaW5vZGVfc2V0YXR0cigpIHN1Y2NlZWRzIHdpdGgg
aW5vZGUtPmlfc2l6ZSBsYXJnZXIgdGhhbgpIRlNfSShpbm9kZSktPnBoeXNfc2l6ZSBhbmQgSEZT
X0koaW5vZGUpLT5mc19ibG9ja3MsIGNhdXNpbmcgc3Vic2VxdWVudApidWZmZXJlZCByZWFkcyB2
aWEgaGZzX3JlYWRfZm9saW8oKSAtPiBibG9ja19yZWFkX2Z1bGxfZm9saW8oKSAtPgpoZnNfZ2V0
X2Jsb2NrKCkgdG8gc2VlIHVuYWxsb2NhdGVkIGJsb2NrcyBhbmQgcmV0dXJuIHplcm8tZmlsbGVk
IHBhZ2VzIHVwCnRvIHRoZSBuZXcgaW5vZGUtPmlfc2l6ZS4KClNlY29uZCwgd2hlbiBhbiBleHRl
bmRpbmcgd3JpdGUgaW4gaGZzX3dyaXRlX2JlZ2luKCkgb3IgaGZzX2RpcmVjdF9JTygpCmFsbG9j
YXRlcyBzb21lIGJsb2NrcyB2aWEgaGZzX2dldF9ibG9jaygpIChpbmNyZW1lbnRpbmcKSEZTX0ko
aW5vZGUpLT5waHlzX3NpemUsIEhGU19JKGlub2RlKS0+ZnNfYmxvY2tzLCBhbmQgaW5vZGUtPmlf
Ynl0ZXMpIGFuZAp0aGVuIGhpdHMgLUVST0ZTIG9uIGEgc3Vic2VxdWVudCBibG9jayBhZnRlciBI
RlNfRkxHX0VNRVJHRU5DWV9STyBpcyBzZXQsCmVycm9yIGNsZWFudXAgY2FsbHMgaGZzX3dyaXRl
X2ZhaWxlZCgpOgoKICAgIHN0YXRpYyB2b2lkIGhmc193cml0ZV9mYWlsZWQoc3RydWN0IGFkZHJl
c3Nfc3BhY2UgKm1hcHBpbmcsIGxvZmZfdCB0bykKICAgIHsKICAgICAgICAgICAgc3RydWN0IGlu
b2RlICppbm9kZSA9IG1hcHBpbmctPmhvc3Q7CgogICAgICAgICAgICBpZiAodG8gPiBpbm9kZS0+
aV9zaXplKSB7CiAgICAgICAgICAgICAgICAgICAgdHJ1bmNhdGVfcGFnZWNhY2hlKGlub2RlLCBp
bm9kZS0+aV9zaXplKTsKICAgICAgICAgICAgICAgICAgICBoZnNfZmlsZV90cnVuY2F0ZShpbm9k
ZSk7CiAgICAgICAgICAgIH0KICAgIH0KClJldHVybmluZyBlYXJseSBhdCB0aGUgdG9wIG9mIGhm
c19maWxlX3RydW5jYXRlKCkgc2tpcHMgdGhlIG91dDogbGFiZWwKYWRqdXN0bWVudHMgYXMgd2Vs
bCwgbGVhdmluZyBIRlNfSShpbm9kZSktPnBoeXNfc2l6ZSwKSEZTX0koaW5vZGUpLT5mc19ibG9j
a3MsIGFuZCB0aGUgaW5vZGUgYnl0ZSBjb3VudCBpbmZsYXRlZCBwYXN0Cmlub2RlLT5pX3NpemUu
CgotLSAKU2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0
LzIwMjYxMDI5LXdvcmstZnMtc2JfcmRvbmx5LXYyLTAtMmY0NGY2NGYwYjY2QGtlcm5lbC5vcmc/
cGFydD0xMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
