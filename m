Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 596DC606A89A
	for <linux-mtd@archiver.kernel.org>; Sat, 14 Nov 2026 12:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4LHsghXM;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LNbrcs4Y
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=rkPEUKPeaWmPy4TgAICLQUmJ8Znll42WL8vGg2RfTtw=; b=4LHsghXMyT/juTrfZNfqMmByeV
	tLrhC+n1hkEdjSbzLgfI8A5NPUuRv+YzMQ/nE7p1N64ePaa7jtfxCUXE39stfv8e/a80LWkZEjfkA
	81Gqa3AumCjpUwSRjuYbmvPO8wHLSGj/8k1bFHQeWt49A4mBmveJizwOHp5FkN2H1epuBVUzroBFS
	Zyjc+L6c5BSd80GOhcqYkXvTO52TLez3+/XcgUTinkga7T2/cHhe4LICLGJvysFpclUh23OjEDjDI
	G8KyChaColXFBwkE4aaMyM2wQFTXRkk6hLHvZBcvl41sv71S7KBGIo2oYuLnYtw75TwJYZmRA0ABQ
	fP5sZGHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSCTo-0000000Fyw1-0Msi;
	Sat, 14 Nov 2026 12:03:36 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSCTk-0000000FytO-3tqk
	for linux-mtd@lists.infradead.org;
	Sat, 14 Nov 2026 12:03:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 61ABA61E39;
	Sat, 14 Nov 2026 12:03:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DA991F000C5;
	Sat, 14 Nov 2026 12:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794657812;
	bh=qsiCTf5/ZDJAgI16zRoAOBgO8sIWPIPaiYYrEaqBQl0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LNbrcs4YE9ttSburmbb6iJ9AMZSDEZsciXFVPdhD9V9DlJQLfjlM7FPiVXi7l9Gwe
	 nYeFvAv5JAjF9k8eBJ27Z/pvT/pGhWSE0qlDGGLMnYhWbsNJByvQdKxRGdUgOnOd3T
	 FrNF2fag/r/bvDutXeoOnOVYgZEH/qpnkaplk+hKj0lyEdJyDPzRy+DTwDrHTwcBWd
	 O3oFIPg2Xhd2sNcsEFmNdC8+wgVXv0X58KKsMxRHlQ1NE8HXpLiqzHwqYlwUONMoEJ
	 Eh58T9nMmlbVadQRoGpQvkVYHUInJjGW235heNs7vHgQ3+zEg+xtEqQsCbamIG7jEW
	 4919mVQ2HqZ1Q==
Message-ID: <sashiko-outbox-214463@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 12/33] exfat: use the generic emergency read-only
 state
To: "Christian Brauner" <brauner@kernel.org>, "Jan Kara" <jack@suse.com>
Cc: "Al Viro" <viro@zeniv.linux.org.uk>, linux-ext4@vger.kernel.org, linux-mm@kvack.org, linux-efi@vger.kernel.org, linux-mtd@lists.infradead.org, dsterba@suse.cz, tytso@mit.edu, "Mark
 Fasheh" <mark@fasheh.com>, "Joel Becker" <jlbec@evilplan.org>, "Joseph Qi" <joseph.qi@linux.alibaba.com>
In-Reply-To: <20261113-work-fs-sb_rdonly-v3-12-0be92bb73709@kernel.org>
References: <20261113-work-fs-sb_rdonly-v3-0-0be92bb73709@kernel.org>
 <20261113-work-fs-sb_rdonly-v3-12-0be92bb73709@kernel.org>
