Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFB4D606A337
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Nov 2026 22:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dVVBc+ld;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=OSkzmjsU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=/aK87dkkCMIDq5TSCDGhepTOkdfc2ymaZEpItNRFTFw=; b=dVVBc+ld/p61CHZrmtvZyldeAJ
	/7Pn6hhGT9pEcURlsETjONAYt1V/Ar+6lP4H1+4v15H0elZpEsngG1AOirc3/n86J56gy2/8VEHwH
	W/ldgJY0BCvGewLoJE+HQODh3/6c64muvhsY5fQup81OLfG6mUxbM6ZqW/CJ3w3eZCnd5FYtJqhNr
	Gmz2wmwggVYo1uCcKfIyn+vYO2KSfd04CzwtTjgyuC31CXNBkI4eAPjO8LIclwFBf51gq6RbeL3if
	JL4w9E8to6xw/u8ZrlogP5a40YC/nqLT1zdK+EnoU0nOYARVwpjw0gEkc1x9Jvr4LD/hB5WKifgPI
	kAxofHLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQXsS-00000001smQ-1Fhx;
	Mon, 09 Nov 2026 22:30:12 +0000
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQXsP-00000001sm1-2tYj
	for linux-mtd@lists.infradead.org;
	Mon, 09 Nov 2026 22:30:11 +0000
Received: by mail-qt1-x82d.google.com with SMTP id d75a77b69052e-533202fe429so33411cf.0
        for <linux-mtd@lists.infradead.org>; Mon, 09 Nov 2026 14:30:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794263408; cv=none;
        d=google.com; s=arc-20260327;
        b=Z+E9yAnd7VQQq5MpPVdpYzOgHLolLhRb2zhv+ykSiFuspkVbwH0gnvmTRCo6mp3DTq
         Dcz0XP18PzzL5TiMjFiNwxxaTT1wTDjQY2mVsRmWbVNuh3snldOnjdsP9lJnQdDzk2O0
         9sX/FkcOI6QBQ11iJ74XOk/tJ2xLUVommXP14krY0CblK5OorRVJg52q0VJKxQEY2yZR
         lYtddf+1s9R4hAE+LBeaevhCkpe+Okeu6VaAnlQwhh4oeESgLIXJ4BAZEqipsn+Pjn4J
         0Fc04xnFvCvk4Prn4l+xSlH0PilEHiEC2yurOtl+dI3dYRI59kF8Pmbk4euwp9dMaFrp
         UTHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=S6J9qhUwfhfejNNDnNi/t39zME3R/+tshu3QmKCryWs=;
        fh=a/9pGPyjcJAhDkTZ7lx4KlET82H714QWD9wvZ3I+dus=;
        b=GJkpMDixxmlwm5HF7f2ExhetZMkZUZH4+hEXXH9YuzPeZKnnF4UqwmYZcAy+Q39eJs
         1wN7jNyUK5jjsdmK7YLJvDUBHtrYnm5ErlIKA7MUuI0aiKI+6J3HVbOFa/jwqC7/hBgz
         yerzFccAOkO3UQXHl71Ld/aCj9hDTjROdUedtcJBFPl3G1JeyE1rLLB/sMLxecz9y8+a
         opB88ZD0u8EdMQpBOg67Dxn/EnUQiYlHHhPSi5hLPAyzEjPt9vbQPTdRlVHm9vv311OS
         jKLk38DuSyb9e7VQbE8h0u9GlkVkOmees3GBJqYXbyklz9hN2p1gMeJZym4TJZy98Ori
         rZ3w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794263408; x=1794868208; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=S6J9qhUwfhfejNNDnNi/t39zME3R/+tshu3QmKCryWs=;
        b=OSkzmjsU6Jo8icAiYEYYfd6Btzi75v7rWeJm+ydF27BSk5eLuwmQPeyx93DQNnpx0Q
         7MY/jBEBDiktnEpQX//uM7DLEDKw8xsd/EfpxnsYaqFj6zgnJ0jK48KbfYL5XlCm23ov
         IJJ7kDmoJxjBnBiRI5rcRcMuQaLlCxqFVMBjqLw/27vr4dssfqWmjvWi9vFmfM3yG5OT
         LnAYxpEw8qfOswp65T6sfyMXgU1JmfLj0sdHYxiZkMp315pqFkyen1qbKna7v6vAhZbZ
         5eD7Vdh5L0CdIHZ2wIzZSqqzUZhyy/T5vk17jFcvSdXHD8/+lvpl/a7kwNbUCSZqB/QU
         R5wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794263408; x=1794868208;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S6J9qhUwfhfejNNDnNi/t39zME3R/+tshu3QmKCryWs=;
        b=huO36tm3syJdp3xthaByT9Zfh71u+wIx9MAsQdG5Hlyasl10Nb3921ajn1l7K1Vcyu
         y8wgaZFsN3h+QTVD3dlsTiySPxWuINwa3xOc3ip4t9/Y+l7ZFyx/4NA9VNSTpdHAezl0
         c9RVDruLthkUtpMCkcWNYAnaPC0Brz+l/1XWiECERzP+MF1VJj8Kn/9QlRE8AjLqld3i
         14+furpK/8suz7NBbz5rVKkHGKpXniaNtS4Tvje5ePVNZWXrCXQTke6VUWQEYjGjK8RN
         Ov/3ZCFJ/vLNGAEYA0omqh5WsLj8fBB9EyPjc4zNEaNQYyepZz5SE4pAQDhdzAUnOfOL
         Nd1g==
