Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7979ACA1016
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Sep 2025 08:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h0T5fF83FEsbPoTPxYANnWOx3Fvgs/AQIzxNHCgHoEI=; b=Prsz4pznXNpBls
	5xUJs7XJRkJBPGBtES03KOwOnms4hq9O4dW6cghcu54x02Py/obrNZLOdprxcH1HJ10E8LhNmshSu
	6p4UsM2DO4+v5RiswZoGF7xl5T0DmUa7730m6HPzsn5DsepAy73pf77Lg9jGY7JrKmuspuYu6SgXs
	KxVGcLQWncM55+hZY4zmU/i2F1a/5JOXUxC9dkGce+YknJ5wBnIFbs4o5CB/v1cGp4TzBXFnsgiVC
	cAyRZezrpkXOm9LF8d/ZxPdUV3hyoDPrMgEuzHvXoZWCP4pa4RdZfs/4Cu8BDxE+oyUN1Vacaj8h7
	+wxNqJmLHkSOkd5bLegA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwcM0-00000001jIg-07ty;
	Thu, 11 Sep 2025 08:08:28 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwcLx-00000001jHC-1S24
	for linux-mtd@lists.infradead.org;
	Thu, 11 Sep 2025 08:08:26 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-32da35469f7so365817a91.1
        for <linux-mtd@lists.infradead.org>; Thu, 11 Sep 2025 01:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757578104; x=1758182904; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yWZc8TqB1iXVf2SuiFfDpIJC0os90AJ8zoKq9v5Sveo=;
        b=eaTYSIMwBh4J74cCBCfRITwmHJWHztDHoy8HDOJ2iE7/xWYC+FNFr082NxKrYaZdMi
         fvKjO9XrHkxRsfFJiUUkj/X8em3WpaMupaNJarA8Kt9L+XwVXjUamsi356IKl47ruPr2
         IPfO7k1iUhbqaI+6VukW5jJ72NztrlbIauSJoVbN/9XDAY2BiDzEX1IUIBeuXK65XL95
         uFE6t76s1RM5MjkMSrQvx51CqrBf3yRRNETN6iXNfAmOWwO/Nb4I8e3tMPHO/LDS4bVy
         q0krwlTsITF3rF0cXZXjBn6X3V43KY7+Rtei1w1X0x/aWip6JZ1CBS8XtF3/b1pI10ue
         EObw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757578104; x=1758182904;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yWZc8TqB1iXVf2SuiFfDpIJC0os90AJ8zoKq9v5Sveo=;
        b=YZ7KzSO0JWr2IVOPAYVtuURpiHZVJ4qxug3ogmzuUUJdyshbGfjAly/jCxtc8jctSR
         twoFo/awjeCMFq4ckDOGyfU1CW9DAXomJ0wnoCN39xQg1Ti5doCgREGb67hGXq3STIde
         jHQIrggdyg7kebXMK11P9YrDVdIAjSKCFfVmSb8BgEg/WnycwT6wYDiE+3P650C0PMKa
         kCKFN9887/0QaPKQfTyWnX/oz7Gd/EonDZKb1mSaHdKLMI9HaV4qUrjA20tjxmwjBFXk
         Vyc5WMDdm6kgjpz6G9dbqzbBmQxCrFfjyyYIuYfpyBxn56n+tllUV4iI190QljV13hxU
         Pkug==
X-Forwarded-Encrypted: i=1; AJvYcCXejereBKgNRubtRDyk4GacfNGbqUwWOUuLpV6gxbrhS3ti1/SWHTQQzrzMMJoOukDIcj9IXJ/fkJs=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9WR/xofOR9vLdTl2tSXzQdlHJa6Wr/C1ORK6sThZ3YLw7hGHg
	cnrNERWarWROdcv1PpqyrnDvAw35prRpmDyeSn0iqATGNhaFQdLnUjSexk4UaJAZ3MVv+m9kcLD
	f7Fkm8LA2XyB4ucRzZ3mX2hkNIsUaaWw=
X-Gm-Gg: ASbGncv1Riecx5+Bjtc94r+345iSjrY7ztWMGvnz0LxI8ASuIt3Jb+T4ZAchU6AVe3k
	uLxdMyQNy294lnVPtxTmxAHNBjeVZJTxC2oHuVxbPuqiwZrt4YNrox08WOlUi5vMHpsGK5zKJGu
	bv6hrGBXZVMJ1eg2wIn/1xzaXKD8WCDHlgyfbWAgHIhhR4zkKAAiDr3THAzq8quR3vgyRFjkZlq
	yWMGoB7VKTLGhJEjHxIliEQLHr/3OloYCDghrhv6R0S8074JJje5IsAjc+//MIa1pt+NOJ2HbFM
	VlIlyw==
X-Google-Smtp-Source: AGHT+IG+CYWgOqOKulCdN8Yazwf+YU8Cv8POaXoSZ+NDltxvwpRzupcwLo7PooHvhIBsmf6LQty0AKdRu+LzJWLeS8E=
X-Received: by 2002:a17:90a:da90:b0:32b:8b8d:c2c6 with SMTP id
 98e67ed59e1d1-32d43f2f458mr20260397a91.14.1757578104427; Thu, 11 Sep 2025
 01:08:24 -0700 (PDT)
