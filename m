Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D63A606A31C
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Nov 2026 22:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Dmxs2/C4;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=K2icLgiP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=zFovUtH3ag0MrnxOEKqpIs5LYezDVnuIsGcnCGfztxo=; b=Dmxs2/C4Nw3PFYPvpLVPWNj9S3
	A2kl7FRQl6IjJZDVOrmd9oMoFecK39v6/t30aPWQYXExCb6EPDUs3i+hesmT1JB9t0FLuwM2Xbk1B
	Epz8jHEB1gJbJ8WGOjYuYEtGgISzw3F9v/guiiaOmvMaGg9fQDp6A9uGWkfJgCgMN6r7HK5ve33tK
	s5CWS/ZEmGGnPgQKgfR1Yx/G3/Gxw3zEA1Sz1WcQogRwfuR8oM3GX3pJ/ZVlu9FBaplOLf6bjnyry
	shWxHd4l4i4vo1wUwOy3OWqXgSY1SU0qsjJ83BPymr3Xj23QwJhS0HZtOPlkd75E50xrFGWynpER1
	KV+Amwiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTRK9-00000007C1a-11gO;
	Tue, 17 Nov 2026 22:06:45 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTRK8-00000007C1K-0pEo
	for linux-mtd@lists.infradead.org;
	Tue, 17 Nov 2026 22:06:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 48CB861B13;
	Tue, 17 Nov 2026 22:06:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BD321F000C4;
	Tue, 17 Nov 2026 22:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794953203;
	bh=AFNCd2IRsUYS5Da0Abk0ebjgd7zz6hbaDktG+z1dHew=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=K2icLgiPv8CdRpwhiSvdNEYuwL6/0NI8GMMyUh1DMF4FYNuuCoH46BNb/Qarn/zEw
	 Ns3B1e2wvPC2UANPQqv8Gt7lJloqNznGMEr4JgzJjmRlXQmOrkCzGULWTar/7iR4C2
	 S24kkBlR+j4RGxHMAA3WOuVU8vf34icqsfgBz5CMaMtmrOKMWAmHYfmQW2LGM73GW2
	 SyiUQb9GH+Q4qNuOy19GOpGmJNEaRIlOJGwoxVA4cCGjnu8cbs2cT7x3MSLlQe8w7O
	 lroYCQ2WnlGh2Nh4aZ0uxU6ZKfMZCbc/hvpOfFpL6Hk8Et8PFbGROpSCx3AodYpkJN
	 rNDE6rOAxJDnA==
Message-ID: <sashiko-outbox-219726@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 4/4] MIPS: Octeon: flash: use the simple map
 accessors without a shared eMMC
To: "Orgad Shaneh" <orgads@gmail.com>, miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com, tsbogend@alpha.franken.de
Cc: linux-mtd@lists.infradead.org, linusw@kernel.org, kaloz@kernel.org, ulli.kroll@googlemail.com, john@phrozen.org, nico@fluxnic.net, dwmw2@infradead.org, corbet@lwn.net
In-Reply-To: <20261117214141.3826637-5-orgads@gmail.com>
References: <20261117214141.3826637-1-orgads@gmail.com>
 <20261117214141.3826637-5-orgads@gmail.com>
