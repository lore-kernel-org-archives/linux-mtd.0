Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4E3FE77187
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Dec 2024 09:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UkqELgmzwae2ZezS3hYLzhKWelz0uyPwzeM3SxC78Y8=; b=fdzaPE+KLrsviM
	lcQO+LrKJZoK6igRkG6Gd/F1wSoIf7SLftf6NqnAySeqzSPKG/FNAv3Yc7Zlouz2WcQp4Jsosgvdl
	UXdZyKZjLy4363kFoUKxKxZTr0Qx49xVvXGFKqWVaR6MUjb46g4n1xeQcE+V/M5avKstmPC0k/Bc9
	6utKWZhE24EeOq1hnlYS8DUXEcCDh3/pZMoDqTC86K4UuGbBg0QZsmhtlqeo3EjomT3DRZry0mnki
	qNYkzBLtqcCFGFu0Am68aaRM6XKsU11fLE+pj+adbmqxUt4CMoP/szOJLjCFYJHGaWNg6c+wzw0fl
	/pTI7V8J9hSe5kTTaRYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNqek-0000000GAJE-2Ciz;
	Wed, 18 Dec 2024 09:47:50 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNqPI-0000000G77K-2LMn
	for linux-mtd@lists.infradead.org;
	Wed, 18 Dec 2024 09:31:53 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-5cecbddb574so10371469a12.1
        for <linux-mtd@lists.infradead.org>; Wed, 18 Dec 2024 01:31:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734514310; x=1735119110; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lZ1YdJtb3rH3TiiKBjVM/1DqFETQgib8Q1Jqh/ZOeHQ=;
        b=KxBpHV58Pp2kAGbVuimWhibgvzq95UM+3OKE1W6Ryq4xcAnNVpCnM12iDvVPHFQ6tT
         rngt/J72GlhmSWprOhO9mJ8QE3aqEiSluoUJmCx5lyEf7OO2tNreKEms7wMFTQA+kO4X
         UzdHjiIXJLJt46B6r0SDnM8ce3OBYpJN9cn6l5Y5HCOaYVkvi1y/KBJEV8XnZpHVhuZp
         jQHkI1Gly/BjVNhoOT0w7doXYj+10nhwrTp8RLrqJW1p+VuT1ALSdByAbxZZgJtLFIES
         cO1h0WX4QLVBesX9lVIjrMqMdElRdnejSIFjw1tnZPoyWXV1kKCB3NHRRYtJO8bzutzA
         mx7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734514310; x=1735119110;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lZ1YdJtb3rH3TiiKBjVM/1DqFETQgib8Q1Jqh/ZOeHQ=;
        b=exXJIEz53JRcw4zdx+kyzgNcOx4I1HXk9q74QoIJ2SFrTPSIWDwG5qiuXIYCf9Pz0Y
         Ms/OGs8gyu+hC1TzIxnmiciB7ZoXHPEFOrxJsGCBlU+aV6YY6zwKZMdBteV0wRen8Lkf
         Lf9H2IiINblRMWo8m6p04Nco8qiXGrQ7IeVhTgusFde8rpI4RN51AmMbEkhSUeEkP7Va
         l6UyQUIOcZZMs9E9KMZ0rK6Bqk3LgWKU470dhma02ItcyjANncTDEzAgjszc8LpOr1dE
         mlpT5Az7ag+CWkLm4byHU3aMiMfjJiL493E0MKQNBC6nc6dz4z/8H7a+wz1puyIneo6r
         5zHA==
X-Forwarded-Encrypted: i=1; AJvYcCU1dRAcD/8KZPsnOXLFnrL5W31oYepu3qvIliKNh8Z1BrNXeAs4bhypvu7ip1iCeeRymWcnphATcss=@lists.infradead.org
X-Gm-Message-State: AOJu0YxA/7hsN3YLQSNsirh+wUup864uYu82w1ag/SNRz0/w0RWM07fe
	jCMPeSrxR4KJPdTCK//Qv7yb8COb8A/wjy856jMn7wVByEaru4CnCf1a+2CGyEnklWJprH8cFl/
	vMjf399/mMmemZXEhx00fI+w+Zys=
X-Gm-Gg: ASbGncupNUsoA8tJp4eRI2qE1/PZKP6OFMwrOMXRbeG0+ozcAYP+5TEtiLNhi0S5VOu
	TwDWnv9iOzUXggpV/W4oV2YFPQO8sLklCI36w2nM=
