Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95CE5C79F9E
	for <linux-mtd@archiver.kernel.org>; Tue,  8 Sep 2026 15:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BFJ8kxe1c+Q6eaqZjeX7+i7p1Vn6AjI0WA27hOtGfBc=; b=zIFiun1xBbtcfK
	XW36jUU0EYQcm/nu4zkMLzw4H1jiZQ1Ckl0FoTLVRrus/ydyA8s5BN0E6P1SicMjMpkLS9CQj/VD8
	ufFFN7HGRGJkiLdJCSyBVqHhG/WSWmt7QmW4qHYU90MDEcY6bdwbGkTC9NlJuytQCOVnr9/mlmFnr
	mTpALUWjTDpBL38DKJKkgCWEnqWyeO7ByLawhfCP3uM8FxpS2hrzKhC5Td9eJ0svVt95IbCnKhKFx
	/HY6K7vqUYVANzLmqxA7mQVFhLcn+PkZaHAOhW6OUdMXtb9YUTrtx5QgmUSVRpreqpVyuNGhP5rzn
	8JOUK9+MSZknDBM5eZEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3xjM-00000009U4M-0imG;
	Tue, 08 Sep 2026 15:27:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3xjL-00000009U43-1FD2
	for linux-mtd@bombadil.infradead.org;
	Tue, 08 Sep 2026 15:27:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=NpWv1MGIw8lJhJkXRWnWsKfLORSzk3NhbHC5pDb1BIw=; b=ZBK0mfhvbBmYpqT6gMmzGdqZy9
	xFqTw0W7AvDH8fM73tTbsW7ul2OIMxK1KkB5l8p51zdKUo8iuwFzZ4YK9ecwruNyBtN2cwqQxU7hm
	Y4BG1x1W8HNCdLqSBDra0y8wzgocqAR1B+xnrAoFe3nyG8rhbC/hdhue0LLnWNMUJ0eb60sa492Sy
	zwgC9Vjt/z216Abgnro/jzVTfWNL01kSECWKZCAyRNFgSRqX5ocIXsTQcLuPIYMvqgHajKFjjAxd9
	zS8jPVBPA1wd5B2yOZZrDoIsxR54lsq4TwR8zvejRuheEvVIPCKvJGe25L/quWtCM6GBqHKDKGUnk
	iuwfQHwg==;
Received: from mail-ua1-x92e.google.com ([2607:f8b0:4864:20::92e])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x3xjI-000000001Hz-0lkm
	for linux-mtd@lists.infradead.org;
	Tue, 08 Sep 2026 15:27:26 +0000
Received: by mail-ua1-x92e.google.com with SMTP id a1e0cc1a2514c-97cc20c05d3so1255694241.0
        for <linux-mtd@lists.infradead.org>; Tue, 08 Sep 2026 08:27:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788881240; cv=none;
        d=google.com; s=arc-20260327;
        b=fO3nSCrqsUAlKrllVA+SskHw+ywzevIsv84TBmN35dRfSQOkjJCiJFXZKsQT7m1xK2
         boupW8UGuDlOl/mWCl+PVfG2+67S8cXKHruVL7HH78n7bBEE05Dk0BF+JnD67XJbX+Ll
         Obuihii2BJTGE5q1tSt9CX3AvNhIfBFm5/ejORw3lnaTpb8otklKrtPni+9lIOSbPBx6
         b19CF/uSGypEseibboygYh5mGilbDgu3Ys53vqNS/GcoWeRX4ziNkJ16+SIwvggoi5UO
         8kZDECDY9OzGhJcBNOIi56v88KWC0tF4VtXGsQqXUsBTJ9B4V+eqKR3dDWfyYdpRbBsd
         AseQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NpWv1MGIw8lJhJkXRWnWsKfLORSzk3NhbHC5pDb1BIw=;
        fh=RDG9css1RBn/4SKb7Swq407RQ5cQtE/w5z5KditK2FU=;
        b=QsnJD2+zzQvZkMlvt1sA7MOQOEq7MIcn1sgX9U2G2eWN1QcYr9aM0OVOF5aLeS+csz
         td5MQOlqfQUuZVEWwhRwhttmYQMKv8T9xedPnyWc/XSFOCn1bwcEja0nYIkn32tO5KzF
         36stKlFtO1ODhpb++PlJX0DU+VNTSnNbRRv/V6NK1HUedQ/R3Pmgt05wy0bhj5Sujb/1
         apJpvx9qbZp3fA0EmJHx/IwTCZqoaVbcLLhnub+bCgY44CVe1mpBviZV4gU00w93WGCD
         LKEeCHXfszDttW8adjEYDHk3DlejKnOZZR7i4/1GtMIMubVt/4YEa9RrP29u/UXF5XEI
         ObzA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788881240; x=1789486040; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NpWv1MGIw8lJhJkXRWnWsKfLORSzk3NhbHC5pDb1BIw=;
        b=V3hk1/xfFffS1kE+Gj2RpW8+9QmkQHWFGGagqBqV3LPnufUj+mtqZaT1kH4sZOOnbs
         RV3oVlPVNV/haHBBwPhlC/W8t2lP+EEgag2i/Hvm0+Jsf/kx4VA0mxqkD7kq2bej1UJM
         G2ui8UmQ5C0CMo5iVVQsyY1jxK1X6dJIdO6/ZyhuoYQAqBeNpSQrsim8eRL2jEuL7349
         EsXUj+AHTjYcdKT163lW9o4iQxC0tMGjIZJ/de/3bCTf5m/McO8myPkTJWKSB8aSEU/q
         Pr31N9n5fmvlK9IpggX7sM7oaaufDrykOvRXLBr43HD7yLBrJWjc91i2ul7Mlj7tPjxU
         q3hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788881240; x=1789486040;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NpWv1MGIw8lJhJkXRWnWsKfLORSzk3NhbHC5pDb1BIw=;
        b=F6qR1jeyY/HNxTqjot/V23Qw5/UmfV1eL4GPt/66TLg4Ry9g2GijIRldU4oQgofs5i
         3WOdj0XZkMi+Cy9g3L3Q4satxa/Lv3vjoSf5mJ+2ZFV5PhYZ17Zp2UVdqZ2k46kH0tBP
         ZXiX7V/tidWG/2g4twM6ish5Fpjco/r2NUsnc33OGXC+Ok5Vqos9ShIoojLmXbbbYOOg
         oB38VLXmAvDyh7O6wj1QHaz4KZwqcGjFw66V4lzUX+TC9ih4kYVMX0xQlFthqn8I8Kcv
         fMUSrjKcB+1eaSdUOxl94yp363G6ZE+h1QiGBuJJo86sThhra4jrJhRf1dQ5MvzHQeZo
         7tRQ==
