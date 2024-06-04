Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6105EC25B75
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Jun 2024 01:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0PaQg99h7O8hdN1Pd4Wu3rd42WeqwKCc3kurhZmVHb4=; b=nsVwv8B7+AtXcD
	/vDJOnNzA3X4ijgWbYIlbkZBlL+Sos6VSjv4645teQhmO6u1fbU4enC+XctZBS8PXr+vNQya9qgib
	ZJkaVTcweVb7VRkBJ9C0Yo8kLFmrWnxumm6bLQb5iiIzmZASETkMyZywNddRQfmsZPHIQveN8cG++
	N4ub2r1FaTT/C1gPsOF6vXH43henVyPxplKqtfyZ7FCeCMVWJptc0VnuxmpJqHnJFN0N8bNcPD5v3
	INzYjKkNfgS6NhUN1WOrGXB28aHAB6Xvm+7mwbGAcI4Lz5jeiSkQJ1IOMS/u7NUKf4usok0Wx3UI4
	AcsLi988h7AVM84fbDmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEJE1-00000000qWr-2oSB;
	Tue, 04 Jun 2024 01:44:33 +0000
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEJDy-00000000qUQ-1WPf
	for linux-mtd@lists.infradead.org;
	Tue, 04 Jun 2024 01:44:32 +0000
Received: by mail-pj1-x1043.google.com with SMTP id 98e67ed59e1d1-2c1e6fcb2f1so2838467a91.1
        for <linux-mtd@lists.infradead.org>; Mon, 03 Jun 2024 18:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717465467; x=1718070267; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jvi35CutHOvk8L4T40KqLdLme+seQz75uz8K1IuqiKI=;
        b=DVzO8XWxjyljGyLAvwBDvby9rrLmKP1y+leDN2XBgh3t4oirxcNwmv7YrASI+cqb9Y
         KkjnEL62uaWGVkGuMqyvkf+uoZWU/eZODfVqGbbwwAritdBQI1f1EWjHMdKGMquMNjIS
         Jf6qZEtlMIZwViWOj5SqnSLa9HUeTicHuYK2Npwf3L7oPq13UHpFO1KkTW6MCfcu69mo
         Vn08vqh0mOaaL0mC4+BZjOBuL1Ab/eezjafMP0zNFXPawlZlm8yJ+JeQo5vtYAQrf5WB
         HWoC4z52lKeFQwn7sviiip53HFPx9dRFKy3AqLaP4G/XZiOOj0PkMen6Plsf8RT3NPYU
         7Uaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717465467; x=1718070267;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jvi35CutHOvk8L4T40KqLdLme+seQz75uz8K1IuqiKI=;
        b=xQZO+eie4eM7KYghw4Q7p1mogDMZApGGk2gXolha9OhPOjPwxNScnbflN/H49o2VvW
         xdzIwpVB7BFcrFB2Kw7U5suvbrQCPJallTj00V1nYYZczY9m6R4mAUC3XyMQgp3zgnFc
         280+QuuW2sQQdA69nbmhLfuoXQv8hs+PZxktMfxeTsbkGMCRq/+8IFdkXc3OBxsUIiq5
         8fMePhK48OI3sALDDqOpLxuQP4a5aPHj01cmNwOk8Ss1JXRxtpoHcFD89eH4R3d1af3f
         rWFn3f96m3FzDF+oKc188WXRE6U+ya5lopXWDABg/4YsQI7rmPaLvXnZWdEkTTz8Ir9O
         2PIw==
X-Forwarded-Encrypted: i=1; AJvYcCUYIqgMzmPF+5wku6CKjnlOnwCsKIU7nIMCJjCOPhQ5oOPawqwDLHVgZo2pGdAYp2ocCfaAZRmlG2ww9kBm/RTuv4mLdmNLzO96NHNgMw==
X-Gm-Message-State: AOJu0YwxlSSKJhm4FfVsbMGQJfcXBiTErRng2CJkUO1L90KHlXkJJ7v6
	Gqjpv6x/x3V7COMbqPt2w1hteMlDgH4VXwAcL1ZIO/KFKNIJP8mmVuVgf7wZY89doWcpGIvLA89
	CRSVPvE3/yC1FAnGKSJ5Jtyok1vc=
X-Google-Smtp-Source: AGHT+IFhp4rKoM4tYI0AmyHbd1SD0L7TWWRFvRLc+IzUN28sOCydRuy8wSF9EeCiqZdTdg6jyPw9gvpqW/SsAaML6jY=
X-Received: by 2002:a17:90a:530c:b0:2c2:4106:1ada with SMTP id
 98e67ed59e1d1-2c241064fc5mr3042177a91.16.1717465467248; Mon, 03 Jun 2024
 18:44:27 -0700 (PDT)
MIME-Version: 1.0
References: <20240603073953.16399-1-linchengming884@gmail.com> <2024060337-relatable-ozone-510e@gregkh>
In-Reply-To: <2024060337-relatable-ozone-510e@gregkh>
From: Cheng Ming Lin <linchengming884@gmail.com>
Date: Tue, 4 Jun 2024 09:44:01 +0800
Message-ID: <CAAyq3SYg3Qr08DguhPbC8Bb89_KS_AAG-Z8SNG_A7H_v4YNrDA@mail.gmail.com>
Subject: Re: [PATCH] Documentation: mtd: spinand: macronix: Add support for
 serial NAND flash
