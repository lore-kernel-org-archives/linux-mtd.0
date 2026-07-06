Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8479DC43458
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Jul 2026 12:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LU0tXTfurO50i/SmI9em/E7Lbk+Yv0Tq97+m7at1zFA=; b=Njtl5la/yMzIek
	iLluhO/7xlOmMF08TeXywKvC7uaZpdNZ0RVkhwaqUmVM9ObzPFRl4E9WuLjpdKFPBWXtx8I4bY6YM
	yVBpH60pkRU6mXM14ByitXOHlf0NYTycb2xKL78BPAi5zMDYuN82iRljpxmcuj/fW53PFiBlVRnq3
	CYF0h7UtAxNwsNE6kSFuWhArZdaR/Rh4GEZlEoF94MsnJVJGmojB0P40aY1uO7kMLeB83G2wcW4Wp
	GBsru0ZHo664/oUqja3KNd6QnZAv2owwVK2Q8WKV9NgHWPWqikESda2JJW+xo2aKHd5/NRxOm43A9
	Q7F3Pc5NSB5xE+dkEJRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgirR-0000000CVrD-377w;
	Mon, 06 Jul 2026 12:55:45 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgirM-0000000CVqp-20jt
	for linux-mtd@lists.infradead.org;
	Mon, 06 Jul 2026 12:55:41 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-470174001a0so1521632f8f.0
        for <linux-mtd@lists.infradead.org>; Mon, 06 Jul 2026 05:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783342538; x=1783947338; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qF6R64HmcT1c2a3xEhtCiEIwl/af807a27WtqelA0FM=;
        b=fdp4ZC2rBURwEu2FhLSN3PYFu/RVinZWx1V/rCeL5pMUd+/dIep8kxD82o+v5ewMPK
         zZ5rUOSJT1FHcW33zjiXfdrXFp9bLm5ahcqLQvjDQTuH84AKbDensDQ2zQfkQjPpQdNv
         LvENOCUzx1sasilJCIpX38FD4X/M9IiAIONegL0X3yLz5LgcHMn+mxd5uUpwO34WbS36
         i7BOqeXuDKCjiyqvN8bB9EidoZZ/OOdu8Gd5B4GlFxv9KrZKiLqiJJmttz9euPy+PpT0
         xlPXqcmtJM6e2SXlzak5dCsoL4YlwurFyP+3NkfAD1i2xde773p5KOhON2KfF5m5uHyP
         g8Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783342538; x=1783947338;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qF6R64HmcT1c2a3xEhtCiEIwl/af807a27WtqelA0FM=;
        b=SM9edc7SldDBvN5i9xrTzg94pQ+EzcbBFhxP04i4xnw7UbiZB8EgaaK7TZ8AdO42Qo
         gEpnZeFbDDpd5ciCAwHuIINXEWy6Mz9/htE1TlBEYTLlXcCs+2SWUkIRP8Zo4Xj4yHHI
         PBqq5V3LiyddBqQU6IUYnBG78Rkb9PECJSszCL+5zzeJ4dRr1Xr7pwgVpPYkBYm+makP
         5AKlgJ+VlL1EqlMMPmYE1t1o0CR4xfmF1+RM6UFeYb+Dr8I8OMr3V9zo/iq16yxrKcBc
         GqhmO5owAynYA8ywBnLLFRk+1iGMWO4Bz047l8/CqLtSNRzyLUhxxK45hQ1JgiC1eu4z
         LyHg==
X-Forwarded-Encrypted: i=1; AHgh+Ro8gJj3l8ilCOu/8QWHCSgg1+zM++8ooSGydypmZ0WIRBeryQ/RTBkr0EkJ8dtbyCm7jjR5WSWlVhU=@lists.infradead.org
X-Gm-Message-State: AOJu0YybsVFPzQPy6esz4tlO9+g1aarGPeBf84ZRvcePfbRCTHsTb9Dk
	pFCSzicUDcIbG5z1tPhINvFQ35zsmqH3h6vSlqjF0Wl5QLSQUo+5PA0pehxeUsrUlao=
