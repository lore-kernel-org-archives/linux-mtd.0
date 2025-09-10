Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBB5FCA101F
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Sep 2025 14:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qc6Bb2aKGDHB6kftcGTs7QtvGg1aRd3Iif45MGzPEzE=; b=aWwAqLt7Jh1hPJ
	0b5yqIyXSTK4GVpeeuPlc2kFDQ78BHNnTq9S9P8RlxQJxiNQNbLkTne0D4L9z4xNAHbzCaqtDDT1C
	QfAyPmcYtIq179g1vrsshv0NL/IOcJiNoDwKSQj4sQHH8MmUr9pOFjxz4qBiz8ZxFp8ehJ35lUnsu
	Z7/tR7/LfaWVTx7SOykSTBGo+YS9qYjO7nCF7QovJtlQNGlydxs8K2L8UH7I7VYiLLx1t0rsBPbj+
	/CRJB9FoBrFQcLZuXEBuYTAVBhKXDoJSMY7qp8obrzCr/RXPkxCr5oJm6fFwITkc8aWq+EuNYaSEb
	d2u2ojyhWVepaAtI/AiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwLr4-0000000EjFt-1sPd;
	Wed, 10 Sep 2025 14:31:26 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwLr1-0000000EjDl-2pLQ
	for linux-mtd@lists.infradead.org;
	Wed, 10 Sep 2025 14:31:24 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-61cfbb21fd1so11417a12.0
        for <linux-mtd@lists.infradead.org>; Wed, 10 Sep 2025 07:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1757514681; x=1758119481; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TBHjh07xVgerT1Ryn1zxmezBGqdr9sptWQnsNWqHz8E=;
        b=huPtikcu8Sxf+NRQN1ibtpp8IJUMyEfN60vOpFOIrkZNFsu1B0cVRt6L1tXpPdaG0W
         wvJFho0CUizO48XXaocGfD69G9Js9rlskhi17UEKUzBC6qDAzvPHy9bdeTR6HXc9BjkO
         F3n2IgeAI14IQWl6pybevEcXEC1BhZrGfN+vJV2MWxJbQwXhtP/w9/yL5Oi4LHThlVkm
         IH6ixPQL67T7mtshy1ywF3XhVfEr6yGv8y4zNohrVDhbnvl0+THegzzs+O3Q0gx3gi0a
         PrMw8gw8BlSD/pGiGGkQoHVlrdo4r9fLl57nDksCgo/wFXFS6ZXBHxm6v4JA1LmXn5ez
         hS7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757514681; x=1758119481;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TBHjh07xVgerT1Ryn1zxmezBGqdr9sptWQnsNWqHz8E=;
        b=ZoNyA3oOpl1UeYx6Nkac48lGfiN2lDW6Qi8YWzkYPueUaPRzO7/hc9NuN3A3kflW8F
         00AUE+ferPnTAaUqlxkC72xf2GJjM1J6bsoOmiQHBWNcoJRhk0ttk+uB2reRZt/jnSnx
         2SWv/UuXkhHQbhq21miaA6gYbZXryq9LQ+xwBaGnptPu5o40xs8MOkuP0vAyB8hTRTNI
         9p//6bIaHPRTBqZ2knvJIA+rZroJe9Rm/tlV1FZHL/Qvu49n95kFj3aptgiMQPXjwjaC
         koV08e/Y+IwrStoXLCDGCgHxCRIp6XQXTHYNgJ8myJ3UCi0JNTbJv4Y3jGe9A0MswU4Z
         ahMg==
X-Forwarded-Encrypted: i=1; AJvYcCUONumIoMLUs9zuTAekF6bByleOdxXoVWWy8Dl91kFFV/bw6HaNBbTXG3j+aVsGqtUFywdLhBQkGZ0=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxqpp1nvjJmT+7Nd5yDGy9ZnmIk9tfV8doZ7QmC4nU+h6Ru6vXR
	eg15NJPcQXoIUrtd2CJX9ymU5RweuBkhO63PhSE9iG7PwODNWfGwvT7IwHV9D7vqduGYT+rRLLH
	sbsO7jPkk6qzCxmaDIcEmENr59FZoGI5V/BQPp0j4
X-Gm-Gg: ASbGncse59EztyLlGkpGUgDyGDiVQd7AGM4lNAUl0PUKu0tCLL3BcifARrUn6/44UCX
	e6wopNvuM3GXt04OslK66Idq9CoV0GLUNq8whuDxrUKwaaOgD7kVm2NnidmBdNDurHu8mof4m2h
	tbJsDbChXSzfkD6HmsaJbzXgfA5o47SAE46QlvgUo3Una0OVXlkDDVg6b2/18AM/rd87q8sCLXw
	MEHbxrXIBmAW1kOiiX285zpVqGMT7r7HA34vN8FaG/tFIqDNP83
