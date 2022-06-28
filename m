Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88AADC43334
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Jun 2022 18:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1pTfWdJFGtHkdKX6xzZ//u+CRKYwZjo9dlRjUMqImxQ=; b=gaW2g9xAUgyR73
	umGOUHA0vMPOGIy0g+qq6zHDUoQIXzJD4+MkUQnPhhLNet1kxQFB/V91hKwBTRJiN2XSvpZMcxmh/
	EWyqeErI5YySkzOPbYt0dX/+m0wubUh2V72ge+4OqmKdFrdMCtEjK1vA+hMFCNEEFranDdmkx4+f8
	8i8LLz8Cti4ZLfXOQkVxpj9PJsplsRB/4ALmMPSeR+d92PIN73803kYCs7e+q7pXUoA3SEvmqB7We
	9Qc2FOA0EqU6177LMUY86Ia1pIOCfJ2zRYzK1IR0MwcTXS0DBLjAqGUW+HFraLMbFogDFBRv3QP6k
	3aXAh5LlCHoYY4rqcLzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6FbT-007XtK-OQ; Tue, 28 Jun 2022 18:06:23 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6Fb5-007Xdu-Be
	for linux-mtd@lists.infradead.org; Tue, 28 Jun 2022 18:06:00 +0000
Received: by mail-pf1-x434.google.com with SMTP id p14so12713216pfh.6
        for <linux-mtd@lists.infradead.org>; Tue, 28 Jun 2022 11:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=pTcGgtfSu6n7KkCWKQ4ciWe5XeKK5S4riO8KfNVW7Ig=;
        b=F/CZTCTDOlhkWqZ+vOzW0DaoZ/EZ1dOhoCSSJ2RrwBNwuY7CCyvEtaLLk8DO+FYVI8
         oY1bh2Rw2NH/e7uwuajkABgxQQynq/vb9wDrQT1ziurYSmeBDoqa9s9XGmGLyXXXVu1m
         Ptj/OKkdrLcBprdD9gQ9RffSNU26yKh9HCJiI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=pTcGgtfSu6n7KkCWKQ4ciWe5XeKK5S4riO8KfNVW7Ig=;
        b=hInZnQNDjRHXxoV9u0OOrXV5NrSMreBiwJXJyc1Xt4bPeVq1fH2nS0BzQ1VpIqlEKy
         DK/PF4RbbdMESH2GEsZ52rP98TF6iw2ahTuwHs8MYWDiyd/+wN/eszc9/B2Ldb9N/01q
         YWC9CTOSmc2Z86mzGPT8TSLRZWPLVjo8oVeobbm1STUeyBx4Ssx04nd4fsSTYkxS9e+D
         m14mOrFsytxX+AyY3G0BUuFEc30RDsVmoqAanKAWyM4BptPWXXg3zGXZBNG4t24/sbNS
         nkUlxAR480uyqU3Df3rF/mg5JMFcoowSAzsCoJtUilOtBzBMrcHXYeAOHP4U3jdYz8tf
         eWhA==
X-Gm-Message-State: AJIora8JAWT0bBjCEZi+Xf/BewJT2qaPAfGjvLPzsEdVbBzS2jYmGCF2
	2z19VCBI0IqlD/OOdVqiEvNf+g==
X-Google-Smtp-Source: AGRyM1v6cdnwBfGpeB2JnkCbahQ14YUYaqjRd3VUKbR8YPBigZjfWVkzlvmFIFzfbBj+r2XqbA+86w==
X-Received: by 2002:a63:7412:0:b0:40c:fa27:9d07 with SMTP id p18-20020a637412000000b0040cfa279d07mr18441815pgc.27.1656439554674;
        Tue, 28 Jun 2022 11:05:54 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id i3-20020a170902cf0300b0016a0ac06424sm9669985plg.51.2022.06.28.11.05.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jun 2022 11:05:54 -0700 (PDT)
Date: Tue, 28 Jun 2022 11:05:53 -0700
From: Kees Cook <keescook@chromium.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	the arch/x86 maintainers <x86@kernel.org>, dm-devel@redhat.com,
	linux-m68k <linux-m68k@lists.linux-m68k.org>,
	"open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
	linux-s390 <linux-s390@vger.kernel.org>,
	KVM list <kvm@vger.kernel.org>,
	Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
	DRI Development <dri-devel@lists.freedesktop.org>,
	netdev <netdev@vger.kernel.org>, bpf <bpf@vger.kernel.org>,
	linux-btrfs <linux-btrfs@vger.kernel.org>,
	linux-can@vger.kernel.org,
	Linux FS Devel <linux-fsdevel@vger.kernel.org>,
	linux1394-devel@lists.sourceforge.net, io-uring@vger.kernel.org,
	lvs-devel@vger.kernel.org,
	MTD Maling List <linux-mtd@lists.infradead.org>,
	kasan-dev <kasan-dev@googlegroups.com>,
	Linux MMC List <linux-mmc@vger.kernel.org>, nvdimm@lists.linux.dev,
	NetFilter <netfilter-devel@vger.kernel.org>, coreteam@netfilter.org,
	linux-perf-users@vger.kernel.org, linux-raid@vger.kernel.org,
	linux-sctp@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	scsi <linux-scsi@vger.kernel.org>,
	target-devel <target-devel@vger.kernel.org>,
	USB list <linux-usb@vger.kernel.org>,
	virtualization@lists.linux-foundation.org,
	V9FS Developers <v9fs-developer@lists.sourceforge.net>,
	linux-rdma <linux-rdma@vger.kernel.org>,
	ALSA Development Mailing List <alsa-devel@alsa-project.org>,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH][next] treewide: uapi: Replace zero-length arrays with
 flexible-array members