Date: Tue, 17 Nov 2026 22:06:41 +0000
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
MSBwb3RlbnRpYWwKaXNzdWUgdG8gY29uc2lkZXI6Ci0gW01lZGl1bV0gTUlQUzogT2N0ZW9uOiBm
bGFzaDogc2ltcGxlX21hcF9pbml0KCkgYnJlYWtzIGxpdHRsZS1lbmRpYW4KICBtdGRfcG9pbnQo
KQotLQoKY29tbWl0IDU2ZTJkMzU2ZjM2Y2I5N2RkMzM2ZDIzMWI4ZjNmOWQ3YjI4NTM2OWMKQXV0
aG9yOiBPcmdhZCBTaGFuZWggPG9yZ2Fkc0BnbWFpbC5jb20+CgpNSVBTOiBPY3Rlb246IGZsYXNo
OiB1c2UgdGhlIHNpbXBsZSBtYXAgYWNjZXNzb3JzIHdpdGhvdXQgYSBzaGFyZWQgZU1NQwoKVGhp
cyBjb21taXQgY2hlY2tzIHdoZXRoZXIgdGhlIGJvb3QgYnVzIGlzIHNoYXJlZCB3aXRoIGEKImNh
dml1bSxvY3Rlb24tNjEzMC1tbWMiIGRldmljZSBub2RlIGFuZCBjYWxscyBzaW1wbGVfbWFwX2lu
aXQoKSB3aGVuIGl0CmlzIG5vdCwgd2hpbGUgY2hlY2tpbmcgbWFwX2Jhbmt3aWR0aF9zdXBwb3J0
ZWQoKSBiZWZvcmUgbWFwcGluZyB0aGUKZmxhc2guCgo+IGRpZmYgLS1naXQgYS9hcmNoL21pcHMv
Y2F2aXVtLW9jdGVvbi9mbGFzaF9zZXR1cC5jIGIvYXJjaC9taXBzL2Nhdml1bS1vY3Rlb24vZmxh
c2hfc2V0dXAuYwo+IGluZGV4IDBlNTY1MmZjMGMyZWYuLjYyNjEyY2Q3NWQxYjAgMTAwNjQ0Cj4g
LS0tIGEvYXJjaC9taXBzL2Nhdml1bS1vY3Rlb24vZmxhc2hfc2V0dXAuYwo+ICsrKyBiL2FyY2gv
bWlwcy9jYXZpdW0tb2N0ZW9uL2ZsYXNoX3NldHVwLmMKClsgLi4uIF0KCj4gQEAgLTEwNywxMSAr
MTI0LDIwIEBAIHN0YXRpYyBpbnQgb2N0ZW9uX2ZsYXNoX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9k
ZXZpY2UgKnBkZXYpCj4gIAkJCXJldHVybiAtRU5PTUVNOwo+ICAJCXByX25vdGljZSgiQm9vdGJ1
cyBmbGFzaDogU2V0dGluZyBmbGFzaCBmb3IgJWx1TUIgZmxhc2ggYXQgIgo+ICAJCQkgICIweCUw
OGxseFxuIiwgbWFwLT5zaXplID4+IDIwLCBtYXAtPnBoeXMpOwo+IC0JCVdBUk5fT04oIW1hcF9i
YW5rd2lkdGhfc3VwcG9ydGVkKG1hcC0+YmFua3dpZHRoKSk7Cj4gLQkJbWFwLT5yZWFkID0gb2N0
ZW9uX2ZsYXNoX21hcF9yZWFkOwo+IC0JCW1hcC0+d3JpdGUgPSBvY3Rlb25fZmxhc2hfbWFwX3dy
aXRlOwo+IC0JCW1hcC0+Y29weV9mcm9tID0gb2N0ZW9uX2ZsYXNoX21hcF9jb3B5X2Zyb207Cj4g
LQkJbWFwLT5jb3B5X3RvID0gb2N0ZW9uX2ZsYXNoX21hcF9jb3B5X3RvOwo+ICsJCS8qCj4gKwkJ
ICogVGhlIGJvb3QgYnVzIHNlbWFwaG9yZSBvbmx5IHNlcmlhbGl6ZXMgdGhlIGZsYXNoIGFnYWlu
c3QKPiArCQkgKiBhbiBlTU1DIGhvc3QgdGhhdCBzaGFyZXMgdGhlIGJ1cyAodGhlIENJVTMgcGFy
dHMgaGF2ZQo+ICsJCSAqIHRoZWlyIG93bikuIFdpdGhvdXQgb25lLCB1c2UgdGhlIHNpbXBsZSBh
Y2Nlc3NvcnM6IHRoZXkKPiArCQkgKiBsZXQgTVREIHBvaW50IGF0IHRoZSBmbGFzaCwgc28gamZm
czIgc2NhbnMgaXQgaW4gcGxhY2UuCj4gKwkJICovCj4gKwkJaWYgKG9jdGVvbl9mbGFzaF9idXNf
c2hhcmVkKCkpIHsKPiArCQkJbWFwLT5yZWFkID0gb2N0ZW9uX2ZsYXNoX21hcF9yZWFkOwo+ICsJ
CQltYXAtPndyaXRlID0gb2N0ZW9uX2ZsYXNoX21hcF93cml0ZTsKPiArCQkJbWFwLT5jb3B5X2Zy
b20gPSBvY3Rlb25fZmxhc2hfbWFwX2NvcHlfZnJvbTsKPiArCQkJbWFwLT5jb3B5X3RvID0gb2N0
ZW9uX2ZsYXNoX21hcF9jb3B5X3RvOwo+ICsJCX0gZWxzZSB7Cj4gKwkJCXNpbXBsZV9tYXBfaW5p
dChtYXApOwo+ICsJCX0KCltTZXZlcml0eTogTWVkaXVtXQpEb2VzIGNhbGxpbmcgc2ltcGxlX21h
cF9pbml0KG1hcCkgYnJlYWsgbXRkX3BvaW50KCkgb24gbGl0dGxlLWVuZGlhbgpPY3Rlb24ga2Vy
bmVscyAoQ09ORklHX0NQVV9MSVRUTEVfRU5ESUFOPXkpPwoKT24gT2N0ZW9uLCB0aGUgYm9vdCBi
dXMgaXMgd2lyZWQgYmlnLWVuZGlhbiBpbnRvIHRoZSA2NC1iaXQgSU9CLCBzbwpzdWItNjQtYml0
IE1NSU8gYWNjZXNzZXMgdW5kZXIgX19MSVRUTEVfRU5ESUFOIHJlcXVpcmUgYWRkcmVzcyBzd2l6
emxpbmc6CgphcmNoL21pcHMvaW5jbHVkZS9hc20vbWFjaC1jYXZpdW0tb2N0ZW9uL21hbmdsZS1w
b3J0Lmg6CiMgZGVmaW5lIF9fc3dpenpsZV9hZGRyX2IocG9ydCkJXAoJKF9fc2hvdWxkX3N3aXp6
bGVfYWRkcihwb3J0KSA/IChwb3J0KSBeIDcgOiAocG9ydCkpCiMgZGVmaW5lIF9fc3dpenpsZV9h
ZGRyX3cocG9ydCkJXAoJKF9fc2hvdWxkX3N3aXp6bGVfYWRkcihwb3J0KSA/IChwb3J0KSBeIDYg
OiAocG9ydCkpCiMgZGVmaW5lIF9fc3dpenpsZV9hZGRyX2wocG9ydCkJXAoJKF9fc2hvdWxkX3N3
aXp6bGVfYWRkcihwb3J0KSA/IChwb3J0KSBeIDQgOiAocG9ydCkpCgppbmxpbmVfbWFwX3JlYWQo
KSBhbmQgaW5saW5lX21hcF93cml0ZSgpIGdvIHRocm91Z2ggX19yYXdfcmVhZGIoKS93KCkgYW5k
Cl9fcmF3X3dyaXRlYigpL3coKSwgd2hpY2ggYXBwbHkgdGhvc2Ugc3dpenpsZXMuICBNYXJraW5n
IHRoZSBtYXAgYXMgc2ltcGxlCmNhdXNlcyBjZmlfY21kc2V0XzAwMDEgYW5kIGNmaV9jbWRzZXRf
MDAwMiB0byB3aXJlIHVwIG10ZC0+X3BvaW50LCBzbwpjYWxsZXJzIHN1Y2ggYXMgSkZGUzIgZGly
ZWN0bHkgZGVyZWZlcmVuY2UgbWFwLT52aXJ0ICsgb2ZzIHdpdGggbm9ybWFsIENQVQpsb2FkcyBh
bmQgcmVhZCBzY3JhbWJsZWQgZmxhc2ggb2Zmc2V0cy4KCi0tIApTYXNoaWtvIEFJIHJldmlldyDC
tyBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjExMTcyMTQxNDEuMzgyNjYzNy0x
LW9yZ2Fkc0BnbWFpbC5jb20/cGFydD00CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
