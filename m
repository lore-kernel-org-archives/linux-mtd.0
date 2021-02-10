Return-Path: <SRS0=JPnc=HM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0266C433DB
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Feb 2021 10:17:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A3FD64E28
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Feb 2021 10:17:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3A3FD64E28
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=szeredi.hu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Jgt9xronfTbg6m390r6VIGJu2mbaapbXBkC8tQH3BI4=; b=pNY5tie7mXRhf6pg6CSULs+6O
	G5pNpLMrzRWKVuvBERBDFMrSLi91q2x16gbVTcnW4Uv8GD+BmSYXx61RFEoK5WCggk65AkKGqr7Rw
	HxPI0xht+u350By3yB6AGKvds0qGcidOn3vLUHZwMBrsRine4olsG3Ef3BTCaDcKTBsMTZnoIJ/rm
	ikuVb+N+3hBgjJX4JrMuA+lstQKIY26lSEPPvZCjL808dr1zTFIRF5UONm1WZ4MmRG8DGovqmePFB
	cg8FbbsiKy8sSq0JPEAuVf8kaBEOXVJSV9dff5RqR/GPrTHmpyA9dou9CrpaiJ7prOFuS2/M59r4h
	Ptmn7tHQA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9mYP-0003m3-1k; Wed, 10 Feb 2021 10:17:01 +0000
Received: from mail-vs1-xe30.google.com ([2607:f8b0:4864:20::e30])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9mYM-0003lG-SU
 for linux-mtd@lists.infradead.org; Wed, 10 Feb 2021 10:16:59 +0000
Received: by mail-vs1-xe30.google.com with SMTP id o186so814360vso.1
 for <linux-mtd@lists.infradead.org>; Wed, 10 Feb 2021 02:16:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=szeredi.hu; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=msA+gdwMsQfk3la/W82WyEHallZtYkbf2eSn/foTDTI=;
 b=akng1dCjJvDQ5GGmSb+6B927DpKcLId5PdzJFHYgIDGFIR9XwgZV+3UBewkVw4NDvb
 xTYDxIKMV3iWgHg5EC3LfhF5nz8v/KB96fSNGbVrisg29CJV/y1tg74eJEyRhxlllxAw
 0Hzi9JBIX8o77zUJBqP92z8VvWgm3orvUCG90=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=msA+gdwMsQfk3la/W82WyEHallZtYkbf2eSn/foTDTI=;
 b=SpHucqdmvVkE2Q1UKPB8PT40nkyReraW4KlKE4uZu0htgbAY7z6cYn4RM7OILoAvsB
 NbqbEBNQgyhGf4G7sVl4kTC9UnjWvebM3PSpa6aJY9Cqx7hAuDOxGvR3qTwMLyk6the4
 BFeYmbgKqwJ0Am4AYdVX1sAkMIn+jQCbQ4V4uxmqqfn0lEn5fGwLKxGA+h5nhCaJ+mpc
 ZOyWjhYdtEhLl3WGhozLdyQh+3DuE/WYsE/ScpgBg9wopEXkNJ5DgOhiMfjjk4SzqBu3
 5wiSZ5nzLrU2bTLRobbm1OPpaMF9w6HmgIuhhyHn5y3DQsbgSnrLKxpKCqPuYuMxJL/z
 E4qw==
X-Gm-Message-State: AOAM530oFUD+wjUW+vabNKsE4Q5Bmiyfme0hNtVBookpLEFEmj1HWw+s
 2SHWgOBezmvCc41Jr1Eof3jauTJhY+r4RpeJcXCVpg==
X-Google-Smtp-Source: ABdhPJxuaIy3etB4q1Qu6NqLANiiMmEiudWH7ucSR0b9uKc7spXfA1hdE3wwn4oSgiRVjcjg3a1OTQ/bCeVkZ5XEHiY=
X-Received: by 2002:a67:c992:: with SMTP id y18mr1103336vsk.7.1612952216822;
 Wed, 10 Feb 2021 02:16:56 -0800 (PST)
