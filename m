Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D96CBC43458
	for <linux-mtd@archiver.kernel.org>; Wed,  1 Jul 2026 10:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ppR5k6+HoYUEQuFdW46Ss8Ax840JnabkUDjRdUE0YDI=; b=x2HBDO2RUVeqFu
	rh4Ij8B7Rzn9ABxqMOr7q788ssJ8QDNhxZYh49ONaKP0RG3WhHqe3QiDlicMKPk67L+keejXuyK1R
	796rfbXpDtjqd/9/Vtui4KvxIEa/yui/XQVBH7uPANcvUwOdpOpizOHmtNr6V+Kmx04sZ9i0+evPM
	TI8+tfSJZh8qZwUxApP/4tDbmIhZUkpQpXAcvEl6HEMWQejSW7BX93+8SF9MJdSkJipeyEU0ULT0O
	TRQzaMqXhm6wv+y0gIBb9fDQx/9W+W7CnDtgBZc3u/JUw6UvQ/yQaLYK3H9BiIJcUpEX4IrmiGJqb
	sezsCgCX2TmZ7W4+xpNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wesZy-00000001N79-0D5l;
	Wed, 01 Jul 2026 10:54:06 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wesZw-00000001N6F-3ZIZ
	for linux-mtd@lists.infradead.org;
	Wed, 01 Jul 2026 10:54:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6550743F46
	for <linux-mtd@lists.infradead.org>; Wed,  1 Jul 2026 10:54:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36FC11F0155D
	for <linux-mtd@lists.infradead.org>; Wed,  1 Jul 2026 10:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782903244;
	bh=3dFhZqVXlPw7AKqdGyCXcF9/T5J+z7jeRJ0PFE89kgg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=jj9yNpcE4V6NcdQD4g05CJvWOH6GRskIlx3Mmm69xy5BxwxpnrT5BqC0gHnRaUFyt
	 O23edhYADsdZPU+HZKUrz/oCTTvue+X/Sp2hJmpFu2roFbszryTFSeR5HMka7v15M0
	 piz/7BCnE+I5rarI7mx8TRbeX572MZy+4DIlZ/RUU66TBUrN+Iq/kEMOXU8miLkKR/
	 QaT0LjyVP4y6A2O8sI1q6SOw1xZHoV69d7p4H5xqnwLeHBVh4QgicvGaOohR+OLjXv
	 72+VPyRgVlGIGtnMYgbqhMcUS4kG1TMB0E3Vyt8d/L1Qp43iVzWVF/2cfTSmxugvBM
	 17ZM8I8DSAy/A==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5aebd77cbb4so356256e87.2
        for <linux-mtd@lists.infradead.org>; Wed, 01 Jul 2026 03:54:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoeggHZIyCaFnQopzpu6eIK8WBEJomCatIvwlnUIPrGjOymNf/1PNoxBlOMNLFmE2307ha8xYK2IA0=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5Isp5FAEPB3CZSmovrGtKd+sAn1mu4PZsqfJoBfhIbzdAD3b3
	/cqFWncrqjDXb2OOnogIXWiyvmxEsyQrXp0uhhVH7cFjLKfTnDOfBTOmepHvK9YGSSBffkUoxYY
	ZzK3gm6bAY+ms/By2IEAs//JGN5zTjzg=
X-Received: by 2002:a05:6512:1043:b0:5ad:67d6:a2d9 with SMTP id
 2adb3069b0e04-5aec68b453fmr281719e87.39.1782903242946; Wed, 01 Jul 2026
 03:54:02 -0700 (PDT)
MIME-Version: 1.0
References: <20260630092406.150587-1-manikandan.m@microchip.com>
 <20260630092406.150587-2-manikandan.m@microchip.com> <CAD++jL=FkEfpz-LW0vmPpZ28fLfGFMWo5E479Mapz55YUxKNAQ@mail.gmail.com>
 <DJN3HIIAY4LE.3MXU9Q2YFSCJJ@walle.cc>
