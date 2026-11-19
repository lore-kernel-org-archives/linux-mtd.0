Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1F55606A33D
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Nov 2026 05:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ttf8x7vy;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=mqURVIF5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=bczXR0uO9JjkmAhFT/UzLawqlyI+GBOCWmRoqoyVICE=; b=ttf8x7vyQSTHy0RYyh01b7UtKo
	1FBVbHIoHEXQZkZaqm0TRaTtcWQbHKo48j0nhOLP6eyOVanvEX251OT8956+42KsjZZwvRqUFsMCg
	fdY8u5WfJOmoT2Vy/ZidGAX8BZ00JOugwOZxBkVz5BUFfy6yT6H6rz4RLglrE4JRFCjSG7qSUqIBo
	/bx9BSmB4a2hO+jZKZj6OwNn2eM2AjJpF1ByrflmQVukuraUVsKtEOJJhxt33vZumfBRNlHBmbDRD
	7fwHM25N6i5Np7xK8gqNFu0B2GoVgaKm6dnWH2MVZRPrjQJ/bwOsCkbgd/P9LV9xdnJmk1ZS5cLJO
	ihjIJX7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTuyB-0000000Awch-1lL8;
	Thu, 19 Nov 2026 05:46:03 +0000
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTuy8-0000000Awbk-1Fuz
	for linux-mtd@lists.infradead.org;
	Thu, 19 Nov 2026 05:46:01 +0000
Received: by mail-qt1-x835.google.com with SMTP id d75a77b69052e-533202fe429so171551cf.0
        for <linux-mtd@lists.infradead.org>; Wed, 18 Nov 2026 21:45:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795067158; cv=none;
        d=google.com; s=arc-20260327;
        b=QI4zeuHViv/qDmKYm3aEP9+I4L5t8K3J17pBBvWJ4T6+5ZV5yrv9xFfUVjAWWBRyPu
         ZYnlCpk/VM0X1UEnpxJhfLwS7J5DyZ+u73FIy8+QKmXBm61Ja/6JBBmMgRueHDeQ8LWi
         qNt0/PvDos+F3iUv50Q1mknZNdWlrt1STplfRKH14zeinvfES8/ITZS1V0q4ouAHWbHN
         KJu2cDr8s6Ps43Ia8YJFGJMsAsI/Dl77dRcrPbeb1XHLeUuxNDUOqQJS6+t686owN2V4
         tUwh/asSQ72z38fqp53zchAzbLlhP0e0UUcIbEbFDBh2RaPaJVTmcP5igXM8aSZbasHa
         8lfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cIkoHsOVRZS7gIowPl6xkao6tH+bfcK9X/Z+HF8PGU0=;
        fh=dSjwTJC1c2uURM6D3TwgtdLLDD6RbQdUknqQfsw2rZQ=;
        b=YntxvuOtojLSRc8Fge4Tsoz6GhEinD1E1YrwHMPkDulRSrqyikHO/jhQe+luN/4Q7h
         wW3C+XHz0sodjKa243MHWX3lLbyrceGWRfEaUDBUprQn5MyU8v5NeZFK90wLCGHndNNk
         W9ERcvaDIHv3UCNlsTxhMi/f5TGyEtzeHnQdTq/9F/ykWjgv71I+p7BkO9d7v0dEuqCj
         EHYQge5n0hy1vmOfOzZsZ45zHLVQAxrQUAI+WAj0eVZF8hUpf8/umTjNi4uTWBRxItOp
         9LDt8XaFVQA0A/I83/sk024NN7C/2Mes9x8L/UwyFAY4IKyzK/hbbOure+9XSoDUGyq5
         GwyA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795067158; x=1795671958; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cIkoHsOVRZS7gIowPl6xkao6tH+bfcK9X/Z+HF8PGU0=;
        b=mqURVIF5loRc2YUsO9dHmVpMcY8Z5/B0fIDF4cRGvepoOoVbysOUoNYTrI8OinS1Pw
         lIVsVuwD3Q0JAnUauT86fg0XH/Okjb/EsDoxeXtFOGGZ/79u0MJSXac9O/3o38b/Wov3
         d8TmbfuMTCjLE7cO0TIbviFodAu2eiouzyDis7PDGVhQJcukAxyuLLcP6lkJr/AU5Ev/
         wn7JnPjSqqMt5TkG87VSdeiJqnpW8lzj+kyMzvVwyNYhGYeTGGK6Ilgh7yOb2yOa+ZgC
         uH/MczPag6NmMKkjL6E4836prQ18F6USZBtk00aUbpCbFtdPSkK67lY3lDcjj+KfpFKH
         XM4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795067158; x=1795671958;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cIkoHsOVRZS7gIowPl6xkao6tH+bfcK9X/Z+HF8PGU0=;
        b=JvRyeLN0et5FveNw8teC0knjOW1TBH9t1FFrgiO5H5iks30bfKQrlYqcTHWXzuXx8a
         QJHT3iekZJ2bouuPYWhYFUwU2cVKadFC0DcoX+43qDzgMwRBEZYO0FMZGubGzxo2rwk1
         /Qc7UV874Iffeb3JFSdfQ04SYd/MYpCeMrcppwn9SOSv6dfgcJB6nPFZsS41j0GfaWS7
         TiFqIWwoecUfSV/sbx47moivF7CpsBNoAcU/VObrWyKKvxf4yQUFTf/BtGggtzUdRg9z
         pekpjhIcoWR317Gma5ooKGxkh7iTEFGYEPxDXKk03DnhkP4azuA+hb7LL6HlRm2Dl7EE
         0FwQ==
