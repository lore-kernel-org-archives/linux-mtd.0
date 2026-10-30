Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45E2360A2601
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Oct 2026 16:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sdhgEPuo;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D/AqvhRZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=nxJkUTQVh+1zQ4uVglr66bn86pI7rzwWJb4NAQMnG3g=; b=sdhgEPuogL3EXzppZ7/9kLLi/e
	qoK7zS4TsZDEnu0kgt9ff3dHiF2UiHzFplSiGR1sA7M1O2mclzPLd/NpTRwNWZhxdMClTuelXu5QC
	OVbk9pTyluLTQoSj1ozDaC8AHAGONRUOsH8qIez2m1+wyw/6W18TzTHWpkOCusN5qJFD9KDFAiurV
	I/kvBGfoBCNDn0hWuAqTKIaXhW7M5XW0v6xIDuzMB8Yc2RD0Eb+paNfkCLub9ZZgbBEVfMDBPnyen
	GajWwxJ8kZ45Y9RnhC+I6aZBD5bL/9vQmjYaImqKO3YUbpJzJjzDKq/q+XeZfMFbjtvNE8nrQv1fo
	Vmr4C7gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMpBD-0000000C5rQ-44so;
	Fri, 30 Oct 2026 16:10:11 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMpBC-0000000C5q5-2OWQ
	for linux-mtd@lists.infradead.org;
	Fri, 30 Oct 2026 16:10:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 548494229B;
	Fri, 30 Oct 2026 16:10:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 966A51F0093A;
	Fri, 30 Oct 2026 16:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793376610;
	bh=BlBJcG/mHzd+bSxyJ7Hr/XNLqvI/KNeShi4TWVGpRMA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=D/AqvhRZy53z7cDhKwZsVvsyi75Y3cw4TMDVGVoQyGakjk6/Hsm81UrhNUKh8lpK8
	 9OBUprIEhacNJzUARTORbGE8nzZsXavQX5moSmXeTaHTkZg0biGi+Jqq1vzQ8hIp4Q
	 bZlIsaZimYR4kXUhi/DFZdAeGfQyf7aGvF73AiCDRIfGSsxgPHES329JutGW2yHMQ8
	 KW1CL+7VGZz7YAhF+HvmS3M2JC3WSkhoL0cTp/XUbv0QHMXiYciLVrdqjqlmmgFBfx
	 asrcDTboC/2rlsxegb+2YSDO8Mpp5zJoUWSQ9JVOWz/a8Y25DSqzSsW/oCD+/WLFCZ
	 r5eLPGGx33uZA==
Message-ID: <sashiko-outbox-191244@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 25/34] gfs2: wait for a pending withdraw before
 remounting read-only
To: "Christian Brauner" <brauner@kernel.org>, "Jan Kara" <jack@suse.com>
Cc: "Al Viro" <viro@zeniv.linux.org.uk>, linux-ext4@vger.kernel.org, linux-mm@kvack.org, linux-efi@vger.kernel.org, linux-mtd@lists.infradead.org, dsterba@suse.cz, tytso@mit.edu, "Mark
 Fasheh" <mark@fasheh.com>, "Joel Becker" <jlbec@evilplan.org>, "Joseph Qi" <joseph.qi@linux.alibaba.com>
In-Reply-To: <20261029-work-fs-sb_rdonly-v2-25-2f44f64f0b66@kernel.org>
References: <20261029-work-fs-sb_rdonly-v2-0-2f44f64f0b66@kernel.org>
 <20261029-work-fs-sb_rdonly-v2-25-2f44f64f0b66@kernel.org>
