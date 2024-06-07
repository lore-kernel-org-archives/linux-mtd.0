Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8E71C27C5E
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Jun 2024 02:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RDOy9WiOGmXEDTMhE1UGfgF8U88T0OvPhWoDTYEIfLo=; b=EsEyA4jlHOoKkj
	LEd452UOo4yizEfPMJHNsMFHzXbqwFZ4v2+eag0ZVXhhp9LVbop4D7aJyWCaG6v+gDhWCsEvrj7ff
	i7Q/qPsBti9wr6fVwkp7sDolyFNNZzGvwaq+m8msv+zZpSj1r61adV+VlhEwvHoJdrfOmbhVJ4+M1
	4G3RWzn8yMqkgc9yGwLxiVo6tveKidptlD7rGBcrSjPoIXf6ZSaN13SJfltGNEAQQFNVRlsONRAgV
	Uil0mweNhbllPYlnuWDvrwW2PDsNIKdiB76YGD/zndJeTmQ+DAW+Cc0omwNa4FYQSygTljbDTzITy
	GEBtBVFkUOW5tk+w+ZIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFPTK-0000000C5jO-2JFR;
	Fri, 07 Jun 2024 02:36:54 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFPTH-0000000C5iy-38Xu
	for linux-mtd@lists.infradead.org;
	Fri, 07 Jun 2024 02:36:53 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-57a5bcfb2d3so932607a12.3
        for <linux-mtd@lists.infradead.org>; Thu, 06 Jun 2024 19:36:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717727809; x=1718332609; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q/Sdxbh2EbAbfKXus3Wfg+HU1FfoVKPNyddUoHaCXs0=;
        b=ByhVJMR8jCZQolAhFD55qjK2+f/F9qvRyHvKKQq1lyaYS1tVq/Ge7ocQHjxqunba21
         jzmWJRlUAnAQgwQaSXwX4A2jyOvz+38PT65heXrxrY1fJ4qgShkjJlBElyx7qb0Ld/GQ
         7OyI3QySvsYQnNxvPnEqswLGOIaBx5nNMPSDuOgwZmi94WcLxiUKl24+rWHVf5YEGC9g
         rgkFDDYhrkLD8LJUVBLuKQqqrCldvoLBOzKr87k+XAOZ5XFwDFdmL57Yn9Mz9TsDEUek
         7CktYBtNG/ukb/O1l7MFc6AJ18jyeNBJtHB9Cijw1JcYA5Q1wh5OJyJpICStokcX2rAK
         uEHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717727809; x=1718332609;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q/Sdxbh2EbAbfKXus3Wfg+HU1FfoVKPNyddUoHaCXs0=;
        b=JFMbJnVfuiTRJevV8w7QwdiQpfp5aSxI8W6TRYNYnXnc1wMw2tCd9M2yV11JmExy12
         Kt8O+03EP5/6WHPutE7KHh6KGweRorqHYzm0NOUe8W07+8M+TSMXS03DHirP1gbCukKn
         A8Xuk6lQNpIIkXMrEE7lmLF/rni37GusPy1m+OjJEEjKjGFhfaXpsrCjX97U3Bo4Qv3n
         64nA1bxToBa6cemwAKLJYX1TkCPyJSRZEnJGvLAUdxWelQrfzJTvoc3yAzyxcHv3At37
         xIkU9bGvr2AZoVhw8sr5RJYhpLIdFpAWKRSi4K1xLbyFasY+HUphglLxNnAzFfB9UUIV
         UiHw==
X-Forwarded-Encrypted: i=1; AJvYcCV3ahMR051srLSiNzOVyBvLKdTMViwBv88+AYXAvda3LPgj+yQz0bA6hzQyFkdcz3L1WJod2p2qOIldtdp5eVREZqbptM+urSM1mPYqfA==
X-Gm-Message-State: AOJu0YwbPXtk4DK9E48vrcPiX0NXVHaA1FLTsP1RwBMC+5gQhSGc4s2j
	NGsPhnqKrTFOU92VLP+1n7W8bbhZD8BWChLt6UPIYdZrDYXFymMaLYxNziraE3taDFzxg3SfHvd
	tI+Da3yGaKC1ksJzHauWyT4iewb0=
X-Google-Smtp-Source: AGHT+IEkaBIuZQ9alfE9AlkTZhoXjlCWg2HZuj9EDuOhb7mtEENe4/9uzIuakQQRBYJlMSB2WtfY0F0+Ye6C5grbjlM=
X-Received: by 2002:a50:d547:0:b0:56e:3293:3777 with SMTP id
 4fb4d7f45d1cf-57c50901260mr781888a12.17.1717727808981; Thu, 06 Jun 2024
 19:36:48 -0700 (PDT)
MIME-Version: 1.0
References: <20240430-loongson1-nand-v7-0-60787c314fa4@gmail.com>
 <20240430-loongson1-nand-v7-1-60787c314fa4@gmail.com> <20240506091444.59228fa9@xps-13>
 <CAJhJPsV1aCvji1G2F94A=pJa8+x6Aw7ndkQUBPtFeeKSxJK9Nw@mail.gmail.com>
 <20240518124732.584f441d@xps-13> <CAJhJPsW9gVe2F1qvxvOkQUX_K1BsK5q_1XjT0u2+QH2gRMNqXA@mail.gmail.com>
 <20240606233344.4e268c04@xps-13>