In-Reply-To: <DJN3HIIAY4LE.3MXU9Q2YFSCJJ@walle.cc>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 1 Jul 2026 12:53:49 +0200
X-Gmail-Original-Message-ID: <CAD++jLntmnwU3gAQfDn2nd4CQ_7HY6S_kBguVtZvVT1PktFCPw@mail.gmail.com>
X-Gm-Features: AVVi8Ce_77SqNNQU5uO1pZpVOGBbpgsRt39tcDkp1nPUZH97o9So0gRgVCLSXDs
Message-ID: <CAD++jLntmnwU3gAQfDn2nd4CQ_7HY6S_kBguVtZvVT1PktFCPw@mail.gmail.com>
Subject: Re: [PATCH v4 1/7] dt-bindings: mtd: jedec,spi-nor: allow the SFDP to
 be exposed via NVMEM
To: Michael Walle <michael@walle.cc>
Cc: Manikandan Muralidharan <manikandan.m@microchip.com>, pratyush@kernel.org, mwalle@kernel.org, 
	takahiro.kuwano@infineon.com, miquel.raynal@bootlin.com, richard@nod.at, 
	vigneshr@ti.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	srini@kernel.org, nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, 
	claudiu.beznea@tuxon.dev, linux@armlinux.org.uk, richardcochran@gmail.com, 
	arnd@arndb.de, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	netdev@vger.kernel.org
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

T24gV2VkLCBKdWwgMSwgMjAyNiBhdCAxMDozNOKAr0FNIE1pY2hhZWwgV2FsbGUgPG1pY2hhZWxA
d2FsbGUuY2M+IHdyb3RlOgoKPiBJZiBJJ20gY29ycmVjdCwgdGhpcyBpcyB0aGUgb2xkIHN0eWxl
LCBzZWUgY29tbWl0IGJkOTEyYzk5MWQyZQo+ICgiZHQtYmluZGluZ3M6IG52bWVtOiBsYXlvdXRz
OiBhZGQgZml4ZWQtbGF5b3V0IikuIFNvIGl0IHNob3VsZAo+IGV2ZW50dWFsbHkgbG9vayBsaWtl
Ogo+Cj4gc2ZkcCB7Cj4gICAgICBjb21wYXRpYmxlID0gImplZGVjLHNmZHAiOwooLi4uKQo+IEFs
c28gSSdtIG5vdCBzdXJlIGlmIHdlIHJlYWxseSBuZWVkIHRvIGFkZCB0aGUgIm52bWVtLWNlbGxz
IiBoZXJlLgo+IElJUkMgaW4gTVREIGl0IHdhcyB0aGVyZSB0byB0ZWxsIGEgZHJpdmVyIHRvIGFk
ZCBhbiBudm1lbSBkZXZpY2UgdG8KPiBhbiBhbHJlYWR5IGV4aXN0aW5nIGNvbXBhdGlibGUvbm9k
ZS4KPgo+IEFwYXJ0IGZyb20gdGhlIE1URCBjYXNlLCBJJ3ZlIGp1c3QgZm91bmQgcWNvbSxzbWVt
LXBhcnQseWFtbCB3aGljaAo+IGhhcyBjb21wYXRpYmxlID0gIm52bWVtLWNlbGxzIi4KCllvdSdy
ZSByaWdodCwgSSB3YXMgdXNpbmcgb2xkIGluZm9ybWF0aW9uLCBkaXNjYXJkIG15IGNvbW1lbnRz
Li4uClJldmlld2VkLWJ5OiBMaW51cyBXYWxsZWlqIDxsaW51c3dAa2VybmVsLm9yZz4KCkkgdGhp
bmsgbXkgY29tbWVudCBpbiB0aGUgZHJpdmVyIHRvIGNoZWNrIGZvciB0aGUgY29tcGF0aWJsZQpp
bnN0ZWFkIG9mIHRoZSBub2RlIG5hbWUgaXMgc3RpbGwgdmFsaWQgdGhvdWdoLgoKWW91cnMsCkxp
bnVzIFdhbGxlaWoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
