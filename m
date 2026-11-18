Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 356D9606A31C
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Nov 2026 21:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VLNUDZpV;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kuXqBQo9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Subject:From:To:
	Cc:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=hkEqereTr18amm1odlS/79wQ7i8K/e+/EQEXMbCJmq4=; b=VLNUDZpVmFc4XQa5dFLwCu7/4q
	ZYKdXMF/OyJXEuGnPupq6NFXavLV6f3HITWK30WI2xqxcfFvJPN5F03EaM4OvFnaGCEL7aU35R5ss
	UxAt0sB+Hm5+C7Akw93bxINsh53k4eb7YHnM91z7hhh77MCrzyYSvREgtl6RD+Y1yITvWMLXxLF5x
	labsBtvQI0NZQDt1J80Jx8/NmyMzuev9ZDp14Bvd7+3N3T9p0w9Tc0Ld3oDzPGl8sQwh/6Kin33mN
	CpMP8nDnBl0LDCqgAhFmmkUDzWrkAPmc8O91GhN0vaTxxk61kiFiZhSpUHlUBzrasuUiE+ozxJnke
	BxTVDSQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTmwH-0000000AHux-1DPt;
	Wed, 18 Nov 2026 21:11:33 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTmwG-0000000AHud-0Amo
	for linux-mtd@lists.infradead.org;
	Wed, 18 Nov 2026 21:11:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2624E63DC5;
	Wed, 18 Nov 2026 21:11:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4625B1F000C4;
	Wed, 18 Nov 2026 21:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795036290;
	bh=fYW7C7ZSeq/hMphn21Jk8+ekBniTzrghgjy5BvzP2bc=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To;
	b=kuXqBQo9E+h9GfS4TOHEmqgk/yUMmLyRthOV87kyoVvVOAzwMpnvqD7A1XkucwxwG
	 +Vl7bpZlxX0JE1vzCQVuNBvbZMaKuIBAvlXTPAUK/GTa7v0LsXaOQ5W64VpbC1VuJl
	 uqJ8OInlapAXmctcRxyW0008D6Xzwyp9lCFH5W/hdRpNqLETcSMRWepnBuLx7zwxxU
	 Sylw1ch5ITJRoQmWb3zw4zYMMrzwKyJn/UZhs2/85dIxkfhwlxjTdBpT9dCJJryN21
	 FmmGw4YgDxUh6xSvFjYiQgrHT7xeYbJw48awVnPj+qHidKGuRNABBugA/RDx9fw+YY
	 xy76njp+TsmiA==
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Date: Wed, 18 Nov 2026 22:11:20 +0100
Message-Id: <DMYN979QJFNV.LM3T6O68OHW6@kernel.org>
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Kees Cook"
 <kees@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>, "Rafael J . Wysocki"
 <rafael@kernel.org>, "Madhavan Srinivasan" <maddy@linux.ibm.com>, "Michael
 Ellerman" <mpe@ellerman.id.au>, "Nicholas Piggin" <npiggin@gmail.com>,
 "Christophe Leroy" <chleroy@kernel.org>, "Nayna Jain"
 <nayna@linux.ibm.com>, "Srish Srinivasan" <ssrish@linux.ibm.com>, "Mimi
 Zohar" <zohar@linux.ibm.com>, "Yoshinori Sato"
 <ysato@users.sourceforge.jp>, "Rich Felker" <dalias@libc.org>, "John Paul
 Adrian Glaubitz" <glaubitz@physik.fu-berlin.de>, "Juergen Gross"
 <jgross@suse.com>, "Stefano Stabellini" <sstabellini@kernel.org>,
 "Oleksandr Tyshchenko" <oleksandr_tyshchenko@epam.com>, "Nathan Chancellor"
 <nathan@kernel.org>, "Nick Desaulniers" <ndesaulniers@google.com>, "Viresh
 Kumar" <viresh.kumar@linaro.org>, "Zhongqiu Han"
 <zhongqiu.han@oss.qualcomm.com>, "Alexander Aring" <aahringo@redhat.com>,
 "Felix Kuehling" <felix.kuehling@amd.com>, =?utf-8?q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, "Zhihao Cheng" <chengzhihao1@huawei.com>,
 "Sumanth Korikkar" <sumanthk@linux.ibm.com>, "Bill Wendling"
 <morbo@google.com>, "Justin Stitt" <justinstitt@google.com>,
 <driver-core@lists.linux.dev>, <llvm@lists.linux.dev>,
 <linux-hardening@vger.kernel.org>, <linux-fsdevel@vger.kernel.org>,
 <linux-doc@vger.kernel.org>, <linux-acpi@vger.kernel.org>,
 <linux-pm@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>,
 <linux-sh@vger.kernel.org>, <linux-s390@vger.kernel.org>,
 <gfs2@lists.linux.dev>, <xen-devel@lists.xenproject.org>,
 <linux-mtd@lists.infradead.org>, <amd-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
