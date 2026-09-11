Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E358BC88E4D
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Sep 2026 15:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6IICx08I7WQ3V9FXwKbHBg4QMNt7efOVyhBvI9mpOW0=; b=TE9YLPvIWZijoo
	y2mCuzae+xsv968U7cxmOPKEtjJfdTEehA2wz22VZZwPqKV+bG81JUAHMP9ojhSZJPeBgwl3yHovB
	5F8fdzTGAnfChGgkRltC7JKugpysR5MiCCq4kLGdrwOli4ZL3z5HkkTBZcMO0P2xup9LI1wBOlNZM
	+TmnKR7MMKUc2Sq7sXFxVdgwXxMG8yIx5BZN77TXwPr15qTDinJXui5XoNvq9Zdy/E1BkgXZbaGQX
	B2du1gzmHvDfjbOaMFPK6SRPFmfI7gN3a+vXh6iy3Rj+EJKz4bP6JMEtiG5d+Y6Y0Jl6MQggP0q2c
	wsbktMLDiAKyAgBJ3GCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x53QF-0000000H7Od-458D;
	Fri, 11 Sep 2026 15:44:15 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x53QD-0000000H7Nq-3Nsf
	for linux-mtd@lists.infradead.org;
	Fri, 11 Sep 2026 15:44:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5860B416AC;
	Fri, 11 Sep 2026 15:44:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B53B01F00893;
	Fri, 11 Sep 2026 15:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789141453;
	bh=FPZslvRSCNdZWGFrQfJeVjz0yJFk4tUTY7XoMHgWR0s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Yee1nUHAplbscR8J3u7mXPWow5ZQa9PJOzhaE+mknXHKXuXnzSjnVzJYD2Vhky+6l
	 8g9pOS7Go6Z5OoDDuYei6f/Ap92KyK5WovIeTxURb70fOExZRceapyENI5leLaKpYN
	 BOQYQ2gQKVaBIQ/xdpXx6uqtC7UYgU70qR6luySR9PFJyVdz/2v1zNLxxLqIssDFEO
	 bSAeDtqY4SwD2XK7aYFHJ/HLmZ9C3DlFHSMOV9Fli1YPSZzzIxHeDN8ofyB0plL+SC
	 AQwI6MwNTOY3N2TeQIFp5M0lxiV2pe7yjY41k6yezAa9CBhNosNDA95Cdb6Fwyep6M
	 bNHDUy1s7p8wQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] mtd: spi-nor: issi: Add support for is25wx01g
To: linux-kernel@vger.kernel.org, =?utf-8?b?TnVubyBTw6E=?= <nuno.sa@analog.com>, linux-mtd@lists.infradead.org
Cc: "Miquel Raynal" <miquel.raynal@bootlin.com>, "Pratyush Yadav" <pratyush@kernel.org>, "Michael
 Walle" <mwalle@kernel.org>, "Vignesh Raghavendra" <vigneshr@ti.com>, "Takahiro
 Kuwano" <takahiro.kuwano@infineon.com>, "Richard Weinberger" <richard@nod.at>
In-Reply-To: <20260911-mtd-spi-nor-new-issi-chip-v1-2-c54615f8c30f@analog.com>
References: <20260911-mtd-spi-nor-new-issi-chip-v1-0-c54615f8c30f@analog.com>
 <20260911-mtd-spi-nor-new-issi-chip-v1-2-c54615f8c30f@analog.com>