X-Google-Smtp-Source: AGHT+IGRjXQUY1hnYAWcdMxN/6KyD3xPZ0pQZ40M0o4vqF3cIQJ4GOYF46WvRJzio4N+Z7uVd9rvPLKsmTPmZkGoMyo=
X-Received: by 2002:a05:6402:2185:b0:61c:c9e3:18f9 with SMTP id
 4fb4d7f45d1cf-62d4e0f68eamr87423a12.3.1757514680889; Wed, 10 Sep 2025
 07:31:20 -0700 (PDT)
MIME-Version: 1.0
References: <20250910103355.629421-1-czapiga@google.com> <87frcucy3p.fsf@bootlin.com>
In-Reply-To: <87frcucy3p.fsf@bootlin.com>
From: "Jakub \"Kuba\" Czapiga" <czapiga@google.com>
Date: Wed, 10 Sep 2025 16:30:43 +0200
X-Gm-Features: AS18NWBTtKhP8XqCorujp7PIPt_ibCOebdea57KS6V9p1MfFOBrohUfAAkZewTE
Message-ID: <CABkukdpRxHFg9FbaV1GnS5UG3-ZxdxPbjKYdUpdmvOcLs5phKA@mail.gmail.com>
Subject: Re: [PATCH] mtd: spi-nor: core: Check read CR support
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Pratyush Yadav <pratyush@kernel.org>, 
	Michael Walle <mwalle@kernel.org>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Konrad Adamczyk <konrada@google.com>, 
	Adeel Arshad <adeel.arshad@intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_073123_713542_B7E283C5 
X-CRM114-Status: GOOD (  14.05  )
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

SGkgTWlxdcOobCwKCk9uIFdlZCwgU2VwIDEwLCAyMDI1IGF0IDI6MDXigK9QTSBNaXF1ZWwgUmF5
bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPiB3cm90ZToKPgo+IEhpIEpha3ViLAo+Cj4g
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvc3BpLW5vci9jb3JlLmMgYi9kcml2ZXJzL210ZC9z
cGktbm9yL2NvcmUuYwo+ID4gaW5kZXggYWM0Yjk2MDEwMWNjLi43OWRlZWUzYTUwZDMgMTAwNjQ0
Cj4gPiAtLS0gYS9kcml2ZXJzL210ZC9zcGktbm9yL2NvcmUuYwo+ID4gKysrIGIvZHJpdmVycy9t
dGQvc3BpLW5vci9jb3JlLmMKPiA+IEBAIC0yNjA4LDYgKzI2MDgsMTAgQEAgc3RhdGljIGludCBz
cGlfbm9yX3NldHVwKHN0cnVjdCBzcGlfbm9yICpub3IsCj4gPiAgICAgICAgICAgICAgIH0KPiA+
ICAgICAgIH0KPiA+Cj4gPiArICAgICAvKiBTb21lIFNQSSBjb250cm9sbGVycyBtaWdodCBub3Qg
c3VwcG9ydCBDUiByZWFkIG9wY29kZS4gKi8KPiA+ICsgICAgIGlmIChzcGlfbm9yX3JlYWRfY3Io
bm9yLCBub3ItPmJvdW5jZWJ1ZikgPT0gLUVPUE5PVFNVUFApCj4KPiBUaGVyZSBpcyBhIHNwaV9u
b3Jfc3BpbWVtX2NoZWNrX29wKCkgaGVscGVyIHdoaWNoIG1pZ2h0IGJlIGJldHRlciBzdWl0ZWQK
PiBmb3IgdGhpcyBwdXJwb3NlPwoKc3BpX25vcl9zcGltZW1fY2hlY2tfb3AoKSB3b3JrcyBvbmx5
IGZvciBzcGktbWVtIGRldmljZXMuIHNwaV9ub3JfcmVhZF9jcigpCmhhbmRsZXMgYm90aCBzcGkt
bWVtIGFuZCBzcGktbm9yIGNvbnRyb2xsZXIuIFVzaW5nIHNwaV9ub3Jfc3BpbWVtX2NoZWNrX29w
KCkKd291bGQgcmVxdWlyZSBhZGRpbmcgYSB2YXJpYXRpb24gb2Ygc3BpX25vcl9yZWFkX2NyKCkg
dGhhdCB3b3VsZCB1c2UKc3BpX25vcl9zcGltZW1fY2hlY2tfb3AoKSBmb3Igc3BpLW1lbSBhbmQg
c3BpX25vcl9jb250cm9sbGVyX29wc19yZWFkX3JlZygpCmZvciBzcGktbm9yIGNvbnRyb2xsZXIu
CkFub3RoZXIgd2F5IHdvdWxkIGJlIHRvIGRvIHRoaXMgY2hlY2sgb25seSBmb3IgdGhlIHNwaS1t
ZW0gYXMgc3BpLW5vcgpjb250cm9sbGVycyBzZWVtIHRvIGJlIGRlcHJlY2F0ZWQgaW4gZmF2b3Vy
IG9mIHNwaS1tZW0uCgpUaGFua3MsCkpha3ViCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBs
aXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRk
Lwo=