X-Forwarded-Encrypted: i=1; AL+hErF2ifvCy3pMpalhgjbyjd/dTk3DeDGXWOukRlgUbksTgRAizFxrYzDvP4wAIcXGvg1kw2Xd+FTAnDY=@lists.infradead.org
X-Gm-Message-State: APuU4Z/UPF/a/qzOqxyPcsSKdA3gHfmkf6w6agvf2k2iDm7YudWOZg62
	viDZ8e2dqQmpBM2z3pli52Y49MsmB6fAZbpsh6sM8sB1ug3RjDk4hU10itHYUwU8K4uu9ZJhu3l
	Xxd2lUn2HYE9Xq3utXlPxtIUHR+ufmbL6VtRawRCo
X-Gm-Gg: AYBFou26b6uSasxuiymtKgzzMQOBQHbn1lHDhxjjX1B7QS161IT1uufmMG//qlfq8RF
	PfoG4Pg/dZ88dhpVxO4ucUq/ybQDm1NwkB4yGA5C1aIzW+Mdkk1PJbdMSYknQtW6bsvO4BhadtE
	XkA2GkI/zl8exPqa7r5AYIE/gbAXipID+6FR1jdpPuhFIM4BdULaVVDgoe/l3wMnj7XEnqeco39
	RAJrMF4TeqyyZ05qHU2oV+o3nAReIU43C4hKilwa/BqWczJ2CMZOfNDdIpofSunZNtfUlosZMu/
	HLPZxjczyZ7s3i4Uv1xYyzPbvUkUWQ7NachP7ykFnE8aYTOOJgVpaF+reamNr1sArPahiNwv9y8
	Wfx/yBQWJCx819wnMQM0eXXgJ4LUusxvahfUA
X-Received: by 2002:a05:622a:4808:b0:536:934f:7da2 with SMTP id
 d75a77b69052e-55d6c7995f9mr6557911cf.2.1795067157461; Wed, 18 Nov 2026
 21:45:57 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261108223913.3624571-1-irogers@google.com> <20261108223913.3624571-10-irogers@google.com>
 <DMYN979QJFNV.LM3T6O68OHW6@kernel.org>
