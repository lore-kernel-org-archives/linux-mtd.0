Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D6C2C0219B
	for <linux-mtd@archiver.kernel.org>; Mon, 10 Feb 2025 02:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a546yPu2gqqtnOd5xTMD3wULl3Kqe9x3V0kIwRjxNJU=; b=ICpu9olGNI6szS
	+zKWD53QOhyfQWHrcV3ObezLArY+rAvFQ9ToR1hhT7M7qbakxfAxULRfFx9h70ft/Cyy5C4tB/7pf
	yaLw0yjrepOc1dcxD/49w0Bgkg2S/kQh4/EqcvVeIdyFM2YieGMmOSDGzpAUIl9efjBCb7QXafAr6
	seKHqmCS2qLTfzs73SRyNCmxLYUCwSFVX9vG58YIpIrGZSKfJHnKXkFoDAE8MxN+SXutGGKs27Vlu
	s6/K7RJxEw25hai1xO3Qxvq/PSZWGcnkQZYTTqk7H6AHZz/MidfnU+mYyIj2zdKiLmH0EJWTMEcdt
	dTrp/WxoQsw2Lk6lnqUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thJsX-0000000G1AY-3mMz;
	Mon, 10 Feb 2025 02:50:33 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thJsT-0000000G1A9-3Vvp
	for linux-mtd@lists.infradead.org;
	Mon, 10 Feb 2025 02:50:31 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-2f9b9c0088fso6008923a91.0
        for <linux-mtd@lists.infradead.org>; Sun, 09 Feb 2025 18:50:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739155827; x=1739760627; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l6wJOWELTsLR3RwU+AAGVqeWv/Z38nHm5I3vNjcGvBg=;
        b=RTTzy+ZrjnnI1NibUDo/pZm/6U3QC7ZV5o/OxPwyLwZyFjB4AeiaPppuqLbOzrFFuB
         KBbv9CzkttgcQVMv1vHtpV3I6ABOMUXvEEzIavTb6xXw26L8UsfTjSpB3ph4hR1zeA5N
         dmmCl0SRuP/thT5qU5RaWpbUMyLRHX0x0noy6ika5x9LT6N+U5+oQTnGkTeTM3WRDtZ5
         Aez3T51IL+rl7dNUC0S7PHMZ4eKnwAuszXU2hQ/w+mUTPqfXoNQNUynPy2VshmCLHOM3
         nwXuG4VF3uUXLdK8JMKcPI/PxoD62z+LO7d2McZfRvcUmxA+rdodDJPYw2hOqY4Wfriq
         OGFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739155827; x=1739760627;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l6wJOWELTsLR3RwU+AAGVqeWv/Z38nHm5I3vNjcGvBg=;
        b=P1sX1dvF+JZv062gbp1wXmcPi7HodWzySxlGk3URIl1hPu5tsU8UYNpT9j0UosUZG8
         kxka32RC5EX3Y/PTiapJSuDRR9As/1jYMsqzd1MWHaFLmhimSaxNR56pSfh01wRlE1lj
         2Xe3a4NaTSNDlayE7hE8p8PwtCjcY7nBB8V6A0iFKL2g+O1Xykd6CZDkm6N7QwxYtMgV
         0Vq9wokVLRWtb/SNLY2d/Z7THk4Zq3Qi8EPzficnGhAuPr3grE9STzrEaeVH7uh7kk7D
         mTSBCobg4RyekhETi909bPnUduPTTTIMqCJR2scjfx4cE3M0FnhtIA2rUdy5DuTuknL0
         yRpw==
X-Forwarded-Encrypted: i=1; AJvYcCUl4eYlE5ipDKEvRac+TDmZi21znX9rC46a4cbfAWjgUjHrkNjUDDSGnQbvRLHrXduPu5u+OB3UA/4=@lists.infradead.org
X-Gm-Message-State: AOJu0YzUdOhWquV5cLu/0b9VDZd873Dow4YNzkho7iNiIRiBlRvpB4Zv
	awhvsdnYERuRRoKKz9lzBjrdswPA99mNfXRpYFsQHloB5HvPPWRvQFjMsgSA+jFtu6txvfRO5iO
	+P7aYkInRv/a8DAxxG3N72/3S1yg=
