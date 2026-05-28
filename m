Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6183CCD5BD1
	for <linux-mtd@archiver.kernel.org>; Thu, 28 May 2026 09:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LUuryBSORq+bCBpWqCsNGlpJ7kVE6mzUHyUqMFNgp0s=; b=AaeJiYDpYEMrAP
	jUCWk4tzOKi/LM2kwkJXF3jdEPv/Y7iTIK2/KMQBeclRE6/4c0LiLlygeTHH8SZKidLXS8CkBMJaP
	fG4ljD8KJyeNKkVLdjp/y5TSo22/KH1JtgHGtFs4Y/3gWOZtzhnv/VUWtpi9jwz22GTUfmXHoiDAo
	606tNHSiDJRXy1SoSPYWMPVxNd2afoncBqKUpzS/TEFPiZ5zKQZr0CoeeURl2hi4EyDS5sDCMTcUC
	dCmOuWbfVtp0LwZM9xBzYPoXudfQ4tMPRGlyyu6RSlSGUlMCvdLCDZl+P5GHEl/tn9VcLufiRt3/C
	RSqyRKhmF/g2Laac1lLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSWdj-00000005Sag-3d1N;
	Thu, 28 May 2026 09:02:55 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSWdc-00000005SZD-1nD8
	for linux-mtd@lists.infradead.org;
	Thu, 28 May 2026 09:02:53 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2b941cd869cso81789965ad.1
        for <linux-mtd@lists.infradead.org>; Thu, 28 May 2026 02:02:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779958968; cv=none;
        d=google.com; s=arc-20240605;
        b=hARKXamSKHiQAc5Ib/k/PdGfhUYEvPG68ppFNwig06M2hm5KlRY615T1ldYrcVKoe/
         W+me0sZdxav+O0gBavbzFx2NE7F3O+G/Wqv5CsTLpD+/SAepMwAyIgMs9eNf6WLO4NHc
         8LsVLZireq1NfsxYuMLpBCTZ13fv+Gi4wsxcwRNayN+oZz9Vy/mxuSf9bSRx2K2GCcZe
         O01xHvB9ol3xXB+Nkb3OeYga98rJrsIYSghXaVLouRdfv3F5y25BTDfhaXJVH10iypIx
         uLVDsJdNHRBG9etjVH1OrAwmdIo+/Du+qCnJvAAiijsCDLqrnQERNJDKtZLBCv6jOanR
         BcUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NwE8Qmw432slAwNHbsExJfORiQiKOhw3a1mPjo8ESyU=;
        fh=dMzVstHZcxAx0X6LHKcm8oz9G04UTIDhuhQZe3DEpEA=;
        b=VhKVqQoZk4zt65UHRsPi+0s3rS+D0+BVD8hbepRliIoFfc8xDO1W9ztnco4lF+BCcV
         Ro5aDF46L8x3ebjpyYN4yDTOdGbUaJNPBvpa0py/8ukrWHg6OwZQ87NEBEC+sKcbFsLH
         L/6I5HEYvLkvT/58IHa8XAC87fCBrNWK5FjDc2KfzNUDMGLLR7uVU714a1yOvsmzmjXt
         8lAaxLF/4NFW16qtpinnbwHY5WAXDIox2l7vBNSkiJy+k9xNdt+XFqXA9FEzWo8zDoth
         qWZInslXagh3ReejxODOv1iioG9au6ayik1UYslBsGjVg6WBiheThHEMakkieNqs21VE
         26xQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779958967; x=1780563767; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NwE8Qmw432slAwNHbsExJfORiQiKOhw3a1mPjo8ESyU=;
        b=CZbD6TDst8/0bHGff4Dv+ppw9WSaLmRKVXpDDdYITw3zLNSOUXH+qAlQtPI2ixhsvH
         CxSqVXO+YfKqb6QyferzUGuD3+9nDHyXtqecMSxLRlkqcJd+pQFMND+FhXaZcA5NoOCR
         f/bivbtRsRpXrr7KgVxPAqcCnapjdmNIu1hZpKO9WWrtPADtZXcM9gvMbrafwOn1Y+6w
         IUcYCzEtmiDjYjoQ2rddspoQZYphScYiD6xH3zc/9N3TzAA+XVn1LsUX6O6wBb4Um4P5
         TeIPQJEcsxkGi6PRp7r8rKIE5lveIail98tP1jvkHpHM57r6OoVF/ulGa0CWIMn9k+Na
         ZcaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779958967; x=1780563767;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NwE8Qmw432slAwNHbsExJfORiQiKOhw3a1mPjo8ESyU=;
        b=iE7FQnipoA7duJuaswj8iC5e5gbI8iNdRCiAraYV3DLjORXVr3E7hS/WTn2ci2/8pr
         niBynjntqq/3wJj1zTsfKkzWNlP7kHEylzmqIk95of5ts6dyRnSD6ot8zWR8/KVr2EoQ
         OPw9fLmw0BPL5Q9BM+Ng4p/ThA1kKxGxsqo5ruXRZX5/Pl3ncEuXv/FZfqee3FAABzEl
         XkalJ50gCSIXUZUTAvY/xMJCTz4+cqFNIv3MELImngWSct4+394hVSZIxemynf4CYYti
         X680J0XpAzv1Mpd50Lk0jQqptPpHKqoOB4oH86kFJpCTHQZue1WKC3I+niNCGG42Gy/I
         ECfg==
