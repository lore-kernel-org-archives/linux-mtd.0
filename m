Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DC61CC6B15
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Oct 2026 22:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=McZ7xN+EtDV2VPnlINpPzbfkotgkk9rZ5mGhIXWRMT8=; b=kseuXIJI1dOuRm
	EZ8kQL0bZMaPOvUyB4xVUCf7rpppfz+1x0LTtsi+VpWRXM8Qrhstx/nWq/PG4gK/QrIpEIpmjf4aW
	qraw0nU6MFS+A5lNVuMN9wnVaKy0BMEuSnDddY3ZZFY+//7Azdvqgw8FSZzSnGmuEsZhrRiK3B5rd
	DxnbPm286r5Wp1G3x0EoqII3m1+TIFXXvZauppekSku4PbpoVZ/kBxix/FJh0KlAihPJwtrf9LMEJ
	bmJJ815LYvOsYBKzsq8DpcTpDvgw7penpTRv58eJLo8BjZcBzk4+9zdt4lPgWlmjw2qea3auj3ItG
	paJFenZWWJ7fQOOo8V/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGlRF-0000000ECwh-3eKE;
	Tue, 13 Oct 2026 22:57:41 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGlRC-0000000ECwW-3uJs
	for linux-mtd@lists.infradead.org;
	Tue, 13 Oct 2026 22:57:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7C6F442DDE;
	Tue, 13 Oct 2026 22:57:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 184311F000FF;
	Tue, 13 Oct 2026 22:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791932258;
	bh=/tsBWa/AeIHpWYnSfggb/tcEzc59MfiSDgJMKAguNHg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MgFLhfUM1TXGEfGMJsgcAb6Y1wRILjIj+J3R430oMlOvQtyf5Jv0IB+lzvt1e4uzL
	 67Q2NgzwDZcj0h0Gp+T4ZaD9fgQpqhU9WOBXb6JeIcXDiW/RmANUUDfYQ0h6pl/r4I
	 hsAFKKlxYOd3LPAKeNTyC54ujuxFojj1SrrMesYXyVNqoCUi6IKFL2xce+4dIemMTs
	 G6MjJFNmZLll7yoqdBaXLsVLdEvTrtoUCVBTfMvaHLChoNrsUz/e7sCt7ZqvxZmfgO
	 q+KVRFyMjefBCAo4ERPG6jZrtvjqAE5PcsoFqWN9Ygr1Yn5uKAyTcrdqfg2Tg5EKX0
	 R3ORV5tNZHeLQ==
Message-ID: <sashiko-outbox-170614@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 10/11] drm/amdkfd: Free queue in procfs_queue_type
 kobject release callback
To: "Ian Rogers" <irogers@google.com>, "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Rafael
 J . Wysocki" <rafael@kernel.org>, "Danilo Krummrich" <dakr@kernel.org>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Kees Cook" <kees@kernel.org>, "Nathan
 Chancellor" <nathan@kernel.org>
Cc: "Nick Desaulniers" <ndesaulniers@google.com>, "Bill Wendling" <morbo@google.com>, "Justin
 Stitt" <justinstitt@google.com>, "Jonathan Corbet" <corbet@lwn.net>, "Madhavan
 Srinivasan" <maddy@linux.ibm.com>, "Michael Ellerman" <mpe@ellerman.id.au>, "Nicholas
 Piggin" <npiggin@gmail.com>, "Christophe Leroy" <chleroy@kernel.org>, "Nayna
 Jain" <nayna@linux.ibm.com>, "Yoshinori Sato" <ysato@users.sourceforge.jp>, "Rich
 Felker" <dalias@libc.org>, "John Paul Adrian Glaubitz" <glaubitz@physik.fu-berlin.de>, "Viresh
 Kumar" <viresh.kumar@linaro.org>, "David Teigland" <teigland@redhat.com>, "Alexander
 Aring" <aahringo@redhat.com>, "Juergen Gross" <jgross@suse.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, "Oleksandr Tyshchenko" <oleksandr_tyshchenko@epam.com>, "Heiko
 Carstens" <hca@linux.ibm.com>, "Vasily Gorbik" <gor@linux.ibm.com>, "Alexander
 Gordeev" <agordeev@linux.ibm.com>, "Christian Borntraeger" <borntraeger@linux.ibm.com>, "Sven
 Schnelle" <svens@linux.ibm.com>, "Richard Weinberger" <richard@nod.at>, "Zhihao
 Cheng" <chengzhihao1@huawei.com>, "Felix Kuehling" <Felix.Kuehling@amd.com>, "Alex
 Deucher" <alexander.deucher@amd.com>, =?utf-8?b?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>, linux-s390@vger.kernel.org, linux-mtd@lists.infradead.org, dri-devel@lists.freedesktop.org
In-Reply-To: <20261013223946.1836757-11-irogers@google.com>
References: <20261013223946.1836757-1-irogers@google.com>
 <20261013223946.1836757-11-irogers@google.com>