X-Gm-Gg: ASbGnctCSKrMUXml6UamCxrJ2P6ZwsZtNg7BToNxagC5xI1fLoYmuaNvOr+LHDJmbaF
	dhiwzDUPZUn6KmRTXJ3J/Rb8TULd63YicrahMpMbsBLhUF52GILk2viXaCaHAIRipLYnb/jEg
X-Google-Smtp-Source: AGHT+IFrD0ZOqN+mBcQv2gPeap0XFft+z+PmKmHDVPeq0Bc0B/TPciJtKw2QC5KGBhrXwlk0nt2+GWYWKxIArj1WtgY=
X-Received: by 2002:a17:90b:5282:b0:2fa:9c9:20a3 with SMTP id
 98e67ed59e1d1-2fa24700cbfmr19649885a91.0.1739155827420; Sun, 09 Feb 2025
 18:50:27 -0800 (PST)
MIME-Version: 1.0
References: <20250122065605.285145-1-linchengming884@gmail.com>
 <20250122065605.285145-2-linchengming884@gmail.com> <878qqj3sju.fsf@bootlin.com>
In-Reply-To: <878qqj3sju.fsf@bootlin.com>
From: Cheng Ming Lin <linchengming884@gmail.com>
Date: Mon, 10 Feb 2025 10:46:19 +0800
X-Gm-Features: AWEUYZmW2VSUp9JJdlVPQz6fJe6PttWR0Fd_M-kLgR0JsCS0S0XBLUDR7Fg5UXE
Message-ID: <CAAyq3SZF9eGKfLLcC3zFHq85-AEb9B=Grjqfap8QqCUKLdLSVw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] mtd: spi-nand: Add read retry support
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: vigneshr@ti.com, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org, richard@nod.at, alvinzhou@mxic.com.tw, 
	leoyu@mxic.com.tw, Cheng Ming Lin <chengminglin@mxic.com.tw>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250209_185029_882434_95889707 