MIME-Version: 1.0
References: <20250910030301.1368372-1-linchengming884@gmail.com>
 <20250910030301.1368372-2-linchengming884@gmail.com> <20250910-godlike-berserk-sambar-cd25f7@kuoka>
In-Reply-To: <20250910-godlike-berserk-sambar-cd25f7@kuoka>
From: Cheng Ming Lin <linchengming884@gmail.com>
Date: Thu, 11 Sep 2025 16:05:21 +0800
X-Gm-Features: Ac12FXz4c-ZW_4rN1oqVd4xLR1hown8Pq90Ds8_JG-yDyxe8dzsU5NnL_4sRICw
Message-ID: <CAAyq3SZO3miC0S14DmgLvZ1dnVXkAVS_j61+erE8c7A-yYJWMw@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: mtd: spi-nand: Add
 enable-randomizer-otp property
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	tudor.ambarus@linaro.org, mmkurbanov@salutedevices.com, 
	Takahiro.Kuwano@infineon.com, pratyush@kernel.org, 
	linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, alvinzhou@mxic.com.tw, 
	Cheng Ming Lin <chengminglin@mxic.com.tw>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_010825_384520_0B3F3B1D 
X-CRM114-Status: GOOD (  19.27  )
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

SGkgS3J6eXN6dG9mLAoKS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6a0BrZXJuZWwub3JnPiDmlrwg
MjAyNeW5tDnmnIgxMOaXpSDpgLHkuIkg5LiL5Y2INzo0MOWvq+mBk++8mgo+Cj4gT24gV2VkLCBT
ZXAgMTAsIDIwMjUgYXQgMTE6MDI6NTlBTSArMDgwMCwgQ2hlbmcgTWluZyBMaW4gd3JvdGU6Cj4g
PiBGcm9tOiBDaGVuZyBNaW5nIExpbiA8Y2hlbmdtaW5nbGluQG14aWMuY29tLnR3Pgo+ID4KPiA+
IEFkZCBhIG5ldyBib29sZWFuIHByb3BlcnR5ICJlbmFibGUtcmFuZG9taXplci1vdHAiIHRvIGVu
YWJsZSB0aGUKPiA+IHJhbmRvbWl6ZXIgZmVhdHVyZSBvbiBzdXBwb3J0ZWQgU1BJLU5BTkQgZGV2
aWNlcy4KPgo+IFdoYXQgaXMgcmFuZG9taXplciBmZWF0dXJlPyBTdWJqZWN0LCBjb21taXQgbXNn
LCBkZXNjcmlwdGlvbiAtIG5vbmUgb2YKPiB0aGVtIGV4cGxhaW4gbWUgdGhhdC4gSXMgdGhpcyBz
b21lIHN0YW5kYXJkIGZvciBOQU5EPyBXaHkgaXMgdGhpcyBhCj4gY29tbW9uIHByb3BlcnR5PwoK
VG8gdGhlIGJlc3Qgb2Ygb3VyIGtub3dsZWRnZSwgTWFjcm9uaXggd2FzIHRoZSBmaXJzdCB2ZW5k
b3IgdG8KaW1wbGVtZW50IHRoaXMgZmVhdHVyZSBpbiBoYXJkd2FyZSB0byBlbmhhbmNlIGRhdGEg
cmVsaWFiaWxpdHkgYW5kCmVuZHVyYW5jZSwgZXNwZWNpYWxseSB1bmRlciBoaWdoIFAvRSBjeWNs
ZSBzdHJlc3MuCgpTaW5jZSB0aGlzIGlzIGEgdmVuZG9yLXNwZWNpZmljIGltcGxlbWVudGF0aW9u
IHJhdGhlciB0aGFuIGEgY29tbW9uCk5BTkQgc3RhbmRhcmQsIEkgYWdyZWUgdGhhdCB0aGlzIHBy
b3BlcnR5IHNob3VsZCBiZSBoYW5kbGVkIHdpdGhpbgp0aGUgTWFyY29uaXggZHJpdmVyIHNwZWNp
ZmljYWxseSwgbm90IGFzIGEgY29tbW9uIHByb3BlcnR5LiBJIHdpbGwKbWFrZSB0aGUgbmVjZXNz
YXJ5IGFkanVzdG1lbnRzLgoKPgo+IFNvIG1hbnkgcXVlc3Rpb25zIGFuZCB6ZXJvIGV4cGxhbmF0
aW9ucyBpbiB0aGUgY29tbWl0IG1zZy4gSW5zdGVhZCB5b3UKPiBqdXN0IHdyb3RlIHdoYXQgd2Ug
c2VlIGluIHRoZSBkaWZmIC0gdGhhdCdzIGNvbXBsZXRlbHkgcmVkdW5kYW50LgoKVGhhbmsgeW91
IGZvciB5b3VyIGZlZWRiYWNrLiBJIGFwb2xvZ2l6ZSB0aGF0IHRoZSBjb21taXQgbWVzc2FnZSB3
YXMgbm90CmNsZWFyIGFuZCBkaWQgbm90IHByb3ZpZGUgc3VmZmljaWVudCBjb250ZXh0IGZvciB0
aGlzIGZlYXR1cmUuCllvdXIgcXVlc3Rpb25zIGFyZSB2ZXJ5IHZhbGlkIGFuZCBJIHNob3VsZCBo
YXZlIGluY2x1ZGVkIHRoZXNlIGRldGFpbHMgZnJvbQp0aGUgYmVnaW5uaW5nLgoKQWNjb3JkaW5n
IHRvIEpFREVDIHN0YW5kYXJkIEpFU0QyMi1BMTE3RSwgbm8gc2luZ2xlIGRhdGEgcGF0dGVybgpy
ZXByZXNlbnRzIGEgdW5pdmVyc2FsIHdvcnN0LWNhc2UgZm9yIGFsbCBOQU5EIGZsYXNoIGZhaWx1
cmUgbWVjaGFuaXNtcy4KRGlmZmVyZW50IHBhdHRlcm5zLCBzdWNoIGFzIGZ1bGx5IHByb2dyYW1t
ZWQsIGNoZWNrZXJib2FyZCwgb3IgbW9zdGx5CmVyYXNlZCwgY2FuIGRpc3Byb3BvcnRpb25hdGVs
eSBzdHJlc3Mgc3BlY2lmaWMgY2VsbHMgKGUuZy4sIHByb2dyYW1tZWQsCmVyYXNlZCwgb3IgdGhv
c2UgaW5mbHVlbmNlZCBieSBhZGphY2VudCBzdGF0ZXMpLgoKR2l2ZW4gdGhhdCBubyBmaXhlZCBw
YXR0ZXJuIGNhbiBjb3ZlciBhbGwgc2NlbmFyaW9zLCB0aGUgdXNlIG9mIGEKcmFuZG9taXplZCBk
YXRhIHBhdHRlcm4gaXMgYSBwcmFjdGljYWwgYW5kIGVmZmVjdGl2ZSBtaXRpZ2F0aW9uIHN0cmF0
ZWd5LgpPdXIgaGFyZHdhcmUgaW1wbGVtZW50cyBhIHJhbmRvbWl6ZXIgZmVhdHVyZSB0aGF0IHNj
cmFtYmxlcyB1c2VyIGRhdGEKYmVmb3JlIGl0IGlzIHdyaXR0ZW4gdG8gdGhlIGZsYXNoIGFuZCBy
ZXN0b3JlcyB0aGUgb3JpZ2luYWwgZGF0YSB1cG9uIHJlYWQuCgpUaGlzIGVuc3VyZXMgdGhlIGRh
dGEgc3RvcmVkIG9uIHRoZSBtZWRpYSBpcyBtb3JlIGV2ZW5seSBkaXN0cmlidXRlZCwKdGh1cyBy
ZWR1Y2luZyBwYXR0ZXJuLWRlcGVuZGVudCBkZWdyYWRhdGlvbi4gVGhpcyBpcyBlc3BlY2lhbGx5
IGNydWNpYWwKZm9yIHByZXZlbnRpbmcgZXJyb3JzIGNhdXNlZCBieSB1bmJhbGFuY2VkIGRhdGEg
KGUuZy4sIGFsbCB6ZXJvcyBvcgphbGwgb25lcykgaW4gYmxvY2tzIHdpdGggaGlnaCBwcm9ncmFt
L2VyYXNlIChQL0UpIGN5Y2xlIGNvdW50cy4KVWx0aW1hdGVseSwgdGhlIHJhbmRvbWl6ZXIgaW1w
cm92ZXMgdGhlIGxvbmctdGVybSByZWxpYWJpbGl0eSBhbmQKZW5kdXJhbmNlIG9mIHRoZSBmbGFz
aCBkZXZpY2UuCgpQbGVhc2UgcmVmZXIgdG8gdGhlIGZvbGxvd2luZyBsaW5rIGZvciByYW5kb21p
emVyIGZlYXR1cmU6Ckxpbms6IGh0dHBzOi8vd3d3Lm14aWMuY29tLnR3L0xpc3RzL0FwcGxpY2F0
aW9uTm90ZS9BdHRhY2htZW50cy8yMTUxL0FOMTA1MVYxLVRoZSUyMEludHJvZHVjdGlvbiUyMG9m
JTIwUmFuZG9taXplciUyMEZlYXR1cmUlMjBvbiUyME1YMzB4RnhHMjhBRF9NWDM1eEZ4RzI0QUQu
cGRmCgo+Cj4gQmVzdCByZWdhcmRzLAo+IEtyenlzenRvZgo+CgpCZXN0IHJlZ2FyZHMsCkNoZW5n
IE1pbmcgTGluCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