Date: Tue, 13 Oct 2026 22:57:36 +0000
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW01lZGl1bV0gc3lzZnM6IFdBUk5J
TkcgaW4ga2VybmZzX3JlbW92ZV9ieV9uYW1lX25zIGR1ZSB0byB1bmNvbmRpdGlvbmFsbHkgZGVs
ZXRpbmcgdW5pbml0aWFsaXplZCBrb2JqZWN0Ci0tCgpjb21taXQgYTgxM2U1ZTVlMzhmZjkyNmE4
ODU5ZjIyNzMyZDhmZGUzZTBlZDY4OQpBdXRob3I6IElhbiBSb2dlcnMgPGlyb2dlcnNAZ29vZ2xl
LmNvbT4KCmRybS9hbWRrZmQ6IEZyZWUgcXVldWUgaW4gcHJvY2ZzX3F1ZXVlX3R5cGUga29iamVj
dCByZWxlYXNlIGNhbGxiYWNrCgpUaGlzIGNvbW1pdCBhZGRzIGEgcmVsZWFzZSBjYWxsYmFjayB0
byBmcmVlIHRoZSBzdHJ1Y3QgcXVldWUgZnJvbSB0aGUga29iamVjdApyZWxlYXNlIGZ1bmN0aW9u
IHRvIHByZXZlbnQgYSB1c2UtYWZ0ZXItZnJlZSwgYW5kIGFkanVzdHMgdGhlIGtvYmplY3RfcHV0
KCkKbG9jYXRpb25zIGFjY29yZGluZ2x5LgoKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRrZmQva2ZkX3Byb2Nlc3MuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tm
ZF9wcm9jZXNzLmMKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfcHJvY2Vz
cy5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX3Byb2Nlc3MuYwpbIC4u
LiBdCj4gQEAgLTcwMSw3ICs3MDgsNiBAQCB2b2lkIGtmZF9wcm9jZnNfZGVsX3F1ZXVlKHN0cnVj
dCBxdWV1ZSAqcSkKPiAgCQlyZXR1cm47Cj4gIAo+ICAJa29iamVjdF9kZWwoJnEtPmtvYmopOwoK
W1NldmVyaXR5OiBNZWRpdW1dCkNhbiB0aGlzIHRyaWdnZXIgYSBrZXJuZWwgd2FybmluZyBpZiBz
eXNmcyBjcmVhdGlvbiBmYWlscz8KCklmIGtmZF9wcm9jZnNfYWRkX3F1ZXVlKCkgZmFpbHMgKGZv
ciBleGFtcGxlLCBkdWUgdG8gYSBtZW1vcnkgYWxsb2NhdGlvbiBmYWlsdXJlCmluIHN5c2ZzKSwg
cS0+a29iai5zdGF0ZV9pbl9zeXNmcyByZW1haW5zIDAgYW5kIHEtPmtvYmouc2QgaXMgbnVsbC4g
SG93ZXZlciwKcHFtX2NyZWF0ZV9xdWV1ZSgpIG1heSBpZ25vcmUgdGhpcyBzeXNmcyBmYWlsdXJl
IGFuZCBrZWVwIHRoZSBxdWV1ZSBvcGVyYXRpb25hbC4KCkxhdGVyLCB3aGVuIHBxbV9kZXN0cm95
X3F1ZXVlKCkgY2FsbHMga2ZkX3Byb2Nmc19kZWxfcXVldWUoKSwga29iamVjdF9kZWwoKSBpcwpj
YWxsZWQgdW5jb25kaXRpb25hbGx5LgoKVGhpcyByZXN1bHRzIGluIGEgY2FsbCBjaGFpbiB0byBf
X2tvYmplY3RfZGVsKCkgd2hpY2ggaW52b2tlcwpzeXNmc19yZW1vdmVfZ3JvdXBzKCkgd2l0aCBh
IG51bGwga29iai0+c2QuIFRoaXMgZXZlbnR1YWxseSBwcm9wYWdhdGVzIHRvCmtlcm5mc19yZW1v
dmVfYnlfbmFtZV9ucygpLCB3aGVyZSBhIHdhcm5pbmcgaXMgdHJpZ2dlcmVkIGV4cGxpY2l0bHkg
d2hlbgppdHMgcGFyZW50IGFyZ3VtZW50IGlzIG51bGw6Cgpmcy9rZXJuZnMvZGlyLmM6a2VybmZz
X3JlbW92ZV9ieV9uYW1lX25zKCkgewogICAgLi4uCiAgICBpZiAoIXBhcmVudCkgewogICAgICAg
IFdBUk4oMSwgS0VSTl9XQVJOSU5HICJrZXJuZnM6IGNhbiBub3QgcmVtb3ZlICclcycsIG5vIGRp
cmVjdG9yeVxuIiwgbmFtZSk7CiAgICAgICAgcmV0dXJuIC1FTk9FTlQ7CiAgICB9CiAgICAuLi4K
fQoKU2hvdWxkIHdlIGNoZWNrIGlmIHRoZSBrb2JqZWN0IHdhcyBzdWNjZXNzZnVsbHkgYWRkZWQg
dG8gc3lzZnMgKHN1Y2ggYXMgY2hlY2tpbmcKcS0+a29iai5zdGF0ZV9pbl9zeXNmcykgYmVmb3Jl
IGNhbGxpbmcga29iamVjdF9kZWwoKT8KCj4gLQlrb2JqZWN0X3B1dCgmcS0+a29iaik7Cj4gIH0K
Ci0tIApTYXNoaWtvIEFJIHJldmlldyDCtyBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQv
MjAyNjEwMTMyMjM5NDYuMTgzNjc1Ny0xLWlyb2dlcnNAZ29vZ2xlLmNvbT9wYXJ0PTEwCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgg
TVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
