Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D909606A32A
	for <linux-mtd@archiver.kernel.org>; Wed, 28 Oct 2026 15:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bkQYdnzC;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=aXdfbrps
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=uRkQBGu2LN8XMczsJbLqrE8beVVA6AxOk3U+6bhLMgI=; b=bkQYdnzC8X/maj79QUbIXhfBMu
	mEQUbQmZBwjvy1mgM0nXi4f6+DJKflUfc7mHdAgydk7kflTJGSXpflvHL5C4yUXWFiTSwPi+4QT7s
	Yg83SfzC4R/nlEpfr7UjYjPlMQNQHH99y60aEd2p1L+aCcFqg77W+azDZIhvByUd2azUaqOlpZog7
	XXVrGuMWI3NlIBq4XOeSewheFRIBPRLrWjAPJAko1J95DBxNnfurkzIYUUaq+uyG+KoolgSNu3bm8
	/8KnFptjZgqWQnj7NPDsw7Doqjum4+8Byh8YbMxuSz9IN8cnfiI32Ziw6Gr0vUKES4x4zgqyOxB0M
	hyXPXjPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM5hB-00000007Pd3-1sMO;
	Wed, 28 Oct 2026 15:36:09 +0000
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM5h9-00000007PbI-0QKO
	for linux-mtd@lists.infradead.org;
	Wed, 28 Oct 2026 15:36:08 +0000
Received: by mail-qt1-x82a.google.com with SMTP id d75a77b69052e-533202fe429so405241cf.0
        for <linux-mtd@lists.infradead.org>; Wed, 28 Oct 2026 08:36:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793201764; cv=none;
        d=google.com; s=arc-20260327;
        b=s9bd7VjwB2K2kSbS4deKNzuDegw/ZDoN3gDaIrQn1SaYCPi0dQOUbughddjGpn/u3Q
         VpUrzUbtKTxP9FwOmBJBqRzuYOaPNz5h81YIX2GckEtiJn3mRy5vuxx1ijp4nJT+8rlC
         c2k9qLuaLnkuP1OVMUwmpGpLLE7v2LpTlCf+tyT162xRl9jnPrP8zSH/a/dhFpUr7OXm
         8nCpsMUwoMl6K1F9OQ7RnOgC1GmjhK20ppUSuVBZKQzjDQg0JygdLaXmkTD8Ssb2YqsO
         ahBiH2OlWkSrBbZWIpSlkyq2NFFasR+Q9w7H8F/iT/UhucWeGQvoAvGQxgmhiXNJPu3j
         rPRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IMDYK1ZjnbIiPQHcJc7SpOjyQ4Wy/ZaG15fuBEkM+6c=;
        fh=S2t9ttvBQ0q4QR5irBvLQtemCVMgoBi5q6KuKCNgL7k=;
        b=idPSqApKa94DthpshqP/9GIGzmuuuEmuzUjF2E8OGZdevPvMwNYCm5UfR1ADWc472F
         M5igTvwQhxNTco6swxEle8WhutlxojxU+UbzDools4PsqudRwAMuIjWE9BegtNPorpM2
         IeettueJswhQz8rFXuyxzz3rjpB9ho1E2UhYivEUxiL17gfajLdBSNrQzvykJtEJBkX5
         l9TxJoNFhVT9gPhvADsrFTsEFD0Vnyr7O5p7OsUWdJBcrVcUOGAFofKRsrI8fECNl6xs
         6MguYj5yKpSebIIlOZOU76VxzfN3k3rare+Im/NV9nLZsW9OSczhB/GT/YXdlBLeBZ2A
         lBJw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793201764; x=1793806564; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IMDYK1ZjnbIiPQHcJc7SpOjyQ4Wy/ZaG15fuBEkM+6c=;
        b=aXdfbrpsk51uCT8oUsdaber4STGoL9ORYuB+u+wINB+IehJzXtOhpCZXGXn9QESP0V
         FwHW6qoBMVaH3yHB1chMe1EPPXe+MsGZM2I+X5P6W3817D0fVMPAqBEqpfLRkLnSBToT
         YZ+g6ULWa4ljiZqeRTn0kqehlVJ9WgFhDW2tpu3TUSJzs2iAdrUxWKTBGmYPLCvKT3OZ
         QeogCdbIF63MnZ/CSo4sJ674K/simnJS/5uxX2bdyL/pdCZdjfV5BQ05JvzRNlMOQTMj
         Sul0oShXlld5lbgKHPmD/lk4inxaZxL67svGr/Dkm9UGx9SweZGCnrPZ6jH6T9zSH713
         BPHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793201764; x=1793806564;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IMDYK1ZjnbIiPQHcJc7SpOjyQ4Wy/ZaG15fuBEkM+6c=;
        b=ZnP3OXgkEiKH7p/+AxW0cS1TEZLsdkeJ0YYS2ENrvp7Ww+A6u/FolEMNz0MijgXQ3R
         zFi4atEzKUCj6FHUbLI71+ulkxikxjvT2DE+AUsnKVsIFBILHrSE2/tUaB8aTfEjsw6+
         GetcOR6xmyYi2POMc2qUnsi+z7oYPf/8V25/+MQBxzA79HaS9ziJ2mBQcn0V5+2xqqi3
         q68Ng14QgKY5TfGsAS9Mq6urGo+AO4KOasyZXJvV1Czzwl3LClPLKagNibiZVlM5aG9I
         Y9qkkosMUJuN5CkWvXRwBL5upJjoSJRMUlmehn/ANuShwcN6t9nFbQIFtslixxnjUVEv
         YKyA==