X-Forwarded-Encrypted: i=1; AFNElJ/C4h2YDVfKWlLXcxbFdGe28r1BeFPPR5FfDM9vbETJHqCx8ydijCAFbe3QSQdmClcsk4TsTH8EWEc=@lists.infradead.org
X-Gm-Message-State: AOJu0YzFC4Rl5dDLK3dB+wb9f/F59rgcen1rxUbsnUs9nHVhla6rUNUZ
	lXEmezJru7p69wgbH9cTnkhpWaiSRqo2ZQqFLOp6IjxIGzUfWe3mkjXuE4DJD1fXMG6MToJMiXL
	QfB++tqtqCODdwjHHGC1+Nu+0mBk2/Z0=
X-Gm-Gg: Acq92OF4WW7Ww4QvKBhFFqt1yQYh8vE1PVpzSHgCa2sTJy6Fr3diNIhR6HialiSojfP
	h9teDvJY01VLi36INe1Pyo/hgiW1g+pF2sCL+P6gerwnUeSBtDNRhPmUaZBECg7tDbruVgCxX92
	L+DHf96C6bT4N5kRrKfFgiiSZ7ChdiSSH+G07gidjZ5qOYsYpce4d0BzolrY5tN9wNWTaTDYb6U
	2/rwHlxLUW/3fAvHlHpqwBBd3kUcWOtmZQuyoho9C6iC1X7PhT/uVH/RID5n37u1VpKd2QuxY6q
	/X8fxVkrprtvhk71eUapOmBX3uJ8
X-Received: by 2002:a17:903:3850:b0:2ba:3e2f:6874 with SMTP id
 d9443c01a7336-2beb06994aemr301775225ad.26.1779958967362; Thu, 28 May 2026
 02:02:47 -0700 (PDT)
MIME-Version: 1.0
References: <20260528051751.1648246-1-linchengming884@gmail.com>
 <DIU3OK3ELUD5.CUL6R3KNX0O9@kernel.org> <CAAyq3SY86mVwYtQMqhcZHjTxiD93awQZPDzHr8e5-+B9caNgbA@mail.gmail.com>
 <87eciwhtf8.fsf@bootlin.com> <DIU5AHNXBPN2.27JOC8D5COWAM@kernel.org>
In-Reply-To: <DIU5AHNXBPN2.27JOC8D5COWAM@kernel.org>
From: Cheng Ming Lin <linchengming884@gmail.com>
Date: Thu, 28 May 2026 17:00:42 +0800
X-Gm-Features: AVHnY4JVDaqEu8bYJzcqCgUzrzv2io1V8qeH-ar2JzFlmQRZgY6hvd5lU3KQ2is
Message-ID: <CAAyq3SY0Yf+J0xyy3Gs47q9n8gPWG0w+T-Vj0+C4Z3T6WyyG_A@mail.gmail.com>
Subject: Re: [PATCH] mtd: spi-nor: Add support for MX25L12833F and MX25L12845G
To: Michael Walle <mwalle@kernel.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Pratyush Yadav <pratyush@kernel.org>, 
	Takahiro Kuwano <takahiro.kuwano@infineon.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org, alvinzhou@mxic.com.tw, 
	Cheng Ming Lin <chengminglin@mxic.com.tw>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_020248_469263_771F8795 
X-CRM114-Status: GOOD (  33.54  )
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

