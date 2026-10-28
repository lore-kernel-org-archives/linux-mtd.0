Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9424A606A31F
	for <linux-mtd@archiver.kernel.org>; Wed, 28 Oct 2026 11:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ahSmBplD;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NCqulnQV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=0fy+Yqiw8AMzvRW/tzH7drQkBoPjvj9LK/TcjvIAI1M=; b=ahSmBplDPNEvgcgQqmO95cYSJc
	bMQbpl9tfsmZ02ZiWjbSXXzLlOlOoB6XLrItMfAQEMv/5MO/rlDEFXDlmoDHghtSLZC6lnCmBf8+c
	Z1pqto0cuOX014ZOKICrnFDtjrqqpyyZ4GvtmxW42glvuTU7KcUZhC4UrrvYNfuMKiqCiUgEIyJ1S
	Qa6Bl30+FmZUNan5LPbRXPkspUfOUlXF19OvcVgQOuNljuNtABsT4to2zEag14FQlHsWG6mEUcjeT
	Lca41V8m3qQEn0+hmqccRG3TPXzOXmo/0pQk0eRTPckzeF8uMAIfBQmfVlLiqOc0yCqwBMfRazz09
	efrMU1+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM1zt-00000006sGw-1ScZ;
	Wed, 28 Oct 2026 11:39:13 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM1zr-00000006sGp-36CO
	for linux-mtd@lists.infradead.org;
	Wed, 28 Oct 2026 11:39:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 301E44400F
	for <linux-mtd@lists.infradead.org>; Wed, 28 Oct 2026 11:39:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 174A91F031E2
	for <linux-mtd@lists.infradead.org>; Wed, 28 Oct 2026 11:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793187551;
	bh=sOScShlNJOoFQgumDsqaC2sVgmpV4+y6Yzg+EW5P6X4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=NCqulnQV1h+oVFLj/JhvH88k7PyrmAZ6XFGU/jiu5vwmg6MjMT387K4TYKodpqyNq
	 MA0BGC2UYvKstLU/+8/cU5Hij1Qun59tjJw/DfIwq+KOZ2E09VTvYib4JyxzD8A5vR
	 9FMKKj0khUwFeMGpJ36F9Yqb8MQuFJfMvFW+1Xa1LhcKkL7/unEYyqXLa8aM1bpZEA
	 8dVngYrjEWSjp8xk5SkQO9dzrkVfgOUKD2fJzEqMBvE5ibg3bcu5KhMtDARfyRNLPC
	 kqtSBBmkS9cFqnZa7WvMACuYyHl+L9D+bWWczw59zel2Twkqi/4fhm8hAddVbD+Xhz
	 2H9eXmztHew9Q==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5bb7c6980f1so957776e87.2
        for <linux-mtd@lists.infradead.org>; Wed, 28 Oct 2026 04:39:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByeBRV2WyuhqfllnmQf3YgNwYNMIuWxNF2B2cBeW4lqW4DNBdfzUG5C8FxBi5oSba+jJOkebAexJ4U=@lists.infradead.org
X-Gm-Message-State: AFq9FYJZ59v8C2zc+HHdan4LI9+pofIXAXUphCdi91NoWHu4BqmQT/zv
	U4ZQB/1NpDiB8A3FZ44ywQBH2xOcOC6NNf/9gsJqVC4sCtIQUjXdKdAIzhUKaRA9LlBbUxG07Jn
	obuDbkCgmYVwjaKAsQ6wILb3uabpX8gs=
X-Received: by 2002:a05:6512:1111:b0:5b9:6603:d451 with SMTP id
 2adb3069b0e04-5bfcad31c8emr697328e87.3.1793187548999; Wed, 28 Oct 2026
 04:39:08 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261027223847.652884-1-irogers@google.com> <20261027223847.652884-5-irogers@google.com>
In-Reply-To: <20261027223847.652884-5-irogers@google.com>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Wed, 28 Oct 2026 12:38:56 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0juvZ2ZVRBkY6FxBM=NhPt9vMA3+yRugXc5u=U1jO9AXg@mail.gmail.com>
X-Gm-Features: AclHuK-NXF3tWCMDzaNjIN417c7ZMuQGYjVHoQ_x6BSITeW_KdKoI_jbnClXt6k
Message-ID: <CAJZ5v0juvZ2ZVRBkY6FxBM=NhPt9vMA3+yRugXc5u=U1jO9AXg@mail.gmail.com>
Subject: Re: [PATCH v2 4/9] cpufreq: governor: Initialize kobj_type release
 callback statically
