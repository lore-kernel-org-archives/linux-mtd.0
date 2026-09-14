Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44DB0C88E75
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Sep 2026 22:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vs1K9Fa9jzErUvY9ia3Krq3cTW5FAfm4VRW44I99Erk=; b=j5lDaS0OUo0rbo
	6zY4IZ9ptvVrs3yJ1TzKONrBT0h+rgC7Qy7D/Fys1iURJwAapqb6x+4WxpuEV2tpNGJlJlqW5TgtN
	sOhdXyn1hrBUpNkfSlNGX1SG4CunsZyrnyBYe77A0QUWWvNc+Lp7keqgbmI+4+e5RVVq7oSum928/
	yhKuz/Yh34LWrCCaaCqtKYfTXY8+5ujpINv3je9zUH6mQPCB/kniV42/fofWeJQ8lnS70s+NMKvWw
	wcjj+YSGAk4qvpiLvgZVHr+UmH6LQhzC3bqfElaT3h+u0kcoFYGKBozXHnuvp0fpftPhNopry3y8a
	w4hAiXIrV2Nd7angHMrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6FUD-00000004ocC-2DWc;
	Mon, 14 Sep 2026 22:49:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6FUB-00000004obx-4AUy
	for linux-mtd@bombadil.infradead.org;
	Mon, 14 Sep 2026 22:49:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Gb8DWQjrs9f+P3wLgZ+RgMWcDCFnHm5XHmUmq+Bd4U8=; b=I9tMKJZKgmke8d9/ozDSZ9He4p
	A0RnCLAmcz/togMHNuuqEc1yzY1QeHjmuvf5E3TpqyZBqlPDC/sXociPRic790IATsBmvlFOTVHRa
	cj/KjAPTyrFYH/lWfjsYoGy8sdbqjLS8kqi15TIox06IhYXvK6Su6BPAb2/LMaTzd1l/d9AwtbT6a
	uNaUGArlSGJOpGgaCZryIp3XglqNkL2k2Tcq4NrbjrTGMpuCABMPt9ToUuJjzDo/0LpQU+FzTrCAf
	nNRKIOYI20kcEAzT3fyhmvwyoUsxjR4zzz7NxaUnP4Smd/LXZmQnV8FPLdz6vjc0pjIai3j4i3d/U
	IEqJUZHA==;
Received: from mail-vk1-xa2b.google.com ([2607:f8b0:4864:20::a2b])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6FU8-0000000657E-1Bll
	for linux-mtd@lists.infradead.org;
	Mon, 14 Sep 2026 22:49:14 +0000