X-Forwarded-Encrypted: i=1; AL+hErFwBk32SQ983woxBryVcNcIVBGLHdyKvD5v8qPSNG6pxxSl+xJICmWrkotsZyXB9lhmCk6EGyp+2HU=@lists.infradead.org
X-Gm-Message-State: APuU4Z84lBIAuQa3Y2rtN4o9965KoawYRX+zJQfvZ0LoRGA5daUf2uCt
	dtdu0l/2NxtvuK1zbECZyaHy2xbrMtER+8nNn14r4dGv/UB/xch5In89JFx+zY18PkFCYPfI9M3
	1r8UNcNnVA/a4CSjSYrzenwOKnW9TDeQh0AVF7F9W
X-Gm-Gg: AYBFou2oLR4rc9D5qfEtmQxL5kDGercuYNF4jN47DNcODk30Dhk3qfhHf/6TA+7mcPl
	ZxvbY2NXxYW2qf7n6rrn41W8duY084T5hAPg/izGR/VWIpy1n5pQBKcTUyQRLjZ23eMmVWOXybp
	23dlY6hP8xunz6QXEZAD8xHF3Y+mb8wlKdhdZyx2fg7YbmJwGE+/ljvzwXtmqlpc3dLcucDZyJw
	pROibgd2F1ehkDczRraLwmOfnsO3J3ZVkuKS9VswDpNjcld3Pj3f02TOenbgGfhBA5EGLn9ayZx
	JP7b1AAbDwAWLTZeyClNQwOobC4D6snM6/dyTQcPpcVdmAXe+DxiEHVAubONTn/CVEjlB4Ql50C
	USzL09ctRyZPzPmEAM4msY8TNIDwbxta0lbwwVfwjp/Um9roYOGU4F8uRzDuwAgajdts=
X-Received: by 2002:a05:622a:1b16:b0:530:e00f:7768 with SMTP id
 d75a77b69052e-555290bb288mr6464421cf.0.1794263407457; Mon, 09 Nov 2026
 14:30:07 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261108223913.3624571-1-irogers@google.com> <20261108223913.3624571-7-irogers@google.com>
 <b8d171de-52fe-474e-96db-d119840c6240@suse.com>