X-Gm-Gg: AfdE7cnKYF5QdRTsi3zktn08defF+sNg0SWlwhVq4ACecbfRC7RgoFmq1Kci/e36Mq5
	ymctEF982ncxOyZrgLXx3Aulo2FdyCQEDcEwP60PY8l4J3GgwwSdl/F7BkaI+CNI3lM4UwzOcW6
	X//FDwDovGAYQfMBX/2wEz9GwTASh09rPX4vvmfcZMeKiK8BsdfZ3MOm1EbxUpyZEZ3LTkVrL0s
	UwT7+Kfe1IwzCUQT7iDBQV26uR5dtnQyaxwb2uN59n+4U57N6qoyoVjVIIuRiHipzFRD6dX7JvC
	lbW3GnL1O9oGniFtISh58ulcswakh3D4M/F3BZ01+T9TTlk/KlhpB+E5is9j7Q1+Ap4ZTevStAn
	kTplh3Sq4PhFyqnKEDxqD5MNLMmkwQHj6B9M4kdBi6d4yMWTlwnveATNfBHWwApZeemmwYweLuA
	TVrAf0a45qDQi1FRFZBmCcTU4g
X-Received: by 2002:a5d:564b:0:b0:470:2fb1:3dca with SMTP id ffacd0b85a97d-47aac5e17damr8744560f8f.30.1783342538035;
        Mon, 06 Jul 2026 05:55:38 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff24:7210:1bb5:914d:5d25:d048])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9e4d8410sm24762493f8f.15.2026.07.06.05.55.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 05:55:37 -0700 (PDT)
Date: Mon, 6 Jul 2026 14:55:26 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-mtd@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>
Subject: Re: [PATCH 0/4] mtd: rawnand: qcom: Add MDM9607
Message-ID: <akult0UUSSwKQ8F5@linaro.org>
References: <20260608-qcom-nandc-mdm9607-v1-0-4639a0492274@linaro.org>
 <4kdjxrn3bxg7rhkdovidxv2b2f6evnknng7gjtbz7pahyqaakh@qkgxaz6xlav2>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4kdjxrn3bxg7rhkdovidxv2b2f6evnknng7gjtbz7pahyqaakh@qkgxaz6xlav2>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_055540_544912_4083E9E0 
X-CRM114-Status: GOOD (  20.23  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Miqu=E8l,

On Mon, Jun 29, 2026 at 05:46:57PM +0200, Manivannan Sadhasivam wrote:
> On Mon, Jun 08, 2026 at 03:20:21PM +0200, Stephan Gerhold wrote:
> > MDM9607 has QPIC v1.5 that supports the OP_PAGE_READ_ONFI_READ command,=
 but
> > is missing the rest of the hardware changes in QPIC v2. There is also o=
nly
> > a single clock that can be controlled using the RPM firmware. Document =
and
> > add the new qcom,mdm9607-nand compatible for this setup.
> > =

> > Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> =

> You could ammend patch 1's commit message with the information I shared i=
n the
> reply. But nevertheless:
> =

> Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
> =


Do you want me to resend the series with patch 1 commit message
adjusted? There were no other changes requested as far as I can tell.

I think the current commit message there is fine, especially if you add
the Link: tag during applying. The extra context will be there.

If you want me to resend, I would just replace the second paragraph in
patch 1 with the following:

---
On MDM9607 and other recent SoCs, the QPIC hardware requires 3 clocks
(ahb, core, aon). However, the access to these clocks is restricted to
the RPM firmware that controls the shared power resources for the whole
SoC. The clocks cannot be controlled separately, there is only a single
RPM_SMD_QPIC_CLK clock that implicitly enables all of the 3 clocks.
The only exception to this are some IPQ* SoC that are not using RPM,
there the clocks are directly controlled by the kernel via the clock
controller (GCC). Require only one clock in the dt-bindings for MDM9607
to avoid having to define dummy clock entries.
---

Thanks,
Stephan

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