MIME-Version: 1.0
References: <20210124232007.21639-1-richard@nod.at>
 <CAJfpegvN2KdMj_7T-OF1PAs8xZiU3f4233AvigaXwwRAsgQEjw@mail.gmail.com>
 <1507208626.379155.1612906761549.JavaMail.zimbra@nod.at>
In-Reply-To: <1507208626.379155.1612906761549.JavaMail.zimbra@nod.at>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Wed, 10 Feb 2021 11:16:45 +0100
Message-ID: <CAJfpegugbvppOKhJ8KjSVGgZOGVuj6NSiy4n18mbD7Ui3wme6g@mail.gmail.com>
Subject: Re: [PATCH 0/8] MUSE: Userspace backed MTD v3
To: Richard Weinberger <richard@nod.at>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210210_051658_930416_36F83B39 
X-CRM114-Status: GOOD (  13.55  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 fuse-devel <fuse-devel@lists.sourceforge.net>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 linux-mtd <linux-mtd@lists.infradead.org>, Ron Minnich <rminnich@google.com>,
 sven <sven@narfation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBGZWIgOSwgMjAyMSBhdCAxMDozOSBQTSBSaWNoYXJkIFdlaW5iZXJnZXIgPHJpY2hh
cmRAbm9kLmF0PiB3cm90ZToKPgo+IE1pa2xvcywKPgo+IC0tLS0tIFVyc3Byw7xuZ2xpY2hlIE1h
aWwgLS0tLS0KPiA+IElmIHlvdSBsb29rIGF0IGZ1c2VfZG9faW9jdGwoKSBpdCBkb2VzIHZhcmlh
YmxlIGxlbmd0aCBpbnB1dCBhbmQKPiA+IG91dHB1dCBhdCB0aGUgc2FtZSB0aW1lLiAgSSBndWVz
cyB5b3UgbmVlZCBzb21ldGhpbmcgc2ltaWxhciB0byB0aGF0Lgo+Cj4gSSdtIG5vdCBzdXJlIHdo
ZXRoZXIgSSB1bmRlcnN0YW5kIGNvcnJlY3RseS4KPgo+IEluIE1VU0Ugb25lIHVzZSBjYXNlIHdv
dWxkIGJlIGF0dGFjaGluZyB0d28gZGlzdGluY3QgKHZhcmlhYmxlIGxlbmd0aCkgYnVmZmVycyB0
byBhCj4gc2luZ2xlIEZVU0UgcmVxdWVzdCwgaW4gYm90aCBkaXJlY3Rpb25zLgo+IElmIEkgcmVh
ZCBmdXNlX2RvX2lvY3RsKCkgY29ycmVjdGx5LCBpdCBhdHRhY2hlcyBhbHdheXMgYSBzaW5nbGUg
YnVmZmVyIHBlciByZXF1ZXN0Cj4gYnV0IGRvZXMgbXVsdGlwbGUgcmVxdWVzdHMuCgpSaWdodC4K
Cj4gSW4gTVVTRSB3ZSBjb2xkIGdvIHRoZSBzYW1lIHBhdGggYW5kIGlzc3VlIHVwIHRvIHR3byBy
ZXF1ZXN0cy4KPiBPbmUgZm9yIGluLWJhbmQgYW5kIG9wdGlvbmFsbHkgYSBzZWNvbmQgb25lIGZv
ciB0aGUgb3V0LW9mLWJhbmQgZGF0YS4KPiBIbW1tPwoKRG9lcyBpbi1iYW5kIGFuZCBPT0IgZGF0
YSBuZWVkIHRvIGJlIGhhbmRsZWQgdG9nZXRoZXI/ICBJZiBzbywgdGhlbgp0d28gcmVxdWVzdHMg
aXMgbm90IGEgZ29vZCBvcHRpb24uCgpUaGFua3MsCk1pa2xvcwoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9u
IG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW10ZC8K
