Return-Path: <SRS0=o/Ze=DH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C46A7C4363D
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Sep 2020 22:34:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5EF8C2071E
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Sep 2020 22:34:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Fi6TXwmb";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="dhje9PS0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5EF8C2071E
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qx+ODpszazjj12lGh5wC0p5mTm/bt2m1FbNVjGaa89g=; b=Fi6TXwmbnyz2HFq4K8gevrrFl
	/c2kY9RieqtnoO/bygSdsuTzWrHRYAE1vFWRV8dBQel26t+6HbnOnD5akwN4LrL4F5/4msCsYxhLC
	RStpwZHdT4ee99BQPtgNnkiC+AQ7vCL2Vb/mSSkuo3iHoXFLE5tyujekpNqo4qB0KmkFAmiz7goz0
	F0Ju9gL9ruNLBigmTKdc802EPjHEWnv22MrQzKBuuah5qDnIqyKtffInLFMXRzDRcA983d8eyOa0F
	AsB9Rl2ofH1uLCoqMC0usex6echWTQHHeMHwNQ60V+wDLmVQXxwii2QJYrP9VPFipOVcyu/KH3iqh
	d/wYigJiw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNkec-0000LD-MN; Wed, 30 Sep 2020 22:32:54 +0000
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNkea-0000Jv-Pm
 for linux-mtd@lists.infradead.org; Wed, 30 Sep 2020 22:32:53 +0000
Received: by mail-ej1-x642.google.com with SMTP id dd13so5152071ejb.5
 for <linux-mtd@lists.infradead.org>; Wed, 30 Sep 2020 15:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=e6O73OjsDxvOW+WlmK+Heyu52Yeg2Jcu5CCnSK4DBT0=;
 b=dhje9PS0dPsa5SE9icH+VbXOR2J377+pA6AR6uz7LR2jewZZUPNCxEx6w+qeI+oGkb
 pgU/Vb4RuH9x1o/7GsN/aY+anl8p5kSPJtUaM9a0o94wriLqJ2cGZs+wE5676T0ulPf8
 BXwGd6kMl1uNGRSkEODujQFaabYaR/jyu8XLHnpac3gWWKX1su6fID3NwUeJ94ZoqRVv
 1ucqZJMZRb6Oj2TB/uYmuKSarxmrBRQcFAT7o55E1FLn+lf28LlGLiTYQjqrHlvaDdBx
 eImGrKIKL1bPXTyJB7fx4FhTJ14CiYHzHY+NRMHqOzFuH8/U8OBCntm0+2fpTUpt9kIU
 gr2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=e6O73OjsDxvOW+WlmK+Heyu52Yeg2Jcu5CCnSK4DBT0=;
 b=SQ+ZooNI0MiDgSvr4pyYimb0Tg1LYJDD9Gj4cfftTUPEQ1HtWSTpxd1jSbweVd7Dy3
 AWHRCxbKOyeBHZOVeM3DsHW4c90m1J5b5It5mVcSC2eO4h/CJ8B0Z4C7devIyxBn6F1r
 wCxL/MuAJ8SFeBmFwh17GmehJDRM283FxJFytSn7Qx8JhqWdoYSDQKcJOc7wnWCeUChC
 ++6MqYuMMN67q3bz4X0E5+xXgYQ5NKxd9r89bZgDaBy+AXEN5K3VhNdahYan81mXcT0B
 e9iHNMOavl4mXeIulNyVY2It1BgVqOtAKpHys21yEBharPRfq8aq5AnCpFITM1tK/+Ew
 74cw==
X-Gm-Message-State: AOAM533cra2eF3zkUNgcmItNi+5MuOK/JJgavo7L4+yq8TFJH8JNUK/N
 j0OPKcv/eTL08K6+xr25lQcsE0WUJ3uGVkc9yghYDw==
X-Google-Smtp-Source: ABdhPJwuv3/9oLHPCAAThwJbncDoDe0+vEaaHx0SqrZ12nS/jDEjdx91TQe9PImrenr/WKrUFEJBbbgzZucV8QwN8uw=
X-Received: by 2002:a17:907:94cf:: with SMTP id
 dn15mr5256195ejc.114.1601505170533; 
 Wed, 30 Sep 2020 15:32:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200930210824.GA12277@embeddedor>
 <CAG48ez3X3aZwfde3_2Sc+gdtUGRHfzan6oNFiffAvNzFDSsFDw@mail.gmail.com>
 <20200930213634.GA12855@embeddedor>
