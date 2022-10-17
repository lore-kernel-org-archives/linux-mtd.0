Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8EC2C4332F
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Oct 2022 11:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5gj1ya7CncvqiKeub5zo+mfwEYXcU0T1gogIwZ2p8RA=; b=lngXYI0yLc+waD
	1m0paJczfrGNYS3ohazhW0PA9RTzD3DA+QqszzgEDANMEzCvxHJiShysy1En4f1UH+CF2dSdCHw+u
	zzBMRjEqZCga2Ofeuh4LVHz41hE2/qnlOfdgWg1AtOjsqjNlBZnMvx1HlEB44291HSb2vHEsi+F2e
	phaO1prrZ4WXiimuunLtypXbEmQq426AQkaHtxaY6wgx1KJJTz3FROOG9RlqPC1CQLuKe9qhV1Qdj
	AAA8E7P88dsAq39zD233N4d/JF8gNJLeBEK1vIWsOJwRqNf0m7F/BkrAYhHdLPvYNF5/Et3FYLEif
	k4X/UjELP6QR1J0yf43g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okOdc-00B9pF-3W; Mon, 17 Oct 2022 11:50:32 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okOdY-00B9dc-1d
	for linux-mtd@lists.infradead.org; Mon, 17 Oct 2022 11:50:29 +0000
Received: by mail-ej1-x636.google.com with SMTP id b2so24315155eja.6
        for <linux-mtd@lists.infradead.org>; Mon, 17 Oct 2022 04:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cUWxNOkyDkn0CBMR0qy8X6kbIMnPGFpXTZKrtcDZ9ZI=;
        b=bK+P+uzVwqugJ9Bb49iiGiXw0KFaNtLVXED/51PF3H3bXPeEV1C7aQ9I8YS7LGGYE/
         AOcrfowP/blFE4N+ugYX+dsnsnE9wypDs5Qkbnlh5QhEYdzhklWHx6acx7bWnvB9u8FG
         Ts4vVLXIcx7/vqSaMY+tfOm6mFZiQ5BDUEoR4zj3tzj9Yk5UdVhyVNGw4FlMrFL/8rZx
         7A/E7K3YRlwSh7spjimBSskbAzqsIknuKxIOJE7NvHLahopUU6CxNUWzSdTfdGwa04dB
         qb7VJkSf1jc1rXnY0l+fLGm2LPjfGBu7WytMThorROGmfxHpkeZZ0nFdK590+u2Ib2oj
         qxmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cUWxNOkyDkn0CBMR0qy8X6kbIMnPGFpXTZKrtcDZ9ZI=;
        b=4HMywXsiPX1pij+/mVAJ9afUe+w9nTLdj1pAEUc7HBFThKDWqkkDRjHLNNGF8NaCCA
         bmeufBFhrEuVR7PHhAHcacGQghRUNIVmJ3J79xWme0ioSbdGe35yRh2Pzp/Gd5SXmNix
         TQOd52GpSNeSIyOkALd0Vje+H1znRbD7tNRa6t9/RuHwEAA63CdvXBUeXsT/fd0bQw/i
         zuDzGOo3DaoktJ7YOmRvbxp+O75LG51L6i3sH8982ApjNajPjB6hDrhd/xVIh0Jasrzh
         wlkuu8Bijce20DcBrVt5JOL/wG4rWdOm2PeJ/zKqhOS+VeuZp6NwjmWmpMkrddwTEDPF
         ICEg==
X-Gm-Message-State: ACrzQf2ihVA3Mv7vCeLy+Zgzkry/nf9MW5MD6pbL3EC/HWh5G8yG218W
	HwKM4GCam3qa34M9ibfjGvgieCXuifrouy8yQtfifw==
X-Google-Smtp-Source: AMsMyM5GQMneb+pka9dnZ4g7iTCB+F/OxtHMfA7b8t6VDPo+Fbh4C+uGdjWvHuIvaDoV1cxbcSBlKvQ8jO4olFpPgbg=
X-Received: by 2002:a17:907:16aa:b0:6fe:91d5:18d2 with SMTP id
 hc42-20020a17090716aa00b006fe91d518d2mr5274422ejc.190.1666007425718; Mon, 17
 Oct 2022 04:50:25 -0700 (PDT)
MIME-Version: 1.0
References: <20221016104017.2695989-1-linus.walleij@linaro.org> <a0cf3ec8-3e27-e8b0-cc0b-e8aefe97842d@gmail.com>
In-Reply-To: <a0cf3ec8-3e27-e8b0-cc0b-e8aefe97842d@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 17 Oct 2022 13:50:13 +0200
Message-ID: <CACRpkda0qTbidJRP-pDx56KmRsvXPOYKLMiR64So2Oqn3p6PVA@mail.gmail.com>
Subject: Re: [PATCH] mtd: parsers: trx: Rewrite partition parsing
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org, 
	Hauke Mehrtens <hauke@hauke-m.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221017_045028_108665_A3713ED9 