Date: Sat, 14 Nov 2026 12:03:31 +0000
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
MSBwb3RlbnRpYWwKaXNzdWUgdG8gY29uc2lkZXI6Ci0gW01lZGl1bV0gZXhmYXQ6IHJhY2Ugd2l0
aCBlbWVyZ2VuY3kgcmVhZC1vbmx5IHRyYW5zaXRpb24gaW4KICBleGZhdF9mb3JjZV9zaHV0ZG93
bigpCi0tCgpjb21taXQgNTU1NTVmYzJhNmEzNmM0N2UxZTYxZmNiZThjMjJiNjlmN2Q1YTVmOApB
dXRob3I6IENocmlzdGlhbiBCcmF1bmVyIDxicmF1bmVyQGtlcm5lbC5vcmc+CgpleGZhdDogdXNl
IHRoZSBnZW5lcmljIGVtZXJnZW5jeSByZWFkLW9ubHkgc3RhdGUKClRoaXMgY29tbWl0IHJlcGxh
Y2VzIEVYRkFUX0ZMQUdTX0VNRVJHRU5DWV9STyB3aXRoIHRoZSBWRlMgZ2VuZXJpYwpTQl9TVEFU
RV9FTUVSR0VOQ1lfUk8gc3RhdGUgYW5kIHNraXBzIGZyZWV6aW5nIGluIGV4ZmF0X2ZvcmNlX3No
dXRkb3duKCkKd2hlbiB0aGUgc3VwZXJibG9jayBpcyBhbHJlYWR5IGluIHRoZSBlbWVyZ2VuY3kg
cmVhZC1vbmx5IHN0YXRlLgoKPiBkaWZmIC0tZ2l0IGEvZnMvZXhmYXQvc3VwZXIuYyBiL2ZzL2V4
ZmF0L3N1cGVyLmMKPiBpbmRleCBmZWVkYTQxYTgwNzQxLi5lMzU4N2VkMjcwMjQ1IDEwMDY0NAo+
IC0tLSBhL2ZzL2V4ZmF0L3N1cGVyLmMKPiArKysgYi9mcy9leGZhdC9zdXBlci5jCgpbIC4uLiBd
Cgo+IEBAIC0xNzYsNiArMTc2LDExIEBAIGludCBleGZhdF9mb3JjZV9zaHV0ZG93bihzdHJ1Y3Qg
c3VwZXJfYmxvY2sgKnNiLCB1MzIgZmxhZ3MpCj4gIAlpZiAoZXhmYXRfZm9yY2VkX3NodXRkb3du
KHNiKSkKPiAgCQlyZXR1cm4gMDsKPiAgCj4gKwkvKiBBZnRlciBhbiBlcnJvciB0aGVyZSBpcyBu
b3RoaW5nIHRvIHN5bmMgYW5kIGZyZWV6aW5nIGZhaWxzLiAqLwo+ICsJaWYgKChmbGFncyA9PSBF
WEZBVF9HT0lOR19ET1dOX0RFRkFVTFQgfHwKPiArCSAgICAgZmxhZ3MgPT0gRVhGQVRfR09JTkdf
RE9XTl9GVUxMU1lOQykgJiYgc2JfZW1lcmdlbmN5X3JvKHNiKSkKPiArCQlmbGFncyA9IEVYRkFU
X0dPSU5HX0RPV05fTk9TWU5DOwo+ICsKPiAgCXN3aXRjaCAoZmxhZ3MpIHsKPiAgCWNhc2UgRVhG
QVRfR09JTkdfRE9XTl9ERUZBVUxUOgo+ICAJY2FzZSBFWEZBVF9HT0lOR19ET1dOX0ZVTExTWU5D
OgoKW1NldmVyaXR5OiBNZWRpdW1dCkNhbiBleGZhdF9mb3JjZV9zaHV0ZG93bigpIGFib3J0IHdp
dGhvdXQgc2V0dGluZyBFWEZBVF9GTEFHU19TSFVURE9XTiBpZiBhCmZpbGVzeXN0ZW0gZXJyb3Ig
c2V0cyBTQl9TVEFURV9FTUVSR0VOQ1lfUk8gd2hpbGUgYmRldl9mcmVlemUoKSBpcyBydW5uaW5n
PwoKQ1BVMCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIENQVTEKZXhmYXRfZm9y
Y2Vfc2h1dGRvd24oKQogIHNiX2VtZXJnZW5jeV9ybyhzYikgLT4gZmFsc2UKICBiZGV2X2ZyZWV6
ZShzYi0+c19iZGV2KQogICAgLi4uCiAgICBmcmVlemVfc3VwZXIoc2IsIC4uLikKICAgICAgc2Jf
d2FpdF93cml0ZShzYiwgLi4uKSAvCiAgICAgIHN5bmNfZmlsZXN5c3RlbShzYikKICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF9fZXhmYXRfZnNfZXJyb3Ioc2IsIC4uLikK
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc2Jfc2V0X2VtZXJnZW5j
eV9ybyhzYikKICAgICAgaWYgKCFyZXQgJiYgc2JfZW1lcmdlbmN5X3JvKHNiKSkKICAgICAgICBy
ZXQgPSAtRVJPRlM7CiAgaWYgKHJldCkKICAgIHJldHVybiByZXQ7ICA8LS0gYWJvcnRzIHdpdGhv
dXQgc2h1dHRpbmcgZG93bgoKQmVjYXVzZSBmcmVlemVfc3VwZXIoKSBjaGVja3Mgc2JfZW1lcmdl
bmN5X3JvKHNiKSBib3RoIG9uIGVudHJ5IGFuZCBhZnRlcgpzeW5jX2ZpbGVzeXN0ZW0oc2IpLCBh
biBpbi1mbGlnaHQgd3JpdGVyIG9yIHdyaXRlYmFjayBlcnJvciBkdXJpbmcgdGhlCmZyZWV6ZSBt
YWtlcyBiZGV2X2ZyZWV6ZSgpIHJldHVybiAtRVJPRlMuICBleGZhdF9mb3JjZV9zaHV0ZG93bigp
IHRoZW4KcmV0dXJucyAtRVJPRlMgd2l0aG91dCBzZXR0aW5nIEVYRkFUX0ZMQUdTX1NIVVRET1dO
IG9yIGNsZWFyaW5nCm9wdHMtPmRpc2NhcmQuICBJZ25vcmluZyAtRVJPRlMgZnJvbSBiZGV2X2Zy
ZWV6ZSgpIHdoZW4gc2JfZW1lcmdlbmN5X3JvKHNiKQppcyBzZXQgd291bGQgc3RpbGwgY29tcGxl
dGUgdGhlIHNodXRkb3duLgoKLS0gClNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBzOi8vc2FzaGlr
by5kZXYvIy9wYXRjaHNldC8yMDI2MTExMy13b3JrLWZzLXNiX3Jkb25seS12My0wLTBiZTkyYmI3
MzcwOUBrZXJuZWwub3JnP3BhcnQ9MTIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
