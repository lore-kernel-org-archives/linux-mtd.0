Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BCE6C54EAA
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Jan 2023 22:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YsnH6FmDGVCP9TgA4pMWoi77w6hSN8dzACgiSHP05Io=; b=FoCplR7dINw6no
	b5g0cek9aJDSHDFM8kbO5pjAsVsuq7t/zXavzxMG+GnNPZeiO//HdewMhnFrwouKHYo3Y4HuhqWle
	tUOkdu0Euw/7WglWBwsB96GR3MR9lyhCk3Z7n+NmDVUxDwgYE5X4a3rvaYQ3IEIGAyL7yoKcP7+tq
	ATLl/hYjOKFlYxXWvo0X9JytOc8kQravCSmMc00ruG6UmWs1FItbuLkKUpVYyBxPWX4Nta2qWYR0a
	Ievwbt3NPPfRbl02KdrqNY6G+gBWyFr3M/9PMNwKE7KQEYAo8mxJIWwFuj7T4ZHkrazWu6eW7I6DA
	LbvXX7xrTkQBnHpUctcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMcrq-005fvk-V5; Mon, 30 Jan 2023 22:43:15 +0000
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMcrg-005fsg-Br
	for linux-mtd@lists.infradead.org; Mon, 30 Jan 2023 22:43:05 +0000
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-4a263c4ddbaso181086917b3.0
        for <linux-mtd@lists.infradead.org>; Mon, 30 Jan 2023 14:43:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+TZHpce+LkRMQa6vx6q9obcgDlv0XoFb3aljOsKv7qU=;
        b=nCBrIiE+L+vdLXic+BhlJTEfwEv/ysg8qF3ePyjPsY/A6pPFUyJ9yxWfviS5IS9XZ+
         aTkrqx4WuQWd2ry/CmUYytg0ONmjJ++XzlyAcGDLyhrZ4/IX03EskCTili/5UQq5yKge
         +e1rwxjmS0vI2LeI41+8f4VGz+I/dUip0S2eGn72UYX+dBh2W8CPEuyvYqHBwUzQTY52
         5vUM6PPZirJQEM/wFGgVbRt8dqUJz0ZaVONsNu44LnLGVX5dLOGLew5RenS7kd33ruoM
         AeG1hFJb4M2UAk+s92c6xRoPBpxkWpcN0CqUVNQ0xsATgHZATATevhE+7nH+bY+9BJXI
         PhRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+TZHpce+LkRMQa6vx6q9obcgDlv0XoFb3aljOsKv7qU=;
        b=PKkN0dEpFkBGjkKV5a6K4UD7hIYDSnVW7LFp98jjdLASTU6czWIFYmGgrWc3hWYTPY
         BvMPaslumX0MuvG/5ICq0NVM43okAuio7CQVqZKCDbpGISvfoFNm2OcFEnpx1oSHhD1j
         YFnoUygTwLfFAErqVyLLXTlcxrfYCt9wBGIWMoTbsAh4Muppdi3wpdQ/gN9aOFl5W/aj
         jfpxnuZQRyxedS54ZHlotYl2P8kC3E221J8x7nI6cDhI/Pmw1vwJLBuSrGIJEx5NevCQ
         kl5qaWsxHCWCLgUKG7f9v8Xd2pBespm0wZ3yEXRBIWZ6Rf84P9vuM98A7AMHuLfJ+D/J
         Pd+g==
X-Gm-Message-State: AFqh2kodLJZOou+1z8LSk6oWCJOa0jdam784Op0iXbKblvkNb+/S9KEX
	xV2cZ+HmIBo3ivhmp9AJzkzkkmzjsLlZj8RQHp4faw==
X-Google-Smtp-Source: AMrXdXtQIx/gOYQWR7Z9y8qC4zSuzlnGWFfiiT/LekYqnnNUbvQG32KG8P3YQVm2xu2If9pxmW9DcUUds+3TfNO/91s=
X-Received: by 2002:a05:690c:39b:b0:4f3:8d0e:edce with SMTP id
 bh27-20020a05690c039b00b004f38d0eedcemr4580998ywb.185.1675118582401; Mon, 30
 Jan 2023 14:43:02 -0800 (PST)
MIME-Version: 1.0
References: <20230127093217.60818-1-krzysztof.kozlowski@linaro.org>
 <20230127093217.60818-4-krzysztof.kozlowski@linaro.org> <CACRpkdbOZLhQ1DTNJowNXF=O-Nvpqcb_A+PwkPWFiUSQUbkR9A@mail.gmail.com>
 <755d4a78-0b23-a381-c422-d12b0063f06f@linaro.org>
In-Reply-To: <755d4a78-0b23-a381-c422-d12b0063f06f@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 30 Jan 2023 23:42:51 +0100
Message-ID: <CACRpkdZWqea+RT75g5CkCzT9zMOj419GMJeydgpZGSLvC9Xoog@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] dt-bindings: serial: restrict possible child node names
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Damien Le Moal <damien.lemoal@opensource.wdc.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Linus Walleij <linusw@kernel.org>, 
	Imre Kaloz <kaloz@openwrt.org>, Krzysztof Halasa <khalasa@piap.pl>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, Marek Vasut <marex@denx.de>, 
	Lubomir Rintel <lkundrak@v3.sk>, - <devicetree@vger.kernel.org>, 
	Marc Zyngier <maz@kernel.org>, linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org, 
	linux-serial@vger.kernel.org, linux-watchdog@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_144304_434630_548BE9BC 
X-CRM114-Status: GOOD (  16.05  )
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

On Sun, Jan 29, 2023 at 4:48 PM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
> On 27/01/2023 14:29, Linus Walleij wrote:
> > On Fri, Jan 27, 2023 at 10:32 AM Krzysztof Kozlowski
> > <krzysztof.kozlowski@linaro.org> wrote:
> >
> >> The re-usable serial.yaml schema matches every property with ".*"
> >> pattern, thus any other schema referencing it will not report unknown
> >> (unevaluated) properties.  This hides several wrong properties.  It is
> >> a limitation of dtschema, thus provide a simple workaround: expect
> >> children to be only of few names matching upstream usage (Bluetooth,
> >> GNSS, GPS and MCU).
> >>
> >> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >
> > Fair enough,
> > Acked-by: Linus Walleij <linus.walleij@linaro.org>
> >
> > However I think V.35 WAN devices (high speed serial network links)
> > should actually be using this? They are just some fancy serial port
> > after all. Cf
> > Documentation/devicetree/bindings/net/intel,ixp4xx-hss.yaml
> >
> > No big deal I guess since they are mostly an anarchronism and not
> > on the table right now.
>
> intel,ixp4xx-hss is not part of the expansion bus node.

True, my point is that WAN V.35 devices in general should be,
so that the pattern properties should include wan.

But we can add it later if a user appears.

Yours,
Linus Walleij

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
