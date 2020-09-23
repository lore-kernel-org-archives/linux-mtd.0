Return-Path: <SRS0=UdE+=DA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADDBEC4363D
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Sep 2020 14:10:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 561482220D
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Sep 2020 14:10:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="T3asyUIG";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="SCPL5h7I"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 561482220D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tKA7Xm9f/JgwKLyrn0UcpBfyROh8xjBwmlV0CWjxJVI=; b=T3asyUIG7vbSceTsHyFHL2TS+
	Xxid/bd5m41d0R2GrKL9AVOXzRyXs7CXoTkUGiXFyCOZscDH8sZ7aB2QzP6S4NQaOaWqM3AQiyPNZ
	8wXBiSsT0GRMP7jPWyhwL13USEt4VvpQoKWyZ6jejpqAWZ8z/IamApQf2+mcZrqbHiYVuv/lL1y7g
	oYw1hxDfvbj1RysTQQaNRsHczKxvVWAVyZ6PEWl2N+bHSq0ZMsDjqphIr+17HfuVnBi/IvmLRN9Wl
	KaFKBdf87YvPCth64OWnJ9GcFNDBk1tN75Pc01iimpRuD99MnUoasOVYgcOII8DhA2Df3ulcuHqb8
	33JTgy7Nw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kL5SM-0004rc-8x; Wed, 23 Sep 2020 14:09:14 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kL5SF-0004pu-HB; Wed, 23 Sep 2020 14:09:08 +0000
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 748CF235FD;
 Wed, 23 Sep 2020 14:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600870146;
 bh=YdIBSxeNAvE6gQ5FC6DdEL/c8aPmX6JYu110Tn4pYb4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=SCPL5h7I8Q2+Rqrmk3vTX4xl+c46yq9MI4bSDw5GroNsoIBP8ozU4ghJbq24G/Nng
 /4D6o/4C0E/pvBIOoaUpT6s7ClcusUZcUS+qb1d/YMD3S9mHHBbZwG6YL/Fe91/goa
 Q20KNMBVEbzDOzwVGsQxOdShPRPImq/OnuRUcRFk=
Received: by mail-ed1-f47.google.com with SMTP id e22so20023863edq.6;
 Wed, 23 Sep 2020 07:09:06 -0700 (PDT)
X-Gm-Message-State: AOAM531nzy6D1LLwv1V+R1px0tbNBhnudiGHDfxF3bLU9DoLj7mDQ51C
 iH0pX3mHYMr+/TdLWocmycy6kA44Ofar5FK72tw=
X-Google-Smtp-Source: ABdhPJwV6yPAy5gbNdaNXncZ2t260JTMWE7HddlqhxYJPw/t/7iwqoqe4AsHLWgMB6HEHZQn26BjmuJV5+rszBRI9Wk=
X-Received: by 2002:a05:6402:ca7:: with SMTP id
 cn7mr9622063edb.143.1600870144956; 
 Wed, 23 Sep 2020 07:09:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200825193536.7332-1-krzk@kernel.org>
 <20200825193536.7332-7-krzk@kernel.org>
 <20200923115201.GD1846003@ulmo>
In-Reply-To: <20200923115201.GD1846003@ulmo>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Wed, 23 Sep 2020 16:08:53 +0200
X-Gmail-Original-Message-ID: <CAJKOXPcZuonCBK1Fc9r=rHzOL02MArrsE=R4x1tWGqov2nP0fA@mail.gmail.com>
Message-ID: <CAJKOXPcZuonCBK1Fc9r=rHzOL02MArrsE=R4x1tWGqov2nP0fA@mail.gmail.com>
Subject: Re: [PATCH v3 06/19] dt-bindings: pwm: imx-pwm: Add i.MX 8M
 compatibles
To: Thierry Reding <thierry.reding@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200923_100907_632333_6BC1264D 
X-CRM114-Status: GOOD (  18.02  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 linux-pwm@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>,
 Frank Li <frank.li@nxp.com>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>, Fabio Estevam <festevam@gmail.com>,
 Anson Huang <Anson.Huang@nxp.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 NXP Linux Team <linux-imx@nxp.com>, linux-serial@vger.kernel.org,
 devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux-pm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Han Xu <han.xu@nxp.com>, linux-arm-kernel@lists.infradead.org,
 Fugang Duan <fugang.duan@nxp.com>, linux-mmc@vger.kernel.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Li Yang <leoyang.li@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, 23 Sep 2020 at 13:52, Thierry Reding <thierry.reding@gmail.com> wrote:
>
> On Tue, Aug 25, 2020 at 09:35:23PM +0200, Krzysztof Kozlowski wrote:
> > DTSes with new i.MX 8M SoCs introduce their own compatibles so add them
> > to fix dtbs_check warnings like:
> >
> >   arch/arm64/boot/dts/freescale/imx8mm-evk.dt.yaml: pwm@30660000:
> >     compatible:0: 'fsl,imx8mm-pwm' is not one of ['fsl,imx1-pwm', 'fsl,imx27-pwm']
> >     From schema: Documentation/devicetree/bindings/pwm/imx-pwm.yaml
> >
> >   arch/arm64/boot/dts/freescale/imx8mm-evk.dt.yaml: pwm@30660000:
> >     compatible: ['fsl,imx8mm-pwm', 'fsl,imx27-pwm'] is too long
> >
> >   arch/arm64/boot/dts/freescale/imx8mm-evk.dt.yaml: pwm@30660000:
> >     compatible: Additional items are not allowed ('fsl,imx27-pwm' was unexpected)
> >
> > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> > Reviewed-by: Rob Herring <robh@kernel.org>
> > ---
> >  Documentation/devicetree/bindings/pwm/imx-pwm.yaml | 14 +++++++++++---
> >  1 file changed, 11 insertions(+), 3 deletions(-)
>
> Applied, thanks.

Thanks Thierry, but this was already picked up by Rob into DT tree.

Best regards,
Krzysztof

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