X-Forwarded-Encrypted: i=1; AKwUvBx4PvrlCoB7n3y/uWSEH9qw9FueDSY5+vifmLPWcq3kZc8I5peSpajSSrkfvHDj2HkWA60pNUyzeOk=@lists.infradead.org
X-Gm-Message-State: AFq9FYKMO/oiL3F9gfST5hoUHrJWy4K42ok9+Cn6zv0AurbrCeVaFHgA
	ryFP/aNhTwmtlIofuO2zUzLahgzF6b/xaT1IExu2X0+NEsyU5vFXJQM2VU4pfUlOYDhy+dgzXOc
	XLGYYvLp+vuX7QV50EygW9tnmc1ggKmzhwOQAigNH
X-Gm-Gg: AYBFou1F9sAMg7wghJWeAgjd4IJItS1EcUtWhiLPZcbXvRXjP6lHfXO5tnx45XppxK/
	rdFqnHzwqsW6S+iqJ52pHRPrZK6SoXpIltwk9vdHxuhSa2CU5M8252/03YS8OlsMBQIT7l83D+3
	Lht5B4fBxlZ6QMGaEU3qKUvWcG3S7VBQYyvSn63oS0Gzlj1UyrR6hyklsLdXDfrJh+t0edQ6O/M
	PVSdmA5QRV4psJpKCxFrsr948DkgMkAHuWI3FzgJvPwCySNNJMUr5l2OFM7Yx5XrsGDqk64yfeR
	bhvElRt59VIHjou4t4ar6EL3fw+cctc6i2l17gK5j+U8LS3jqj2tFQNvzwtbu15uI3VkmniG/60
	w68FyVOs0HPyMAkgMqcb8k+cXJgEiSuwVCWK01emJKUE7inJlgcjm2PtIjRY=
X-Received: by 2002:a05:622a:22a9:b0:536:97c0:dcd0 with SMTP id
 d75a77b69052e-53fc2aa1fa2mr21345071cf.4.1793201763129; Wed, 28 Oct 2026
 08:36:03 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261027223847.652884-1-irogers@google.com> <20261027223847.652884-5-irogers@google.com>
 <CAJZ5v0juvZ2ZVRBkY6FxBM=NhPt9vMA3+yRugXc5u=U1jO9AXg@mail.gmail.com>
