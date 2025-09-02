Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B377CA1005
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Sep 2025 07:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=e5aOwv/OoyKjZOq0qwCbUS347fI6wH1ceGXXIQY3dA4=; b=pURnLCA12ewoZsRNQCa++TJhEC
	h/GHXd2i1B/sKRQHAYPs3IRxFjtkt0Kj3egLCKisDDBjxkqe8csHGSookH+Ugwz3h5U/DC4adgEBG
	a38C48JlNeWB0thNyC5rrMXvlvZ69VgEWcxdFWlBLvOOxcFaBJKViRORHZdLR5WugR9yeY/yOQSkw
	1U1UlmKYIcrGvCqJwauvlzyr6/1h2wQE3nMbaS4XPJSSyk3zSum1+yi9pKSWIOqI2ViqGhiVtCsFJ
	WgEiMtpaOikNoCR9tUrKPv9+XH4DuoPulyYZEtK2DdY9HrlfEuNIMyE8dQxNdQ+mmDWYt+DazwnAl
	J6rqHfAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utLkl-0000000FpAZ-0B9H;
	Tue, 02 Sep 2025 07:48:31 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utLki-0000000Fp9M-2TaD
	for linux-mtd@lists.infradead.org;
	Tue, 02 Sep 2025 07:48:30 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-24b1596b1beso3285255ad.2
        for <linux-mtd@lists.infradead.org>; Tue, 02 Sep 2025 00:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756799308; x=1757404108; darn=lists.infradead.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TozCbK6Gu7kax824vW+1RZdfyYGAlXrJstUGToWApKc=;
        b=RWvf7tKhfxX1Od6QXnIWFfK25f9wdUy0PqMrne+5mBNW85/yXeVkj79CgqAlAE0XOL
         aGVUTR7ZP48exfURqhCoGxqxwWcysvyJpL0tVS8Zby2h9Gd4g3xaiXHagoV+ek1w7+Iu
         in9NlRRYxLhM8PzXmIkiLrRiRBS2SGSBXY2+nSUWT3/OH5bth3i4edo6S++uCy+f1RlR
         7TLF0hLncpOqz+gq2Hx+16D+Qwq7WUFL+xIcYX36X8TKcY/4NWlTbCDc09dBVdSbAbHR
         MuUI1bQ1TleosZFfPdNpyUs1kluXWCE6xbFsUzRug0WR/YoLV5Y+qQfEuZhcSpXhVluV
         mdxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756799308; x=1757404108;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TozCbK6Gu7kax824vW+1RZdfyYGAlXrJstUGToWApKc=;
        b=AqbZcJmJ3lcPf3dHdk2Ln62WSbRRxvG7YkB/Klk19m/JGIe67BqN7EdNMpPHM0Nlb6
         3u4uRZqXe9zhuPocJecNDc7syYqUJA+r+7Y/NNp7Pu7Je2RWjAmcCrhgzuNtyns74HHk
         +/5rZEcBmEKHNgPo29WjiuY4f4sKtT0OMlOJTfu2+vDXHlHRsCDZySqz4UxTnbBb62vf
         sf648D+x0LMCLfrNqYfVj0MQDwbLjsdRD2SP2rPZJeA1ES9vQhBO81IrXzlxYGmGQC39
         vBhhOHOwFPV8Pu/eVG7B1ztr1KbIZ+g/+Xq2FEXHlKHuO2cwdyggD5q35ldyczC1ZW+d
         5t1Q==
X-Forwarded-Encrypted: i=1; AJvYcCUNegmj4VTX2amZjFKSbqk087WFqhuVI0QliWzVt903Kv+6HvfhCU9Y1zsbgPLhMTlTvEzCMvXSNms=@lists.infradead.org
X-Gm-Message-State: AOJu0YzN2x/0LyuzKEYXNfxDgzqKSwDTDgRTNGGNBYuxeNtxDbJVoLuh
	z2NE7jXfz+sWSxv9fTG8ZaCXXFJgaWZejFKJWC0/zG8bWjyIiIB0kvqpY+GU9VBKZCSEU8xv3j2
	a8oTzOmK5V4SGgptxGXgG0gnzi/9vdqQ=
