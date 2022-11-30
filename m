Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99A5DC4321E
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Nov 2022 09:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Bgq3EMNByt+nATaZUVIibxrFAEvtIpDnPRZ0JoNbHuU=; b=0hwukCXV0jQOlS
	3NGV2xmjOrZx0nw/UeiDFl/knA4+Ip2JrJm/jtGSh62YzEE32P2Erhq/mWR0AUr/lDNvzX8i9aW/c
	7TCDxFVonVsGyhLI851/b88At1bdzO/Er4dFpowIwsqyPb8CbMgAypgtfgXPRWd8bxxuClYGsn/Lv
	WNxB9iJciEYxS8uI6gtsHTUyIb3xvYAx+fWqrcLhkP+yjgt5fzH35JAgGyOcFuJ86JUteYIbaMonC
	xHJZmzKic6+w0lckLEgLJTBX2dWLb8865C77RN11iCdl5hWMU3FcL0h2qlRG1eIj+hMCrqS+mrRgq
	gZZ5dc/HbvIzZMta+YFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0J5e-00ErzT-Us; Wed, 30 Nov 2022 09:09:15 +0000
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0J5b-00Erwh-2q; Wed, 30 Nov 2022 09:09:12 +0000
Received: by mail-ot1-x332.google.com with SMTP id t19-20020a9d7753000000b0066d77a3d474so10784181otl.10;
        Wed, 30 Nov 2022 01:09:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=B04fj9P00rqNhYYFd7+/64238rHa0D4FG/P5nQ2+7wA=;
        b=mDQvEm1QplQg6YYyArNrM+4YH1l2ZwXmiBdYl+pswyW6I5sLmbPz+bUOW4saQgm5SV
         RMRttnO718bCX4d3B+3FwynDrnMldjqGzetgTSaNlnVtSvj+4xku8XUOP8A/dgHajeJk
         G2H67Y/u8tSQwfwqME8/zkA+9/kIHQEsf0QU+bEcJuekgJ2jbgemUkdGgjZjfmdz99/+
         zJq9gQyWw8I31QzZ+DqfYr1UCpDwHfMaX5ZqsEfjJ6OPhnHVg1pOT211oX8D9BuMpbtz
         ro+HKT4vqeAsQP94N3hhmkGgz/mkzFcctqftEofv/88pdAlXzy04dWkeQpvv7tBO/1+S
         TjsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B04fj9P00rqNhYYFd7+/64238rHa0D4FG/P5nQ2+7wA=;
        b=y9Lu3DLw4tf28yhBia4hKD+evTrob4SfTxWPT8nxUP1jebU7IIOr7g+RcZF6BW+lxr
         pHD6GRLcWBkPT2Qh66OfJKDVj0pGo/V5gCKgdPtxYmzQvqHvxWAlQfIDE8dsEmOe/VNX
         5ralPY1Mqo9m/LQPPOqLaBW5bl0mIHpm1VUuitclfFkorhbnjBOKvRGoweVikZOy/Oku
         VS7qAISPhNzVa0tkLum5rfRmczIxjJ/ntHXxHbhQWuDRUD2TgfLAIj2hIXra8INkXUaT
         v/nv3a4c9fH9GZoiZqc3SnKa2l3zPmZdJhIiEjWKxZkmKFROQlbVQttuLxohq2/dQekG
         KaVA==
X-Gm-Message-State: ANoB5pmTUwe1t937gF0mRCIKsc2p2LTIOgYN0ypOO5G+YPvWETSIU2L+
	/DpYkMVpxnIJhU+MyhLaiPzz/elOBWK6pi3jy/Q=
X-Google-Smtp-Source: AA0mqf4iveLTZYV/xPRmj2emARsFD/Nu70y1nVjqfEd3HoFurktQjGnoPWWEZdf5U2qztxEjQN3owWB4HNcmz+Z3LBs=
X-Received: by 2002:a9d:161:0:b0:66e:65dc:18e1 with SMTP id
 88-20020a9d0161000000b0066e65dc18e1mr2106886otu.83.1669799349116; Wed, 30 Nov
 2022 01:09:09 -0800 (PST)
MIME-Version: 1.0
References: <20221128020613.14821-1-xiangsheng.hou@mediatek.com>
 <20221128020613.14821-8-xiangsheng.hou@mediatek.com> <9985d44e-977e-d7ea-0932-4879a3ccd14d@linaro.org>
 <f83184ae803dbe0afd37a31a8a83a369a9772880.camel@mediatek.com>
 <08ebc76a-0220-f984-b546-23dba8677be9@linaro.org> <741d7ce16df25450b08c92e508190bc7c91fc8d9.camel@mediatek.com>
 <bc356f96-600a-64df-c0fe-00c807fa605c@linaro.org>
In-Reply-To: <bc356f96-600a-64df-c0fe-00c807fa605c@linaro.org>
From: Chuanhong Guo <gch981213@gmail.com>
Date: Wed, 30 Nov 2022 17:08:57 +0800
Message-ID: <CAJsYDVKdV7Pzt4fhc+OFWto6hK9U=WBe7LkPZU5sJHX1nyXTDw@mail.gmail.com>
Subject: Re: [PATCH 7/9] dt-bindings: spi: mtk-snfi: add two timing delay property
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: =?UTF-8?B?WGlhbmdzaGVuZyBIb3UgKOS+r+elpeiDnCk=?= <Xiangsheng.Hou@mediatek.com>, 
	"miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, 
	"broonie@kernel.org" <broonie@kernel.org>, 
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>, 
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "vigneshr@ti.com" <vigneshr@ti.com>, 
	"richard@nod.at" <richard@nod.at>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	=?UTF-8?B?QmVubGlhbmcgWmhhbyAo6LW15pys5LquKQ==?= <Benliang.Zhao@mediatek.com>, 
	"linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	=?UTF-8?B?QmluIFpoYW5nICjnq6Dmlowp?= <bin.zhang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221130_010911_165402_B17FBB91 
X-CRM114-Status: GOOD (  13.22  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi!

On Wed, Nov 30, 2022 at 4:35 PM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
> >>> Will change to other private property. The read sample delay with
> >>> MediaTek SPI NAND controller can be set with values from 0 to 47.
> >>> However, it`s difficult to say the unit of each vaule, because the
> >>> unit
> >>> value will be difference with different chip process or different
> >>> corner IC.
> >>
> >> Why you cannot use same formula as other SPI drivers for sample-
> >> delay?
> >> And divide/multiple by some factor specific to SoC, which is taken
> >> from
> >> driver_data?
> >
> > Even for specific SoC, the unit of sample delay may be various with
> > different corner IC.
>
> Which is easy to achieve with driver_data as I said.

I think Xiangsheng means this:
This sample delay isn't achieved using a fixed clock signal. It's
probably some kind of delay circuit whose delay value varies
due to its manufacturing process. Every single chip made got
different delay units, so it's impossible to specify a single unit
for one chip model.

If that's true, shouldn't this be a value calibrated on-the-fly
on probe instead? A single device-tree is supposed to be
applied to all devices of the same model, so a value that
varies on a device-by-device basis probably shouldn't
be a device-tree property.

-- 
Regards,
Chuanhong Guo

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