In-Reply-To: <CAJZ5v0juvZ2ZVRBkY6FxBM=NhPt9vMA3+yRugXc5u=U1jO9AXg@mail.gmail.com>
From: Ian Rogers <irogers@google.com>
Date: Wed, 28 Oct 2026 08:35:50 -0700
X-Gm-Features: AclHuK8Z1SdNi4k8-UQceLsnqDJD6d9aTo0cl8IQ7vlO1Fmucv2n8goL0VFX4iw
Message-ID: <CAP-5=fWVZ=7-qDRODiEQzRzhpQqribv9Morj=OoAXW_6uaW2dA@mail.gmail.com>
Subject: Re: [PATCH v2 4/9] cpufreq: governor: Initialize kobj_type release
 callback statically
To: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Cc: Kees Cook <kees@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_083607_194184_E62DAF1D 
X-CRM114-Status: GOOD (  26.18  )
X-Spam-Score: -17.6 (-----------------)
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gV2VkLCBPY3QgMjgsIDIwMjYgYXQgNDozOeKAr0FNIFJhZmFlbCBKLiBXeXNvY2tpIChJbnRl
bCkKPHJhZmFlbEBrZXJuZWwub3JnPiB3cm90ZToKPgo+IE9uIFR1ZSwgT2N0IDI3LCAyMDI2IGF0
IDExOjM54oCvUE0gSWFuIFJvZ2VycyA8aXJvZ2Vyc0Bnb29nbGUuY29tPiB3cm90ZToKPiA+Cj4g
PiBFeHBvcnQgY3B1ZnJlcV9kYnNfZGF0YV9yZWxlYXNlKCkgYW5kIHNldCAua29ial90eXBlLnJl
bGVhc2Ugc3RhdGljYWxseQo+ID4gaW4gdGhlIG9uZGVtYW5kIGFuZCBjb25zZXJ2YXRpdmUgZ292
ZXJub3JzIHNvIHRoZWlyIGdvdl9hdHRyX3NldAo+ID4ga29iamVjdHMgaGF2ZSBhIHZhbGlkIHJl
bGVhc2UgY2FsbGJhY2sgc3RhdGljYWxseSBpbml0aWFsaXplZCwgbWF0Y2hpbmcKPiA+IGNwdWZy
ZXFfZ292ZXJub3JfZGJzLiBSZW1vdmUgdGhlIHJlZHVuZGFudCBydW50aW1lIGFzc2lnbm1lbnQg
aW4KPiA+IGNwdWZyZXFfZGJzX2dvdmVybm9yX2luaXQoKS4KPiA+Cj4gPiBUaGlzIHByZXBhcmVz
IGZvciBhbm5vdGF0aW5nIHN0cnVjdCBrb2JqX3R5cGU6OnJlbGVhc2Ugd2l0aAo+ID4gX19tdXN0
X2luaXQuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogSWFuIFJvZ2VycyA8aXJvZ2Vyc0Bnb29nbGUu
Y29tPgo+Cj4gRG8geW91IHdhbnQgc3R1ZmYgdG8gYmUgcGlja2VkIHVwIGJ5IG1haW50YWluZXJz
LCBvciBkbyB5b3Ugd2FudCB0bwo+IHJvdXRlIGl0IHlvdXJzZWxmPwoKSGkgUmFmYWVsLAoKSnVz
dCBhIHF1aWNrIG5vdGU6IEkgYWdyZWUgd2l0aCBaaG9uZ3FpdSdzIGZlZWRiYWNrIGFuZCB0aGUg
Y29tbWl0Cm1lc3NhZ2UgbmVlZHMgYSBmaXguCgpSZWdhcmRpbmcgbWVyZ2luZyB0aGUgcGF0Y2hl
cywgdGhlIGlzc3VlIHdpdGggbWFpbnRhaW5lcnMgcGlja2luZyB1cApmaXhlcyBpcyB0aGF0IHRo
ZSBzZXJpZXMgd2lsbCBicmVhayB0aGUgY2xhbmcvbGx2bSBidWlsZCB3aXRob3V0IHRoZW0uClNv
IHRoZSBtYWludGFpbmVycyBuZWVkIHRvIGVpdGhlciBtZXJnZSB0aGUgcGF0Y2hlcyAoYW5kIHRo
ZSBzZXJpZXMgYmUKcmViYXNlZCBvbiB0b3Agb2YgdGhlbSkgb3IgbWVyZ2UgdGhlIHNlcmllcyBh
cyBhIHVuaXQuIFBlcmhhcHMgc2luY2UKdGhlIHBhdGNoZXMgYWxpZ24sIG1lcmdlIGNvbmZsaWN0
cyB3b24ndCBoYXBwZW4sIHNvIG1haW50YWluZXJzCm1lcmdpbmcgYW5kIGxhbmRpbmcgdGhlIHNl
cmllcyBpcyBva2F5LiBJIGRvbid0IGhhdmUgdGhlIGV4cGVyaWVuY2UgdG8Ka25vdy4KClRoYW5r
cywKSWFuCgo+ID4gLS0tCj4gPiAgZHJpdmVycy9jcHVmcmVxL2NwdWZyZXFfY29uc2VydmF0aXZl
LmMgfCA1ICsrKystCj4gPiAgZHJpdmVycy9jcHVmcmVxL2NwdWZyZXFfZ292ZXJub3IuYyAgICAg
fCA0ICsrLS0KPiA+ICBkcml2ZXJzL2NwdWZyZXEvY3B1ZnJlcV9nb3Zlcm5vci5oICAgICB8IDEg
Kwo+ID4gIGRyaXZlcnMvY3B1ZnJlcS9jcHVmcmVxX29uZGVtYW5kLmMgICAgIHwgNSArKysrLQo+
ID4gIDQgZmlsZXMgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPiA+
Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9jcHVmcmVxL2NwdWZyZXFfY29uc2VydmF0aXZlLmMg
Yi9kcml2ZXJzL2NwdWZyZXEvY3B1ZnJlcV9jb25zZXJ2YXRpdmUuYwo+ID4gaW5kZXggMDJiZmQ0
NjU0M2U5Li4xNDZhMjM1M2IxYTIgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2NwdWZyZXEvY3B1
ZnJlcV9jb25zZXJ2YXRpdmUuYwo+ID4gKysrIGIvZHJpdmVycy9jcHVmcmVxL2NwdWZyZXFfY29u
c2VydmF0aXZlLmMKPiA+IEBAIC0zMTgsNyArMzE4LDEwIEBAIHN0YXRpYyB2b2lkIGNzX2xpbWl0
cyhzdHJ1Y3QgY3B1ZnJlcV9wb2xpY3kgKnBvbGljeSkKPiA+Cj4gPiAgc3RhdGljIHN0cnVjdCBk
YnNfZ292ZXJub3IgY3NfZ292ZXJub3IgPSB7Cj4gPiAgICAgICAgIC5nb3YgPSBDUFVGUkVRX0RC
U19HT1ZFUk5PUl9JTklUSUFMSVpFUigiY29uc2VydmF0aXZlIiksCj4gPiAtICAgICAgIC5rb2Jq
X3R5cGUgPSB7IC5kZWZhdWx0X2dyb3VwcyA9IGNzX2dyb3VwcyB9LAo+ID4gKyAgICAgICAua29i
al90eXBlID0gewo+ID4gKyAgICAgICAgICAgICAgIC5yZWxlYXNlID0gY3B1ZnJlcV9kYnNfZGF0
YV9yZWxlYXNlLAo+ID4gKyAgICAgICAgICAgICAgIC5kZWZhdWx0X2dyb3VwcyA9IGNzX2dyb3Vw
cywKPiA+ICsgICAgICAgfSwKPiA+ICAgICAgICAgLmdvdl9kYnNfdXBkYXRlID0gY3NfZGJzX3Vw
ZGF0ZSwKPiA+ICAgICAgICAgLmFsbG9jID0gY3NfYWxsb2MsCj4gPiAgICAgICAgIC5mcmVlID0g
Y3NfZnJlZSwKPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2NwdWZyZXEvY3B1ZnJlcV9nb3Zlcm5v
ci5jIGIvZHJpdmVycy9jcHVmcmVxL2NwdWZyZXFfZ292ZXJub3IuYwo+ID4gaW5kZXggZjNiZDNk
YmU3YzQxLi5mOGI1YWNhMDliNmIgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2NwdWZyZXEvY3B1
ZnJlcV9nb3Zlcm5vci5jCj4gPiArKysgYi9kcml2ZXJzL2NwdWZyZXEvY3B1ZnJlcV9nb3Zlcm5v
ci5jCj4gPiBAQCAtNDE5LDcgKzQxOSw3IEBAIHN0YXRpYyB2b2lkIGZyZWVfcG9saWN5X2Ric19p
bmZvKHN0cnVjdCBwb2xpY3lfZGJzX2luZm8gKnBvbGljeV9kYnMsCj4gPiAgICAgICAgIGdvdi0+
ZnJlZShwb2xpY3lfZGJzKTsKPiA+ICB9Cj4gPgo+ID4gLXN0YXRpYyB2b2lkIGNwdWZyZXFfZGJz
X2RhdGFfcmVsZWFzZShzdHJ1Y3Qga29iamVjdCAqa29iaikKPiA+ICt2b2lkIGNwdWZyZXFfZGJz
X2RhdGFfcmVsZWFzZShzdHJ1Y3Qga29iamVjdCAqa29iaikKPiA+ICB7Cj4gPiAgICAgICAgIHN0
cnVjdCBkYnNfZGF0YSAqZGJzX2RhdGEgPSB0b19kYnNfZGF0YSh0b19nb3ZfYXR0cl9zZXQoa29i
aikpOwo+ID4gICAgICAgICBzdHJ1Y3QgZGJzX2dvdmVybm9yICpnb3YgPSBkYnNfZGF0YS0+Z292
Owo+ID4gQEAgLTQyNyw2ICs0MjcsNyBAQCBzdGF0aWMgdm9pZCBjcHVmcmVxX2Ric19kYXRhX3Jl
bGVhc2Uoc3RydWN0IGtvYmplY3QgKmtvYmopCj4gPiAgICAgICAgIGdvdi0+ZXhpdChkYnNfZGF0
YSk7Cj4gPiAgICAgICAgIGtmcmVlKGRic19kYXRhKTsKPiA+ICB9Cj4gPiArRVhQT1JUX1NZTUJP
TF9HUEwoY3B1ZnJlcV9kYnNfZGF0YV9yZWxlYXNlKTsKPiA+Cj4gPiAgaW50IGNwdWZyZXFfZGJz
X2dvdmVybm9yX2luaXQoc3RydWN0IGNwdWZyZXFfcG9saWN5ICpwb2xpY3kpCj4gPiAgewo+ID4g
QEAgLTQ4OCw3ICs0ODksNiBAQCBpbnQgY3B1ZnJlcV9kYnNfZ292ZXJub3JfaW5pdChzdHJ1Y3Qg
Y3B1ZnJlcV9wb2xpY3kgKnBvbGljeSkKPiA+ICAgICAgICAgcG9saWN5LT5nb3Zlcm5vcl9kYXRh
ID0gcG9saWN5X2RiczsKPiA+Cj4gPiAgICAgICAgIGdvdi0+a29ial90eXBlLnN5c2ZzX29wcyA9
ICZnb3Zlcm5vcl9zeXNmc19vcHM7Cj4gPiAtICAgICAgIGdvdi0+a29ial90eXBlLnJlbGVhc2Ug
PSBjcHVmcmVxX2Ric19kYXRhX3JlbGVhc2U7Cj4gPiAgICAgICAgIHJldCA9IGtvYmplY3RfaW5p
dF9hbmRfYWRkKCZkYnNfZGF0YS0+YXR0cl9zZXQua29iaiwgJmdvdi0+a29ial90eXBlLAo+ID4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBnZXRfZ292ZXJub3JfcGFyZW50X2tv
YmoocG9saWN5KSwKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIiVzIiwg
Z292LT5nb3YubmFtZSk7Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9jcHVmcmVxL2NwdWZyZXFf
Z292ZXJub3IuaCBiL2RyaXZlcnMvY3B1ZnJlcS9jcHVmcmVxX2dvdmVybm9yLmgKPiA+IGluZGV4
IDgwNmQ4ZmI0ZGZmMS4uMTAyNjcxMmJiNzliIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9jcHVm
cmVxL2NwdWZyZXFfZ292ZXJub3IuaAo+ID4gKysrIGIvZHJpdmVycy9jcHVmcmVxL2NwdWZyZXFf
Z292ZXJub3IuaAo+ID4gQEAgLTE1MCw2ICsxNTAsNyBAQCBzdGF0aWMgaW5saW5lIHN0cnVjdCBk
YnNfZ292ZXJub3IgKmRic19nb3Zlcm5vcl9vZihzdHJ1Y3QgY3B1ZnJlcV9wb2xpY3kgKnBvbGlj
eQo+ID4gIH0KPiA+Cj4gPiAgLyogR292ZXJub3IgY2FsbGJhY2sgcm91dGluZXMgKi8KPiA+ICt2
b2lkIGNwdWZyZXFfZGJzX2RhdGFfcmVsZWFzZShzdHJ1Y3Qga29iamVjdCAqa29iaik7Cj4gPiAg
aW50IGNwdWZyZXFfZGJzX2dvdmVybm9yX2luaXQoc3RydWN0IGNwdWZyZXFfcG9saWN5ICpwb2xp
Y3kpOwo+ID4gIHZvaWQgY3B1ZnJlcV9kYnNfZ292ZXJub3JfZXhpdChzdHJ1Y3QgY3B1ZnJlcV9w
b2xpY3kgKnBvbGljeSk7Cj4gPiAgaW50IGNwdWZyZXFfZGJzX2dvdmVybm9yX3N0YXJ0KHN0cnVj
dCBjcHVmcmVxX3BvbGljeSAqcG9saWN5KTsKPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2NwdWZy
ZXEvY3B1ZnJlcV9vbmRlbWFuZC5jIGIvZHJpdmVycy9jcHVmcmVxL2NwdWZyZXFfb25kZW1hbmQu
Ywo+ID4gaW5kZXggOTk0MmRiYjM4ZGFlLi43Mzg2ZDA0M2M2NjUgMTAwNjQ0Cj4gPiAtLS0gYS9k
cml2ZXJzL2NwdWZyZXEvY3B1ZnJlcV9vbmRlbWFuZC5jCj4gPiArKysgYi9kcml2ZXJzL2NwdWZy
ZXEvY3B1ZnJlcV9vbmRlbWFuZC5jCj4gPiBAQCAtMzc0LDcgKzM3NCwxMCBAQCBzdGF0aWMgc3Ry
dWN0IG9kX29wcyBvZF9vcHMgPSB7Cj4gPgo+ID4gIHN0YXRpYyBzdHJ1Y3QgZGJzX2dvdmVybm9y
IG9kX2Ric19nb3YgPSB7Cj4gPiAgICAgICAgIC5nb3YgPSBDUFVGUkVRX0RCU19HT1ZFUk5PUl9J
TklUSUFMSVpFUigib25kZW1hbmQiKSwKPiA+IC0gICAgICAgLmtvYmpfdHlwZSA9IHsgLmRlZmF1
bHRfZ3JvdXBzID0gb2RfZ3JvdXBzIH0sCj4gPiArICAgICAgIC5rb2JqX3R5cGUgPSB7Cj4gPiAr
ICAgICAgICAgICAgICAgLnJlbGVhc2UgPSBjcHVmcmVxX2Ric19kYXRhX3JlbGVhc2UsCj4gPiAr
ICAgICAgICAgICAgICAgLmRlZmF1bHRfZ3JvdXBzID0gb2RfZ3JvdXBzLAo+ID4gKyAgICAgICB9
LAo+ID4gICAgICAgICAuZ292X2Ric191cGRhdGUgPSBvZF9kYnNfdXBkYXRlLAo+ID4gICAgICAg
ICAuYWxsb2MgPSBvZF9hbGxvYywKPiA+ICAgICAgICAgLmZyZWUgPSBvZF9mcmVlLAo+ID4gLS0K
PiA+IDIuNTYuMC4zMTMuZzI0NzkzMjJlNjgtZ29vZwo+ID4KPiA+CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Np
b24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbXRkLwo=
