Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C2D7C021B8
	for <linux-mtd@archiver.kernel.org>; Wed, 26 Feb 2025 17:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y7pn6OZTM+zkb+mGjxzFrIXx5NzCb8TNIxj0v4K2NCE=; b=OJ76AlUm9tOGUw
	beY1AZgKSSRaTH3ASPURrV5eKdE6l4cEO9hxri1R7VBnDnSoPrskOMdtzrqEFbGXqsXZpFtyXITGI
	0W1/P/o553UcOV6nXHYcpdFzUq4fsOiM4GS7fvgf7w8hCLB/1IH9TXhF94O/IXZPl+DyryRcgf+Wm
	e4LYumbC7bwnI/nqYUNu2pBmruETM/NLd8Kz5EVV/Nq194Jiy60FKFoPOYQj3pvRoz0Be5YxxQ9zB
	P7V0PrIN3MEvMLb7h0vEL1bOTtbFBuwArz+6sWbROuR3sgsau8j9ulLKazOAgj1NKOLhr0bYuejU5
	JNFKd/N6SYQCoDX9VF3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnL1C-00000004gaf-1lGs;
	Wed, 26 Feb 2025 17:16:22 +0000
Received: from tor.source.kernel.org ([2600:3c04::f03c:95ff:fe5e:7468])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnKrn-00000004dir-30gs
	for linux-mtd@lists.infradead.org;
	Wed, 26 Feb 2025 17:06:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3370861F25
	for <linux-mtd@lists.infradead.org>; Wed, 26 Feb 2025 17:06:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C93FC4CEF0
	for <linux-mtd@lists.infradead.org>; Wed, 26 Feb 2025 17:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740589598;
	bh=2R180IJ7APaALd1g+yyfkVhGYnf3hIvGDgk8lsKLG8A=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=LE/EsJFb2o+sN6h6c7yw0PHl5LhhPL9w8R/xJBOUGLGKDVwUw+DydCDSC471vysSD
	 LISAoC1I0aiD8HNK6hiavbFjTbfVfWIEA7L1eR8HxQRMg/ixQsSCjCxDSnpuH93a4L
	 GCYdnB4nMh2Uh3YepPtKutGEeO2DQhULDzCHc6Nmg97rhggPf9UGwulKmuba0a5e14
	 Fut9ocBXr94N7Mio3eJQCaAchxPD9Vb3fOa/QCj05mhi1rXU+hZPsAb4Rqgn+WDUss
	 WjKjp98yld7wOpGGXJkV0gW0zSbgW8vBFR+SvA0x4pwGWtiPCI/wGL2XwY5vCJxhqr
	 99NfBGQtHYXJA==
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-5fd26af3d93so545445eaf.1
        for <linux-mtd@lists.infradead.org>; Wed, 26 Feb 2025 09:06:38 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXw717xTqRYXJ8dZR2ANBoq9hBzKOsDHvlvFGY1wL5SWrHlYdJE+L4pQPS8TTV8rpFqpRONj3MYXsw=@lists.infradead.org
X-Gm-Message-State: AOJu0YwCbUNXOkJalGBi9fg8YkBtzMwEyyUglVEeknLb1JfMw+vw5JDj
	MSIAfhdpjRXPyQsMVLmWL/TjkfNYbnBRnRvdIFLEX4SpmYfvucgcdJx2EO5kdhPiUkYbSvHb6el
	X6yRxjMtqlS5y1WQ6VuB8G3VQeI0=
X-Google-Smtp-Source: AGHT+IHyPLVjXp7kw5kgInAMNb4jd7h5cWQZCWKEZs0yMGYHKslrekdKrqf86zX892n/fj3IchT6bMpb2Dem6Q8+U3o=
X-Received: by 2002:a05:6871:d20d:b0:2bd:286:d713 with SMTP id
 586e51a60fabf-2c155700434mr67466fac.11.1740589597661; Wed, 26 Feb 2025
 09:06:37 -0800 (PST)
MIME-Version: 1.0
References: <20250221-rmv_return-v1-0-cc8dff275827@quicinc.com> <20250221-rmv_return-v1-14-cc8dff275827@quicinc.com>
In-Reply-To: <20250221-rmv_return-v1-14-cc8dff275827@quicinc.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 26 Feb 2025 18:06:26 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0i-_08mhOpsecuU+XzS8rKbk9mtgr_Kwx-QGRPh9jumKw@mail.gmail.com>
X-Gm-Features: AQ5f1Jo18T3Py72uAV75_Jf5fdQvWu4rZ8JYWNQWcMOGXjnJR1QY3tpi4Yj9mbE
Message-ID: <CAJZ5v0i-_08mhOpsecuU+XzS8rKbk9mtgr_Kwx-QGRPh9jumKw@mail.gmail.com>
Subject: Re: [PATCH *-next 14/18] PM: wakeup: Remove needless return in three
 void APIs