Date: Fri, 30 Oct 2026 16:10:09 +0000
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIGdmczI6IGhhbmcgaW4g
Z2ZzMl9tYWtlX2ZzX3JvKCkgaWYgd2l0aGRyYXcgb2NjdXJzIGJlZm9yZSBTQl9CT1JOCi0tCgpj
b21taXQgNGRiYzQzZWZjMzE2ZDFlNjIwOWY3MjFiNWM3YzBlMTNiMmU4MWY5NQpBdXRob3I6IENo
cmlzdGlhbiBCcmF1bmVyIDxicmF1bmVyQGtlcm5lbC5vcmc+CgpnZnMyOiB3YWl0IGZvciBhIHBl
bmRpbmcgd2l0aGRyYXcgYmVmb3JlIHJlbW91bnRpbmcgcmVhZC1vbmx5CgpUaGlzIGNvbW1pdCBm
aXhlcyBhIHJhY2UgYmV0d2VlbiBhc3luY2hyb25vdXMgZmlsZXN5c3RlbSB3aXRoZHJhdyBhbmQK
cmVhZC1vbmx5IHJlbW91bnQgYnkgc3luY2hyb25pemluZyBTREZfSk9VUk5BTF9MSVZFIHVuZGVy
IHNkX2xvZ19mbHVzaF9sb2NrIGluCmdmczJfbWFrZV9mc19ydygpLCB3YWtpbmcgd2FpdGVycyB3
aGVuIGRvX3dpdGhkcmF3KCkgY2xlYXJzIFNERl9KT1VSTkFMX0xJVkUsCmFuZCB3YWl0aW5nIGZv
ciBTREZfSk9VUk5BTF9MSVZFIHRvIGNsZWFyIGluIGdmczJfbWFrZV9mc19ybygpIGJlZm9yZSBj
YWxsaW5nCmdmczJfcXVvdGFfY2xlYW51cCgpLgoKPiBkaWZmIC0tZ2l0IGEvZnMvZ2ZzMi9zdXBl
ci5jIGIvZnMvZ2ZzMi9zdXBlci5jCj4gaW5kZXggMDRiYjRjZjc4N2Q0ZC4uZjYxYzMwOTM2OGVm
MSAxMDA2NDQKPiAtLS0gYS9mcy9nZnMyL3N1cGVyLmMKPiArKysgYi9mcy9nZnMyL3N1cGVyLmMK
PiBAQCAtMTQ2LDEyICsxNDYsMjEgQEAgaW50IGdmczJfbWFrZV9mc19ydyhzdHJ1Y3QgZ2ZzMl9z
YmQgKnNkcCkKPiAgCX0KPiAgCj4gIAllcnJvciA9IGdmczJfcXVvdGFfaW5pdChzZHApOwo+IC0J
aWYgKCFlcnJvciAmJiBnZnMyX3dpdGhkcmF3bihzZHApKSB7Cj4gLQkJZ2ZzMl9xdW90YV9jbGVh
bnVwKHNkcCk7Cj4gKwlpZiAoZXJyb3IpCj4gKwkJcmV0dXJuIGVycm9yOwo+ICsKPiArCS8qCj4g
KwkgKiBDaGVjayBmb3IgYSB3aXRoZHJhdyB1bmRlciB0aGUgbG9jayBkb193aXRoZHJhdygpIGhv
bGRzIHdoaWxlIGl0Cj4gKwkgKiB0YWtlcyBhIGxpdmUgam91cm5hbCBkb3duLCBzbyBvbmUgb2Yg
dGhlbSBzZWVzIHRoZSBvdGhlci4KPiArCSAqLwo+ICsJZG93bl93cml0ZSgmc2RwLT5zZF9sb2df
Zmx1c2hfbG9jayk7Cj4gKwlpZiAoZ2ZzMl93aXRoZHJhd24oc2RwKSkKPiAgCQllcnJvciA9IC1F
SU87Cj4gLQl9Cj4gLQlpZiAoIWVycm9yKQo+ICsJZWxzZQo+ICAJCXNldF9iaXQoU0RGX0pPVVJO
QUxfTElWRSwgJnNkcC0+c2RfZmxhZ3MpOwo+ICsJdXBfd3JpdGUoJnNkcC0+c2RfbG9nX2ZsdXNo
X2xvY2spOwo+ICsJaWYgKGVycm9yKQo+ICsJCWdmczJfcXVvdGFfY2xlYW51cChzZHApOwo+ICAJ
cmV0dXJuIGVycm9yOwo+ICB9Cj4gIAo+IEBAIC01NjcsNiArNTc2LDkgQEAgdm9pZCBnZnMyX21h
a2VfZnNfcm8oc3RydWN0IGdmczJfc2JkICpzZHApCj4gIAkJCQkgICBIWiAqIDUpOwo+ICAJCWdm
czJfYXNzZXJ0X3dhcm4oc2RwLCBnZnMyX2xvZ19pc19lbXB0eShzZHApKTsKPiAgCX0KPiArCS8q
IEEgd2l0aGRyYXcgdGhhdCBkb193aXRoZHJhdygpIGRpZG4ndCBmaW5pc2ggeWV0IGxlYXZlcyBp
dCBsaXZlLiAqLwo+ICsJaWYgKCF0ZXN0X2JpdChTREZfTk9SRUNPVkVSWSwgJnNkcC0+c2RfZmxh
Z3MpKQo+ICsJCXdhaXRfb25fYml0KCZzZHAtPnNkX2ZsYWdzLCBTREZfSk9VUk5BTF9MSVZFLCBU
QVNLX1VOSU5URVJSVVBUSUJMRSk7CgpbU2V2ZXJpdHk6IEhpZ2hdCkNhbiB3YWl0X29uX2JpdCgp
IGluIGdmczJfbWFrZV9mc19ybygpIGhhbmcgZm9yZXZlciBpbiBUQVNLX1VOSU5URVJSVVBUSUJM
RQppZiBhIHdpdGhkcmF3IGhhcHBlbnMgYWZ0ZXIgZ2ZzMl9tYWtlX2ZzX3J3KCkgc2V0cyBTREZf
Sk9VUk5BTF9MSVZFIGR1cmluZwptb3VudCwgYnV0IGJlZm9yZSB2ZnNfZ2V0X3RyZWUoKSBzZXRz
IFNCX0JPUk4/CgpEdXJpbmcgYSByZWFkLXdyaXRlIG1vdW50LCB2ZnNfZ2V0X3RyZWUoKSBjYWxs
cyBnZnMyX2dldF90cmVlKCkgLT4KZ2V0X3RyZWVfYmRldl9mbGFncygpIC0+IGdmczJfZmlsbF9z
dXBlcigpIGJlZm9yZSBzZXR0aW5nIFNCX0JPUk4gb24Kc2ItPnNfZmxhZ3MuIEluc2lkZSBnZnMy
X2ZpbGxfc3VwZXIoKSwgc3lzZnMgYW5kIHRoZSBkYWVtb24gdGhyZWFkcyBhcmUKc3RhcnRlZCBi
ZWZvcmUgZ2ZzMl9tYWtlX2ZzX3J3KCkgaXMgY2FsbGVkOgoKZnMvZ2ZzMi9vcHNfZnN0eXBlLmM6
Z2ZzMl9maWxsX3N1cGVyKCkgewoJLi4uCglpZiAoIXNiX3Jkb25seShzYikpCgkJZXJyb3IgPSBn
ZnMyX21ha2VfZnNfcncoc2RwKTsKCglpZiAoZXJyb3IpIHsKCQlnZnMyX2ZyZWV6ZV91bmxvY2so
c2RwKTsKCQlmc19lcnIoc2RwLCAiY2FuJ3QgbWFrZSBGUyBSVzogJWRcbiIsIGVycm9yKTsKCQln
b3RvIGZhaWxfcGVyX25vZGU7Cgl9CglnZnMyX2dsb2NrX2RxX3VuaW5pdCgmbW91bnRfZ2gpOwoJ
Z2ZzMl9vbmxpbmVfdWV2ZW50KHNkcCk7CglyZXR1cm4gMDsKfQoKT25jZSBnZnMyX21ha2VfZnNf
cncoKSBzZXRzIFNERl9KT1VSTkFMX0xJVkUgdW5kZXIgc2RfbG9nX2ZsdXNoX2xvY2ssIHRoZXJl
CmlzIHN0aWxsIGEgd2luZG93IGJlZm9yZSB2ZnNfZ2V0X3RyZWUoKSBzZXRzIFNCX0JPUk4gd2hl
cmUgZ2ZzMl9sb2dkLApnZnMyX3F1b3RhZCwgZ2xvY2sgd29ya3F1ZXVlcywgb3Igc3lzZnMgY2Fu
IHRyaWdnZXIgZ2ZzMl93aXRoZHJhdygpLgoKSW4gZ2ZzMl93aXRoZHJhdygpLCBTREZfV0lUSERS
QVdOIGlzIHNldCwgYW5kIHRoZW4gaXQgcmV0dXJucyBlYXJseSB3aXRob3V0CnF1ZXVpbmcgc2Rf
d2l0aGRyYXdfd29yayBiZWNhdXNlIFNCX0JPUk4gaXMgbm90IHlldCBzZXQ6Cgpmcy9nZnMyL3V0
aWwuYzpnZnMyX3dpdGhkcmF3KCkgewoJLi4uCgkJaWYgKHRlc3RfYW5kX3NldF9iaXQoU0RGX1dJ
VEhEUkFXTiwgJnNkcC0+c2RfZmxhZ3MpKQoJCQlyZXR1cm47CgoJCWR1bXBfc3RhY2soKTsKCQkv
KgoJCSAqIFRoZXJlIGlzIG5vIG5lZWQgdG8gd2l0aGRyYXcgd2hlbiB0aGUgc3VwZXJibG9jayBo
YXNuJ3QgYmVlbgoJCSAqIGZ1bGx5IGluaXRpYWxpemVkLCB5ZXQuCgkJICovCgkJaWYgKCEoc2Rw
LT5zZF92ZnMtPnNfZmxhZ3MgJiBTQl9CT1JOKSkKCQkJcmV0dXJuOwoJCWZzX2VycihzZHAsICJh
Ym91dCB0byB3aXRoZHJhdyB0aGlzIGZpbGUgc3lzdGVtXG4iKTsKCQlzY2hlZHVsZV93b3JrKCZz
ZHAtPnNkX3dpdGhkcmF3X3dvcmspOwoJLi4uCn0KCkJlY2F1c2UgU0RGX1dJVEhEUkFXTiBpcyBh
bHJlYWR5IHNldCwgbm8gbGF0ZXIgZ2ZzMl93aXRoZHJhdygpIGNhbGwgY2FuCnF1ZXVlIHNkX3dp
dGhkcmF3X3dvcmssIGFuZCBnZnMyX2ZpbGxfc3VwZXIoKSByZXR1cm5zIDAgd2l0aCBib3RoClNE
Rl9XSVRIRFJBV04gYW5kIFNERl9KT1VSTkFMX0xJVkUgc2V0IHdoaWxlIGRvX3dpdGhkcmF3KCkg
bmV2ZXIgcnVucy4KCklmIHRoZSBmaWxlc3lzdGVtIGlzIHN1YnNlcXVlbnRseSByZW1vdW50ZWQg
cmVhZC1vbmx5IHZpYQpnZnMyX3JlY29uZmlndXJlKCkgLT4gZ2ZzMl9tYWtlX2ZzX3JvKCksIGdm
czJfbG9nX2ZsdXNoKCkgYmFpbHMgb3V0IGVhcmx5IG9uCnRoZSB3aXRoZHJhd24gZmlsZXN5c3Rl
bSB3aXRob3V0IGNsZWFyaW5nIFNERl9KT1VSTkFMX0xJVkUsIGxlYXZpbmcKd2FpdF9vbl9iaXQo
KSBpbiBnZnMyX21ha2VfZnNfcm8oKSBzbGVlcGluZyBmb3JldmVyIHdoaWxlIGhvbGRpbmcKc2It
PnNfdW1vdW50LgoKLS0gClNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBzOi8vc2FzaGlrby5kZXYv
Iy9wYXRjaHNldC8yMDI2MTAyOS13b3JrLWZzLXNiX3Jkb25seS12Mi0wLTJmNDRmNjRmMGI2NkBr
ZXJuZWwub3JnP3BhcnQ9MjUKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