X-Google-Smtp-Source: AGHT+IF/HJ3QAgvFxebOkkyGf3IJ/58S2RyS6Isz4e20ApGWFi/5XJPLoatg0C6IO+UJMagSFd9s235qMqMYJQbhRJU=
X-Received: by 2002:a05:6402:430e:b0:5d0:e2c8:dc8d with SMTP id
 4fb4d7f45d1cf-5d7ee3d5b5amr2063811a12.20.1734514310075; Wed, 18 Dec 2024
 01:31:50 -0800 (PST)
MIME-Version: 1.0
References: <20241217-loongson1-nand-v11-0-b692c58988bb@gmail.com>
 <20241217-loongson1-nand-v11-1-b692c58988bb@gmail.com> <x5hka7t2sxeac6nesr5r47s5bmbbiksyvky5hqoelkvaxcuhiy@7fsxv2y7deag>
In-Reply-To: <x5hka7t2sxeac6nesr5r47s5bmbbiksyvky5hqoelkvaxcuhiy@7fsxv2y7deag>
From: Keguang Zhang <keguang.zhang@gmail.com>
Date: Wed, 18 Dec 2024 17:31:13 +0800
Message-ID: <CAJhJPsWdbmOHTtqPxXDjr+hn1RhxpWobr6m+Vinc+xBT8QhctA@mail.gmail.com>
Subject: Re: [PATCH v11 1/2] dt-bindings: mtd: Add Loongson-1 NAND Controller
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-media@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_013152_596122_A9EDB1BB 
X-CRM114-Status: GOOD (  10.55  )
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

T24gV2VkLCBEZWMgMTgsIDIwMjQgYXQgNTowMeKAr1BNIEtyenlzenRvZiBLb3psb3dza2kgPGty
emtAa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBUdWUsIERlYyAxNywgMjAyNCBhdCAwNjoxNjo0
OVBNICswODAwLCBLZWd1YW5nIFpoYW5nIHdyb3RlOgo+ID4gKwo+ID4gK3Byb3BlcnRpZXM6Cj4g
PiArICBjb21wYXRpYmxlOgo+ID4gKyAgICBvbmVPZjoKPiA+ICsgICAgICAtIGVudW06Cj4gPiAr
ICAgICAgICAgIC0gbG9vbmdzb24sbHMxYi1uYW5kLWNvbnRyb2xsZXIKPiA+ICsgICAgICAgICAg
LSBsb29uZ3NvbixsczFjLW5hbmQtY29udHJvbGxlcgo+ID4gKyAgICAgIC0gaXRlbXM6Cj4gPiAr
ICAgICAgICAgIC0gZW51bToKPiA+ICsgICAgICAgICAgICAgIC0gbG9vbmdzb24sbHMxYS1uYW5k
LWNvbnRyb2xsZXIKPiA+ICsgICAgICAgICAgLSBjb25zdDogbG9vbmdzb24sbHMxYi1uYW5kLWNv
bnRyb2xsZXIKPiA+ICsKPiA+ICsgIHJlZzoKPiA+ICsgICAgbWF4SXRlbXM6IDIKPiA+ICsKPiA+
ICsgIHJlZy1uYW1lczoKPiA+ICsgICAgaXRlbXM6Cj4gPiArICAgICAgLSBjb25zdDogbmFuZAo+
ID4gKyAgICAgIC0gY29uc3Q6IG5hbmQtZG1hCj4KPiBBcmUgeW91IHN1cmUgdGhlc2UgYXJlIHNl
cGFyYXRlIGFkZHJlc3Mgc3BhY2VzPwo+IDwweDFmZTc4MDAwIDB4MjQ+LCA8MHgxZmU3ODA0MCAw
eDQ+Cj4gc3BhY2luZy9kaXN0YW5jZSBvZiAhNCB3b3Jkcy4uLgo+ClN1cmUuIFRoYXTigJlzIGV4
YWN0bHkgd2hhdCB0aGUgdXNlciBtYW51YWwgc3RhdGVzLgoKPiBCZXN0IHJlZ2FyZHMsCj4gS3J6
eXN6dG9mCj4KCgoKLS0KQmVzdCByZWdhcmRzLAoKS2VndWFuZyBaaGFuZwoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNj
dXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LW10ZC8K