X-Gm-Gg: ASbGncsR3bTX04xhziNtkLO4SXyklSO9lWXhNTZ1MxDiIHyyb+anj1OZIUjG/JNkZrL
	oGQYwtOijqocK9B80eI3xQR/SNY9Zf9vLlHRn92a2azDv5pzlPAYIhwYc+vfXM5lceZ5+xHUFJm
	6AaXkMI9zHKTzC03H/v/M8EORVtl/ffDxThe1mTN43aLXKht03f0ymK2YmpOsu7/fVAlr+Pss8X
	qpzajHSpkWRa8BL
X-Google-Smtp-Source: AGHT+IFSTpNLnrarUYMsVhYePeIAaGEQ8xpKMejZyQKDrgCKsKJS/K2TWAHvZWBdQP2pCHAJyXPxjusAZYEddUvokg0=
X-Received: by 2002:a17:902:e749:b0:24b:15b3:223d with SMTP id
 d9443c01a7336-24b15b34ad6mr16913685ad.16.1756799307721; Tue, 02 Sep 2025
 00:48:27 -0700 (PDT)
MIME-Version: 1.0
References: <20250902-yarn-from-020874b4da63@thorsis.com> <CAFLxGvzO2yszspJtd_A3BSTCRNSF+ts_5+2aMkNksxM48DYEwA@mail.gmail.com>
 <20250902-life-domestic-c341a8992cac@thorsis.com>
In-Reply-To: <20250902-life-domestic-c341a8992cac@thorsis.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Tue, 2 Sep 2025 09:48:15 +0200
X-Gm-Features: Ac12FXwFpHf0iqgyEreb1xfoEqD4qKw1D3J2oevFGJ2IPUlmVQfGkwXoWME8zbA
Message-ID: <CAFLxGvxdqkvhZmMnL+KzTW4O-cL1oJ+WL6koD1TzBnVzJ7oLjA@mail.gmail.com>
Subject: Re: State of the UBI fastmap feature
To: Richard Weinberger <richard.weinberger@gmail.com>, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_004829_046598_F601E499 
X-CRM114-Status: GOOD (  10.18  )
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

T24gVHVlLCBTZXAgMiwgMjAyNSBhdCA5OjM34oCvQU0gQWxleGFuZGVyIERhaGwgPGFkYUB0aG9y
c2lzLmNvbT4gd3JvdGU6Cj4gPiBJIGd1ZXNzIHlvdXIgbW90aXZhdGlvbiBpcyByZWR1Y2luZyB0
aGUgYXR0YWNoIHRpbWU/Cj4KPiBJbmRlZWQuICBOZWVkIHRvIHJlZHVjZSBib290IHRpbWUgaGVy
ZSwgYW5kIFVCSSBpcyBhdHRhY2hlZCB0d2ljZS4KPiBPbmNlIGluIFUtQm9vdCB0byByZWFkIHRo
ZSBrZXJuZWwgaW1hZ2UgYW5kIHRoZW4gYWdhaW4gaW4gTGludXguCgpTb21lIGlkZWFzIHRoYXQg
Y291bGQgc2lnbmlmaWNhbnRseSBpbXByb3ZlIGF0dGFjaCB0aW1lIHdoaWxlIGJlaW5nCmxlc3Mg
aW52YXNpdmUgdGhhbiBGYXN0bWFwOgoxLiBQYXNzIHRoZSBMRUItUEVCIG1hcHBpbmcgZnJvbSBV
LUJvb3QgdG8gTGludXggc28gdGhhdCBzY2FubmluZwpvY2N1cnMgb25seSBpbiBVLUJvb3QuCjIu
IE9wdGltaXplIEVDL1ZJRCBoZWFkZXIgcmVhZHM6CjIuMS4gSWYgc3VwcG9ydGVkIGJ5IHRoZSBk
ZXZpY2UsIHRyYW5zZmVyIG9ubHkgdGhlIGFjdHVhbCBoZWFkZXIgc2l6ZQppbnN0ZWFkIG9mIHRo
ZSBlbnRpcmUgKHN1YilwYWdlLgoyLjIuIFJlYWQgaGVhZGVycyB3aXRob3V0IEVDQyAoaWYgRUND
IG92ZXJoZWFkIGlzIG1lYXN1cmFibGUpLiBJZiB0aGUKaGVhZGVyIENSQyBmYWlscywgcmUtcmVh
ZCB3aXRoIEVDQy4KCi0tIApUaGFua3MsCi8vcmljaGFyZAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1h
aWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW10ZC8K