In-Reply-To: <DMYN979QJFNV.LM3T6O68OHW6@kernel.org>
From: Ian Rogers <irogers@google.com>
Date: Wed, 18 Nov 2026 21:45:45 -0800
X-Gm-Features: Aa3M54p8GzPfKDPQ_HJcPbdLHGq3vwK7n9VGnVvnVB1ODjbFHeHwrlgOfVCaaEo
Message-ID: <CAP-5=fXrMyfLFXq6CiqwWMSbtYVRNESxuDo-ddqNwDmq5Nm4SA@mail.gmail.com>
Subject: Re: [PATCH v3 9/9] kobject: Require explicit initialization of struct kobj_type::release
To: Danilo Krummrich <dakr@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kees Cook <kees@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <chleroy@kernel.org>, Nayna Jain <nayna@linux.ibm.com>, 
	Srish Srinivasan <ssrish@linux.ibm.com>, Mimi Zohar <zohar@linux.ibm.com>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Juergen Gross <jgross@suse.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>, Alexander Aring <aahringo@redhat.com>, 
	Felix Kuehling <felix.kuehling@amd.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Zhihao Cheng <chengzhihao1@huawei.com>, Sumanth Korikkar <sumanthk@linux.ibm.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, driver-core@lists.linux.dev, 
	llvm@lists.linux.dev, linux-hardening@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-acpi@vger.kernel.org, linux-pm@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org, 
	linux-s390@vger.kernel.org, gfs2@lists.linux.dev, 
	xen-devel@lists.xenproject.org, linux-mtd@lists.infradead.org, 
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_214600_382009_F77D4EDB 
X-CRM114-Status: GOOD (  21.16  )
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gV2VkLCBOb3YgMTgsIDIwMjYgYXQgMToxMeKAr1BNIERhbmlsbyBLcnVtbXJpY2ggPGRha3JA
a2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBTdW4gTm92IDgsIDIwMjYgYXQgMTE6MzkgUE0gQ0VU
LCBJYW4gUm9nZXJzIHdyb3RlOgo+ID4gIHN0YXRpYyBjb25zdCBzdHJ1Y3Qga29ial90eXBlIGNw
dXJlZ3Nfa29ial90eXBlID0gewo+ID4gKyAgICAgLyoKPiA+ICsgICAgICAqIFByZS1leGlzdGlu
ZzogaW5mby0+a29iaiBpcyBlbWJlZGRlZCBpbiBwZXItQ1BVIGNwdV9kYXRhOwo+ID4gKyAgICAg
ICogY3B1aWRfY3B1X29mZmxpbmUoKSBvbmx5IGNhbGxzIGtvYmplY3RfZGVsKCkuCj4gPiArICAg
ICAgKi8KPgo+IEFsbCBvZiB0aGVzZSBjb21tZW50cyBjYXJyeSBhIOKAnFByZS1leGlzdGluZzri
gJ0gcHJlZml4LCBidXQgdGhhdCBkb2VzbuKAmXQKPiBkaXN0aW5ndWlzaCBjYXNlcyB3aXRoIGJy
b2tlbiBsaWZldGltZSBtYW5hZ2VtZW50IGZyb20gdGhvc2Ugd2hlcmUgdGhlIHN0b3JhZ2UKPiBy
ZW1haW5zIHZhbGlkIGRlc3BpdGUgdGhlIEFQSSBtaXN1c2UuCj4KPiBGb3IgZXhhbXBsZToKPgo+
ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV94Y3AuYyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV94Y3AuYwo+ID4gaW5kZXggYWIxNDA3
OWQxYzQyLi4wODQ3MTM0YTEzOTEgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfeGNwLmMKPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV94Y3AuYwo+ID4gQEAgLTc5Nyw2ICs3OTcsMTEgQEAgc3RhdGljIGNvbnN0IHN0cnVj
dCBzeXNmc19vcHMgeGNwX2NmZ19yZXNfc3lzZnNfb3BzID0gewo+ID4gIH07Cj4gPgo+ID4gIHN0
YXRpYyBjb25zdCBzdHJ1Y3Qga29ial90eXBlIHhjcF9jZmdfcmVzX3N5c2ZzX2t0eXBlID0gewo+
ID4gKyAgICAgLyoKPiA+ICsgICAgICAqIFByZS1leGlzdGluZzogeGNwX3JlcyBpcyBlbWJlZGRl
ZCBpbiBzdHJ1Y3QgYW1kZ3B1X3hjcF9jZmcKPiA+ICsgICAgICAqIHJhdGhlciB0aGFuIGZyZWVk
IGluZGl2aWR1YWxseSBieSBrb2JqZWN0X3B1dCgpLgo+ID4gKyAgICAgICovCj4gPiArICAgICAu
cmVsZWFzZSA9IE5VTEwsCj4KPiBCZWluZyBlbWJlZGRlZCBpbiBhbm90aGVyIHN0cnVjdHVyZSBk
b2Vzbid0IGV4cGxhaW4gd2hhdCBndWFyYW50ZWVzIHRoYXQgdGhlCj4gZW5jbG9zaW5nIGFsbG9j
YXRpb24gb3V0bGl2ZXMgdGhlIGtvYmplY3TigJlzIGZpbmFsIGNsZWFudXAuCj4KPiBDb3VsZCB5
b3UgcGxlYXNlIGRyb3AgdGhlIOKAnFByZS1leGlzdGluZzrigJ0gcHJlZml4IGFuZCBtYWtlIHRo
YXQgZGlzdGluY3Rpb24KPiBleHBsaWNpdD8gRm9yIGJyb2tlbiBjYXNlcywgZGVzY3JpYmUgdGhl
IGxpZmV0aW1lIHByb2JsZW0gYW5kIG1hcmsgaXQgYXMgbmVlZGluZwo+IGEgZm9sbG93LXVwIGZp
eC4gRm9yIGNhc2VzIHdoZXJlIHRoZSBsaWZldGltZSBpcyBzYWZlLCBleHBsYWluIHdoYXQgZ3Vh
cmFudGVlcwo+IHRoYXQgc2FmZXR5LCB3aGlsZSBhY2tub3dsZWRnaW5nIHRoYXQgb21pdHRpbmcg
cmVsZWFzZSgpIHN0aWxsIHZpb2xhdGVzIHRoZQo+IGRvY3VtZW50ZWQgQVBJIGNvbnRyYWN0Lgo+
Cj4gQWxzbywgZG8geW91IHBsYW4gdG8gZm9sbG93IHVwIG9uIHRob3NlIGNhc2VzPwoKTWFrZXMg
Y29tcGxldGUgc2Vuc2UsIHRoYW5rcyBEYW5pbG8hCgpBdWRpdGluZyBhbGwgMTcgZmlsZXMgaW4g
cGF0Y2ggOSB3aXRoIHRoYXQgZGlzdGluY3Rpb24gaW4gbWluZDoKLSBPbmx5IDMgYnVpbHQtaW4g
c2l0ZXMgKGFybTY0IGNwdWluZm8sIEFDUEkgaG90cGx1ZyBwcm9maWxlcywgYW5kCnMzOTAgc2Ns
cF9tZW0pIGhhdmUgYmFja2luZyBzdG9yYWdlIHRoYXQgZ2VudWluZWx5IHJlbWFpbnMgdmFsaWQg
Zm9yCnRoZSBsaWZldGltZSBvZiB0aGUga2VybmVsLgotIFRoZSBvdGhlciAxNCBmaWxlcyBlaXRo
ZXIgZnJlZS96ZXJvIGFuIGVuY2xvc2luZyBkeW5hbWljIG9yIGRldm0KYWxsb2NhdGlvbiB3aXRo
b3V0IHdhaXRpbmcgZm9yIGZpbmFsIGtvYmplY3QgY2xlYW51cCwgb3IgYXJlIHRyaXN0YXRlCm1v
ZHVsZXMgdGhhdCB1bnJlZ2lzdGVyIHN0YXRpYyBrb2JqZWN0cy9rc2V0cyBvbiBtb2R1bGVfZXhp
dCBhbmQgY2FuCnVubWFwIG1vZHVsZSBtZW1vcnkgYmVmb3JlIGRlbGF5ZWQgY2xlYW51cCBmaW5p
c2hlcy4KCkkndmUgZHJvcHBlZCB0aGUgIlByZS1leGlzdGluZzoiIHByZWZpeCwgZG9jdW1lbnRl
ZCB0aGUgc3BlY2lmaWMKZ3VhcmFudGVlIG9yIEZJWE1FIGxpZmV0aW1lIGhhemFyZCBhdCBlYWNo
IHNpdGUgaW4gdjQsIGFuZCB5ZXMsIEkgcGxhbgp0byBzZW5kIGZvbGxvdy11cCBmaXhlcyB0byB0
aGUgcmVzcGVjdGl2ZSBzdWJzeXN0ZW1zIG9uY2UgX19tdXN0X2luaXQKaXMgaW4gcGxhY2UuCgpU
aGFua3MsCklhbgoKPiBUaGFua3MsCj4gRGFuaWxvCj4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWls
aW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1tdGQvCg==
