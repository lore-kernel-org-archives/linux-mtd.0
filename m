Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE9C6C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Feb 2022 12:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nt2PBVaOQJQcd6YQRYDNXLOOUNggtvXRalsGK2etj2M=; b=J51kujjjWVqm2I
	cnW1ob6xnO/OFSqhKWIBr1Kw2KRMXzQ7VOKHvmvVUs+i2QCgs0UEVQMj6tOuQ3Y3RHYBi5/ivuxVa
	/zn0fS5+b5b9bZo+KAvU9Sc6caU1JHezXXCQdaxWj7L6pzkMT9wOnI6Pyy30FwggbYhoQUnFajyeN
	1r9o9Zzq5R3kcPHFUfG3/f9OgXDSzTPTjU5OJgWtcKjhYNbicQUk12ZfN6ldWLD1VV8QnJlmlimdl
	vrbZKkaPYWIFyk1TQ7a0D4loiY2kTEUuulqo+SsQfXnADfGsu2njHr00dtLUi5nm1ajckTDzVJsox
	uG8AtSmAJw3uJHSolVCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJa8Q-00F24r-3X; Mon, 14 Feb 2022 12:07:14 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJZJz-00EkF3-KC
 for linux-mtd@lists.infradead.org; Mon, 14 Feb 2022 11:15:09 +0000
Received: by mail-lj1-x234.google.com with SMTP id w6so1610641ljj.3
 for <linux-mtd@lists.infradead.org>; Mon, 14 Feb 2022 03:15:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kempniu.pl; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=/gvyvLv0L7lIbtDKzPDBQ3PnEIpy4XvEbEZzW6NXC+g=;
 b=AZV1BkAsEdGRrs9twRIwoaLNpw3pBbcqFotnGiE8hRUgcJbPChrSAN0nKtNUEg4p6G
 F9ac4XIr3moL5HhS1MHGpcDLz3pflsjdb/wxp+26J72Y/YYqjX1oGhT6Ixl7mftAQ+SE
 LWQbc3TITf0zfw6SA64Qru8GAYieTOTg02PoI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=/gvyvLv0L7lIbtDKzPDBQ3PnEIpy4XvEbEZzW6NXC+g=;
 b=m5TVroa+6HuBhMYb2qKk43jHq6GJG5b2xoWuqo/WXTcSmn0W3XfH1OXmU19POzhQnb
 lerZV/6xCAnAcsu9mCfaThB7rDdBc3epvdAMyeG6TRerIjjS9Ttlt8J0UCDnPfnf/q7T
 hHupmvJ3OzDAIH4jegJSjuq1v7tOhvqxPddOMgIb485i5VQfIPnOIKvnybhqXOPyJEP+
 1v0CmxPjyjGUXgFfGzll7ZC5k4w6Ygs5Qsq+YMoxDugFzv8WJocnrra9Jc8jJDdHqX8x
 uv2AYQrvDnKbhxCLFVsq/4QVyuLmpLkkTDUnRwrg4knpfwqz2QZRFGv59TBOo1N36YyQ
 tDww==
X-Gm-Message-State: AOAM531BE+yOwEtJ+iNivEXkchYZ/pVOE0OKbjUyJToMlUuIzVSDBOOP
 /NwhlcCZZzz5cKnTrKuDvk79wg==
X-Google-Smtp-Source: ABdhPJxRoBE3cIUrCU9X1zU2YRXoewWnjgMuJxW4V+IlP2JD8glHc5xw6ubK/RupzjCRv9d8nhumbQ==
X-Received: by 2002:a2e:9619:: with SMTP id v25mr6303279ljh.92.1644837305128; 
 Mon, 14 Feb 2022 03:15:05 -0800 (PST)
Received: from larwa.hq.kempniu.pl ([2001:470:64df:111::e02])
 by smtp.gmail.com with ESMTPSA id o14sm517491lfr.176.2022.02.14.03.15.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Feb 2022 03:15:04 -0800 (PST)
