Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C794C76196
	for <linux-mtd@archiver.kernel.org>; Sat,  1 Apr 2023 21:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zEzI79iL/1yMowZKXM+xHdFZ/yxZP9cD4iTmnOwGY4Y=; b=UIHqU+8tC9N3FZ
	bXXynefIaTj6WqAuGD/PhAOjIw3URjEIe4kkCP6ugNgx9nKNXD1yScrt6YdP9sFMHDncvbJkebTs0
	JrBKEBAPRWl02eq2N8LanUy9X85DlbLrFoQ9nl4hRWIULgMFkMBqn7H8QITI9wUMm284fNIQANWhN
	h1H2sEKwVM2N6azx3jZ+q8xT3Cgq3cu2MZruzLxbPue9OWdsH0rGV8WzY5vusFWPGET81xih7k5Qa
	haUHh/gbILUyFySunaGPCYA8sY0mVe0wThjC5ycCV33KA0v2DyDI+Qk6K4yM4cAxFc36Oslry+7vm
	uBL8CNvli6KBLCJgsHtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piiov-00BL36-1U;
	Sat, 01 Apr 2023 21:31:33 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piios-00BL2S-0L;
	Sat, 01 Apr 2023 21:31:31 +0000
Received: by mail-ed1-x52f.google.com with SMTP id r11so103203177edd.5;
        Sat, 01 Apr 2023 14:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112; t=1680384688;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dt5ngga/lv9sqqVvq2wzQnqY8glMlw+sCOIGV96ACzk=;
        b=m/TZgiBLUsKpYohthUQ4aegzSVWjkZkzZ4mAS5L6oB4U2BsAAR+zCXqUdngWCrmPrV
         N/lq+E+ijV4ZOid0UIjyTRI1iTpPEdK/VP+TZcnbbySpkyxXG+wo25x387SyPx4hM6Uz
         qj3eAOLUE6Mx+M7+ghwuitCrN0J9F/h7GXPBXRyCzYB3MxDJKeDpfUsHawADKxy6DSuc
         256ISU3fYlrEUGWq5nStPtb5Zk/UmT0UFqA38gGjdNoEHoeQAKVnM+KM+fEx2mmM6uy4
         1z6wQ3iQXQrhXlHPNiqjGOseDVekFfvXjXJiGYvEPEU8j2yTPAMZcjqYF2949nPbQ9o0
         r0kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680384688;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dt5ngga/lv9sqqVvq2wzQnqY8glMlw+sCOIGV96ACzk=;
        b=L+VmFmGD/Tj8sOpuOluol2pAZsUhvmvjjUPiVLdpGuh5Rh/zb7w0Xwj6FmZkyZxXYX
         nzMJusZor/QeMPZuRR/fSw+3dPdleRpLhdIYC7tGef/voOc+2cF6iG449ITOm8/LbfkU
         4Nbi722EYk85eC2PJ9Xro/h00Lq5voNf8hg5SGCGPyuATifSX7iHTUt156d8Lx4c3EWl
         SO0/QHPP1EtGrrX5gV3wNRKHs9n96bgOQO1xi0i1ohL6Ss7c4aO9HjvKD9s3cxLqTXz/
         TM9k5m17ukYFg6GlQwicOw4p8KXlsAEh4yVgkPiMtitt1ysyxMgDZM72V9TqpaqzLl82
         mThg==
X-Gm-Message-State: AAQBX9cfzc0v1Tvzakc276Z/ReF1VVakAMhTP3ejF16zJnPY0MX8qC2j
	JhR8lhg5NHeF505aUDEVSTvOscu6j37fqQSLoBs=
X-Google-Smtp-Source: AKy350aP8rnVsT/fHzmre+ExQt6kcQ5QGNY4yvEG20mUHHz1MphFj30Cd4/hyr8FheYGVTvAlfeUnQLNGGljN08COKw=
X-Received: by 2002:a17:906:e08c:b0:920:da8c:f7b0 with SMTP id
 gh12-20020a170906e08c00b00920da8cf7b0mr16163779ejb.6.1680384687960; Sat, 01
 Apr 2023 14:31:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230401161938.2503204-1-u.kleine-koenig@pengutronix.de> <20230401161938.2503204-26-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230401161938.2503204-26-u.kleine-koenig@pengutronix.de>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 1 Apr 2023 23:31:17 +0200
Message-ID: <CAFBinCA4A+reBNE0beub62ffOysSGHK6PhS-e+LB90pJ2thnkQ@mail.gmail.com>
Subject: Re: [PATCH 25/49] mtd: rawnand: meson: Convert to platform remove
 callback returning void
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Liang Yang <liang.yang@amlogic.com>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Richard Weinberger <richard@nod.at>, 
	Jerome Brunet <jbrunet@baylibre.com>, linux-mtd@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	kernel@pengutronix.de
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230401_143130_148772_5078D3E0 
X-CRM114-Status: GOOD (  11.51  )
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

T24gU2F0LCBBcHIgMSwgMjAyMyBhdCA2OjE54oCvUE0gVXdlIEtsZWluZS1Lw7ZuaWcKPHUua2xl
aW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4gd3JvdGU6Cj4KPiBUaGUgLnJlbW92ZSgpIGNhbGxi
YWNrIGZvciBhIHBsYXRmb3JtIGRyaXZlciByZXR1cm5zIGFuIGludCB3aGljaCBtYWtlcwo+IG1h
bnkgZHJpdmVyIGF1dGhvcnMgd3JvbmdseSBhc3N1bWUgaXQncyBwb3NzaWJsZSB0byBkbyBlcnJv
ciBoYW5kbGluZyBieQo+IHJldHVybmluZyBhbiBlcnJvciBjb2RlLiBIb3dldmVyIHRoZSB2YWx1
ZSByZXR1cm5lZCBpcyAobW9zdGx5KSBpZ25vcmVkCj4gYW5kIHRoaXMgdHlwaWNhbGx5IHJlc3Vs
dHMgaW4gcmVzb3VyY2UgbGVha3MuIFRvIGltcHJvdmUgaGVyZSB0aGVyZSBpcyBhCj4gcXVlc3Qg
dG8gbWFrZSB0aGUgcmVtb3ZlIGNhbGxiYWNrIHJldHVybiB2b2lkLiBJbiB0aGUgZmlyc3Qgc3Rl
cCBvZiB0aGlzCj4gcXVlc3QgYWxsIGRyaXZlcnMgYXJlIGNvbnZlcnRlZCB0byAucmVtb3ZlX25l
dygpIHdoaWNoIGFscmVhZHkgcmV0dXJucwo+IHZvaWQuCj4KPiBUcml2aWFsbHkgY29udmVydCB0
aGlzIGRyaXZlciBmcm9tIGFsd2F5cyByZXR1cm5pbmcgemVybyBpbiB0aGUgcmVtb3ZlCj4gY2Fs
bGJhY2sgdG8gdGhlIHZvaWQgcmV0dXJuaW5nIHZhcmlhbnQuCj4KPiBTaWduZWQtb2ZmLWJ5OiBV
d2UgS2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlPgpSZXZpZXdl
ZC1ieTogTWFydGluIEJsdW1lbnN0aW5nbCA8bWFydGluLmJsdW1lbnN0aW5nbEBnb29nbGVtYWls
LmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