SGkgTWljaGFlbCwKCk1pY2hhZWwgV2FsbGUgPG13YWxsZUBrZXJuZWwub3JnPiDmlrwgMjAyNuW5
tDXmnIgyOOaXpemAseWbmyDkuIvljYgzOjUy5a+r6YGT77yaCj4KPiBIaSwKPgo+IE9uIFRodSBN
YXkgMjgsIDIwMjYgYXQgOTo0MiBBTSBDRVNULCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+ID4gSGkg
Q2hlbmcgTWluZywKPiA+Cj4gPj4+IEl0IGxvb2tzIGxpa2UgeW91J3JlIGdldHRpbmcgYml0dGVu
IGJ5IHRoZSBJRCByZXVzZS4gWW91IGNhbid0IGp1c3QKPiA+Pj4gdW5jb25kaXRpb25hbGx5IGFk
ZCB0aGUgcXVhZCBQUCBiZWNhdXNlIGFzIGZhciBhcyBJIGNhbiBzZWUgdGhlCj4gPj4+IE1YMjVM
MTI4MDVEIFsxXSBpcyBqdXN0IGEgc3RhbmRhcmQgc2luZ2xlIGJpdCBpL28gZmxhc2ggYW5kIGRv
ZXNuJ3QKPiA+Pj4gc3VwcG9ydCB0aGUgNFBQLgo+ID4+Cj4gPj4gWW91IGFyZSBhYnNvbHV0ZWx5
IHJpZ2h0LiBUaGFua3MgZm9yIGNhdGNoaW5nIHRoaXMuCj4gPj4KPiA+PiBUaGUgTVgyNUwxMjgw
NUQgaXMgaW5kZWVkIGEgbXVjaCBvbGRlciBwcm9kdWN0IChyZWxlYXNlZCBhcm91bmQgMjAwOSku
Cj4gPj4gU2luY2UgdGhlIGluaXRpYWwgSkVTRDIxNiBTRkRQIHN0YW5kYXJkIHdhc24ndCBwdWJs
aXNoZWQgdW50aWwgMjAxMSwKPiA+PiBJIGRvdWJsZS1jaGVja2VkIHdpdGggb3VyIGludGVybmFs
IFBNIGFuZCBjb25maXJtZWQgdGhhdCB0aGUgTVgyNUwxMjgwNUQKPiA+PiBkb2VzIG5vdCBzdXBw
b3J0IFNGRFAgYXQgYWxsLgo+ID4+Cj4gPj4gU2luY2UgdGhlIG5ld2VyIGZsYXNoZXMgKE1YMjVM
MTI4MzNGIGFuZCBNWDI1TDEyODQ1RykgZG8gc3VwcG9ydCBTRkRQLAo+ID4+IHdlIGNvdWxkIHVz
ZSB0aGlzIGFzIGEgZGlmZmVyZW50aWF0b3IgdG8gZGlzdGluZ3Vpc2ggdGhlbSBmcm9tIHRoZSBs
ZWdhY3kKPiA+PiBNWDI1TDEyODA1RC4KPiA+Pgo+ID4+IFdoYXQgaWYgd2UgdHJ5IHRvIHJlYWQg
dGhlIFNGRFAgc2lnbmF0dXJlIChSRFNGRFApIGluIHRoZSBmaXh1cCBob29rPwo+ID4+IElmIGEg
dmFsaWQgU0ZEUCBzaWduYXR1cmUgaXMgZGV0ZWN0ZWQsIHdlIGNhbiBzYWZlbHkgaWRlbnRpZnkg
aXQgYXMgdGhlCj4gPj4gbmV3ZXIgZmxhc2ggYW5kIGFwcGx5IHRoZSBTTk9SX0hXQ0FQU19QUF8x
XzRfNCBjYXBhYmlsaXR5LiBJZiB0aGVyZSBpcwo+ID4+IG5vIFNGRFAgc2lnbmF0dXJlLCB3ZSBs
ZWF2ZSBpdCBhcyBpcyBmb3IgdGhlIGxlZ2FjeSBNWDI1TDEyODA1RC4KPiA+Pgo+ID4+IERvIHlv
dSB0aGluayB0aGlzIGFwcHJvYWNoIGlzIGZlYXNpYmxlIGFuZCBhY2NlcHRhYmxlPyBJZiBzbywg
SSB3aWxsCj4gPj4gaW1wbGVtZW50IHRoaXMgbG9naWMgYW5kIHN1Ym1pdCBhIHYyIHBhdGNoLgo+
ID4KPiA+IFRoZSAtPnBvc3Rfc2ZkcCgpIGZpeHVwIGhvb2sgaXMgZG9jdW1lbnRlZCBhcyAibm90
IGNhbGxlZCBmb3IgU1BJIE5PUnMKPiA+IHRoYXQgZG8gbm90IHN1cHBvcnQgU0ZEUCIuIEFsdGVy
bmF0aXZlbHksIEkgYmVsaWV2ZSBhbiBlYXJsaWVyIGhvb2ssCj4gPiBsaWtlIC0+cG9zdF9iZnB0
KCkgY291bGQgYWxzbyB3b3JrIHNpbmNlIGl0IGRvZXMgbm90IHNlZW0gdG8gcnVuIG9uCj4gPiBu
b24gU0ZEUCBjb21wYXRpYmxlIGZsYXNoZXMuCj4KPiBNb3Jlb3ZlcjoKPgo+ICAqICAgIHNwaV9u
b3JfcG9zdF9zZmRwX2ZpeHVwcygpIGlzIGNhbGxlZCBhZnRlciB0aGUgU0ZEUCB0YWJsZXMgYXJl
IHBhcnNlZC4KPiAgKiAgICBJdCBpcyB1c2VkIHRvIHR3ZWFrIHZhcmlvdXMgZmxhc2ggcGFyYW1l
dGVycyB3aGVuIGluZm9ybWF0aW9uIHByb3ZpZGVkCj4gICogICAgYnkgdGhlIFNGRFAgdGFibGVz
IGFyZSB3cm9uZy4KPgo+IEFuZCBpdCBsb29rcyBsaWtlIHRoYXQgaXMgdGhlIGNhc2UgZm9yIHRo
ZXNlIGZsYXNoZXMuIEFsc28sIHBsZWFzZQo+IHByb3ZpZGUgYSBjb21tZW50IG9uIHRoZSBmaXh1
cCBkZXNjcmliaW5nIHRoYXQgdGhlIGZsYXNoIG1pc3NlcyB0aGF0Cj4gcHJvcGVydHkuIEJhc2lj
YWxseSwgd2hhdCB5b3UndmUgd3JpdHRlbiBpbiB0aGUgY29tbWl0IG1lc3NhZ2UuCgpHb3QgaXQu
IEkgd2lsbCBhZGQgdGhlIGRldGFpbGVkIGNvbW1lbnRzIGluIHRoZSBmaXh1cCBhcyB5b3Ugc3Vn
Z2VzdGVkCmFuZCBwcmVwYXJlIHRoZSB2MiBwYXRjaCBhY2NvcmRpbmdseS4KCkJlc2lkZXMgdGhh
dCwgSSBkaXNjb3ZlcmVkIGFub3RoZXIgaXNzdWUgd2hpbGUgcmV2aWV3aW5nIHRoZSBjb2RlLiBT
aW5jZQp0aGUgbGVnYWN5IE1YMjVMMTI4MDVEIGRvZXMgbm90IHN1cHBvcnQgU0ZEUCwgaXQgc3Ry
aWN0bHkgcmVxdWlyZXMgdGhlCnNpemUgYW5kIG5vX3NmZHBfZmxhZ3MgdG8gYmUgZGVmaW5lZCBp
biB0aGUgZmxhc2hfaW5mbyBzdHJ1Y3QuIFdpdGhvdXQKdGhlc2Ugc3RhdGljIHBhcmFtZXRlcnMs
IHRoZSBwcm9iZSB3aWxsIGZhaWwgZm9yIHRoZSBsZWdhY3kgcGFydC4KCkxvb2tpbmcgYmFjayBh
dCB0aGUgcHJldmlvdXMgZWZmb3J0IHdoZW4gd2Ugc3VibWl0dGVkIHBhdGNoZXMgdG8gZHJvcApm
bGFzaF9pbmZvIGZpZWxkcyAoc2hpZnRpbmcgdG8gcmVseSBvbiBTRkRQKSwgdGhlIE1YMjVMMTI4
MDVEIHdhcwphbHJlYWR5IEVPTCBhbmQgd2UgaGFkIG5vIHBoeXNpY2FsIHN0b2NrIGF2YWlsYWJs
ZS4gQXQgdGhhdCB0aW1lLCB3ZQp1c2VkIHRoZSBNWDI1TDEyODMzRiBmb3IgdmVyaWZpY2F0aW9u
LCB3aGljaCBpbmFkdmVydGVudGx5IGxlZCB0bwptaXN0YWtlbmx5IGRyb3BwaW5nIHRoZSBmYWxs
YmFjayBwYXJhbWV0ZXJzIG5lZWRlZCBieSB0aGUgYWN0dWFsCk1YMjVMMTI4MDVELgoKVG8gcmVz
b2x2ZSB0aGlzLCBJIHdpbGwgcmVzdG9yZSB0aGUgc2l6ZSBhbmQgbm9fc2ZkcF9mbGFncyBiYWNr
IHRvIHRoaXMKSkVERUMgSUQgZW50cnkuIFNpbmNlIHRoaXMgaXMgYSBmaXggZm9yIHRoZSBsZWdh
Y3kgcGFydCwgSSB3aWxsIGxpa2VseQpzcGxpdCBpdCBpbnRvIGEgc2VwYXJhdGUgcGF0Y2ggaW4g
dGhlIHYyIHNlcmllcyBhbmQgYWRkIGEKQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcgdGFnIHNv
IGl0IGNhbiBiZSBwcm9wZXJseSBiYWNrcG9ydGVkLgoKPgo+IC1taWNoYWVsCgpUaGFua3MsCkNo
ZW5nIE1pbmcgTGluCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
