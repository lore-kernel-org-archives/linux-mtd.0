Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A4C2EFB817
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Feb 2026 08:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=la3Qp8J3mKstFbrCueWnc/nwbIfWZOWn5uUa4ypy9Fo=; b=Y2KACjk3ATfVlW
	MjL9Ezw4oy9xmY54lUyqZ874iccVm2WUPiyVJHl5qL8zRFwvUp2zCRima6zPJwyi4f23Tgf3vy4X8
	bL8XyR0I182D9DQ4R5vxdMPCdaoesxKX22Su9GziD5Yo0JA8TP525Rn79ng1qEjhKSt/oxgOVoHVb
	QB/+K8juqK27yH0y91apZ5b1PJt3vXbixiXQ/BpeJWlf27swZck8VKMQGNdQlxjAKV2NaCZtl+ntv
	Unm+ppNxdFSZmAaSbF2M4vik5DbvQHxeZfaRUogYcW2oaQ4AnwrCS4gHU33Vf8dccRh/UzCk+WzLW
	4Q/p03asUR9jGkzhR3YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuns2-00000001eP4-2LCI;
	Tue, 24 Feb 2026 08:34:18 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vunrz-00000001eOX-3Rzp
	for linux-mtd@lists.infradead.org;
	Tue, 24 Feb 2026 08:34:17 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2a7a23f5915so31179585ad.2
        for <linux-mtd@lists.infradead.org>; Tue, 24 Feb 2026 00:34:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771922055; cv=none;
        d=google.com; s=arc-20240605;
        b=YSnZuWcDqAVPETY6C/K69QlXxEYu4wOU0syBqTqqkH4Ns4LLCJlN7vc/R5/iN/3FG2
         l5VeWhknyFaIMc0wSJZ2nH2YDEfGWis8sRE8SAU1dnAZ5H4qnjJo672Xs5H18fPEinZT
         V9pgRh6+N475sOBhaRmdA4ogg/a/01+tneNlSszVonXkUggFtE3PR/3HK69mFJNJKGy4
         G8ZEG845AyM/jVcCpg+SmUF8N8tk9fNb0UXSWmmvCbj1WCke7FJ+33IIpRtqsT+BJNqT
         OOBUNfNpDxxBZSjo9HkGwuZWDaCVsetM0hTGG99DNB7qy5YrSwHcrXuJ7I+s12sgqOaN
         pOfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BOp69aoXyTerJNnUrclzJdYCnnjdh4YYaM9YJxNzM3w=;
        fh=/Nz1NJaMraz1MDyFtQ8OszeJbPeD4s4yxDTDncnRmbI=;
        b=HhuIsB1VjPmTVCZL6vSHqMX2p7csZk5KM0VkU4UBQ+IhRsOdF1ILrOyULQXqlI2jL1
         sx9hhut/czfLNTA+PMbkvElIJvTwxTyy5WrZ2IXbhiwDoSvtEE4CAoTNDUkdKkDON3Xw
         yOglqJ0MFv6roj3L+fb6L2AxIIbD6h0W0yozJe7Z9WONAHFBllnU2oywWELgZdVqI2Xl
         j+9flTabHv3trQi/Cc+hcYiifHlD574LDw2XskQ2u/+VOFE6n8F2XnhCcKKz8n7JOua/
         gSJvE+IGFmgJWGDpTQtaXUjG62NyQklbjf63YKHEiUUbvDmQQExPX73j9jfldPkqajAf
         THmw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771922055; x=1772526855; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BOp69aoXyTerJNnUrclzJdYCnnjdh4YYaM9YJxNzM3w=;
        b=bOuaTKzK4adEkFet1sUbu8v50Sj8u38FWPZz/zx+4sIZZEZOQrVLqQrtwGKyBbabHT
         1Tuihe54CghOUqmCyYjbb12Q/COsjhNpfYYR8Edyh3FyxyXnnLnEDS4qBLp+9fEjWySr
         j+un2hCeckPkyMLivGvPk8rQ+zBU1iO8kHgZb8s7T8BOu+tG5l/QKpjRCbUZby2NaT8e
         7LR6ipJkS0FziWevBnInvpDSLAntOcl5GcdUoL6ZAZpS3y56jZy7vrWVM5u5dzJxT+UX
         /66rsVWZsrXxN3b4UJZ12l3ZjU5aMNXc/wqa78fC6x+E+15H1UYBeM95h3yGCeLPaZj2
         6eyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771922055; x=1772526855;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BOp69aoXyTerJNnUrclzJdYCnnjdh4YYaM9YJxNzM3w=;
        b=s4gk+7Q7XxpgnkMbWDRELRDt6zeXUCMxbjoZEbDEEsDP7wvqGVhCpn1k2aYpFX7Wo7
         y+YD6wuIja7gKXPOuVEh0iybBZsJyBtINXtjIssxwbs1zWFPwyvy41C/PjGUNu43kBsq
         l5g66pTEF2/E3ch1UptLuUVFlBsc8nCrDDy9190tW7XMgc69j5X3B5lYh3rSDyquigpM
         y8giS8zYhtuMzqSVXairerW2zYjR07XKzTLGIpBJdy3EQfdTQjsBYVy9/jdXnY918h2O
         YEDgysVYglftP0xpIKAHwnybBPJnBTvT+Dx6RZiZz5pdFgn4iow4O+a14wWiltUVWWpN
         l+DA==