X-Forwarded-Encrypted: i=1; AKwUvBx22zCryBDAEttE6IGy91TmzmpVm66g0dkvHctvpA9NaQTybL6rP3wbt/a6tcxoQChhEiLD5x8gbiA=@lists.infradead.org
X-Gm-Message-State: AFuF++lUkTn94hC4p7NicOUek6rVIO+IcZwT6fZH+AO7lCUonDQBIpCW
	abG9FAQKtOpfhteXpKtNJurJ5oFLPfrpcQIQQHyQR2/fs7Tg1/jg0GPUZ4dBZWOePtvuEssXz0f
	tftJLwouv/GOJROrGSSRChS09A8NYXyk=
X-Gm-Gg: AYBFou0wNLZYbWE854NV9KWhw1nhcVDQNQDRYedwWbsLjfQrvZHuI2z1XSt6fJnrwCv
	rxK9JDAbl2RNU15ANIj41Bt6YjkF7xSPX3rPSHEBBb649VjcDxRNiBgt8G0r+CiXU6CxeKlbUl/
	qp/kFlGvkSb1QEtJemC7CpSYGdu6kmoeZ95nQpub30+5NCPmvAj97BUPHmGVLQeWP/UzSJxy4n4
	34eKXISEQbeSWtbHSVd9Z+iDiZj373/miDGAp5cEGiovqZbVri8u6BwueVBFyQwexjYApVxiT0s
	vs3TMEo5PJHWNmqT351PSbz/DbOmfMNqPtPkyzEoznnJw2JIFk0vP6vigKxFPjJ+mWGbHaP5D6V
	Jo+oGr4KfIzxGlG4mtF8JZyGpZ1bQZRPxAtHxmvd6zYVSIxgQ63d/VE49ZRe49jjgOipC5FaPdu
	ZopHu+ceLbyRK9u93bHFjw1A+ekHQVu+5nWAb0QQ==
X-Received: by 2002:a05:6102:3b05:b0:78f:7135:b4ff with SMTP id
 ada2fe7eead31-78f7135b567mr108498137.2.1788881240558; Tue, 08 Sep 2026
 08:27:20 -0700 (PDT)
MIME-Version: 1.0
References: <20260904-submit-sunxi-nand-ecc-step-validation-v2-1-6e3ba6200948@gmail.com>
 <87zexst5ze.fsf@bootlin.com>
In-Reply-To: <87zexst5ze.fsf@bootlin.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 8 Sep 2026 09:27:08 -0600
X-Gm-Features: AcwNN1XTfSZyHBIe8pqnaVApbMCPBzAi1LuuzXv-U_kf3BpB2aghA9-Ue90Qud8
Message-ID: <CADvTj4rFxwgYZgKzcHZG738UV0_94gxG1Dhy--ET9jC=E1dgoA@mail.gmail.com>
Subject: Re: [PATCH v2] mtd: rawnand: sunxi: fit maximized ECC step to page size
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Boris Brezillon <bbrezillon@kernel.org>, linux-mtd@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_162724_416715_18965AD3 
X-CRM114-Status: GOOD (  17.29  )
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