Received: by mail-vk1-xa2b.google.com with SMTP id 71dfb90a1353d-5c663437fe5so2234514e0c.3
        for <linux-mtd@lists.infradead.org>; Mon, 14 Sep 2026 15:49:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789426150; cv=none;
        d=google.com; s=arc-20260327;
        b=m+jcMENxuoWwXpIHuH++oVECfO7o8bQAu2wfYu5tz8wthZzCpr33OUllp7LwoBoty0
         IhRpYPnaGE9jC+ETF9O89PIsZ3XitqzKaiQI6+Z6mCg2TyKtUfcE3TgupoAU5CpDYqD8
         4Q1LftEv/k+dSlo4W3Xu1jhxQtKG6BTSs7xtV1RC9TYdQ+Jawa457dfjl3/NaxLiYHMq
         PJQyydyJlFx61Y6lHeMf5TucqC2Gl6QP+ZCjoNmL2487UaaNJh6VoraYjfMIuEavSyvT
         Yp8zQl+mCCWM73P7bWPTJxV6Z3uOtXBcHIV00706TdTVLE4AfDMjy6zkyxFPsMHse37G
         Xriw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Gb8DWQjrs9f+P3wLgZ+RgMWcDCFnHm5XHmUmq+Bd4U8=;
        fh=NwaTf4MwxLbo5qyYRT29ttxtpOEZMOho/evalF8U6YY=;
        b=VeyqT8nZylPkwriuQNfpdUf96AOSJwf4YV/IK+LAHbDNt622FgroJhV5E1X84MN4vV
         mHP5Xj01owQbpNdYjxlfxQWeT9aHX8Jksu3p0FyS76otejE0feJsQmCOnmMgOKAOj8S8
         IQoEXhcuCSln73KAlWc/p0/d5isYbNlrMCLtWhEMM9huXAvHGlgCnIghqbobamf6f2C6
         Oxw1JUDAkGwFSQMSMejnqoEFey0/hV4eZbw9vW8aW6/hA3AQOKxDmzGW1yMp8bdGFWNr
         jC8AKeOH8ZR7oYmQrNq66NTy4NscJAAyywa13GropUkV1mdugXkLM5/o1u6RWLN+PnaN
         7SGg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789426150; x=1790030950; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Gb8DWQjrs9f+P3wLgZ+RgMWcDCFnHm5XHmUmq+Bd4U8=;
        b=aYQbpbbO01LqYzCUorJH0/G/59xObTewJcuCpjU8CvVbMShAXv+A772KTmdZmUJIHx
         afo9W1V0PEMnkffgt8DteMSkpP+//jTru3gcTa6vlTajyXRUsjsqPwP+fOIqtTxUF//u
         +1HzQ+xkEYiMA++XKibwdLzlNBYrOdTsxJvEXNhl8oKkMgsTkjNkSM8LblUrDzwqnge0
         gvfRurEi0VQZI8NYvP709Vq9NZb+kaaK01SR5pUqFAhBQdc442MmwC/4FquO7nT7P+t5
         nQydw/A9uHtX46HoBcPq/DQM0J7Q9m7u47H/ehx5A1q7jD9bk/rQv90v3jSsSw/GkcI0
         Ue0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789426150; x=1790030950;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gb8DWQjrs9f+P3wLgZ+RgMWcDCFnHm5XHmUmq+Bd4U8=;
        b=vseg0TVFC5kNz7BurU9OFqc5fZSSZjHhP8grg/PNJTn0xjfWCxETrPnDqnHfkspskU
         lP7th6tgJepQBeJs/RLJSREB3wMpLUZyOYIZVlpKySWhXAKkwi60fJB4ZHwuTzXv4ZYs
         COAF+UJTfc5KbOMBF3ebqgsjId8DEBOaQQOGxn88CC3NymmpbkkgSw70xaq26RlrsSGY
         X8c+3kLHITfQLOEhWoXoU7NI7WjxHm9n3dXIwbi57XMpf+GDBAYedUDO/X4yaea2exC2
         S+olS6I+yEB73uHUHpqwDsA8AQjXp94TVhvu9ZxGHpKkztVOGRyn6HOOpKU28irpz5nU
         IvbQ==
X-Forwarded-Encrypted: i=1; AKwUvBymmpNWOX2e7A7Ghd5vnLKPDjjGds+IMQ2y1QbX0dl6dlLpBDl7qfPlIdXt1kiwflAveKRnJcbw6fM=@lists.infradead.org
X-Gm-Message-State: AFuF++kIpc9tkt27Ro/J7vE6sVMRLVJAUvkJ60rd0AYPfGY/BCNMTi0d
	fori+Wd5jNAOsWtmB0cP7PwCBTke6WGWweXqhHeEaMkMaqFLaRsoB+QnWhCEfZy7sWcfrETY0iN
	58CcrzJ9gYBDyWsf5mQE8E1BEX5C+edo=
X-Gm-Gg: AYBFou1CGW/w5Qn5dY62cb30H8X9pTysJGET514u9i4W22tg5peLi1zliwq5Y2LZE3u
	letvEbyUF0iTcDf0PqGYTUCOPOpfiAiDTrRdhaTVMf/Z2LmqrF7fPhOUM0ztwsfmoVuKqMFpZNN
	xRVi96IlSV2Ur1m0CFIwdw/91PgYvz+hV1OWlN88buRy+cHGIfuP8krO5m7DKNpTM+FNpPbdRvS
	I4n8H/Bi2Y3HS8dN0Z7S1uR/c3x3HsT0DGnVr4mKm1P+bEG2NCwaGA6nsK9HhIfYPs1PMgZpHTM
	GTy01pvttTDKsR996+t9kNC/+jSBTLsUZ64eHAYRqZOlLrNl8o1ADvXcodegrT7YmfNUOZ7dTGo
	N2G4HjEEPobQMwi6o40DZYsQZRt4TFO4TW9aMKzrIqWsnBYQ4Xi6QflhzGIAbHrOR+NNIPPKA5O
	612FtIcKvOSLie8O4LRloHvxmQFI/KDO1RuXsYiPn1qXoDjTOa
X-Received: by 2002:a05:6102:4492:b0:77a:d089:3dd8 with SMTP id
 ada2fe7eead31-79b60973580mr409096137.12.1789426149941; Mon, 14 Sep 2026
 15:49:09 -0700 (PDT)
