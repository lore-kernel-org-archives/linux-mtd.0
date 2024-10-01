Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D82A5CEACE8
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Oct 2024 16:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T6kDjFB0UobJQ1z+SL1Xg4IieM0MwIl/SOvrmK/0VqE=; b=SQHfDl9jIbvraQ
	OU6AhBwRuR5/MDp2azaTZyPHq1WCXudJ9Ac8WpLBvwQUCq53+nTbsrUQxfxcfSuqac5EVk8KGojC6
	YMV9BAHUSsWaxxFl9qkqqTXt7WpcQm1FzAEh/0GhB7P1Ie3qNbWiGE3acW8fCRvxEWfs9KdGekkWp
	j3FZXQOR2IpjLYVsvLSjfup/atyeKoErQB0Uc8+4jrUDjZrwgcYmSZ/lroxGQfmUGC5axCzRHA5xy
	oBXgMUrTNxq00kon3RaO+X7UgfPau8J64jJqxAJbWsKEgXJ4na0HWXl8WOWK1EaTl64hH9I/LJ/jy
	KO0fWYVoa/5bDqRPQSxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svfxU-00000003Zv5-2QVc;
	Tue, 01 Oct 2024 16:42:44 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svfxQ-00000003ZuZ-2tJi
	for linux-mtd@lists.infradead.org;
	Tue, 01 Oct 2024 16:42:41 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-5398996acbeso5087661e87.1
        for <linux-mtd@lists.infradead.org>; Tue, 01 Oct 2024 09:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727800958; x=1728405758; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V6i7vWcWmPggAvHHEAieW2NuSXRKfSov4TjQFiR69WU=;
        b=EcKjNgaFfn3xfLcHRiXgHEUpW8oTYW4MWDtiqSN7QShaf3gDJeyqdoNXoBWOPFGnC1
         cclkK1R23bUDE1AKpnGXXgwWoqaXH1zSO9ls0T8vzQdCQKROcR0UPFuDUQHbO6dQaXS+
         cPmqU6srwwiX3pBqDIrsdGl6lOrDaEokqAvGgbSiPXQvP/Nkq2fGHhhLZHWUiIjIt51H
         4XJfYz8J0CXuyCMaINd9QBIeV1jSBr1QVuRaj4JPp0T9q+lArdutgDTshnVZGJYuRYdT
         UcL+3y+1iNdURXScmOu7sz8MdcJaTyaIAoMa5xPGkO/jlJwNAmGfWLd5pNetLGlWup4b
         s2Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727800958; x=1728405758;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V6i7vWcWmPggAvHHEAieW2NuSXRKfSov4TjQFiR69WU=;
        b=ZugLHNG6me3gQtzvvjEQvMCrs+pOr13GEon+otq+LhF8OtuChmcLDCjXPaceXgnMy2
         QGVPX4fT8VlppiYgaISOKSh2IRKThMIVhEryu2MVpdjjqUMjGccgUipRmWxYUqxgA59G
         v9Avnv8JttuQGsmT7MbgL5Y1GkX/6BUzxeVMlG2hBYk5UllNHWsFsQ5XdJ7eRfharw0s
         sj/5Qetv2G3WCtQlXzDTnx/qnA1Gn2y2PF4A0vk5g2xZYpGX2rWxEfqAiMcDGC3fEWDP
         FfphQVLopFSK5a+uSeAXHJs6z7EVhGzULpzU+BEcJZwWVCvhotRczpLcEMIOhGWKzgKQ
         K+UQ==
X-Forwarded-Encrypted: i=1; AJvYcCWsE5xPi0IwvVJZ/G5wVa4arTC90hODCKeBLg4a7z338ZWPeSjnzdIe7VF2HczYvRldp+V+4D7xI1o=@lists.infradead.org
X-Gm-Message-State: AOJu0YwzCv50NW9aiMHLeQ2ZkhpuIJcFAMPMLe2Ts+1BoJcbbubpcC3L
	pX8YjbGDKfdKJr8cgcXo5OrxpEJ+qkara35fVUYtOvA978tHEEkHIOMoxfbdp1xaG3D+pDgm2jG
	bsfxmzuGhmdGSXnzhFS3cBZedf73UELRY
X-Google-Smtp-Source: AGHT+IHrY7301UmnL2Imcx/jn4R4Bb+f9nqvndhDoNb5KoBwiAbH01vr7CF3mvxGbkFApgIhoFOuXGohXFlDj85XM5c=
X-Received: by 2002:a05:6512:3f11:b0:536:54e9:3a63 with SMTP id
 2adb3069b0e04-539a07a339bmr7710e87.49.1727800957816; Tue, 01 Oct 2024
 09:42:37 -0700 (PDT)
MIME-Version: 1.0
References: <20241001163106.4169421-1-han.xu@nxp.com>
In-Reply-To: <20241001163106.4169421-1-han.xu@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 1 Oct 2024 13:42:26 -0300
Message-ID: <CAOMZO5CsoTAPHBkuDw_zgArRX0g=aUNeVJQPzD=dv9qTtjXU1A@mail.gmail.com>
Subject: Re: [PATCH 1/2] mtd: nand: raw: gpmi: switch to SYSTEM_SLEEP_PM_OPS
To: Han Xu <han.xu@nxp.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, imx@lists.linux.dev, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241001_094240_757904_776B7A0B 
X-CRM114-Status: UNSURE (   9.17  )
X-CRM114-Notice: Please train this message.
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

T24gVHVlLCBPY3QgMSwgMjAyNCBhdCAxOjMy4oCvUE0gSGFuIFh1IDxoYW4ueHVAbnhwLmNvbT4g
d3JvdGU6Cgo+ICBzdGF0aWMgY29uc3Qgc3RydWN0IGRldl9wbV9vcHMgZ3BtaV9wbV9vcHMgPSB7
Cj4gLSAgICAgICBTRVRfU1lTVEVNX1NMRUVQX1BNX09QUyhncG1pX3BtX3N1c3BlbmQsIGdwbWlf
cG1fcmVzdW1lKQo+IC0gICAgICAgU0VUX1JVTlRJTUVfUE1fT1BTKGdwbWlfcnVudGltZV9zdXNw
ZW5kLCBncG1pX3J1bnRpbWVfcmVzdW1lLCBOVUxMKQo+ICsgICAgICAgU1lTVEVNX1NMRUVQX1BN
X09QUyhncG1pX3BtX3N1c3BlbmQsIGdwbWlfcG1fcmVzdW1lKQo+ICsgICAgICAgUlVOVElNRV9Q
TV9PUFMoZ3BtaV9ydW50aW1lX3N1c3BlbmQsIGdwbWlfcnVudGltZV9yZXN1bWUsIE5VTEwpCj4g
IH07CgpZb3UgbWlzc2VkIHRvIGNoYW5nZSAucG0gPSAmZ3BtaV9wbV9vcHMsIHRvIC5wbSA9IHBt
X3B0cigmZ3BtaV9wbV9vcHMpLAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
