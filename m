Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEE6DC48BC1
	for <linux-mtd@archiver.kernel.org>; Wed, 14 Feb 2024 16:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nft6S+MvknUTEmEg5EMaA96XSkUf42IQ+tTwIq2coJo=; b=uhHzk5xAKczElw
	WP4n328gK4mtX9ZB46UaHWb4tLx8Q9uxzgOl2KUZNumzL12HtBvinyXS3uf3ksEi/eX6QqWynYHaS
	+v0nCVXMfepC5EJxcfjzHmq/+aQUQGznOVCnxD3Eey6+Yqu2cozyU4MDaL9b7Vju3wDwxu58k5bx1
	Tjyba5DfFLgwUsm86ZvKRbflvStbGcN2VpsY+5FJ8ydDq8TSgloShcRoa8BtfNOixKDFPggp5QWzD
	wxYQvitL5GysTihXaTAKPER6wsiqa0r/wlfWIW/0xe1HuSdC3z/8EQsHE9cemAxpGjpxJps0DeK1r
	+opwjN0/byS53iM0cPwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raIPi-0000000DajT-3bch;
	Wed, 14 Feb 2024 16:47:14 +0000
Received: from mail-yw1-f174.google.com ([209.85.128.174])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raIPg-0000000DaiO-1zP4;
	Wed, 14 Feb 2024 16:47:13 +0000
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-607a84acf6aso7588267b3.2;
        Wed, 14 Feb 2024 08:47:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707929231; x=1708534031;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ICVRIlP5TWlztMLLLMDwV83GSTpE4QQrJbkwQICALLk=;
        b=BIPuKKSA4YU6WfiQmqHbJAhMOZpScwm61GLrPFn74r8/MyJ+idAX506qNvjlhj9+hl
         IB6ZUDwhHxoPGAgBkY80QRmqu757K7Quw4MbFhjtbMVN92S6tWoLgn++EaA9aNZ0b7S3
         yLpMBtBZ89r0mhiD3q/Af6zNKpbOdvBmNKevqqc/oU90eLVFCLtKwfrl9n4r64dV9q3L
         be6/R3iQOTRGi5lLwNkLaBzmpa5rNlEqr2cMo9Ve/ZoZ0qJ80Y+oaMaz6hEbiizeXuSH
         7nSjabgEj/9Yqdst2TPsw6MtGO/XHn2VUec/4cj0GtXFrBIkIlrxe/I5KqHohyWTgt7W
         fLOw==
X-Forwarded-Encrypted: i=1; AJvYcCXDUQCVma1LKlDAswWhXeQAif/i+B9Eu2h7EhnLbWAjA9ak/peZ1cPhg0A8tQjy185tAcE6Euvh/zjPd9ANxWh3TL+v71HSKtIH3n2NNq4Edt+VzjseDPdj7dKJenCQls3sAnVz7RZyK3vlEwtoDv7/xp3L
X-Gm-Message-State: AOJu0Yzi7FAXgxLqN/wo/rPxvPPuAlerxgnnvCiM8EhPB4xacUE7eopc
	yQxeVimJz1cmgkzXtD7gqDKzt0vUfZnCkBFkiRbd7T18wT2zUtWw0EznPktVYSM=
X-Google-Smtp-Source: AGHT+IHTHeoAP1Va6EyerEIPegmaG3LUG8jEIT2Wbjl7h1qz5QNGYTJfVLw/VsKBgmdDj3ooqG3kTw==
X-Received: by 2002:a0d:d3c3:0:b0:607:9d44:aef1 with SMTP id v186-20020a0dd3c3000000b006079d44aef1mr2948409ywd.47.1707929230937;
        Wed, 14 Feb 2024 08:47:10 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW+REeaNbxX0X8dr7UtkacMa6T7IBZb9t1+1RWrzPvvsUxNypnfixH7Up9K4YY+iqrMnHZYbEc8fWJ8UjFkUh7c/MKdqctxgLucDp2oCi8trfYR9CEw2V2pAVC4sPWtzu2LXQzk0W0llt78Q02WfIN/7lU7
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com. [209.85.219.175])
        by smtp.gmail.com with ESMTPSA id t125-20020a0dea83000000b006078c48a265sm780072ywe.6.2024.02.14.08.47.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Feb 2024 08:47:10 -0800 (PST)
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-dcbcea9c261so2953931276.3;
        Wed, 14 Feb 2024 08:47:10 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXdYKdki3LK1q3IpxxWyhuuqEjofLC1aLiNCh55cCALHd0DFQ6w+cM7v1P2yXsBySXUUFGZezBTe3X2677CAwUZOkRw1npfZnDUwe0CdSLbDGh9Xj0hu8HD219DRQxln6gl+wj8JuZTr6tD9Pj/z49tX7Zh