MIME-Version: 1.0
References: <20260904-submit-sunxi-nand-vendor-oob-layout-v1-v2-0-b12074f4aca7@gmail.com>
 <20260904-submit-sunxi-nand-vendor-oob-layout-v1-v2-2-b12074f4aca7@gmail.com> <87ik4fu4fh.fsf@bootlin.com>
In-Reply-To: <87ik4fu4fh.fsf@bootlin.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 14 Sep 2026 16:48:58 -0600
X-Gm-Features: AcwNN1UlC9FxjgijfoClAvZzNG8RBzvUoNkXu_nF9VDV4LFTu4fZlyRKfp3tTWs
Message-ID: <CADvTj4pH8KvTmsxOXO8JQYCQmKf2OA__eqvYXrM+1=vjq0368Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] mtd: rawnand: sunxi: support randomized OOB formats
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Maxime Ripard <mripard@kernel.org>, linux-mtd@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_234912_854450_4B139E27 
X-CRM114-Status: GOOD (  27.26  )
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

T24gVHVlLCBTZXAgOCwgMjAyNiBhdCA5OjUx4oCvQU0gTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJh
eW5hbEBib290bGluLmNvbT4gd3JvdGU6Cj4KPiBIaSBKYW1lcywKPgo+IE9uIDA0LzA5LzIwMjYg
YXQgMTU6MjI6MTIgLTA2LCBKYW1lcyBIaWxsaWFyZCA8amFtZXMuaGlsbGlhcmQxQGdtYWlsLmNv
bT4gd3JvdGU6Cj4KPiA+IFRoZSBjb250cm9sbGVyIHJhbmRvbWl6ZXIgY292ZXJzIHRoZSBiYWQg
YmxvY2sgbWFya2VyIGFsb25nIHdpdGggdGhlCj4gPiByZXN0IG9mIHRoZSBPT0IgZGF0YS4gVGhl
IGRyaXZlciBjdXJyZW50bHkgY29tcGVuc2F0ZXMgdGhlIG1hcmtlciBieXRlcwo+ID4gYmVmb3Jl
IHdyaXRlcyBhbmQgYWZ0ZXIgcmVhZHMgc28gdGhhdCB0aGV5IHJlbWFpbiBwbGFpbiBvbiBmbGFz
aC4KPiA+Cj4gPiBBbGx3aW5uZXIgTkFORCBmaXJtd2FyZSBpbnN0ZWFkIHN0b3JlcyB0aGUgbWFy
a2VyIHRocm91Z2ggdGhlCj4gPiByYW5kb21pemVyLiBNZWRpYSB1c2luZyB0aGF0IGZvcm1hdCBh
cHBlYXJzIHRvIGNvbnRhaW4gYmFkIGJsb2NrcyB1bmxlc3MKPiA+IHRoZSByYW5kb21pemVyIGlz
IGVuYWJsZWQgd2hpbGUgcmVhZGluZyB0aGUgbWFya2VyLgo+ID4KPiA+IEhvbm9yIHRoZSBhbGx3
aW5uZXIscmFuZG9taXplZC1vb2IgcHJvcGVydHkgYnkgbWFya2luZyB0aGUgTkFORCBhcwo+ID4g
cmVxdWlyaW5nIHNjcmFtYmxpbmcgZHVyaW5nIG5vcm1hbCBoYXJkd2FyZS1FQ0MgdHJhbnNmZXJz
IGFuZCBsZWF2aW5nCj4gPiB0aGUgbWFya2VyIGluIHRoZSByYW5kb21pemVyIGRhdGEgc3RyZWFt
LiBLZWVwIHRoZSBleGlzdGluZyBwbGFpbiBtYXJrZXIKPiA+IGJlaGF2aW9yIHdoZW4gdGhlIHBy
b3BlcnR5IGlzIGFic2VudC4gUmVqZWN0IHRoZSBwcm9wZXJ0eSB3aXRoIHNvZnR3YXJlCj4gPiBv
ciBkaXNhYmxlZCBFQ0MgYmVjYXVzZSB0aG9zZSBwYXRocyBkbyBub3Qgb3BlcmF0ZSB0aGUgY29u
dHJvbGxlcgo+ID4gcmFuZG9taXplci4KPiA+Cj4gPiBNVERfT1BTX1JBVyBiZWhhdmlvciByZW1h
aW5zIHVuY2hhbmdlZDogcmF3IGFjY2Vzc2VzIGJ5cGFzcyBib3RoIEVDQyBhbmQKPiA+IHJhbmRv
bWl6YXRpb24gYW5kIGV4cG9zZSB0aGUgcGh5c2ljYWwgcmVwcmVzZW50YXRpb24uIFRoZSByYXct
TkFORAo+ID4gY29yZSdzIGJhZC1ibG9jayBhbmQgZmxhc2gtQkJUIHBhdGhzIHVzZSBkZWNvZGVk
IGFjY2Vzc2VzIGFuZCB0aGVyZWZvcmUKPiA+IGNvbnRpbnVlIHRocm91Z2ggdGhlIGhhcmR3YXJl
LUVDQy9yYW5kb21pemVyIHBhdGguCj4gPgo+ID4gVGhpcyBjaGFuZ2VzIG1hcmtlciBoYW5kbGlu
ZyBvbiBhbGwgc3VwcG9ydGVkIGNvbnRyb2xsZXJzOyB0aGUgSDYvSDYxNgo+ID4gcHJvdGVjdGVk
IHVzZXItZGF0YSBwbGFjZW1lbnQgaXMgaGFuZGxlZCBzZXBhcmF0ZWx5Lgo+ID4KPiA+IFNpZ25l
ZC1vZmYtYnk6IEphbWVzIEhpbGxpYXJkIDxqYW1lcy5oaWxsaWFyZDFAZ21haWwuY29tPgo+Cj4g
SSBiZWxpZXZlIGl0IGlzIHN0aWxsIG5vdCBjb21wbGV0ZWx5IHdvcmtpbmcuIElmIHlvdSBsb29r
IGF0IHRoZSBlcnJvcgo+IHBhdGggaW4gdGhlIHJlYWQgZnVuY3Rpb25zLCBpbiBjYXNlIHdlIGZh
Y2UgYSBmYWN0b3J5IGJhZCBibG9jaywgdGhlcmUKPiB3aWxsIGJlIG5vIGRhdGEsIHdlIHdpbGwg
ZmFjZSB0aGUgInBhZ2UgaXMgbWF5YmUgZW1wdHkiIGNhc2Ugd2hlcmUgd2UKPiBzdGlsbCBhZGRy
ZXNzIGNvbHVtbnMgbGlrZSBiZWZvcmUuIFNpbmNlIGRhdGEgaXMgcmFuZG9taXplZCB3aXRoIHRo
ZXNlCj4gYWNjZXNzZXMsIEkgYmVsaWV2ZSB3ZSB3b3VsZCByZXR1cm4gZXJyb3JzIHdoaWNoIHdp
bGwgbm90IGJlIGludGVycHJldGVkCj4gY29ycmVjdGx5IGJ5IHRoZSBjb3JlLiBUaGUgZGlzY292
ZXJ5IG9mIHRoZSBmYWN0b3J5IGJhZCBibG9jayBtYXJrZXJzIGlzCj4gdGh1cyBicm9rZW4gZHVy
aW5nIEJCVCBzY2FuLiBCdXQgYSBCQlQgcmVhZCBpcyBhbHNvIGJyb2tlbiwgYmVjYXVzZSBldmVu
Cj4gaWYgZXJyb3JzIGFyZSBpZ25vcmVkLCB3ZSBwZXJmb3JtIHBhdHRlcm4gbWF0Y2hpbmcgb24g
ZGF0YSB3aGljaCBpcywgaWYKPiBteSB1bmRlcnN0YW5kaW5nIG9mIHlvdXIgaW1wbGVtZW50YXRp
b24gaXMgY29ycmVjdCwgbm90IGRlLXJhbmRvbWl6ZWQgaW4KPiB0aGlzIGNhc2UuCgpUaGUgZXJh
c2VkLXBhZ2UgZmFsbGJhY2sgY291bGQgb3ZlcndyaXRlIHRoZSBkZWNvZGVkIGJ1ZmZlcnMgd2l0
aApwaHlzaWNhbCByYW5kb21pemVkIGJ5dGVzIGJlZm9yZSB0aGUgY29yZSBpbnNwZWN0ZWQgdGhl
IGJhZC1ibG9jawptYXJrZXIgb3IgQkJUIHNpZ25hdHVyZS4KCkluIHY2IFsxXSwgYm90aCBQSU8g
YW5kIERNQSBwcmVzZXJ2ZSB0aGUgbWFpbiBkYXRhIGFuZCBwcm90ZWN0ZWQgT09CCmZyb20gdGhl
IG9yaWdpbmFsIGhhcmR3YXJlIHJlYWQgaW4gcmFuZG9taXplZC1PT0IgbW9kZSwgaW5jbHVkaW5n
IG9uCnVuY29ycmVjdGFibGUgRUNDIGVycm9ycy4KCkVyYXNlZC1wYWdlIGNsYXNzaWZpY2F0aW9u
IHVzZXMgdGhlIGNvbnRyb2xsZXItc3BlY2lmaWMgdmVuZG9yCnNwYXJlLWJ5dGUgaGV1cmlzdGlj
IHdpdGhvdXQgYSByYXcgcmVyZWFkLiBBY2NlcHRlZCBlcmFzZWQgcGFnZXMKcmV0dXJuIGFsbC0w
eGZmIGRhdGEgYW5kIE9PQjsgYWxsLXplcm8gcGh5c2ljYWwgcGFnZXMgaW5zdGVhZCByZXRhaW4K
YSBiYWQgbWFya2VyIGFuZCBhbiBFQ0MgZmFpbHVyZS4gT3RoZXIgdW5jb3JyZWN0YWJsZSByZWFk
cyByZXRhaW4KdGhlIGRlY29kZWQgYnVmZmVycyBhbmQgcmVwb3J0IGZhaWx1cmVzIHRocm91Z2gg
dGhlIEVDQyBzdGF0aXN0aWNzLApzbyB0aGUgY29yZSBjYW4gaW5zcGVjdCB0aGUgbWFya2VyIGFu
ZCBCQlQgcGF0dGVybi4KCkkgdmVyaWZpZWQgdGhpcyBvbiBINjE2IHVzaW5nIHRoZSBhY3R1YWwg
TkFORC1jb3JlIEJCTSBhbmQgQkJUIHBhdGhzCnRocm91Z2ggUElPLCBETUEgYW5kIGZvcmNlZCBz
cGxpdC1ETUEgcmVhZHMuIFNpZ25hdHVyZSBzZWFyY2hlcwpyZXRhaW5lZCB0aGUgZGVjb2RlZCBw
YXR0ZXJuIGRlc3BpdGUgRUNDIGVycm9ycywgd2hpbGUgdGFibGUgbG9hZGluZwpyZWplY3RlZCBh
biB1bmNvcnJlY3RhYmxlIHByaW1hcnkgYW5kIHN1Y2Nlc3NmdWxseSBsb2FkZWQgaXRzIGNsZWFu
Cm1pcnJvci4gQ29ycmVjdGFibGUgcHJvdGVjdGVkLU9PQiBjYXNlcyBhbmQgQkJUIGNyZWF0aW9u
L3VwZGF0ZSBhbHNvCnBhc3NlZC4gSGFyZHdhcmUgdmFsaWRhdGlvbiBpcyBsaW1pdGVkIHRvIEg2
MTYuCgpNVERfT1BTX1JBVyByZW1haW5zIHBoeXNpY2FsLCBhbmQgdGhlIGV4aXN0aW5nIHBsYWlu
LW1hcmtlcgplcmFzZWQtcGFnZSBjaGVjayBpcyB1bmNoYW5nZWQgYXBhcnQgZnJvbSB0aGUgcHJl
cmVxdWlzaXRlCmVycm9yLWhhbmRsaW5nIGZpeGVzLgoKVGhlIHNlcmllcyBncmV3IGJlY2F1c2Ug
dGhpcyB3b3JrIGV4cG9zZWQgZXhpc3RpbmcgYnVncyBpbiB0aGUgc2hhcmVkClBJTy9ETUEgcGF0
aHM6IGVycm9yIHByb3BhZ2F0aW9uIGFuZCBjbGVhbnVwLCBJUlEvY29tcGxldGlvbiBvcmRlcmlu
ZywKT09CIGluZGV4aW5nIGFuZCBwcm9ncmFtLWNvbW1hbmQgaGFuZGxpbmcuIFRob3NlIGZpeGVz
IGFsc28gYXBwbHkKd2l0aG91dCB0aGUgbmV3IHByb3BlcnR5LCBzbyB0aGV5IGFyZSBzcGxpdCBm
cm9tIHRoZSBmb3JtYXQgc3VwcG9ydC4KVGhlIGZpbmFsIHBhdGNoZXMgYXJlIHNlcGFyYXRlIG9w
dGltaXphdGlvbnMuCgpbMV0gaHR0cHM6Ly9wYXRjaC5tc2dpZC5saW5rLzIwMjYwOTE0LXN1Ym1p
dC1zdW54aS1uYW5kLXZlbmRvci1vb2ItbGF5b3V0LXYxLXY2LTAtMmZiMDg0ZmUwNzUxQGdtYWls
LmNvbQoKPgo+IFRoYW5rcywKPiBNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBs
aXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRk
Lwo=
