Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E291606A325
	for <linux-mtd@archiver.kernel.org>; Wed, 28 Oct 2026 15:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=5Egt+iyA;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VHtM/wzi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=mW8RG6AqnQPk/tw02SYyP1seCaehskauV+Ecti3Z4KA=; b=5Egt+iyAtNpgTF3DkiP50tmSRx
	NCkaJkIQ4AsXnR4h9rCMceyh9EZwdGv/KvdLoJU5KdnSRW6sCMJ5NZuBMCLbDJeKYCVPuxM9E/88P
	36eY9mkIeC6LB7ghwcqKaquYkFbjxvHp4u5ov4Z9xm3Dk4n9a59C8BYcxFViGJIHMsmQQjOl+x6os
	KAaxrPr6xPMKgElRaTyekwin2jrQiyhr6yyNP60SHUaWe0TF8WN9Qh0SBprkJ1j8/V64T5YO25+j5
	2eUD+ujWceL/1BLMyNUWQMGJH4l3ADH5XPzGBioPyva/xX1XudQ+tFC7abLyyvlu2xUMDbWFG9OAC
	crSrsHmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM5km-00000007QUn-2EmY;
	Wed, 28 Oct 2026 15:39:52 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM5kl-00000007QUg-1kiI
	for linux-mtd@lists.infradead.org;
	Wed, 28 Oct 2026 15:39:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DEB604381F
	for <linux-mtd@lists.infradead.org>; Wed, 28 Oct 2026 15:39:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5B041F031F7
	for <linux-mtd@lists.infradead.org>; Wed, 28 Oct 2026 15:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793201990;
	bh=v/GrfVBE9REqGlviMjMV9KYA8baC9D3Z4PFL9rDyJNI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=VHtM/wzid4Vjpi1ahtkrCTunBXdpMk588+yxAl/Zt7jPzQ9CgDIh+PYPt+lW+RHtD
	 XBF1ITpY/oCCREN/r3GxTTiasnxkbYCm2mrSb3zmMn23c5zknBvNx/dV5SfeyYM827
	 m45G9IzvrUp2GsXITO1BPz91FS4SrBTRct5fIYPvHF7/uja6GCRbMQHJlEDtcLZFBR
	 bBqsTOILPojBkbqP9c5uFYFLXwvDa2XYT2SFUMxRTuB6ZQzLNkssif/6urHzHO00fk
	 Skgn+ptvjMSTS3VMBezq8yREZJPVwbZdc9I441ADP3crdeclpWj7HnR60MZ9kaBb89
	 e8j26jTotaK2A==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5be4d648aacso1063530e87.3
        for <linux-mtd@lists.infradead.org>; Wed, 28 Oct 2026 08:39:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwSlozIMX2gyK9RBCsnRtrS1gryyNnjmFNQA46I2suxL0GfqFPxpijt3ndD+9bfzYqsZXXM9nZgYF4=@lists.infradead.org
X-Gm-Message-State: AFq9FYLq55ywWYUixLpsczN/IpXsUP9YwaA+eMGIdS38I4Z8nagGuTcN
	KTISPD4DHmlxfJqHjxjRtOXiSFoN3GhVDfejfqqOKo87vpgvBr/YtVbCbpoh9aIDhm6WUMJUKtw
	NCrYaM8hiiqJNHosSALzdFcyBMIkJtms=
X-Received: by 2002:a05:6512:33cb:b0:5bf:ba43:f2f1 with SMTP id
 2adb3069b0e04-5bfcad8c081mr1232361e87.34.1793201988873; Wed, 28 Oct 2026
 08:39:48 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261027223847.652884-1-irogers@google.com> <20261027223847.652884-5-irogers@google.com>
 <CAJZ5v0juvZ2ZVRBkY6FxBM=NhPt9vMA3+yRugXc5u=U1jO9AXg@mail.gmail.com> <CAP-5=fWVZ=7-qDRODiEQzRzhpQqribv9Morj=OoAXW_6uaW2dA@mail.gmail.com>
In-Reply-To: <CAP-5=fWVZ=7-qDRODiEQzRzhpQqribv9Morj=OoAXW_6uaW2dA@mail.gmail.com>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Wed, 28 Oct 2026 16:39:37 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0i0YoOW+ueh_aZJdYVS0etuCqfrf_S0NTKzCE9_6oKxPQ@mail.gmail.com>
X-Gm-Features: AclHuK-jtq7opXKWd_89haXf76RntnjsmSewB7PcsqPK44QRbhInXeBo-GT0LQw
Message-ID: <CAJZ5v0i0YoOW+ueh_aZJdYVS0etuCqfrf_S0NTKzCE9_6oKxPQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/9] cpufreq: governor: Initialize kobj_type release
 callback statically
