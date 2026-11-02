Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFC96606D805
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Nov 2026 20:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1NuRZBhI;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RIqQSiH2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=SvLukyskPI5/xPCfWP3+RNqOhZkofReH5OVx6Kehhe0=; b=1NuRZBhI8Wl+eFqghlX/wyL/ls
	XVNja9Bl1Uk4Sckr2vBZ/ZGzDvITNT6AtkpOKC1QVOh32Fs2S14m7ehfaD6YOEJ55qTfJtRLzQsX5
	JU0zjX7x7VnyhVyJQUzihNqUdRpiqIbBlTJoMjLx3dAF7bPwZ+JhUVS7xyWdaHLzZjKg7vb8kJ7pT
	ETDwxMyYD67S6UNODcrRWFha1XPHZ8Fn93wHbRqoA6WrodM5w+fOBak7YNPX574lR5bGeh82AIObm
	ZkhuaQQrxvsU24GSg2nMWEfY2+hM629BIohiB6wXrwUiV8rHPiZ9B3hUJ6TPl8WFZCvFAp8Db395c
	yLZ6c4kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNz1n-00000000QC5-3wEg;
	Mon, 02 Nov 2026 20:53:15 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNz1l-00000000QBl-2aPw
	for linux-mtd@lists.infradead.org;
	Mon, 02 Nov 2026 20:53:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793652791;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=117yBiLwKENKL+3PiWG/U5OMCVmGd5cgD5S+cpkVimE=;
	b=RIqQSiH2Cof3hI/HhP1Y2cIiEwMwPg+acWNtLO6eGNkEBY5nmX/S5RmJY03JRrDO1D44Ku
	9R4bM376xGH6e9llcvqvwNb+bPTLNAUdGN0yV/eic3P0sPMVien1v9IV8VJcO7Qk5BXvob
	wT5voRVogPpxcpDhpHgCvnqnfAOLwsE=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-549-XEdxY9bbP5mTmJ_tRHZBEw-1; Mon, 02 Nov 2026 15:53:09 -0500
X-MC-Unique: XEdxY9bbP5mTmJ_tRHZBEw-1
X-Mimecast-MFC-AGG-ID: XEdxY9bbP5mTmJ_tRHZBEw_1793652788
Received: by mail-lj1-f198.google.com with SMTP id 38308e7fff4ca-3ab2f8ce13dso225971fa.1
        for <linux-mtd@lists.infradead.org>; Mon, 02 Nov 2026 12:53:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793652788; x=1794257588;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=117yBiLwKENKL+3PiWG/U5OMCVmGd5cgD5S+cpkVimE=;
        b=oKQdgxeprW6E84q5Kh+Iwu0fQI4Sh6XPA97oIcgwRqWNSmULcRB6bL9+ww+5RMU/OZ
         aLPjwdRwSNUmOsMP6MCfcs3aQvmNYxYFSnLEJjPiJJDGpuF/BELVa9B0Ntl3ivigNX76
         1STubjL49h6vovuxUAAN8wwBJZ3MPP9/9YfapN1M+Gs1qyDXe6uBMku1DajAXc19V8Um
         11oD8aMjC3XyQ3jPvpo3WwF9FPDUqQzy21EcYu9eHLP1Wld5Gnw+Xc6OsGpbpENQHCDJ
         iv8r0K+aqskvJ15HQrqVxe4fpKNu7qiOahT+uPHEI+HbBuCgCvwY0v6iWhTP9fNt+X4I
         drWw==
X-Forwarded-Encrypted: i=1; AKwUvBxhHd6Apn+dDk4GqWOSYgu2rk9nagzTicanM4aACn8Yiqqp1enLoUoq/Ni0nacXjjhSFXhbc/bhV4w=@lists.infradead.org
X-Gm-Message-State: APuU4Z98lp+gcyjqt2qreiRUUdpRQoO/j6RCu7GxB23BQo/5XfbgiXWb
	7QJsq344vAzzf6p3qb0pwzxRJqzT5ztjvybDGbLDoYvf+kuASSzrOQIfFLiTJtDwBBxcjCFoC/8
	w26r4i7Y6TsQuS6tPe+5AN16JiOS/F4/X5OuDp0yY2HCI1r8leL5Vkpc18U2LtD5cVHJS4o/Ib2
	Wr2TZibfLMbWtnmfyIDenkITlY/E8RIEbUf6bnt6MZNw==
X-Gm-Gg: AYBFou0VdGqZIKt3EpQXZBbWwJjHLs7HovsNRQevRnvlsOXSAYDrDMxCe6wkE96Ove6
	5ezoUPdAeI/6E7hYonXem8nHTQEhHuxOnfJQpoUI7r/+pXeH3OBlRmUzFgiDs0aKcwB9hXJM3Ji
	4ptQBkjJSoziShx7yb3PHb3rgy2gpZg3E5fBdi1oMhpOFsm1pvQhxxXnPL
X-Received: by 2002:a05:651c:a14e:b0:3ac:4b79:573b with SMTP id 38308e7fff4ca-3acb7aa83b1mr20499101fa.13.1793652788252;
        Mon, 02 Nov 2026 12:53:08 -0800 (PST)