Message-ID: <202206281104.7CC3935@keescook>
References: <20220627180432.GA136081@embeddedor>
 <CAMuHMdU27TG_rpd=WTRPRcY22A4j4aN-6d_8OmK2aNpX06G3ig@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMuHMdU27TG_rpd=WTRPRcY22A4j4aN-6d_8OmK2aNpX06G3ig@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220628_110559_455050_018D28B1 
X-CRM114-Status: GOOD (  20.04  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBKdW4gMjgsIDIwMjIgYXQgMDk6Mjc6MjFBTSArMDIwMCwgR2VlcnQgVXl0dGVyaG9l
dmVuIHdyb3RlOgo+IEhpIEd1c3Rhdm8sCj4gCj4gVGhhbmtzIGZvciB5b3VyIHBhdGNoIQo+IAo+
IE9uIE1vbiwgSnVuIDI3LCAyMDIyIGF0IDg6MDQgUE0gR3VzdGF2byBBLiBSLiBTaWx2YQo+IDxn
dXN0YXZvYXJzQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4gVGhlcmUgaXMgYSByZWd1bGFyIG5lZWQg
aW4gdGhlIGtlcm5lbCB0byBwcm92aWRlIGEgd2F5IHRvIGRlY2xhcmUKPiA+IGhhdmluZyBhIGR5
bmFtaWNhbGx5IHNpemVkIHNldCBvZiB0cmFpbGluZyBlbGVtZW50cyBpbiBhIHN0cnVjdHVyZS4K
PiA+IEtlcm5lbCBjb2RlIHNob3VsZCBhbHdheXMgdXNlIOKAnGZsZXhpYmxlIGFycmF5IG1lbWJl
cnPigJ1bMV0gZm9yIHRoZXNlCj4gPiBjYXNlcy4gVGhlIG9sZGVyIHN0eWxlIG9mIG9uZS1lbGVt
ZW50IG9yIHplcm8tbGVuZ3RoIGFycmF5cyBzaG91bGQKPiA+IG5vIGxvbmdlciBiZSB1c2VkWzJd
Lgo+IAo+IFRoZXNlIHJ1bGVzIGFwcGx5IHRvIHRoZSBrZXJuZWwsIGJ1dCB1YXBpIGlzIG5vdCBj
b25zaWRlcmVkIHBhcnQgb2YgdGhlCj4ga2VybmVsLCBzbyBkaWZmZXJlbnQgcnVsZXMgYXBwbHku
ICBVYXBpIGhlYWRlciBmaWxlcyBzaG91bGQgd29yayB3aXRoCj4gd2hhdGV2ZXIgY29tcGlsZXIg
dGhhdCBjYW4gYmUgdXNlZCBmb3IgY29tcGlsaW5nIHVzZXJzcGFjZS4KClJpZ2h0LCB1c2Vyc3Bh
Y2UgaXNuJ3QgYm91bmQgYnkgdGhlc2UgcnVsZXMsIGJ1dCB0aGUga2VybmVsIGVuZHMgdXAKY29u
c3VtaW5nIHRoZXNlIHN0cnVjdHVyZXMsIHNvIHdlIG5lZWQgdG8gZml4IHRoZW0uIFRoZSBbMF0g
LT4gW10KY2hhbmdlcyAod2hlbiB0aGV5IGFyZSBub3QgZXJyb25lb3VzbHkgYmVpbmcgdXNlZCB3
aXRoaW4gb3RoZXIKc3RydWN0dXJlcykgaXMgdmFsaWQgZm9yIGFsbCBjb21waWxlcnMuIEZsZXhp
YmxlIGFycmF5cyBhcmUgQzk5OyBpdCdzCmJlZW4gMjMgeWVhcnMuIDopCgpCdXQsIHllcywgd2hl
cmUgd2UgRE8gYnJlYWsgc3R1ZmYgd2UgbmVlZCB0byB3b3JrYXJvdW5kIGl0LCBldGMuCgotLSAK
S2VlcyBDb29rCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