To: "Ian Rogers" <irogers@google.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v3 9/9] kobject: Require explicit initialization of
 struct kobj_type::release
References: <20261108223913.3624571-1-irogers@google.com>
 <20261108223913.3624571-10-irogers@google.com>
In-Reply-To: <20261108223913.3624571-10-irogers@google.com>
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gU3VuIE5vdiA4LCAyMDI2IGF0IDExOjM5IFBNIENFVCwgSWFuIFJvZ2VycyB3cm90ZToKPiAg
c3RhdGljIGNvbnN0IHN0cnVjdCBrb2JqX3R5cGUgY3B1cmVnc19rb2JqX3R5cGUgPSB7Cj4gKwkv
Kgo+ICsJICogUHJlLWV4aXN0aW5nOiBpbmZvLT5rb2JqIGlzIGVtYmVkZGVkIGluIHBlci1DUFUg
Y3B1X2RhdGE7Cj4gKwkgKiBjcHVpZF9jcHVfb2ZmbGluZSgpIG9ubHkgY2FsbHMga29iamVjdF9k
ZWwoKS4KPiArCSAqLwoKQWxsIG9mIHRoZXNlIGNvbW1lbnRzIGNhcnJ5IGEg4oCcUHJlLWV4aXN0
aW5nOuKAnSBwcmVmaXgsIGJ1dCB0aGF0IGRvZXNu4oCZdApkaXN0aW5ndWlzaCBjYXNlcyB3aXRo
IGJyb2tlbiBsaWZldGltZSBtYW5hZ2VtZW50IGZyb20gdGhvc2Ugd2hlcmUgdGhlIHN0b3JhZ2UK
cmVtYWlucyB2YWxpZCBkZXNwaXRlIHRoZSBBUEkgbWlzdXNlLgoKRm9yIGV4YW1wbGU6Cgo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfeGNwLmMgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfeGNwLmMKPiBpbmRleCBhYjE0MDc5ZDFjNDIu
LjA4NDcxMzRhMTM5MSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfeGNwLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfeGNw
LmMKPiBAQCAtNzk3LDYgKzc5NywxMSBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHN5c2ZzX29wcyB4
Y3BfY2ZnX3Jlc19zeXNmc19vcHMgPSB7Cj4gIH07Cj4gIAo+ICBzdGF0aWMgY29uc3Qgc3RydWN0
IGtvYmpfdHlwZSB4Y3BfY2ZnX3Jlc19zeXNmc19rdHlwZSA9IHsKPiArCS8qCj4gKwkgKiBQcmUt
ZXhpc3Rpbmc6IHhjcF9yZXMgaXMgZW1iZWRkZWQgaW4gc3RydWN0IGFtZGdwdV94Y3BfY2ZnCj4g
KwkgKiByYXRoZXIgdGhhbiBmcmVlZCBpbmRpdmlkdWFsbHkgYnkga29iamVjdF9wdXQoKS4KPiAr
CSAqLwo+ICsJLnJlbGVhc2UgPSBOVUxMLAoKQmVpbmcgZW1iZWRkZWQgaW4gYW5vdGhlciBzdHJ1
Y3R1cmUgZG9lc24ndCBleHBsYWluIHdoYXQgZ3VhcmFudGVlcyB0aGF0IHRoZQplbmNsb3Npbmcg
YWxsb2NhdGlvbiBvdXRsaXZlcyB0aGUga29iamVjdOKAmXMgZmluYWwgY2xlYW51cC4KCkNvdWxk
IHlvdSBwbGVhc2UgZHJvcCB0aGUg4oCcUHJlLWV4aXN0aW5nOuKAnSBwcmVmaXggYW5kIG1ha2Ug
dGhhdCBkaXN0aW5jdGlvbgpleHBsaWNpdD8gRm9yIGJyb2tlbiBjYXNlcywgZGVzY3JpYmUgdGhl
IGxpZmV0aW1lIHByb2JsZW0gYW5kIG1hcmsgaXQgYXMgbmVlZGluZwphIGZvbGxvdy11cCBmaXgu
IEZvciBjYXNlcyB3aGVyZSB0aGUgbGlmZXRpbWUgaXMgc2FmZSwgZXhwbGFpbiB3aGF0IGd1YXJh
bnRlZXMKdGhhdCBzYWZldHksIHdoaWxlIGFja25vd2xlZGdpbmcgdGhhdCBvbWl0dGluZyByZWxl
YXNlKCkgc3RpbGwgdmlvbGF0ZXMgdGhlCmRvY3VtZW50ZWQgQVBJIGNvbnRyYWN0LgoKQWxzbywg
ZG8geW91IHBsYW4gdG8gZm9sbG93IHVwIG9uIHRob3NlIGNhc2VzPwoKVGhhbmtzLApEYW5pbG8K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