In-Reply-To: <20240606233344.4e268c04@xps-13>
From: Keguang Zhang <keguang.zhang@gmail.com>
Date: Fri, 7 Jun 2024 10:36:12 +0800
Message-ID: <CAJhJPsU3foQ_Nr3WhH6nqJZxrK+WpjgJZAcGjGHzRp4K6pfTNw@mail.gmail.com>
Subject: Re: [PATCH v7 1/3] dt-bindings: mtd: Add Loongson-1 NAND Controller
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Keguang Zhang via B4 Relay <devnull+keguang.zhang.gmail.com@kernel.org>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mips@vger.kernel.org, devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240606_193651_816218_207C35AB 
X-CRM114-Status: GOOD (  22.40  )
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

T24gRnJpLCBKdW4gNywgMjAyNCBhdCA1OjMz4oCvQU0gTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJh
eW5hbEBib290bGluLmNvbT4gd3JvdGU6Cj4KPiBIaSwKPgo+ID4gPiA+ID4gPiArcHJvcGVydGll
czoKPiA+ID4gPiA+ID4gKyAgY29tcGF0aWJsZToKPiA+ID4gPiA+ID4gKyAgICBvbmVPZjoKPiA+
ID4gPiA+ID4gKyAgICAgIC0gY29uc3Q6IGxvb25nc29uLGxzMWItbmZjCj4gPiA+ID4gPgo+ID4g
PiA+ID4gV2hhdCBpcyB0aGUgcmF0aW9uYWxlIGJlaGluZCB0aGlzIGNob2ljZT8gU2VlbXMgbGlr
ZSB0aGUgYiB2YXJpYW50IGhhcwo+ID4gPiA+ID4gdHdvIHBvc3NpYmxlIGltcGxlbWVudGF0aW9u
cyBhbmQgc2hvdWxkIGFsd2F5cyBiZSBwcmVjZWRlZCBieSBhIG1vcmUKPiA+ID4gPiA+IHNwZWNp
ZmljIGNvbXBhdGlibGUuCj4gPiA+ID4gPgo+ID4gPiA+ID4gQXMgdGhlcmUgaXMgY3VycmVudGx5
IG5vIGRlc2NyaXB0aW9uIG9mIHRoaXMgY29udHJvbGxlciB1cHN0cmVhbSwgSQo+ID4gPiA+ID4g
d291bGQgbm90IGNhcmUgdG9vIG11Y2ggYWJvdXQgYW55IG91dC1vZi10cmVlIGRlc2NyaXB0aW9u
IGFuZCBkaXJlY3RseQo+ID4gPiA+ID4gZ28gZm9yIGEgY2xlYW4gZGVzY3JpcHRpb24uCj4gPiA+
ID4gPgo+ID4gPiA+IEV4Y3VzZSBtZSwgc2hvdWxkIEkgYWRkIGEgZGVzY3JpcHRpb24gZm9yIHRo
aXMgcHJvcGVydHk/Cj4gPiA+Cj4gPiA+IE5vLCBkZXNjcmlwdGlvbiBpcyBub3QgbmVlZGVkLiBC
dXQgeW91IGFyZSBhbGxvd2luZyB0aGUKPiA+ID4gImxvb25nc29uLGxzMWItbmZjIiBjb21wYXRp
YmxlIGFsb25lLCB3aGljaCBJIHRoaW5rIGlzIG5vdCByZWxldmFudCwKPiA+ID4gdW5sZXNzIHlv
dSBjb252aW5jZSBtZSBpdCBpcyA6LSkKPiA+ID4KPiA+ICJsb29uZ3NvbixsczFiLW5mYyIgaXRz
ZWxmIGlzIGEgc3BlY2lmaWMgaW1wbGVtZW50YXRpb24uCj4gPiBJIHdhcyBzdWdnZXN0ZWQgdG8g
c2V0IHVwIGEgZmFsbGJhY2sgYmVmb3JlLgo+ID4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxs
LzIwMjMxMDA3LXVudGFwcGVkLW1hc3Nlcy0wMWY4MGI3YzEzYzdAc3B1ZC8KPiA+IFRoZW4gImxv
b25nc29uLGxzMWItbmZjIiBiZWNhbWUgdGhlIGZhbGxiYWNrLgo+Cj4gWW91IGNhbm5vdCBhbGxv
dyAndGhlIGZhbGxiYWNrJywgYWxvbmUuIEJ1dCB0aGlzIGlzIHdoYXQgeW91IGRvIGFib3ZlLgo+
IEJlbG93IGRlc2NyaXB0aW9uIGlzIGZpbmUuIEp1c3QgZG9uJ3QgYWxsb3cgdGhlIGxzMWItbmZj
IGNvbXBhdGlibGUKPiBhbG9uZS4KPgpTb3JyeS4gSSBzdGlsbCBkb24ndCBnZXQgdGhpcy4KQWNj
b3JkaW5nIHRvIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDIyMTIxMjE2MzUzMi4xNDI1
MzMtMi1rcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmcvLAp0aGUgZ2VuZXJpYyBmYWxsYmFj
ayBzaG91bGQgbm90IGJlIHVzZWQgYWxvbmUuCkluIGNvbnRyYXN0LCB0aGUgc3BlY2lmaWMgZmFs
bGJhY2sgaGFzIHRvIGJlIHVzZWQgYWxvbmUsIGFzIEkgdW5kZXJzdGFuZCBpdC4KSWYgbm90LCBj
b3VsZCB5b3UgcGxlYXNlIHNob3cgbWUgdGhlIHJpZ2h0IHdheT8KVGhhbmtzIHZlcnkgbXVjaCEK
Cj4gVGhhbmtzLAo+IE1pcXXDqGwKCgoKLS0gCkJlc3QgcmVnYXJkcywKCktlZ3VhbmcgWmhhbmcK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