X-CRM114-Status: GOOD (  15.75  )
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

T24gTW9uLCBPY3QgMTcsIDIwMjIgYXQgNzozNCBBTSBSYWZhxYIgTWnFgmVja2kgPHphamVjNUBn
bWFpbC5jb20+IHdyb3RlOgoKPiBZb3UncmUgdHJ5aW5nIHRvIHdvcmthcm91bmQgbXRkIHdyaXRl
IGxpbWl0YXRpb24gYnkgaGFja2luZyBtdGQKPiBwYXJ0aXRpb24uIFRSWCBoZWFkZXIgaXMgTk9U
IGEgcGFydCBvZiBrZXJuZWwgaW1hZ2UuIEl0IHNob3VsZCBub3QgYmUKPiBwYXJ0IG9mIHRoZSAi
bGludXgiIE1URCBwYXJ0aXRpb24uCgpPSwoKPiA+IDIuIFNjYW4gZm9yIHNldmVyYWwgVFJYIGhl
YWRlcnMKPiA+Cj4gPiBDdXJyZW50bHkgb25seSB0aGUgZmlyc3QgZmxhc2ggYmxvY2sgaXMgc2Nh
bm5lZCBmb3IgYSBUUlgKPiA+IGhlYWRlciwgYnV0IHNldmVyYWwgZmxhc2hlcyBoYXZlIG11bHRp
cGxlIFRSWCBoZWFkZXJzCj4gPiBlYWNoIHdpdGggdXAgdG8gMyBwYXJ0aXRpb25zLgo+Cj4gVGhh
dCdzIGJlY2F1c2UgaXQncyBhIFRSWCBwYXJzZXIuIEl0J3MgbWVhbnQgdG8gcGFyc2UgVFJYIGNv
bnRhaW5lci4KPiBKdXN0IHRoYXQuCiguLi4pCj4gTGV0J3Mga2VlcCB0aGluZ3Mgc2ltcGxlLiBM
ZXQgVFJYIHBhcnNlciBqdXN0IHBhcnNlIFRSWC4gVXNlIGFub3RoZXIKPiBwYXJzZXIgdG8gZGVh
bCB3aXRoIHlvdXIgc3BlY2lmaWMgZmxhc2ggc3BhY2UgbGF5b3V0LgoKT0sgbWF5YmUgdGhhdCBz
aG91bGQgYmUgZWxzZXdoZXJlIGxpa2UgYSBzdWJwYXJ0aXRpb24uCgo+IFNvIHBsZWFzZSBqdXN0
IHVzZS93cml0ZSBhIHByb3BlciBwYXJzZXIgZm9yIHlvdXIgZGV2aWNlIGZsYXNoIHNwYWNlLgo+
IE1ha2UgaXQgcmVnaXN0ZXIgImZpcm13YXJlIiAob3Igc2ltaWxhcikgTVREIHBhcnRpdGlvbiBm
b3IgYWN0dWFsIFRSWAo+IGNvbnRlbnQuIFRoZW4gbGV0IFRSWCBwYXJzZXIgZG8gaXRzIGpvYi4K
CkJ1dCB3aGF0IGFib3V0IHRoaXMgcGFydCBvZiB0aGUgcHJlc2VudCBjb2RlLCB3aGljaCBpcyBh
Y3R1YWxseQp0aGUgbW9zdCBwcm9ibGVtYXRpYzoKCiAgICAgdTY0IG5leHRfcGFydF9vZmZzZXQg
PSAoaSA8IGN1cnJfcGFydCAtIDEpID8KICAgICAgICAgICAgICAgICAgICAgIHBhcnRzW2kgKyAx
XS5vZmZzZXQgOiBtdGQtPnNpemU7CgpUaGlzIG10ZC0+c2l6ZSBpcyB3aGF0IHJlYWxseSBtYWtl
cyBteSBVQkkgcGFydGl0aW9uIHVubW91bnRhYmxlLgoKVGhlIHdheSBJIHNvbHZlZCBpdCB3YXMg
dG8gc2NhbiBhaGVhZCBmb3IgVUJJIG1hZ2ljIHRvIGRldGVybWluZSBob3cKYmlnIHRoZSBVQkkg
cGFydGl0aW9uIGlzLgoKVGhlICJsZW5ndGgiIGZpZWxkIGluIHRoZSBUUlggaGVhZGVyIGNsZWFy
bHkgY2Fubm90IGJlIHRydXN0ZWQuCgpZb3VycywKTGludXMgV2FsbGVpagoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNj
dXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LW10ZC8K