X-CRM114-Status: GOOD (  16.74  )
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
IDIwMjXlubQy5pyIN+aXpSDpgLHkupQg5LiK5Y2IMToxM+Wvq+mBk++8mgo+Cj4gSGVsbG8gQ2hl
bmcsCj4KPiA+IEBAIC02ODcsMTggKzY5MSw0MyBAQCBzdGF0aWMgaW50IHNwaW5hbmRfbXRkX3Jl
Z3VsYXJfcGFnZV9yZWFkKHN0cnVjdCBtdGRfaW5mbyAqbXRkLCBsb2ZmX3QgZnJvbSwKPiA+ICAg
ICAgICAgICAgICAgaWYgKHJldCkKPiA+ICAgICAgICAgICAgICAgICAgICAgICBicmVhazsKPiA+
Cj4gPiArcmVhZF9yZXRyeToKPiA+ICAgICAgICAgICAgICAgcmV0ID0gc3BpbmFuZF9yZWFkX3Bh
Z2Uoc3BpbmFuZCwgJml0ZXIucmVxKTsKPiA+ICAgICAgICAgICAgICAgaWYgKHJldCA8IDAgJiYg
cmV0ICE9IC1FQkFETVNHKQo+ID4gICAgICAgICAgICAgICAgICAgICAgIGJyZWFrOwo+ID4KPiA+
IC0gICAgICAgICAgICAgaWYgKHJldCA9PSAtRUJBRE1TRykKPiA+ICsgICAgICAgICAgICAgaWYg
KHJldCA9PSAtRUJBRE1TRyAmJiBzcGluYW5kLT5zZXRfcmVhZF9yZXRyeSkgewo+ID4gKyAgICAg
ICAgICAgICAgICAgICAgIGlmIChzcGluYW5kLT5yZWFkX3JldHJpZXMgJiYgKCsrcmV0cnlfbW9k
ZSA8IHNwaW5hbmQtPnJlYWRfcmV0cmllcykpIHsKPgo+IEkgYmVsaWV2ZSB0aGUgY29uZGl0aW9u
IHNob3VsZCBiZToKPgo+ICAgICAgICAgICAgICAgICAgICAgICAgIGlmIChzcGluYW5kLT5yZWFk
X3JldHJpZXMgJiYgKCsrcmV0cnlfbW9kZSA8PSBzcGluYW5kLT5yZWFkX3JldHJpZXMpKSB7Cj4K
PiBTbyBpZiB5b3UgaGF2ZSA1IHJldHJ5IG1vZGVzLCB5b3UgY2FuIHByb3ZpZGUgNSBpbiB0aGUg
bWFudWZhY3R1cmVyIGRyaXZlciwKPiBhbmQgbm90IDYuCgpUaGlzIHdhcyBvcmlnaW5hbGx5IGJh
c2VkIG9uIHRoZSBjb25maWd1cmF0aW9uIGluIHJhd25hbmQuCkhvd2V2ZXIsIEkgYWdyZWUgdGhh
dCB5b3VyIHByb3Bvc2VkIGNvbmRpdGlvbiBpcyBhIGJldHRlciBhcHByb2FjaC4KVGhhbmsgeW91
IGZvciB0aGUgc3VnZ2VzdGlvbi4KCj4KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHJldCA9IHNwaW5hbmQtPnNldF9yZWFkX3JldHJ5KHNwaW5hbmQsIHJldHJ5X21vZGUpOwo+ID4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaWYgKHJldCA8IDApIHsKPiA+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZWNjX2ZhaWxlZCA9IHRydWU7Cj4gPiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiByZXQ7Cj4KPiBTaGFsbCB3
ZSB0cnkgdG8gc2V0IHRoZSByZWFkX3JldHJ5IGxldmVsIHRvIDAgdXBvbjoKPgo+ICAgICAgIGlm
IChyZXQgPCAwICYmIHJldHJ5X21vZGUgPiAxKQo+Cj4gPwoKSWYgd2Ugc2V0IHRoZSByZWFkX3Jl
dHJ5IGxldmVsIHRvIDAgdXBvbiwgYW5kIHNldF9yZWFkX3JldHJ5IGZhaWxzCndoZW4gcmV0cnlf
bW9kZSBlcXVhbHMgdG8gMSwgaXQgd29uJ3QgcmV0dXJuIGFuIGVycm9yLiBUaGlzIGNvdWxkCnBv
dGVudGlhbGx5IG1hc2sgYW4gdW5kZXJseWluZyBpc3N1ZS4KCj4KPiA+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIH0KPiA+ICsKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IC8qIFJlc2V0IGVjY19zdGF0czsgcmV0cnkgKi8KPiA+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIG10ZC0+ZWNjX3N0YXRzID0gb2xkX3N0YXRzOwo+ID4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgZ290byByZWFkX3JldHJ5Owo+ID4gKyAgICAgICAgICAgICAgICAgICAgIH0g
ZWxzZSB7Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAvKiBObyBtb3JlIHJldHJ5
IG1vZGVzOyByZWFsIGZhaWx1cmUgKi8KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IGVjY19mYWlsZWQgPSB0cnVlOwo+ID4gKyAgICAgICAgICAgICAgICAgICAgIH0KPiA+ICsgICAg
ICAgICAgICAgfSBlbHNlIGlmIChyZXQgPT0gLUVCQURNU0cpIHsKPgo+IFJlc3QgbGd0bS4KPgo+
IFRoYW5rcywKPiBNaXF1w6hsCgpUaGFua3MsCkNoZW5nIE1pbmcgTGluCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1
c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbXRkLwo=