To: Ian Rogers <irogers@google.com>
Cc: Kees Cook <kees@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Miguel Ojeda <ojeda@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Zhihao Cheng <chengzhihao1@huawei.com>, Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>, 
	Sumanth Korikkar <sumanthk@linux.ibm.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, driver-core@lists.linux.dev, llvm@lists.linux.dev, 
	linux-hardening@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-acpi@vger.kernel.org, 
	linux-pm@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-sh@vger.kernel.org, linux-s390@vger.kernel.org, gfs2@lists.linux.dev, 
	xen-devel@lists.xenproject.org, linux-mtd@lists.infradead.org, 
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Viresh Kumar <viresh.kumar@linaro.org>
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gVHVlLCBPY3QgMjcsIDIwMjYgYXQgMTE6MznigK9QTSBJYW4gUm9nZXJzIDxpcm9nZXJzQGdv
b2dsZS5jb20+IHdyb3RlOgo+Cj4gRXhwb3J0IGNwdWZyZXFfZGJzX2RhdGFfcmVsZWFzZSgpIGFu
ZCBzZXQgLmtvYmpfdHlwZS5yZWxlYXNlIHN0YXRpY2FsbHkKPiBpbiB0aGUgb25kZW1hbmQgYW5k
IGNvbnNlcnZhdGl2ZSBnb3Zlcm5vcnMgc28gdGhlaXIgZ292X2F0dHJfc2V0Cj4ga29iamVjdHMg
aGF2ZSBhIHZhbGlkIHJlbGVhc2UgY2FsbGJhY2sgc3RhdGljYWxseSBpbml0aWFsaXplZCwgbWF0
Y2hpbmcKPiBjcHVmcmVxX2dvdmVybm9yX2Ricy4gUmVtb3ZlIHRoZSByZWR1bmRhbnQgcnVudGlt
ZSBhc3NpZ25tZW50IGluCj4gY3B1ZnJlcV9kYnNfZ292ZXJub3JfaW5pdCgpLgo+Cj4gVGhpcyBw
cmVwYXJlcyBmb3IgYW5ub3RhdGluZyBzdHJ1Y3Qga29ial90eXBlOjpyZWxlYXNlIHdpdGgKPiBf
X211c3RfaW5pdC4KPgo+IFNpZ25lZC1vZmYtYnk6IElhbiBSb2dlcnMgPGlyb2dlcnNAZ29vZ2xl
LmNvbT4KCkRvIHlvdSB3YW50IHN0dWZmIHRvIGJlIHBpY2tlZCB1cCBieSBtYWludGFpbmVycywg
b3IgZG8geW91IHdhbnQgdG8Kcm91dGUgaXQgeW91cnNlbGY/Cgo+IC0tLQo+ICBkcml2ZXJzL2Nw
dWZyZXEvY3B1ZnJlcV9jb25zZXJ2YXRpdmUuYyB8IDUgKysrKy0KPiAgZHJpdmVycy9jcHVmcmVx
L2NwdWZyZXFfZ292ZXJub3IuYyAgICAgfCA0ICsrLS0KPiAgZHJpdmVycy9jcHVmcmVxL2NwdWZy
ZXFfZ292ZXJub3IuaCAgICAgfCAxICsKPiAgZHJpdmVycy9jcHVmcmVxL2NwdWZyZXFfb25kZW1h
bmQuYyAgICAgfCA1ICsrKystCj4gIDQgZmlsZXMgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwg
NCBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2NwdWZyZXEvY3B1ZnJlcV9j
b25zZXJ2YXRpdmUuYyBiL2RyaXZlcnMvY3B1ZnJlcS9jcHVmcmVxX2NvbnNlcnZhdGl2ZS5jCj4g
aW5kZXggMDJiZmQ0NjU0M2U5Li4xNDZhMjM1M2IxYTIgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9j
cHVmcmVxL2NwdWZyZXFfY29uc2VydmF0aXZlLmMKPiArKysgYi9kcml2ZXJzL2NwdWZyZXEvY3B1
ZnJlcV9jb25zZXJ2YXRpdmUuYwo+IEBAIC0zMTgsNyArMzE4LDEwIEBAIHN0YXRpYyB2b2lkIGNz
X2xpbWl0cyhzdHJ1Y3QgY3B1ZnJlcV9wb2xpY3kgKnBvbGljeSkKPgo+ICBzdGF0aWMgc3RydWN0
IGRic19nb3Zlcm5vciBjc19nb3Zlcm5vciA9IHsKPiAgICAgICAgIC5nb3YgPSBDUFVGUkVRX0RC
U19HT1ZFUk5PUl9JTklUSUFMSVpFUigiY29uc2VydmF0aXZlIiksCj4gLSAgICAgICAua29ial90
eXBlID0geyAuZGVmYXVsdF9ncm91cHMgPSBjc19ncm91cHMgfSwKPiArICAgICAgIC5rb2JqX3R5
cGUgPSB7Cj4gKyAgICAgICAgICAgICAgIC5yZWxlYXNlID0gY3B1ZnJlcV9kYnNfZGF0YV9yZWxl
YXNlLAo+ICsgICAgICAgICAgICAgICAuZGVmYXVsdF9ncm91cHMgPSBjc19ncm91cHMsCj4gKyAg
ICAgICB9LAo+ICAgICAgICAgLmdvdl9kYnNfdXBkYXRlID0gY3NfZGJzX3VwZGF0ZSwKPiAgICAg
ICAgIC5hbGxvYyA9IGNzX2FsbG9jLAo+ICAgICAgICAgLmZyZWUgPSBjc19mcmVlLAo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2NwdWZyZXEvY3B1ZnJlcV9nb3Zlcm5vci5jIGIvZHJpdmVycy9jcHVm
cmVxL2NwdWZyZXFfZ292ZXJub3IuYwo+IGluZGV4IGYzYmQzZGJlN2M0MS4uZjhiNWFjYTA5YjZi
IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvY3B1ZnJlcS9jcHVmcmVxX2dvdmVybm9yLmMKPiArKysg
Yi9kcml2ZXJzL2NwdWZyZXEvY3B1ZnJlcV9nb3Zlcm5vci5jCj4gQEAgLTQxOSw3ICs0MTksNyBA
QCBzdGF0aWMgdm9pZCBmcmVlX3BvbGljeV9kYnNfaW5mbyhzdHJ1Y3QgcG9saWN5X2Ric19pbmZv
ICpwb2xpY3lfZGJzLAo+ICAgICAgICAgZ292LT5mcmVlKHBvbGljeV9kYnMpOwo+ICB9Cj4KPiAt
c3RhdGljIHZvaWQgY3B1ZnJlcV9kYnNfZGF0YV9yZWxlYXNlKHN0cnVjdCBrb2JqZWN0ICprb2Jq
KQo+ICt2b2lkIGNwdWZyZXFfZGJzX2RhdGFfcmVsZWFzZShzdHJ1Y3Qga29iamVjdCAqa29iaikK
PiAgewo+ICAgICAgICAgc3RydWN0IGRic19kYXRhICpkYnNfZGF0YSA9IHRvX2Ric19kYXRhKHRv
X2dvdl9hdHRyX3NldChrb2JqKSk7Cj4gICAgICAgICBzdHJ1Y3QgZGJzX2dvdmVybm9yICpnb3Yg
PSBkYnNfZGF0YS0+Z292Owo+IEBAIC00MjcsNiArNDI3LDcgQEAgc3RhdGljIHZvaWQgY3B1ZnJl
cV9kYnNfZGF0YV9yZWxlYXNlKHN0cnVjdCBrb2JqZWN0ICprb2JqKQo+ICAgICAgICAgZ292LT5l
eGl0KGRic19kYXRhKTsKPiAgICAgICAgIGtmcmVlKGRic19kYXRhKTsKPiAgfQo+ICtFWFBPUlRf
U1lNQk9MX0dQTChjcHVmcmVxX2Ric19kYXRhX3JlbGVhc2UpOwo+Cj4gIGludCBjcHVmcmVxX2Ri
c19nb3Zlcm5vcl9pbml0KHN0cnVjdCBjcHVmcmVxX3BvbGljeSAqcG9saWN5KQo+ICB7Cj4gQEAg
LTQ4OCw3ICs0ODksNiBAQCBpbnQgY3B1ZnJlcV9kYnNfZ292ZXJub3JfaW5pdChzdHJ1Y3QgY3B1
ZnJlcV9wb2xpY3kgKnBvbGljeSkKPiAgICAgICAgIHBvbGljeS0+Z292ZXJub3JfZGF0YSA9IHBv
bGljeV9kYnM7Cj4KPiAgICAgICAgIGdvdi0+a29ial90eXBlLnN5c2ZzX29wcyA9ICZnb3Zlcm5v
cl9zeXNmc19vcHM7Cj4gLSAgICAgICBnb3YtPmtvYmpfdHlwZS5yZWxlYXNlID0gY3B1ZnJlcV9k
YnNfZGF0YV9yZWxlYXNlOwo+ICAgICAgICAgcmV0ID0ga29iamVjdF9pbml0X2FuZF9hZGQoJmRi
c19kYXRhLT5hdHRyX3NldC5rb2JqLCAmZ292LT5rb2JqX3R5cGUsCj4gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBnZXRfZ292ZXJub3JfcGFyZW50X2tvYmoocG9saWN5KSwKPiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICIlcyIsIGdvdi0+Z292Lm5hbWUpOwo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2NwdWZyZXEvY3B1ZnJlcV9nb3Zlcm5vci5oIGIvZHJpdmVy
cy9jcHVmcmVxL2NwdWZyZXFfZ292ZXJub3IuaAo+IGluZGV4IDgwNmQ4ZmI0ZGZmMS4uMTAyNjcx
MmJiNzliIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvY3B1ZnJlcS9jcHVmcmVxX2dvdmVybm9yLmgK
PiArKysgYi9kcml2ZXJzL2NwdWZyZXEvY3B1ZnJlcV9nb3Zlcm5vci5oCj4gQEAgLTE1MCw2ICsx
NTAsNyBAQCBzdGF0aWMgaW5saW5lIHN0cnVjdCBkYnNfZ292ZXJub3IgKmRic19nb3Zlcm5vcl9v
ZihzdHJ1Y3QgY3B1ZnJlcV9wb2xpY3kgKnBvbGljeQo+ICB9Cj4KPiAgLyogR292ZXJub3IgY2Fs
bGJhY2sgcm91dGluZXMgKi8KPiArdm9pZCBjcHVmcmVxX2Ric19kYXRhX3JlbGVhc2Uoc3RydWN0
IGtvYmplY3QgKmtvYmopOwo+ICBpbnQgY3B1ZnJlcV9kYnNfZ292ZXJub3JfaW5pdChzdHJ1Y3Qg
Y3B1ZnJlcV9wb2xpY3kgKnBvbGljeSk7Cj4gIHZvaWQgY3B1ZnJlcV9kYnNfZ292ZXJub3JfZXhp
dChzdHJ1Y3QgY3B1ZnJlcV9wb2xpY3kgKnBvbGljeSk7Cj4gIGludCBjcHVmcmVxX2Ric19nb3Zl
cm5vcl9zdGFydChzdHJ1Y3QgY3B1ZnJlcV9wb2xpY3kgKnBvbGljeSk7Cj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvY3B1ZnJlcS9jcHVmcmVxX29uZGVtYW5kLmMgYi9kcml2ZXJzL2NwdWZyZXEvY3B1
ZnJlcV9vbmRlbWFuZC5jCj4gaW5kZXggOTk0MmRiYjM4ZGFlLi43Mzg2ZDA0M2M2NjUgMTAwNjQ0
Cj4gLS0tIGEvZHJpdmVycy9jcHVmcmVxL2NwdWZyZXFfb25kZW1hbmQuYwo+ICsrKyBiL2RyaXZl
cnMvY3B1ZnJlcS9jcHVmcmVxX29uZGVtYW5kLmMKPiBAQCAtMzc0LDcgKzM3NCwxMCBAQCBzdGF0
aWMgc3RydWN0IG9kX29wcyBvZF9vcHMgPSB7Cj4KPiAgc3RhdGljIHN0cnVjdCBkYnNfZ292ZXJu
b3Igb2RfZGJzX2dvdiA9IHsKPiAgICAgICAgIC5nb3YgPSBDUFVGUkVRX0RCU19HT1ZFUk5PUl9J
TklUSUFMSVpFUigib25kZW1hbmQiKSwKPiAtICAgICAgIC5rb2JqX3R5cGUgPSB7IC5kZWZhdWx0
X2dyb3VwcyA9IG9kX2dyb3VwcyB9LAo+ICsgICAgICAgLmtvYmpfdHlwZSA9IHsKPiArICAgICAg
ICAgICAgICAgLnJlbGVhc2UgPSBjcHVmcmVxX2Ric19kYXRhX3JlbGVhc2UsCj4gKyAgICAgICAg
ICAgICAgIC5kZWZhdWx0X2dyb3VwcyA9IG9kX2dyb3VwcywKPiArICAgICAgIH0sCj4gICAgICAg
ICAuZ292X2Ric191cGRhdGUgPSBvZF9kYnNfdXBkYXRlLAo+ICAgICAgICAgLmFsbG9jID0gb2Rf
YWxsb2MsCj4gICAgICAgICAuZnJlZSA9IG9kX2ZyZWUsCj4gLS0KPiAyLjU2LjAuMzEzLmcyNDc5
MzIyZTY4LWdvb2cKPgo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