Date: Fri, 11 Sep 2026 15:44:12 +0000
Message-Id: <20260911154412.B53B01F00893@smtp.kernel.org>
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
Reply-To: sashiko-reviews@lists.linux.dev
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0xvd10gVGhlIHBhdGNoIGludHJv
ZHVjZXMgbXVsdGlwbGUgYnVpbGQgZmFpbHVyZXMgZHVlIHRvIGFuIGluY29tcGxldGUgZm9yd2Fy
ZC1wb3J0IGZyb20gYW4gb2xkZXIga2VybmVsIHZlcnNpb24uIEl0IHJlZmVyZW5jZXMgbm9uLWV4
aXN0ZW50IHN0cnVjdCBmaWVsZHMsIHVzZXMgYW4gdW5kZWNsYXJlZCBmbGFnLCBhbmQgYXR0ZW1w
dHMgYW4gb3V0ZGF0ZWQgbWV0aG9kIHRvIGRpc2FibGUgMTYtYml0IHN0YXR1cyByZWdpc3RlciB3
cml0ZXMuCi0tCgpjb21taXQgMmEyZjkzY2YzOTFlMjM3ZTRiNWI3MTFjZWY2OGNjMjI1ZTJiYzJm
ZQpBdXRob3I6IE51bm8gU8OhIDxudW5vLnNhQGFuYWxvZy5jb20+CgptdGQ6IHNwaS1ub3I6IGlz
c2k6IEFkZCBzdXBwb3J0IGZvciBpczI1d3gwMWcKClRoaXMgcGF0Y2ggYWRkcyBzdXBwb3J0IGZv
ciB0aGUgSVNTSSBJUzI1V1gwMUcgMSBHYml0IG9jdGFsIE5PUiBmbGFzaC4gSXQKcmVsaWVzIG9u
IFNGRFAgYW5kIHByb3ZpZGVzIEJGUFQgZml4dXBzIHRvIGhhbmRsZSB0aGUgbGFjayBvZiBhIDM1
aCBjb21tYW5kCmFuZCB0byBkaXNhYmxlIHRoZSBxdWFkIGVuYWJsZSBtZXRob2QuCgo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL210ZC9zcGktbm9yL2lzc2kuYyBiL2RyaXZlcnMvbXRkL3NwaS1ub3Iv
aXNzaS5jCj4gaW5kZXggMmYwNTdkNzMxZGYyYS4uYWFjOWQxOWI5MGZjZiAxMDA2NDQKPiAtLS0g
YS9kcml2ZXJzL210ZC9zcGktbm9yL2lzc2kuYwo+ICsrKyBiL2RyaXZlcnMvbXRkL3NwaS1ub3Iv
aXNzaS5jCj4gQEAgLTI5LDYgKzI5LDI5IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgc3BpX25vcl9m
aXh1cHMgaXMyNWxwMjU2X2ZpeHVwcyA9IHsKPiAgCS5wb3N0X2JmcHQgPSBpczI1bHAyNTZfcG9z
dF9iZnB0X2ZpeHVwcywKPiAgfTsKPiAgCj4gK3N0YXRpYyBpbnQgaXMyNXd4MDFnX3Bvc3RfYmZw
dF9maXh1cHMoc3RydWN0IHNwaV9ub3IgKm5vciwKPiArCQkJCSAgICAgIGNvbnN0IHN0cnVjdCBz
ZmRwX3BhcmFtZXRlcl9oZWFkZXIgKmJmcHRfaGVhZGVyLAo+ICsJCQkJICAgICAgY29uc3Qgc3Ry
dWN0IHNmZHBfYmZwdCAqYmZwdCkKPiArewo+ICsJLyoKPiArCSAqIFRoZXJlIGlzIG5vIFN0YXR1
cyBSZWdpc3RlciAyIGFuZCBubyAzNWggY29tbWFuZC4gQW5kIFdSSVRFIFNUQVRVUwo+ICsJICog
UkVHSVNURVIgdGFrZXMgYSBzaW5nbGUgZGF0YSBieXRlLgo+ICsJICovCj4gKwlub3ItPmZsYWdz
ICY9IH5TTk9SX0ZfSEFTXzE2QklUX1NSOwoKW1NldmVyaXR5OiBMb3ddCkRvZXMgdGhpcyBjb2Rl
IGNvbXBpbGUgb24gdGhlIHRhcmdldCB0cmVlPyBzdHJ1Y3Qgc3BpX25vciBkb2VzIG5vdCBhcHBl
YXIKdG8gaGF2ZSBhIGZsYWdzIG1lbWJlciBpbiB0aGUgY3VycmVudCBBUEksIGFuZCBTTk9SX0Zf
SEFTXzE2QklUX1NSIHNlZW1zCnRvIGJlIHVuZGVjbGFyZWQuCgo+ICsKPiArCS8qCj4gKwkgKiBU
aGUgQkZQVCBRdWFkIEVuYWJsZSBSZXF1aXJlbWVudCBmaWVsZCBpcyBzZXQgdG8gYSByZXNlcnZl
ZCB2YWx1ZSwgc28KPiArCSAqIHNwaV9ub3JfcGFyc2VfYmZwdCgpIGxlYXZlcyB0aGUgcXVhZCBl
bmFibGUgbWV0aG9kIGF0IGl0cyBkZWZhdWx0Lgo+ICsJICogTWFrZSBzdXJlIHdlIGRpc2FibGUg
aXQgYXMgdGhlcmUgaXMgbm8gcXVhZCBtb2RlIGFueXdheS4KPiArCSAqLwo+ICsJbm9yLT5wYXJh
bXMtPnF1YWRfZW5hYmxlID0gTlVMTDsKPiArCXJldHVybiAwOwo+ICt9Cj4gKwo+ICtzdGF0aWMg
Y29uc3Qgc3RydWN0IHNwaV9ub3JfZml4dXBzIGlzMjV3eDAxZ19maXh1cHMgPSB7Cj4gKwkucG9z
dF9iZnB0ID0gaXMyNXd4MDFnX3Bvc3RfYmZwdF9maXh1cHMsCj4gK307Cj4gKwoKWyAuLi4gXQoK
PiBAQCAtMTIwLDYgKzE0MywxMCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGZsYXNoX2luZm8gaXNz
aV9ub3JfcGFydHNbXSA9IHsKPiAgCQkuaWQgPSBTTk9SX0lEKDB4OWQsIDB4NzAsIDB4MTkpLAo+
ICAJCS5uYW1lID0gImlzMjV3cDI1NiIsCj4gIAkJLmZsYWdzID0gU1BJX05PUl9RVUFEX1BQLAo+
ICsJfSwgewo+ICsJCS5pZCA9IFNOT1JfSUQoMHg5ZCwgMHg1YiwgMHgxYiksCj4gKwkJLm5hbWUg
PSAiaXMyNXd4MDFnIiwKPiArCQkuZml4dXBzID0gJmlzMjV3eDAxZ19maXh1cHMsCgpbU2V2ZXJp
dHk6IExvd10KRG9lcyBzdHJ1Y3QgZmxhc2hfaW5mbyBoYXZlIGEgZml4dXBzIG1lbWJlciBpbiB0
aGUgY3VycmVudCBmcmFtZXdvcms/Ckl0IGxvb2tzIGxpa2UgZml4dXBzIG1pZ2h0IG5lZWQgdG8g
YmUgcmVnaXN0ZXJlZCB2aWEgc3RydWN0CnNwaV9ub3JfbWFudWZhY3R1cmVyIGFuZCBpdHMgZml4
dXBzIGFycmF5IGluc3RlYWQuCgo+ICAJfQo+ICB9OwoKLS0gClNhc2hpa28gQUkgcmV2aWV3IMK3
IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MDkxMS1tdGQtc3BpLW5vci1uZXct
aXNzaS1jaGlwLXYxLTAtYzU0NjE1ZjhjMzBmQGFuYWxvZy5jb20/cGFydD0yCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRp
c2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtbXRkLwo=