To: Zijun Hu <quic_zijuhu@quicinc.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Will Deacon <will@kernel.org>, 
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Nick Piggin <npiggin@gmail.com>, Peter Zijlstra <peterz@infradead.org>, Arnd Bergmann <arnd@arndb.de>, 
	Thomas Gleixner <tglx@linutronix.de>, Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S. Miller" <davem@davemloft.net>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Johannes Berg <johannes@sipsolutions.net>, Jamal Hadi Salim <jhs@mojatatu.com>, 
	Cong Wang <xiyou.wangcong@gmail.com>, Jiri Pirko <jiri@resnulli.us>, 
	Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Lee Jones <lee@kernel.org>, Thomas Graf <tgraf@suug.ch>, 
	Christoph Hellwig <hch@lst.de>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Robin Murphy <robin.murphy@arm.com>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Zijun Hu <zijun_hu@icloud.com>, 
	linux-arch@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-crypto@vger.kernel.org, netdev@vger.kernel.org, 
	linux-wireless@vger.kernel.org, linux-rdma@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-pm@vger.kernel.org, iommu@lists.linux.dev, 
	linux-mtd@lists.infradead.org
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

T24gRnJpLCBGZWIgMjEsIDIwMjUgYXQgMjowM+KAr1BNIFppanVuIEh1IDxxdWljX3ppanVodUBx
dWljaW5jLmNvbT4gd3JvdGU6Cj4KPiBSZW1vdmUgbmVlZGxlc3MgJ3JldHVybicgaW4gdGhlIGZv
bGxvd2luZyB2b2lkIEFQSXM6Cj4KPiAgX19wbV93YWtldXBfZXZlbnQoKQo+ICBwbV93YWtldXBf
ZXZlbnQoKQo+ICBwbV93YWtldXBfaGFyZF9ldmVudCgpCj4KPiBTaW5jZSBib3RoIHRoZSBBUEkg
YW5kIGNhbGxlZSBpbnZvbHZlZCBhcmUgdm9pZCBmdW5jdGlvbnMuCj4KPiBTaWduZWQtb2ZmLWJ5
OiBaaWp1biBIdSA8cXVpY196aWp1aHVAcXVpY2luYy5jb20+Cj4gLS0tCj4gIGluY2x1ZGUvbGlu
dXgvcG1fd2FrZXVwLmggfCA2ICsrKy0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25z
KCspLCAzIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvcG1fd2Fr
ZXVwLmggYi9pbmNsdWRlL2xpbnV4L3BtX3dha2V1cC5oCj4gaW5kZXggZDUwMWMwOWM2MGNkLi41
MWUwZThkZDVmOWUgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9saW51eC9wbV93YWtldXAuaAo+ICsr
KyBiL2luY2x1ZGUvbGludXgvcG1fd2FrZXVwLmgKPiBAQCAtMjA1LDE3ICsyMDUsMTcgQEAgc3Rh
dGljIGlubGluZSB2b2lkIGRldmljZV9zZXRfYXdha2VfcGF0aChzdHJ1Y3QgZGV2aWNlICpkZXYp
Cj4KPiAgc3RhdGljIGlubGluZSB2b2lkIF9fcG1fd2FrZXVwX2V2ZW50KHN0cnVjdCB3YWtldXBf
c291cmNlICp3cywgdW5zaWduZWQgaW50IG1zZWMpCj4gIHsKPiAtICAgICAgIHJldHVybiBwbV93
YWtldXBfd3NfZXZlbnQod3MsIG1zZWMsIGZhbHNlKTsKPiArICAgICAgIHBtX3dha2V1cF93c19l
dmVudCh3cywgbXNlYywgZmFsc2UpOwo+ICB9Cj4KPiAgc3RhdGljIGlubGluZSB2b2lkIHBtX3dh
a2V1cF9ldmVudChzdHJ1Y3QgZGV2aWNlICpkZXYsIHVuc2lnbmVkIGludCBtc2VjKQo+ICB7Cj4g
LSAgICAgICByZXR1cm4gcG1fd2FrZXVwX2Rldl9ldmVudChkZXYsIG1zZWMsIGZhbHNlKTsKPiAr
ICAgICAgIHBtX3dha2V1cF9kZXZfZXZlbnQoZGV2LCBtc2VjLCBmYWxzZSk7Cj4gIH0KPgo+ICBz
dGF0aWMgaW5saW5lIHZvaWQgcG1fd2FrZXVwX2hhcmRfZXZlbnQoc3RydWN0IGRldmljZSAqZGV2
KQo+ICB7Cj4gLSAgICAgICByZXR1cm4gcG1fd2FrZXVwX2Rldl9ldmVudChkZXYsIDAsIHRydWUp
Owo+ICsgICAgICAgcG1fd2FrZXVwX2Rldl9ldmVudChkZXYsIDAsIHRydWUpOwo+ICB9Cj4KPiAg
LyoqCj4KPiAtLQoKQXBwbGllZCBhcyA2LjE1IG1hdGVyaWFsLCB0aGFua3MhCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRp
c2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtbXRkLwo=