X-Forwarded-Encrypted: i=1; AJvYcCXjq+L7GMfz+19E/shkpVlH2zBmp0KeQx3x8jPZENi9b5MQSGPTYsKuAvrWnseTrY3feqnX0LPtZr0=@lists.infradead.org
X-Gm-Message-State: AOJu0YyuEDIPnW/UXn758g+EP2SEveDCvODnAtH77xu3DxTIIo+BJp5x
	WPraMtYWjK4GQiw/p5bOtNGeS2to8/FRzxzz2nvNuoGDLDt3U1NhbMJrw2Mkuq5oYPc+x3/aLCN
	YWfSgJg63379GdZDVW8wMTRmTHyxKYVU=
X-Gm-Gg: ATEYQzwgPVcibYbzRK7etMSIKcMNZJcA89p9EyKsdvID2xIfbUjmBp2Qfpq6KiQDpDr
	l3TR2vXAvOm8HoZ9FuF8hZFUGoxttidjiJUBH+EJgxGMlaRndbCx1qS49vC8ZcE3JiXpnJ80ynq
	dE7lJDTryK1pQNyoKmJsBzI5EKRQkNY4r+j3RYvvg0ENVffiKPgWvdIZBUe7/BJU63D9mOa0IYk
	RXcxYltTi76mo2NrNiPM5nhOmRHz0QXaGz3ZGuiHB4Kvve/a7Ut/J38BfDx9FN0Mt8ugwVYyHTG
	IAbQwdI=
X-Received: by 2002:a17:902:f68d:b0:2aa:e3ba:d045 with SMTP id
 d9443c01a7336-2ad74419c74mr110311295ad.8.1771922054591; Tue, 24 Feb 2026
 00:34:14 -0800 (PST)
MIME-Version: 1.0
References: <20260224025550.1102660-1-linchengming884@gmail.com> <87ecmar1lc.fsf@bootlin.com>
In-Reply-To: <87ecmar1lc.fsf@bootlin.com>
From: Cheng Ming Lin <linchengming884@gmail.com>
Date: Tue, 24 Feb 2026 16:32:19 +0800
X-Gm-Features: AaiRm52n38wsv3oieVThWjDdwKzwY9H4OQ4IYvdXW07PHUve2nRzTc-ATUf5yZQ
Message-ID: <CAAyq3SbkLxKKnadVZX6YVQDY18EDkMvA46xeq=oN4EEFpUAJVQ@mail.gmail.com>
Subject: Re: [PATCH] mtd: spi-nor: core: Fix false positive in Read CR
 capability check
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Pratyush Yadav <pratyush@kernel.org>, 
	Michael Walle <mwalle@kernel.org>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Jakub Czapiga <czapiga@google.com>, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org, alvinzhou@mxic.com.tw, 
	Cheng Ming Lin <chengminglin@mxic.com.tw>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_003415_900796_673132B9 