Date: Mon, 14 Feb 2022 12:15:02 +0100
From: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
To: Richard Weinberger <richard@nod.at>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 4/4] mtdchar: add MEMREAD ioctl
Message-ID: <Ygo5tta48poc0IOB@larwa.hq.kempniu.pl>
References: <20220125104822.8420-1-kernel@kempniu.pl>
 <20220125104822.8420-5-kernel@kempniu.pl>
 <1173246756.12597.1643879936765.JavaMail.zimbra@nod.at>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1173246756.12597.1643879936765.JavaMail.zimbra@nod.at>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_031507_802931_987754EC 
X-CRM114-Status: GOOD (  12.47  )
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

UmljaGFyZCwKClRoYW5rIHlvdSBmb3IgdGFraW5nIGEgbG9vayBhdCB0aGlzIHBhdGNoIHNlcmll
cy4KCj4gPiArCWlmIChyZXEuc3RhcnQgKyByZXEubGVuID4gbXRkLT5zaXplKSB7Cj4gCj4gSSB0
aGluayB0aGlzIGNhbiBvdmVyZmxvdyBzaW5jZSBib3RoIHJlcS5zdGFydCBhbmQgcmVxLmxlbiBh
cmUgdTY0Lgo+IFNvIGFuIGV2aWwtZG9lciBtaWdodCBieXBhc3MgdGhpcyBjaGVjay4KCllvdSBh
cmUgcmlnaHQsIHRoYW5rcy4gIEkgYWRvcHRlZCB0aGlzIGNoZWNrIGZyb20gbXRkX2NoZWNrX29v
Yl9vcHMoKQphbmQgeW91ciBjb21tZW50IG1hZGUgbWUgdGhpbmsgdGhhdCBtYXliZSB0aGUgTUVN
UkVBRE9PQjY0L01FTVdSSVRFT09CNjQKaW9jdGxzIGFyZSBhZmZlY3RlZCBhcyB3ZWxsLCBidXQg
aXQgbG9va3MgbGlrZSAnbGVuJyBpcyBhIDMyLWJpdCBpbnRlZ2VyCmluIHRob3NlIG90aGVyIGNh
c2VzLCBzbyB0aGV5IGxvb2sgc2FmZSB0byBtZS4KCkhvd2V2ZXIsIHRoZSBNRU1XUklURSBpb2N0
bCBkb2VzIHNlZW0gdG8gYmUgYWZmZWN0ZWQgYnkgdGhlIHNhbWUgaXNzdWUKc2luY2UgY29tbWl0
IGY2NTYyYmNhODRkMjI1MjVmNzkyMzA1ZTMxMDY1NzFmODcxNGQwNTcgKCJtdGRjaGFyOiBwcmV2
ZW50CnVuYm91bmRlZCBhbGxvY2F0aW9uIGluIE1FTVdSSVRFIGlvY3RsIiksIHNlZSBtdGRjaGFy
X3dyaXRlX2lvY3RsKCkuCgpDaGFuZ2luZyB0aGUgJ2xlbicgYW5kICdvb2JsZW4nIGZpZWxkcyBv
ZiBzdHJ1Y3QgbXRkX3tyZWFkLHdyaXRlfV9yZXEgdG8KdTMyIHdvdWxkIGJyZWFrIHVzZXJzcGFj
ZSwgc28gdGhhdCBpcyBub3QgYW4gb3B0aW9uLiAgV291bGQgdHJ1bmNhdGluZwpyZXEubGVuIHRv
IDMyIGJpdHMgKHJlcS5sZW4gJj0gMHhmZmZmZmZmZikgZWFybHkgaW4gdGhlIHR3byByZWxldmFu
dApmdW5jdGlvbnMgYmUgdGhlIHdheSB0byBnbz8gIEkgZ3Vlc3Mgc3VjaCBhIGNoYW5nZSBzaG91
bGQgYmUgcmVmbGVjdGVkCmluIGluY2x1ZGUvdWFwaS9tdGQvbXRkLWFiaS5oLCB0b28uCgotLSAK
QmVzdCByZWdhcmRzLApNaWNoYcWCIEvEmXBpZcWECgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGlu
ZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bXRkLwo=
