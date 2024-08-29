Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81E06C7115D
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Aug 2024 05:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:Subject:References:Cc:
	To:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KNL/cvuMCgO3kczoYA7SNe+MxOuRh0NYS4y685l0bWg=; b=iZV3TYnh/UqWpB
	AKH6Ont5WTKCGj3uci9M9oeuCYBJdnq6u5B60+bHB+5HLdjPBYnhNMemRyHgBy6OQx5s1M5fsiJIj
	juKjMDjGad+7y5G6MMeMM+V5xM07O+JYPRgG6NXR0jrUImMqS8Fn/o7k3pwchOoHfgqYV48pS8yFg
	AUyjj/tqx8hcVRlgLkI3/ah7yVaG8P5yA7uVHMNy7gDMM4tsMbX2QFnY88alEwxTO0gvO1sDwW/YH
	3mDuXsJasTn99B0BPNwbs79E/N0kIezzyf5sTx5pCtlcy5TO1S/xN715lqyhSPHh5w3BONI8WeoUu
	QcifHSBeylIQ2UL0IMSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjXQx-00000000Yc2-0arP;
	Thu, 29 Aug 2024 05:10:59 +0000
Received: from mout.web.de ([217.72.192.78])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjXQt-00000000Yav-1lkR;
	Thu, 29 Aug 2024 05:10:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1724908225; x=1725513025; i=markus.elfring@web.de;
	bh=x0H5LhWeBnap376Af69NmB4TBfSaSBhzBfGyQjPVPB8=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=cHEoehbuOE6W4x4I+N76/6FiOuExmeFWUQhfWdrSV6PTsN/9DWrmoO0yxJsOUl2V
	 WQyAXumerCU8oJtd1SB2jlFzuc0w1jifSl1EE0sPCoX8YxiIZyqCm094CmDAsq9BO
	 byzdlRxIWacR1tQrZbE5k0N995stzs+mcvg6NI5iIk2X0M2o/AotPb2xv5AxmNKjx
	 4v5W1d0DkJa55QzPs5OJInjNm3cN0Gu0cHromuMOj8F7XvPHLRjJU7dhROuz8PTr/
	 a3803NJS2XlpDqnlHyTa+9l0+fjKyRHXoimeADK7tg26lV7/WzLbV3ixPQLueS/hF
	 FT/i/2q+bk5syQNi+g==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.84.95]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1Myv72-1rp71X22zK-00uSO5; Thu, 29
 Aug 2024 07:10:25 +0200
Message-ID: <75ffe2db-a5d5-471b-9e8b-53b98e75368e@web.de>
Date: Thu, 29 Aug 2024 07:10:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Hui-Ping Chen <hpchen0nvt@gmail.com>, linux-mtd@lists.infradead.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Conor Dooley <conor+dt@kernel.org>, Esben Haabendal <esben@geanix.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Rob Herring <robh@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: LKML <linux-kernel@vger.kernel.org>
References: <20240821071132.281018-3-hpchen0nvt@gmail.com>
Subject: Re: [PATCH v3 2/2] mtd: rawnand: nuvoton: add new driver for the
 Nuvoton MA35 SoC
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240821071132.281018-3-hpchen0nvt@gmail.com>
X-Provags-ID: V03:K1:P17nbWou0TFVsrRb5ZgVibk9Jj9ThMZLILYHiiSBcaB4zGnpU7i
 d3nGa573rBMdE/Sn7xSbbnb4oG20qYzkXmvPMobuVmM2/OOl25j7K2jCCqjwFMBOwvNDosc
 3P5I8cuiD2iyp1ey55TCcv/3krjIddp9i+FsQ2jR4V7aNrDZHIRxiwOCjLHSE12IE339m/M
 EWV4excC/Vf/yiN1hOa5w==