In-Reply-To: <b8d171de-52fe-474e-96db-d119840c6240@suse.com>
From: Ian Rogers <irogers@google.com>
Date: Mon, 9 Nov 2026 14:29:55 -0800
X-Gm-Features: AclHuK-dlWDp0B4FdK6V9QBR5LM_sA67_T-19O3ovPwDJ5RdBpzojQ18ICzxF_E
Message-ID: <CAP-5=fXd640kfaR+soPdiEV2mfqCPGDANCt04KzaXBphYP4Htg@mail.gmail.com>
Subject: Re: [PATCH v3 6/9] xen/sys-hypervisor: Add release callback to hyp_sysfs_kobj_type
To: Juergen Gross <jgross@suse.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Kees Cook <kees@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <chleroy@kernel.org>, Nayna Jain <nayna@linux.ibm.com>, 
	Srish Srinivasan <ssrish@linux.ibm.com>, Mimi Zohar <zohar@linux.ibm.com>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Stefano Stabellini <sstabellini@kernel.org>, 
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
X-CRM114-CacheID: sfid-20261109_143009_754139_34B336A8 
X-CRM114-Status: GOOD (  24.11  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gU3VuLCBOb3YgOCwgMjAyNiBhdCAxMDo1NuKAr1BNIEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0Bz
dXNlLmNvbT4gd3JvdGU6Cj4KPiBPbiAwOC4xMS4yNiAyMzozOSwgSWFuIFJvZ2VycyB3cm90ZToK
PiA+IGh5cGVydmlzb3JfaW5pdCgpIGluIGRyaXZlcnMvYmFzZS9oeXBlcnZpc29yLmMgY3JlYXRl
cyBoeXBlcnZpc29yX2tvYmoKPiA+IHdpdGgga29iamVjdF9jcmVhdGVfYW5kX2FkZCgpICh3aGlj
aCBhbGxvY2F0ZXMgYSBkeW5hbWljIGtvYmplY3QgdXNpbmcKPiA+IGR5bmFtaWNfa29ial9rdHlw
ZSksIGFuZCBoeXBlcnZpc29yX3N1YnN5c19pbml0KCkgaW4KPiA+IGRyaXZlcnMveGVuL3N5cy1o
eXBlcnZpc29yLmMgdGhlbiBvdmVyd3JpdGVzIGh5cGVydmlzb3Jfa29iai0+a3R5cGUgd2l0aAo+
ID4gJmh5cF9zeXNmc19rb2JqX3R5cGUsIHdoaWNoIGhhZCBubyAucmVsZWFzZSBjYWxsYmFjay4K
PiA+Cj4gPiBBZGQgaHlwX3N5c2ZzX3JlbGVhc2UoKSBjYWxsaW5nIGtmcmVlKGtvYmopIHRvIHBy
ZXNlcnZlIHRoZSBkeW5hbWljCj4gPiBrb2JqZWN0IHJlbGVhc2UgYmVoYXZpb3IuCj4gPgo+ID4g
Rml4ZXM6IGNmZjdlODFiM2RkNyAoInhlbjogYWRkIC9zeXMvaHlwZXJ2aXNvciBzdXBwb3J0IikK
PiA+IFNpZ25lZC1vZmYtYnk6IElhbiBSb2dlcnMgPGlyb2dlcnNAZ29vZ2xlLmNvbT4KPiA+IC0t
LQo+ID4gICBkcml2ZXJzL3hlbi9zeXMtaHlwZXJ2aXNvci5jIHwgNiArKysrKysKPiA+ICAgMSBm
aWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L3hlbi9zeXMtaHlwZXJ2aXNvci5jIGIvZHJpdmVycy94ZW4vc3lzLWh5cGVydmlzb3IuYwo+ID4g
aW5kZXggOTE5MjMyNDJhNWFlLi4wZThhMmNkNjlmZDYgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJz
L3hlbi9zeXMtaHlwZXJ2aXNvci5jCj4gPiArKysgYi9kcml2ZXJzL3hlbi9zeXMtaHlwZXJ2aXNv
ci5jCj4gPiBAQCAtNjU5LDcgKzY1OSwxMyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHN5c2ZzX29w
cyBoeXBfc3lzZnNfb3BzID0gewo+ID4gICAgICAgLnN0b3JlID0gaHlwX3N5c2ZzX3N0b3JlLAo+
ID4gICB9Owo+ID4KPiA+ICtzdGF0aWMgdm9pZCBoeXBfc3lzZnNfcmVsZWFzZShzdHJ1Y3Qga29i
amVjdCAqa29iaikKPiA+ICt7Cj4gPiArICAgICBrZnJlZShrb2JqKTsKPiA+ICt9Cj4gPiArCj4g
PiAgIHN0YXRpYyBjb25zdCBzdHJ1Y3Qga29ial90eXBlIGh5cF9zeXNmc19rb2JqX3R5cGUgPSB7
Cj4gPiArICAgICAucmVsZWFzZSA9IGh5cF9zeXNmc19yZWxlYXNlLAo+ID4gICAgICAgLnN5c2Zz
X29wcyA9ICZoeXBfc3lzZnNfb3BzLAo+ID4gICB9Owo+ID4KPgo+IFdvdWxkbid0IGl0IG1ha2Ug
c2Vuc2UgdG8gaGF2ZSBhIGNvbW1vbiBmdW5jdGlvbiBmb3IganVzdCBrZnJlZShrb2JqKT8KPgo+
IEluIHlvdXIgc2VyaWVzIHRoZXJlIGFyZSAzIGluc3RhbmNlcyBvZiAucmVsZWFzZSBqdXN0IGRv
aW5nIGtmcmVlKGtvYmopLgo+Cj4gSW4gY2FzZSB0aGlzIGlzIG5vdCB3YW50ZWQgb3Igd2l0aCB1
c2luZyB0aGUgc3VnZ2VzdGVkIGNvbW1vbiAucmVsZWFzZQo+IGhlbHBlciB5b3UgY2FuIGFkZCBt
eQo+Cj4gUmV2aWV3ZWQtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KClRoYW5r
cyBKdWVyZ2VuIQoKbGliL2tvYmplY3QuYyBhbHJlYWR5IGhhcyBhIHN0YXRpYyBkeW5hbWljX2tv
YmpfcmVsZWFzZSgpIHRoYXQgZG9lcwp0aGlzIChhbmQgdGhlcmUgYXJlIH4xNSBvdGhlciBwbGFj
ZXMgaW4gdGhlIHRyZWUgb3Blbi1jb2RpbmcgYSBzdGF0aWMKa2ZyZWUoa29iaikgcmVsZWFzZSB3
cmFwcGVyKSwgc28gaW5jbHVkZS9saW51eC9rb2JqZWN0LmggKwpsaWIva29iamVjdC5jIHdvdWxk
IGJlIHRoZSBuYXR1cmFsIGhvbWUgaWYgd2UgZXhwb3J0ZWQgb25lLgoKSSBrZXB0IHRoZW0gYXMg
bG9jYWwgc3RhdGljIGZ1bmN0aW9ucyBoZXJlIGZvciB0d28gcmVhc29uczoKCjEuIFBhdGNoZXMg
Mi85LCAzLzksIGFuZCA2LzkgY2FycnkgRml4ZXM6IHRhZ3MsIGFuZCBrZWVwaW5nIHRoZSBzbWFs
bAogICBsb2NhbCBjYWxsYmFja3MgYXZvaWRzIGEgZGVwZW5kZW5jeSBvbiBhIG5ldyBkcml2ZXIt
Y29yZSBleHBvcnQgZm9yCiAgIGJhY2twb3J0cy4KMi4gU2luY2Uga29iamVjdHMgYXJlIG5vcm1h
bGx5IGVtYmVkZGVkIGluIGEgbGFyZ2VyIHN0cnVjdCBhbmQgZnJlZWQgdmlhCiAgIGNvbnRhaW5l
cl9vZigpLCBJIHdhc24ndCBzdXJlIHdoZXRoZXIgR3JlZyBhbmQgRGFuaWxvIHdvdWxkIHZpZXcg
YW4KICAgZXhwb3J0ZWQga2ZyZWUoa29iaikgcmVsZWFzZSBoZWxwZXIgKGVzcGVjaWFsbHkgYWxv
bmdzaWRlCiAgIF9fbXVzdF9pbml0KSBhcyBhbiBpbnZpdGF0aW9uIGZvciBtaXN1c2Ugb24gZW1i
ZWRkZWQga29iamVjdHMuCgpVbmxlc3MgR3JlZyBvciBEYW5pbG8gd291bGQgbGlrZSBkeW5hbWlj
X2tvYmpfcmVsZWFzZSgpIChvciBzaW1pbGFyKQpleHBvcnRlZCBub3csIEknbGwgcGxhbiB0byBr
ZWVwIHRoZSBsb2NhbCBjYWxsYmFja3MgZm9yIHRoaXMgc2VyaWVzCmFuZCBjYW4gc2VuZCBhIGZv
bGxvdy11cCBjbGVhbnVwIGZvciB0aGUgdHJlZS13aWRlIGNhbGxlcnMgaWYKZHJpdmVyLWNvcmUg
bWFpbnRhaW5lcnMgdGhpbmsgYSBzaGFyZWQgaGVscGVyIG1ha2VzIHNlbnNlLgoKVGhhbmtzLApJ
YW4KCj4KPgo+IEp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