In-Reply-To: <20200930213634.GA12855@embeddedor>
From: Jann Horn <jannh@google.com>
Date: Thu, 1 Oct 2020 00:32:24 +0200
Message-ID: <CAG48ez3XqE0m2UmRh+OtmYJRhyCBYY=sdJKaWBXtJZKCRpLMYQ@mail.gmail.com>
Subject: Re: [PATCH][next] mtd: rawnand: Replace one-element array with
 flexible-array member
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200930_183252_869120_FDEF74C0 
X-CRM114-Status: GOOD (  18.77  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Lucas Stach <dev@lynxeye.de>, Vignesh Raghavendra <vigneshr@ti.com>,
 Richard Weinberger <richard@nod.at>,
 kernel list <linux-kernel@vger.kernel.org>, Stefan Agner <stefan@agner.ch>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-mtd@lists.infradead.org,
 linux-hardening@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gV2VkLCBTZXAgMzAsIDIwMjAgYXQgMTE6MzAgUE0gR3VzdGF2byBBLiBSLiBTaWx2YQo8Z3Vz
dGF2b2Fyc0BrZXJuZWwub3JnPiB3cm90ZToKPiBPbiBXZWQsIFNlcCAzMCwgMjAyMCBhdCAxMTox
MDo0M1BNICswMjAwLCBKYW5uIEhvcm4gd3JvdGU6Cj4gPiBPbiBXZWQsIFNlcCAzMCwgMjAyMCBh
dCAxMTowMiBQTSBHdXN0YXZvIEEuIFIuIFNpbHZhCj4gPiA8Z3VzdGF2b2Fyc0BrZXJuZWwub3Jn
PiB3cm90ZToKPiA+ID4gVGhlcmUgaXMgYSByZWd1bGFyIG5lZWQgaW4gdGhlIGtlcm5lbCB0byBw
cm92aWRlIGEgd2F5IHRvIGRlY2xhcmUgaGF2aW5nCj4gPiA+IGEgZHluYW1pY2FsbHkgc2l6ZWQg
c2V0IG9mIHRyYWlsaW5nIGVsZW1lbnRzIGluIGEgc3RydWN0dXJlLiBLZXJuZWwgY29kZQo+ID4g
PiBzaG91bGQgYWx3YXlzIHVzZSDigJxmbGV4aWJsZSBhcnJheSBtZW1iZXJz4oCdWzFdIGZvciB0
aGVzZSBjYXNlcy4gVGhlIG9sZGVyCj4gPiA+IHN0eWxlIG9mIG9uZS1lbGVtZW50IG9yIHplcm8t
bGVuZ3RoIGFycmF5cyBzaG91bGQgbm8gbG9uZ2VyIGJlIHVzZWRbMl0uCj4gPgo+ID4gQnV0IHRo
aXMgaXMgbm90IHN1Y2ggYSBjYXNlLCByaWdodD8gSXNuJ3QgdGhpcyBhIHRydWUgZml4ZWQtc2l6
ZQo+ID4gYXJyYXk/IEl0IHNvdW5kcyBsaWtlIHlvdSdyZSBqdXN0IGNoYW5naW5nIGl0IGJlY2F1
c2UgaXQKPiA+IHBhdHRlcm4tbWF0Y2hlZCBvbiAiYXJyYXkgb2YgbGVuZ3RoIDEgYXQgdGhlIGVu
ZCBvZiBhIHN0cnVjdCIuCj4KPiBZZWFoOyBJIHNob3VsZCBoYXZlIGNoYW5nZWQgdGhhdCAnZHlu
YW1pY2FsbHknIHBhcnQgb2YgdGhlIHRleHQgYWJvdmUKPiBhIGJpdC4gSG93ZXZlciwgYXMgSSBj
b21tZW50ZWQgaW4gdGhlIHRleHQgYmVsb3csIGluIHRoZSBjYXNlIHRoYXQgbW9yZQo+IENTIElE
cyBhcmUgbmVlZGVkIChsZXQncyB3YWl0IGZvciB0aGUgbWFpbnRhaW5lcnMgdG8gY29tbWVudCBv
biB0aGlzLi4uKQo+IGluIHRoZSBmdXR1cmUsIHRoaXMgY2hhbmdlIG1ha2VzIHRoZSBjb2RlIG1v
cmUgbWFpbnRhaW5hYmxlLCBhcyBmb3IKPiB0aGUgYWxsb2NhdGlvbiBwYXJ0LCB0aGUgZGV2ZWxv
cGVyIHdvdWxkIG9ubHkgaGF2ZSB0byB1cGRhdGUgdGhlIENTX04KPiBtYWNybyB0byB0aGUgbnVt
YmVyIG9mIENTIElEcyB0aGF0IGFyZSBuZWVkZWQuCgpCdXQgaW4gdGhhdCBjYXNlLCBzaG91bGRu
J3QgeW91IGNoYW5nZSBpdCB0byAiaW50IGNzW0NTX05dIiBhbmQgZ2V0CnJpZCBvZiB0aGUgc3Ry
dWN0X3NpemUoKSBzdHVmZj8KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