UI-OutboundReport: notjunk:1;M01:P0:uyUJvvjWHBA=;lmK5yfkuO6oybTgUqjJef7gzTex
 C+IW3/jqkkEk+ehwv0zec1lU4cceppSd2W4RDl2aDbvRfuhOc03lCoKS9TkcPoXzV2aaZyB4x
 a7S/FoTIuXAscD78GSCSfXhVAUxbDzYYLRPP6c0f0XW6u/Th73nPovPIgW5X7n9o4+arSYRoa
 2G09L5hafj4i+oQiyUN155ulJ2skjCRzJjjw1O+x3sneXPdtYrfL/2VjV+6eCVTcL+HukpKcz
 BgXHULCNz9bsQzrwgEW/cSOvCAH+5NsLAPvH/IzvD7xnBMI6xw9s7QY/VLEuvrXrj05shXOb8
 k5bAR8x/VWWz1bZYuuqsXvy8Zv7fJfZ/0M7EYxRQT8iXRSCB4GsAw9tSqBM6n+s8S1eyHTOgp
 +J831BdHjlxrhuWd+Y9YAQUMTU+E/Aaye0hHVyXZCccxL/IdLQKA3jlVCXalyrKGbBM3kjp1I
 Be9+K66xldnuE3yO/tREJNMX1KLbYrwSKIzLK+i2wyHxkVgCh1NWCxzebysQo2d4DNih6DUdi
 feVPauS3pLZVyia992XftojjPmTmMdL0TBgLjoosZaw1iSeakczlH6YuP6Sfx7j5Wm+o2FDtb
 3Czh+AUiZN+0wreGIEa5BCWmoqPlvP1M88YO8IQuGe58/J9l5b4uNpTcQGl96pNpkNhjbDjRR
 dkLVvX5NNLPQjHjEm6v+bIbRKUO1iReFOG4HRwgjhX2e6HwlKJ0PMLyC/X/uoK/t7kLQe3QXE
 QwObMRqOyZpZxIfMnCg9v/zXzBHGyuGs1t43LhfeIoumZYy6OyJsFvlc7qv9KUz6Em9aPpS4X
 0ojkGP9/sW9GbLSQamt+VVvg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240828_221055_860600_8E1BE5E9 
X-CRM114-Status: UNSURE (   7.27  )
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

PiBOdXZvdG9uIE1BMzUgU29DcyBOQU5EIEZsYXNoIEludGVyZmFjZSBDb250cm9sbGVyCj4gc3Vw
cG9ydHMgMktCLCA0S0IgYW5kIDhLQiBwYWdlIHNpemUsIGFuZCB1cCB0byA4LWJpdCwKPiAxMi1i
aXQsIGFuZCAyNC1iaXQgaGFyZHdhcmUgRUNDIGNhbGN1bGF0aW9uIGNpcmN1aXQKPiB0byBwcm90
ZWN0IGRhdGEgY29tbXVuaWNhdGlvbi4KCllvdSBtYXkgb2NjYXNpb25hbGx5IHB1dCBtb3JlIHRo
YW4gNTMgY2hhcmFjdGVycyBpbnRvIHRleHQgbGluZXMKb2Ygc3VjaCBhIGNoYW5nZSBkZXNjcmlw
dGlvbi4KaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdG9y
dmFsZHMvbGludXguZ2l0L3RyZWUvRG9jdW1lbnRhdGlvbi9wcm9jZXNzL3N1Ym1pdHRpbmctcGF0
Y2hlcy5yc3Q/aD12Ni4xMS1yYzUjbjQ1CgoK4oCmCj4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9y
YXcvbnV2b3Rvbl9tYTM1ZDFfbmFuZC5jCj4gQEAgLTAsMCArMSwxMDY4IEBACuKApgo+ICtzdGF0
aWMgaXJxcmV0dXJuX3QgbWEzNV9uYW5kX2lycShpbnQgaXJxLCB2b2lkICppZCkKPiArewrigKYK
PiArCXUzMiBpc3I7Cj4gKwo+ICsJc3Bpbl9sb2NrKCZuYW5kLT5kbWFfbG9jayk7CuKApgo+ICsJ
c3Bpbl91bmxvY2soJm5hbmQtPmRtYV9sb2NrKTsKPiArCj4gKwlyZXR1cm4gSVJRX0hBTkRMRUQ7
Cj4gK30K4oCmCgpVbmRlciB3aGljaCBjaXJjdW1zdGFuY2VzIHdvdWxkIHlvdSBiZWNvbWUgaW50
ZXJlc3RlZCB0byBhcHBseSBhIHN0YXRlbWVudApsaWtlIOKAnGd1YXJkKHNwaW5sb2NrKSgmbmFu
ZC0+ZG1hX2xvY2spO+KAnT8KaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjYuMTEt
cmM1L3NvdXJjZS9pbmNsdWRlL2xpbnV4L3NwaW5sb2NrLmgjTDU1OQoKUmVnYXJkcywKTWFya3Vz
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