X-CRM114-Status: GOOD (  27.04  )
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

SGkgTWlxdWVsLAoKTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4g5pa8
IDIwMjblubQy5pyIMjTml6XpgLHkuowg5LiL5Y2INDoyNOWvq+mBk++8mgo+Cj4gSGkgQ2hlbmcg
TWluZywKPgo+IE9uIDI0LzAyLzIwMjYgYXQgMTA6NTU6NTAgKzA4LCBDaGVuZyBNaW5nIExpbiA8
bGluY2hlbmdtaW5nODg0QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiA+IEZyb206IENoZW5nIE1pbmcg
TGluIDxjaGVuZ21pbmdsaW5AbXhpYy5jb20udHc+Cj4gPgo+ID4gVGhlIGN1cnJlbnQgY29kZSB1
c2VzIHNwaV9ub3Jfc3BpbWVtX2NoZWNrX29wKCkgdG8gY2hlY2sgaWYgdGhlIFNQSQo+ID4gY29u
dHJvbGxlciBzdXBwb3J0cyB0aGUgUmVhZCBDUiBvcGVyYXRpb24uIEhvd2V2ZXIsIHRoaXMgbGVh
ZHMgdG8gYQo+ID4gZmFsc2UgcG9zaXRpdmUgd2hlcmUgY2FwYWJsZSBjb250cm9sbGVycyBhcmUg
d3JvbmdseSBmbGFnZ2VkIHdpdGgKPiA+IFNOT1JfRl9OT19SRUFEX0NSLgo+ID4KPiA+IFNQSV9O
T1JfUkRDUl9PUCBkZWZpbmVzIGFuIG9wZXJhdGlvbiB3aXRob3V0IGFuIGFkZHJlc3MgcGhhc2UK
PiA+IChhZGRyLm5ieXRlcyA9IDAsIGFkZHIuYnVzd2lkdGggPSAwKS4gV2hlbiB0aGlzIG9wZXJh
dGlvbiBpcyBwYXNzZWQKPiA+IHRvIHNwaV9ub3Jfc3BpbWVtX2NoZWNrX29wKCksIHRoZSBmdW5j
dGlvbiBvdmVyd3JpdGVzIG9wLT5hZGRyLm5ieXRlcwo+ID4gdG8gMyBvciA0IHRvIHRlc3QgYWRk
cmVzc2luZyBjYXBhYmlsaXRpZXMgKGFzIGl0IHdhcyBvcmlnaW5hbGx5IGRlc2lnbmVkCj4gPiBm
b3IgZGF0YSByZWFkL3dyaXRlIG9wcykuCj4gPgo+ID4gVGhpcyBtb2RpZmllZCBvcGVyYXRpb24g
aXMgdGhlbiByZWplY3RlZCBieSBzcGlfbWVtX2NoZWNrX29wKCkgaW4gdGhlCj4gPiBjb3JlIHNw
aS1tZW0uYyBiZWNhdXNlIGl0IGhhcyBhIG5vbi16ZXJvIGFkZHJlc3MgbGVuZ3RoIGJ1dCBhIHpl
cm8gYWRkcmVzcwo+ID4gYnVzd2lkdGgsIHdoaWNoIGlzIGFuIGludmFsaWQgY29tYmluYXRpb24u
Cj4gPgo+ID4gRml4IHRoaXMgYnkgYnlwYXNzaW5nIHNwaV9ub3Jfc3BpbWVtX2NoZWNrX29wKCkg
Zm9yIHJlZ2lzdGVyIG9wZXJhdGlvbnMuCj4gPiBJbnN0ZWFkLCBkaXJlY3RseSBjYWxsIHNwaV9t
ZW1fc3VwcG9ydHNfb3AoKSB0byB0ZXN0IHRoZSBleGFjdCBvcGVyYXRpb24KPiA+IHdpdGhvdXQg
YWx0ZXJpbmcgaXRzIGFkZHJlc3MgcGhhc2UuCj4gPgo+ID4gRml4ZXM6IDUwMDhjM2VjM2Y4OSAo
Im10ZDogc3BpLW5vcjogY29yZTogQ2hlY2sgcmVhZCBDUiBzdXBwb3J0IikKPiA+IFNpZ25lZC1v
ZmYtYnk6IENoZW5nIE1pbmcgTGluIDxjaGVuZ21pbmdsaW5AbXhpYy5jb20udHc+Cj4KPiBUaGF0
IGlzIGluZGVlZCBhIHByb2JsZW0sIEkgYWxyZWFkeSBzZW50IGEgcGF0Y2ggZm9yIHRoYXQgYnV0
IHRoZXJlIGlzIGEKPiBiaXQgb2YgdHVybm92ZXIgaW4gdGhlIHNwaS1ub3IgdGVhbS4gSXQgaGFz
bid0IGJlZW4gYWNrZWQgc28gSSBkaWRuJ3QKPiB0b29rIGl0IHRocm91Z2ggdGhlIGZpbmFsIE1S
LiBUaGUgcHJvYmxlbSBub3cgZXhpc3RzIGluIDcuMC1yYzEsIHNlZToKPgo+IGh0dHBzOi8vbG9y
ZS5rZXJuZWwub3JnL2xpbnV4LW10ZC8yMDI2MDEwODEyMTQzMC4xMDk2ODQ0LTEtbWlxdWVsLnJh
eW5hbEBib290bGluLmNvbS8KClVuZGVyc3Rvb2QsIHRoYW5rIHlvdSBmb3IgcG9pbnRpbmcgdGhh
dCBvdXQuIEkgY29tcGxldGVseSBtaXNzZWQgeW91cgpwcmV2aW91cyBwYXRjaCB3aGVuIEkgd2Fz
IGxvb2tpbmcgaW50byB0aGlzIGlzc3VlLgoKVGhhbmtzIGFnYWluIGZvciB0aGUgY2xhcmlmaWNh
dGlvbiEKCj4KPiA+IC0tLQo+ID4gIGRyaXZlcnMvbXRkL3NwaS1ub3IvY29yZS5jIHwgMiArLQo+
ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+ID4KPiA+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9zcGktbm9yL2NvcmUuYyBiL2RyaXZlcnMvbXRkL3Nw
aS1ub3IvY29yZS5jCj4gPiBpbmRleCA4ZmZlYjQxYzNlMDguLjEzMjAxOTA4YTY5ZiAxMDA2NDQK
PiA+IC0tLSBhL2RyaXZlcnMvbXRkL3NwaS1ub3IvY29yZS5jCj4gPiArKysgYi9kcml2ZXJzL210
ZC9zcGktbm9yL2NvcmUuYwo+ID4gQEAgLTI0NjYsNyArMjQ2Niw3IEBAIHNwaV9ub3Jfc3BpbWVt
X2FkanVzdF9od2NhcHMoc3RydWN0IHNwaV9ub3IgKm5vciwgdTMyICpod2NhcHMpCj4gPgo+ID4g
ICAgICAgICAgICAgICBzcGlfbm9yX3NwaW1lbV9zZXR1cF9vcChub3IsICZvcCwgbm9yLT5yZWdf
cHJvdG8pOwo+ID4KPiA+IC0gICAgICAgICAgICAgaWYgKHNwaV9ub3Jfc3BpbWVtX2NoZWNrX29w
KG5vciwgJm9wKSkKPiA+ICsgICAgICAgICAgICAgaWYgKCFzcGlfbWVtX3N1cHBvcnRzX29wKG5v
ci0+c3BpbWVtLCAmb3ApKQo+ID4gICAgICAgICAgICAgICAgICAgICAgIG5vci0+ZmxhZ3MgfD0g
U05PUl9GX05PX1JFQURfQ1I7Cj4gPiAgICAgICB9Cj4gPiAgfQoKQmVzdCByZWdhcmRzLApDaGVu
ZyBNaW5nIExpbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