T24gVHVlLCBTZXAgOCwgMjAyNiBhdCA0OjAz4oCvQU0gTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJh
eW5hbEBib290bGluLmNvbT4gd3JvdGU6Cj4KPiBIZWxsbyBKYW1lcywKPgo+IE9uIDA0LzA5LzIw
MjYgYXQgMTY6Mzk6MjcgLTA2LCBKYW1lcyBIaWxsaWFyZCA8amFtZXMuaGlsbGlhcmQxQGdtYWls
LmNvbT4gd3JvdGU6Cj4KPiA+IFdoZW4gbmFuZC1lY2MtbWF4aW1pemUgaXMgc2V0LCB0aGUgZHJp
dmVyIHVuY29uZGl0aW9uYWxseSBzZWxlY3RzIGEKPiA+IDEwMjQtYnl0ZSBFQ0Mgc3RlcC4gQSBO
QU5EIHdpdGggYSA1MTItYnl0ZSBwYWdlIGNvbnNlcXVlbnRseSBwcm9kdWNlcwo+ID4gemVybyBF
Q0Mgc3RlcHMgYmVmb3JlIHRoZSBhdmFpbGFibGUgT09CIGJ5dGVzIGFyZSBkaXZpZGVkIGJ5IHRo
ZSBzdGVwCj4gPiBjb3VudC4KPiA+Cj4gPiBUaGUgb2xkZXIgc3VueGkgTkFORCBjb250cm9sbGVy
cyBzdXBwb3J0IDUxMi1ieXRlIEVDQyBibG9ja3MuIFNlbGVjdCB0aGUKPiA+IHNtYWxsZXIgb2Yg
dGhlIHBhZ2Ugc2l6ZSBhbmQgdGhlIHByZWZlcnJlZCAxMDI0LWJ5dGUgc3RlcCwgdXNpbmcgYQo+
ID4gNTEyLWJ5dGUgc3RlcCBmb3IgYSA1MTItYnl0ZSBwYWdlIHdoaWxlIHJldGFpbmluZyAxMDI0
LWJ5dGUgc3RlcHMgZm9yCj4gPiBsYXJnZXIgcGFnZXMuIFVuc3VwcG9ydGVkIHNtYWxsZXIgc3Rl
cHMgYW5kIGNvbnRyb2xsZXJzIHdpdGhvdXQKPiA+IDUxMi1ieXRlIHN1cHBvcnQgY29udGludWUg
dG8gYmUgcmVqZWN0ZWQgYnkgdGhlIGV4aXN0aW5nIGNoZWNrcy4KPiA+Cj4gPiBGaXhlczogNDc5
NmQ4NjU1OTE1ICgibXRkOiBuYW5kOiBzdW54aTogU3VwcG9ydCBFQ0MgbWF4aW1pemF0aW9uIikK
PiA+IENjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnCj4gPiBTaWduZWQtb2ZmLWJ5OiBKYW1lcyBI
aWxsaWFyZCA8amFtZXMuaGlsbGlhcmQxQGdtYWlsLmNvbT4KPgo+IEFzIHJlcG9ydGVkIGJ5IFNh
c2hpa28sIHRoZXJlIGlzIGFub3RoZXIgdXNlIG9mIDEwMjQgZG93biB0aGUgcm9hZCB3aGljaAo+
IG11c3QgYmUgbW9kaWZpZWQgYWNjb3JkaW5nbHkuIEFsdGhvdWdoLCBpbiBwcmFjdGljZSwgNTEy
LWJ5dGUgcGFnZSBOQU5Ecwo+IGhhdmUgZGlzYXBwZWFyZWQgZm9yIHF1aXRlIHNvbWUgdGltZSwg
c28gdGhpcyBpcyBhIHRoZW9yZXRpY2FsIGZpeCBtb3JlCj4gdGhhbiBhIHJlYWwgcHJvYmxlbS4K
CkRvZXMgdGhlIHYzIEkgc2VudCBsb29rIGxpa2UgaXQgc2hvdWxkIHdvcms/OgpodHRwczovL2xv
cmUua2VybmVsLm9yZy9hbGwvMjAyNjA5MDQtc3VibWl0LXN1bnhpLW5hbmQtZWNjLXN0ZXAtdmFs
aWRhdGlvbi12My0xLTkzMWNlYzMxN2MxMEBnbWFpbC5jb20vCgo+Cj4gVGhhbmtzLAo+IE1pcXXD
qGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