X-Received: by 2002:a25:870d:0:b0:dc2:6496:f41a with SMTP id
 a13-20020a25870d000000b00dc26496f41amr2267049ybl.28.1707929230231; Wed, 14
 Feb 2024 08:47:10 -0800 (PST)
MIME-Version: 1.0
References: <946079fe606d18b97578db42dd57a31acf38b26a.1693407641.git.geert+renesas@glider.be>
 <CACRpkdbgBtAmyxfiXrZ75gAdc1DeaqMaHRNVX=nz7SuzxFU40w@mail.gmail.com>
In-Reply-To: <CACRpkdbgBtAmyxfiXrZ75gAdc1DeaqMaHRNVX=nz7SuzxFU40w@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 14 Feb 2024 17:46:57 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWJ7-3ULokmvFPRuvquTme6HFzsK=VUKpvP=CVOVqnDQQ@mail.gmail.com>
Message-ID: <CAMuHMdWJ7-3ULokmvFPRuvquTme6HFzsK=VUKpvP=CVOVqnDQQ@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: arm: realview: Fix development chip ROM
 compatible value
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Boris Brezillon <bbrezillon@kernel.org>, Ricardo Ribalda <ribalda@kernel.org>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240214_084712_530956_9B5B52D1 
X-CRM114-Status: GOOD (  21.01  )
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

SGkgTGludXMsCgpPbiBUdWUsIFNlcCAxMiwgMjAyMyBhdCA5OjE44oCvQU0gTGludXMgV2FsbGVp
aiA8bGludXMud2FsbGVpakBsaW5hcm8ub3JnPiB3cm90ZToKPiBPbiBXZWQsIEF1ZyAzMCwgMjAy
MyBhdCA1OjAz4oCvUE0gR2VlcnQgVXl0dGVyaG9ldmVuCj4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVy
LmJlPiB3cm90ZToKPiA+IFdoZW4gdGhlIGRldmVsb3BtZW50IGNoaXAgUk9NIHdhcyBhZGRlZCwg
dGhlICJkaXJlY3QtbWFwcGVkIiBjb21wYXRpYmxlCj4gPiB2YWx1ZSB3YXMgYWxyZWFkeSBvYnNv
bGV0ZS4gIEluIGFkZGl0aW9uLCB0aGUgZGV2aWNlIG5vZGUgbGFja2VkIHRoZQo+ID4gYWNjb21w
YW55aW5nICJwcm9iZS10eXBlIiBwcm9wZXJ0eSwgY2F1c2luZyB0aGUgb2xkIHBoeXNtYXBfb2Zf
Y29yZQo+ID4gZHJpdmVyIHRvIGZhbGwgYmFjayB0byB0cnlpbmcgYWxsIGF2YWlsYWJsZSBwcm9i
ZSB0eXBlcy4KPiA+IFVuZm9ydHVuYXRlbHkgdGhpcyBmYWxsYmFjayB3YXMgbG9zdCB3aGVuIHRo
ZSBEVCBhbmQgcGRhdGEgY2FzZXMgd2VyZQo+ID4gbWVyZ2VkLgo+ID4KPiA+IEZpeCB0aGlzIGJ5
IHVzaW5nIHRoZSBtb2Rlcm4gIm10ZC1yb20iIGNvbXBhdGlibGUgdmFsdWUgaW5zdGVhZC4KPiA+
Cj4gPiBGaXhlczogNWMzZjVlZGJlMGExZGZmMyAoIkFSTTogcmVhbHZpZXc6IGFkZCBmbGFzaCBk
ZXZpY2VzIHRvIHRoZSBQQjExNzYgRFRTIikKPiA+IEZpeGVzOiA2NDJiMWU4ZGJlZDdiYmJmICgi
bXRkOiBtYXBzOiBNZXJnZSBwaHlzbWFwX29mLmMgaW50byBwaHlzbWFwLWNvcmUuYyIpCj4gPiBT
aWduZWQtb2ZmLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJl
Pgo+Cj4gUGF0Y2ggYXBwbGllZCEKCkxvb2tzIGxpa2UgdGhpcyBmZWxsIHRocm91Z2ggdGhlIGNy
YWNrcz8KU2hhbGwgSSByZXNlbmQ/ClRoYW5rcyEKCkdye29ldGplLGVldGluZ31zLAoKICAgICAg
ICAgICAgICAgICAgICAgICAgR2VlcnQKCi0tIApHZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUn
cyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LW02OGsub3JnCgpJbiBw
ZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2Vs
ZiBhIGhhY2tlci4gQnV0CndoZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNh
eSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4KICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcwoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxp
bmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW10ZC8K