X-Received: by 2002:a05:651c:a14e:b0:3ac:4b79:573b with SMTP id
 38308e7fff4ca-3acb7aa83b1mr20499011fa.13.1793652787872; Mon, 02 Nov 2026
 12:53:07 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261027223847.652884-1-irogers@google.com> <20261027223847.652884-6-irogers@google.com>
In-Reply-To: <20261027223847.652884-6-irogers@google.com>
From: Alexander Aring <aahringo@redhat.com>
Date: Mon, 2 Nov 2026 15:52:55 -0500
X-Gm-Features: AclHuK8pGzNf4aGPekLa6NQcs521xOugw8djA3E8ZMCjZ7yn89XzG5j_wIaQNFk
Message-ID: <CAK-6q+j-MS_5St04YFU11LG_Cjf1jOuS3q33qk_iK=7TE-iuBg@mail.gmail.com>
Subject: Re: [PATCH v2 5/9] dlm: Free dlm_ls in kobject release callback
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
	linux-kernel@vger.kernel.org, David Teigland <teigland@redhat.com>, 
	Greg Kroah-Hartman <gregkh@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 2BSpz33U5Ncjn7ibyLbTOs7GclHXp76QTdPtaxxo2Zk_1793652788
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_125313_724094_295B8B55 
X-CRM114-Status: GOOD (  12.40  )
X-Spam-Score: -2.8 (--)
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
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGksCgpPbiBUdWUsIE9jdCAyNywgMjAyNiBhdCA2OjM54oCvUE0gSWFuIFJvZ2VycyA8aXJvZ2Vy
c0Bnb29nbGUuY29tPiB3cm90ZToKPgo+IHN0cnVjdCBkbG1fbHMgZW1iZWRzIGEgc3RydWN0IGtv
YmplY3QgKGxzX2tvYmopLCBidXQgZGxtX2t0eXBlIGxhY2tlZCBhCj4gLnJlbGVhc2UgY2FsbGJh
Y2sgYW5kIGRsbSBmcmVlZCB0aGUgbG9ja3NwYWNlIHN0cnVjdHVyZSBkaXJlY3RseSB2aWEKPiBr
ZnJlZShscykuIFdpdGggQ09ORklHX0RFQlVHX0tPQkpFQ1RfUkVMRUFTRT15LCBmcmVlaW5nIGxz
IGJlZm9yZSB0aGUKPiBkZWxheWVkIGtvYmplY3QgcmVsZWFzZSBydW5zIGNhdXNlcyBhIHVzZS1h
ZnRlci1mcmVlLCBhbmQgdW5sb2FkaW5nIHRoZQo+IG1vZHVsZSB3aGlsZSB0aGUgZGVsYXllZCBy
ZWxlYXNlIGlzIHBlbmRpbmcgcmVzdWx0cyBpbiBhbiBpbnN0cnVjdGlvbgo+IHBhZ2UgZmF1bHQu
Cj4KPiBBZGQgYSBjb21wbGV0aW9uIGxzX2tvYmpfZG9uZSBhbmQgZGxtX2xzX3JlbGVhc2UoKSB0
byBjb21wbGV0ZSBpdCB3aGVuCj4gdGhlIGxhc3Qga29iamVjdCByZWZlcmVuY2UgaXMgZHJvcHBl
ZCwgd2FpdGluZyBmb3IgaXQgaW4gZnJlZV9sb2Nrc3BhY2UoKQo+IGJlZm9yZSBrZnJlZShscykg
YW5kIGluIHRoZSBuZXdfbG9ja3NwYWNlKCkgZXJyb3IgcGF0aCBiZWZvcmUgbW9kdWxlX3B1dCgp
Lgo+IEFsc28gZGVsZXRlIHRoZSBrb2JqZWN0IHZpYSBrb2JqZWN0X2RlbCgpIGJlZm9yZSBzdG9w
cGluZyBkbG1fcmVjb3ZlcmQKPiB0byBjbG9zZSB0aGUgd2luZG93IHdoZXJlIGNvbmN1cnJlbnQg
c3lzZnMgd3JpdGVzIGNvdWxkIHdha2UgdGhlIHN0b3BwZWQKPiByZWNvdmVyeSB0YXNrLgo+Cj4g
Rml4ZXM6IDM1MTRmYWNhMTlhNiAoImtvYmplY3Q6IHJlbW92ZSBzdHJ1Y3Qga29ial90eXBlIGZy
b20gc3RydWN0IGtzZXQiKQo+IFNpZ25lZC1vZmYtYnk6IElhbiBSb2dlcnMgPGlyb2dlcnNAZ29v
Z2xlLmNvbT4KCkEgc29tZXdoYXQgImJpZyBjaGFuZ2UiIGZvciBqdXN0IGEgZGVidWcgZnVuY3Rp
b25hbGl0eS4gQWx0aHJvdWdoIEkKYWdyZWUgd2Ugc2hvdXQgY2FsbCAia29iamVjdF9kZWwoKSIg
ZWFybHkgdG8gYXZvaWQgYWRkaXRpb25hbCBzeXNmcwpjaGFuZ2VzIGR1cmluZyByZW1vdmFsLgoK
QWNrZWQtYnk6IEFsZXhhbmRlciBBcmluZyA8YWFocmluZ29AcmVkaGF0LmNvbT4KClRoYW5rcy4K
Ci0gQWxleAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