To: Greg KH <gregkh@linuxfoundation.org>
Cc: miquel.raynal@bootlin.com, dwmw2@infradead.org, 
	computersforpeace@gmail.com, marek.vasut@gmail.com, vigneshr@ti.com, 
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, richard@nod.at, alvinzhou@mxic.com.tw, 
	leoyu@mxic.com.tw, Cheng Ming Lin <chengminglin@mxic.com.tw>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240603_184430_424373_D6B17ED4 
X-CRM114-Status: GOOD (  15.43  )
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

SGVsbG8sCgpHcmVnIEtIIDxncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZz4g5pa8IDIwMjTlubQ2
5pyIM+aXpSDpgLHkuIAg5LiL5Y2IMzo1OOWvq+mBk++8mgo+Cj4gT24gTW9uLCBKdW4gMDMsIDIw
MjQgYXQgMDM6Mzk6NTNQTSArMDgwMCwgQ2hlbmcgTWluZyBMaW4gd3JvdGU6Cj4gPiBGcm9tOiBD
aGVuZyBNaW5nIExpbiA8Y2hlbmdtaW5nbGluQG14aWMuY29tLnR3Pgo+ID4KPiA+IE1YMzVVRnsx
LDIsNH1HRTRBRCBhbmQgTVgzNVVGezEsMn1HRTRBQyBoYXZlIGJlZW4gbWVyZ2UgaW50bwo+ID4g
TGludXgga2VybmVsIG1haW5saW5lLgo+Cj4gVHJhaWxpbmcgd2hpdGVzcGFjZSA6KAoKU29ycnks
IHdlIHdpbGwgZml4IGl0IGluIHRoZSBuZXh0IHZlcnNpb24uCgo+Cj4gPiBDb21taXQgSUQ6ICJj
Mzc0ODM5ZjliNDQ3NTE3M2U1MzZkMWVhZGRmZjQ1Y2I0ODFkYmRmIi4KPgo+IFNlZSB0aGUga2Vy
bmVsIGRvY3VtZW50YXRpb24gZm9yIGhvdyB0byBwcm9wZXJseSByZWZlcmVuY2UgY29tbWl0cyBp
bgo+IGNoYW5nZWxvZyBtZXNzYWdlcy4KClN1cmUsIHRoaXMgd2lsbCBhbHNvIGJlIGZpeGVkIGlu
IHRoZSBuZXh0IHZlcnNpb24uCgo+Cj4gPiBGb3IgU1BJLU5BTkQgZmxhc2ggc3VwcG9ydCBvbiBM
aW51eCBrZXJuZWwgTFRTIHY1LjQueSwKPiA+IGFkZCBTUEktTkFORCBmbGFzaCBNWDM1VUZ7MSwy
LDR9R0U0QUQgYW5kIE1YMzVVRnsxLDJ9R0U0QUMgaW4gaWQgdGFibGVzLgo+ID4KPiA+IFRob3Nl
IGZpdmUgZmxhc2hlcyBoYXZlIGJlZW4gdmFsaWRhdGUgb24gWGlsaW54IHp5bnEtcGljb3plZCBi
b2FyZCBhbmQKPiA+IExpbnV4IGtlcm5lbCBMVFMgdjUuNC55Lgo+Cj4gV2hhdCBkb2VzIDUuNC55
IGhhdmUgdG8gZG8gd2l0aCB0aGUgbGF0ZXN0IG1haW5saW5lIHRyZWU/ICBJcyB0aGlzCj4gdGVz
dGVkIG9uIG91ciBsYXRlc3QgdHJlZT8KCldlIGhhdmUgcmVxdWlyZW1lbnRzIHNwZWNpZmljIHRv
IHRoZSA1LjQueSwgYW5kIHRoZXNlIGZpdmUgZmxhc2hlcwpoYXZlIGJlZW4gYWRhcHRlZCBmb3Ig
dGhlIGxhdGVzdCBtYWlubGluZSB0cmVlLgpBZGRpdGlvbmFsbHksIHRoZXkgaGF2ZSBiZWVuIHBh
dGNoZWQgb24gTFRTIDUuMTQueSwgYW5kIHdlIGhhdmUKdGVzdGVkIHRoZW0gb24gTFRTIDUuNC55
LgpHaXZlbiB0aGVzZSBjaXJjdW1zdGFuY2VzLCB3ZSBhcmUgaG9wZWZ1bCBmb3IgYXBwcm92YWwg
dG8gYmFja3BvcnQKdGhlc2UgZml2ZSBmbGFzaCBJRHMgb24gNS40LnkuCgo+Cj4gdGhhbmtzLAo+
Cj4gZ3JlZyBrLWgKClJlZ2FyZHMsCkNoZW5nIE1pbmcKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWls
aW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1tdGQvCg==