To: Ian Rogers <irogers@google.com>
Cc: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>, Kees Cook <kees@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
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

T24gV2VkLCBPY3QgMjgsIDIwMjYgYXQgNDozNuKAr1BNIElhbiBSb2dlcnMgPGlyb2dlcnNAZ29v
Z2xlLmNvbT4gd3JvdGU6Cj4KPiBPbiBXZWQsIE9jdCAyOCwgMjAyNiBhdCA0OjM54oCvQU0gUmFm
YWVsIEouIFd5c29ja2kgKEludGVsKQo+IDxyYWZhZWxAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPgo+
ID4gT24gVHVlLCBPY3QgMjcsIDIwMjYgYXQgMTE6MznigK9QTSBJYW4gUm9nZXJzIDxpcm9nZXJz
QGdvb2dsZS5jb20+IHdyb3RlOgo+ID4gPgo+ID4gPiBFeHBvcnQgY3B1ZnJlcV9kYnNfZGF0YV9y
ZWxlYXNlKCkgYW5kIHNldCAua29ial90eXBlLnJlbGVhc2Ugc3RhdGljYWxseQo+ID4gPiBpbiB0
aGUgb25kZW1hbmQgYW5kIGNvbnNlcnZhdGl2ZSBnb3Zlcm5vcnMgc28gdGhlaXIgZ292X2F0dHJf
c2V0Cj4gPiA+IGtvYmplY3RzIGhhdmUgYSB2YWxpZCByZWxlYXNlIGNhbGxiYWNrIHN0YXRpY2Fs
bHkgaW5pdGlhbGl6ZWQsIG1hdGNoaW5nCj4gPiA+IGNwdWZyZXFfZ292ZXJub3JfZGJzLiBSZW1v
dmUgdGhlIHJlZHVuZGFudCBydW50aW1lIGFzc2lnbm1lbnQgaW4KPiA+ID4gY3B1ZnJlcV9kYnNf
Z292ZXJub3JfaW5pdCgpLgo+ID4gPgo+ID4gPiBUaGlzIHByZXBhcmVzIGZvciBhbm5vdGF0aW5n
IHN0cnVjdCBrb2JqX3R5cGU6OnJlbGVhc2Ugd2l0aAo+ID4gPiBfX211c3RfaW5pdC4KPiA+ID4K
PiA+ID4gU2lnbmVkLW9mZi1ieTogSWFuIFJvZ2VycyA8aXJvZ2Vyc0Bnb29nbGUuY29tPgo+ID4K
PiA+IERvIHlvdSB3YW50IHN0dWZmIHRvIGJlIHBpY2tlZCB1cCBieSBtYWludGFpbmVycywgb3Ig
ZG8geW91IHdhbnQgdG8KPiA+IHJvdXRlIGl0IHlvdXJzZWxmPwo+Cj4gSGkgUmFmYWVsLAo+Cj4g
SnVzdCBhIHF1aWNrIG5vdGU6IEkgYWdyZWUgd2l0aCBaaG9uZ3FpdSdzIGZlZWRiYWNrIGFuZCB0
aGUgY29tbWl0Cj4gbWVzc2FnZSBuZWVkcyBhIGZpeC4KPgo+IFJlZ2FyZGluZyBtZXJnaW5nIHRo
ZSBwYXRjaGVzLCB0aGUgaXNzdWUgd2l0aCBtYWludGFpbmVycyBwaWNraW5nIHVwCj4gZml4ZXMg
aXMgdGhhdCB0aGUgc2VyaWVzIHdpbGwgYnJlYWsgdGhlIGNsYW5nL2xsdm0gYnVpbGQgd2l0aG91
dCB0aGVtLgo+IFNvIHRoZSBtYWludGFpbmVycyBuZWVkIHRvIGVpdGhlciBtZXJnZSB0aGUgcGF0
Y2hlcyAoYW5kIHRoZSBzZXJpZXMgYmUKPiByZWJhc2VkIG9uIHRvcCBvZiB0aGVtKSBvciBtZXJn
ZSB0aGUgc2VyaWVzIGFzIGEgdW5pdC4gUGVyaGFwcyBzaW5jZQo+IHRoZSBwYXRjaGVzIGFsaWdu
LCBtZXJnZSBjb25mbGljdHMgd29uJ3QgaGFwcGVuLCBzbyBtYWludGFpbmVycwo+IG1lcmdpbmcg
YW5kIGxhbmRpbmcgdGhlIHNlcmllcyBpcyBva2F5LiBJIGRvbid0IGhhdmUgdGhlIGV4cGVyaWVu
Y2UgdG8KPiBrbm93LgoKSSdkIGV4cGVjdCB0aGUgZHJpdmVyIGNvcmUgdG8gcGljayB1cCB0aGUg
c2VyaWVzIGFzIGEgd2hvbGUgdGhlbiwgc28KcGxlYXNlIGZlZWwgZnJlZSB0byBhZGQKCkFja2Vk
LWJ5OiBSYWZhZWwgSi4gV3lzb2NraSAoSW50ZWwpIDxyYWZhZWxAa2VybmVsLm9yZz4gIyBjcHVm
cmVxCgp0byB0aGUgbmV4dCB2ZXJzaW9uIG9mIHRoaXMgcGF0Y2guCgpUaGFua3MhCgo+ID4gPiAt
LS0KPiA+ID4gIGRyaXZlcnMvY3B1ZnJlcS9jcHVmcmVxX2NvbnNlcnZhdGl2ZS5jIHwgNSArKysr
LQo+ID4gPiAgZHJpdmVycy9jcHVmcmVxL2NwdWZyZXFfZ292ZXJub3IuYyAgICAgfCA0ICsrLS0K
PiA+ID4gIGRyaXZlcnMvY3B1ZnJlcS9jcHVmcmVxX2dvdmVybm9yLmggICAgIHwgMSArCj4gPiA+
ICBkcml2ZXJzL2NwdWZyZXEvY3B1ZnJlcV9vbmRlbWFuZC5jICAgICB8IDUgKysrKy0KPiA+ID4g
IDQgZmlsZXMgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPiA+ID4K
PiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvY3B1ZnJlcS9jcHVmcmVxX2NvbnNlcnZhdGl2ZS5j
IGIvZHJpdmVycy9jcHVmcmVxL2NwdWZyZXFfY29uc2VydmF0aXZlLmMKPiA+ID4gaW5kZXggMDJi
ZmQ0NjU0M2U5Li4xNDZhMjM1M2IxYTIgMTAwNjQ0Cj4gPiA+IC0tLSBhL2RyaXZlcnMvY3B1ZnJl
cS9jcHVmcmVxX2NvbnNlcnZhdGl2ZS5jCj4gPiA+ICsrKyBiL2RyaXZlcnMvY3B1ZnJlcS9jcHVm
cmVxX2NvbnNlcnZhdGl2ZS5jCj4gPiA+IEBAIC0zMTgsNyArMzE4LDEwIEBAIHN0YXRpYyB2b2lk
IGNzX2xpbWl0cyhzdHJ1Y3QgY3B1ZnJlcV9wb2xpY3kgKnBvbGljeSkKPiA+ID4KPiA+ID4gIHN0
YXRpYyBzdHJ1Y3QgZGJzX2dvdmVybm9yIGNzX2dvdmVybm9yID0gewo+ID4gPiAgICAgICAgIC5n
b3YgPSBDUFVGUkVRX0RCU19HT1ZFUk5PUl9JTklUSUFMSVpFUigiY29uc2VydmF0aXZlIiksCj4g
PiA+IC0gICAgICAgLmtvYmpfdHlwZSA9IHsgLmRlZmF1bHRfZ3JvdXBzID0gY3NfZ3JvdXBzIH0s
Cj4gPiA+ICsgICAgICAgLmtvYmpfdHlwZSA9IHsKPiA+ID4gKyAgICAgICAgICAgICAgIC5yZWxl
YXNlID0gY3B1ZnJlcV9kYnNfZGF0YV9yZWxlYXNlLAo+ID4gPiArICAgICAgICAgICAgICAgLmRl
ZmF1bHRfZ3JvdXBzID0gY3NfZ3JvdXBzLAo+ID4gPiArICAgICAgIH0sCj4gPiA+ICAgICAgICAg
Lmdvdl9kYnNfdXBkYXRlID0gY3NfZGJzX3VwZGF0ZSwKPiA+ID4gICAgICAgICAuYWxsb2MgPSBj
c19hbGxvYywKPiA+ID4gICAgICAgICAuZnJlZSA9IGNzX2ZyZWUsCj4gPiA+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2NwdWZyZXEvY3B1ZnJlcV9nb3Zlcm5vci5jIGIvZHJpdmVycy9jcHVmcmVxL2Nw
dWZyZXFfZ292ZXJub3IuYwo+ID4gPiBpbmRleCBmM2JkM2RiZTdjNDEuLmY4YjVhY2EwOWI2YiAx
MDA2NDQKPiA+ID4gLS0tIGEvZHJpdmVycy9jcHVmcmVxL2NwdWZyZXFfZ292ZXJub3IuYwo+ID4g
PiArKysgYi9kcml2ZXJzL2NwdWZyZXEvY3B1ZnJlcV9nb3Zlcm5vci5jCj4gPiA+IEBAIC00MTks
NyArNDE5LDcgQEAgc3RhdGljIHZvaWQgZnJlZV9wb2xpY3lfZGJzX2luZm8oc3RydWN0IHBvbGlj
eV9kYnNfaW5mbyAqcG9saWN5X2RicywKPiA+ID4gICAgICAgICBnb3YtPmZyZWUocG9saWN5X2Ri
cyk7Cj4gPiA+ICB9Cj4gPiA+Cj4gPiA+IC1zdGF0aWMgdm9pZCBjcHVmcmVxX2Ric19kYXRhX3Jl
bGVhc2Uoc3RydWN0IGtvYmplY3QgKmtvYmopCj4gPiA+ICt2b2lkIGNwdWZyZXFfZGJzX2RhdGFf
cmVsZWFzZShzdHJ1Y3Qga29iamVjdCAqa29iaikKPiA+ID4gIHsKPiA+ID4gICAgICAgICBzdHJ1
Y3QgZGJzX2RhdGEgKmRic19kYXRhID0gdG9fZGJzX2RhdGEodG9fZ292X2F0dHJfc2V0KGtvYmop
KTsKPiA+ID4gICAgICAgICBzdHJ1Y3QgZGJzX2dvdmVybm9yICpnb3YgPSBkYnNfZGF0YS0+Z292
Owo+ID4gPiBAQCAtNDI3LDYgKzQyNyw3IEBAIHN0YXRpYyB2b2lkIGNwdWZyZXFfZGJzX2RhdGFf
cmVsZWFzZShzdHJ1Y3Qga29iamVjdCAqa29iaikKPiA+ID4gICAgICAgICBnb3YtPmV4aXQoZGJz
X2RhdGEpOwo+ID4gPiAgICAgICAgIGtmcmVlKGRic19kYXRhKTsKPiA+ID4gIH0KPiA+ID4gK0VY
UE9SVF9TWU1CT0xfR1BMKGNwdWZyZXFfZGJzX2RhdGFfcmVsZWFzZSk7Cj4gPiA+Cj4gPiA+ICBp
bnQgY3B1ZnJlcV9kYnNfZ292ZXJub3JfaW5pdChzdHJ1Y3QgY3B1ZnJlcV9wb2xpY3kgKnBvbGlj
eSkKPiA+ID4gIHsKPiA+ID4gQEAgLTQ4OCw3ICs0ODksNiBAQCBpbnQgY3B1ZnJlcV9kYnNfZ292
ZXJub3JfaW5pdChzdHJ1Y3QgY3B1ZnJlcV9wb2xpY3kgKnBvbGljeSkKPiA+ID4gICAgICAgICBw
b2xpY3ktPmdvdmVybm9yX2RhdGEgPSBwb2xpY3lfZGJzOwo+ID4gPgo+ID4gPiAgICAgICAgIGdv
di0+a29ial90eXBlLnN5c2ZzX29wcyA9ICZnb3Zlcm5vcl9zeXNmc19vcHM7Cj4gPiA+IC0gICAg
ICAgZ292LT5rb2JqX3R5cGUucmVsZWFzZSA9IGNwdWZyZXFfZGJzX2RhdGFfcmVsZWFzZTsKPiA+
ID4gICAgICAgICByZXQgPSBrb2JqZWN0X2luaXRfYW5kX2FkZCgmZGJzX2RhdGEtPmF0dHJfc2V0
LmtvYmosICZnb3YtPmtvYmpfdHlwZSwKPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBnZXRfZ292ZXJub3JfcGFyZW50X2tvYmoocG9saWN5KSwKPiA+ID4gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAiJXMiLCBnb3YtPmdvdi5uYW1lKTsKPiA+ID4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvY3B1ZnJlcS9jcHVmcmVxX2dvdmVybm9yLmggYi9kcml2ZXJzL2Nw
dWZyZXEvY3B1ZnJlcV9nb3Zlcm5vci5oCj4gPiA+IGluZGV4IDgwNmQ4ZmI0ZGZmMS4uMTAyNjcx
MmJiNzliIDEwMDY0NAo+ID4gPiAtLS0gYS9kcml2ZXJzL2NwdWZyZXEvY3B1ZnJlcV9nb3Zlcm5v
ci5oCj4gPiA+ICsrKyBiL2RyaXZlcnMvY3B1ZnJlcS9jcHVmcmVxX2dvdmVybm9yLmgKPiA+ID4g
QEAgLTE1MCw2ICsxNTAsNyBAQCBzdGF0aWMgaW5saW5lIHN0cnVjdCBkYnNfZ292ZXJub3IgKmRi
c19nb3Zlcm5vcl9vZihzdHJ1Y3QgY3B1ZnJlcV9wb2xpY3kgKnBvbGljeQo+ID4gPiAgfQo+ID4g
Pgo+ID4gPiAgLyogR292ZXJub3IgY2FsbGJhY2sgcm91dGluZXMgKi8KPiA+ID4gK3ZvaWQgY3B1
ZnJlcV9kYnNfZGF0YV9yZWxlYXNlKHN0cnVjdCBrb2JqZWN0ICprb2JqKTsKPiA+ID4gIGludCBj
cHVmcmVxX2Ric19nb3Zlcm5vcl9pbml0KHN0cnVjdCBjcHVmcmVxX3BvbGljeSAqcG9saWN5KTsK
PiA+ID4gIHZvaWQgY3B1ZnJlcV9kYnNfZ292ZXJub3JfZXhpdChzdHJ1Y3QgY3B1ZnJlcV9wb2xp
Y3kgKnBvbGljeSk7Cj4gPiA+ICBpbnQgY3B1ZnJlcV9kYnNfZ292ZXJub3Jfc3RhcnQoc3RydWN0
IGNwdWZyZXFfcG9saWN5ICpwb2xpY3kpOwo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9jcHVm
cmVxL2NwdWZyZXFfb25kZW1hbmQuYyBiL2RyaXZlcnMvY3B1ZnJlcS9jcHVmcmVxX29uZGVtYW5k
LmMKPiA+ID4gaW5kZXggOTk0MmRiYjM4ZGFlLi43Mzg2ZDA0M2M2NjUgMTAwNjQ0Cj4gPiA+IC0t
LSBhL2RyaXZlcnMvY3B1ZnJlcS9jcHVmcmVxX29uZGVtYW5kLmMKPiA+ID4gKysrIGIvZHJpdmVy
cy9jcHVmcmVxL2NwdWZyZXFfb25kZW1hbmQuYwo+ID4gPiBAQCAtMzc0LDcgKzM3NCwxMCBAQCBz
dGF0aWMgc3RydWN0IG9kX29wcyBvZF9vcHMgPSB7Cj4gPiA+Cj4gPiA+ICBzdGF0aWMgc3RydWN0
IGRic19nb3Zlcm5vciBvZF9kYnNfZ292ID0gewo+ID4gPiAgICAgICAgIC5nb3YgPSBDUFVGUkVR
X0RCU19HT1ZFUk5PUl9JTklUSUFMSVpFUigib25kZW1hbmQiKSwKPiA+ID4gLSAgICAgICAua29i
al90eXBlID0geyAuZGVmYXVsdF9ncm91cHMgPSBvZF9ncm91cHMgfSwKPiA+ID4gKyAgICAgICAu
a29ial90eXBlID0gewo+ID4gPiArICAgICAgICAgICAgICAgLnJlbGVhc2UgPSBjcHVmcmVxX2Ri
c19kYXRhX3JlbGVhc2UsCj4gPiA+ICsgICAgICAgICAgICAgICAuZGVmYXVsdF9ncm91cHMgPSBv
ZF9ncm91cHMsCj4gPiA+ICsgICAgICAgfSwKPiA+ID4gICAgICAgICAuZ292X2Ric191cGRhdGUg
PSBvZF9kYnNfdXBkYXRlLAo+ID4gPiAgICAgICAgIC5hbGxvYyA9IG9kX2FsbG9jLAo+ID4gPiAg
ICAgICAgIC5mcmVlID0gb2RfZnJlZSwKPiA+ID4gLS0KPiA+ID4gMi41Ni4wLjMxMy5nMjQ3OTMy
MmU2OC1nb29nCj4gPiA+Cj4gPiA+Cj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
