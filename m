Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4F27C433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Feb 2022 15:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wSYKoxiilW/3C2a5BxD39IjKOpPw+0dhF482XcS2cUk=; b=vGoWcLMR5MfGaG
	V1m3CtGeew05TgwWAHW5/bpILeLSJkZ5Ti3tEacrFdfYqi+yGYsyLuyE0LiI7fWFhBTvaxdVNOFI2
	/3DqZcl8vf5W+RQKNXmf76yD205ZrabU1L9slWbMu8jsYg3JqNWdqD7rwhK5Sd1PvPf+Di3R+yLxI
	9ZVPfZewJu77DAxBFD2c8CTMCz/WM/3gA+sIndhTpzlv7tH5dEbRXlKXKi6gj49CdPXaOsT1HyVVB
	HfR5tZP7hehv5/2cJcnFO1XfqemZ84WSf28dGMVPpIbdUguuk/3vV75YUuoNXMhv/ktESnbVsdFmE
	xk7XIK7a4feBQ8MxZTeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJzg0-003EZO-1a; Tue, 15 Feb 2022 15:23:36 +0000
Received: from mail-io1-f49.google.com ([209.85.166.49])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJzfM-003EHl-30; Tue, 15 Feb 2022 15:22:57 +0000
Received: by mail-io1-f49.google.com with SMTP id w7so24246256ioj.5;
 Tue, 15 Feb 2022 07:22:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=9J4rDa9s4wmqYQBOVueBwn1a76vdE1euAb2VZB7wcmc=;
 b=GKb8jcwbiozQU8ORywY5JnGMlwby4reoqsgo/e9UVeTWAvFri1Dj08596hoiJg9RD/
 Cyt0ntnCrUkNr7djtyt3jl9HqUPpgmsDXCxc/ZSp0WfKeV6uLZuf9U0+BTq238Z6sptt
 Bn9vOYd3xUAYg2OC14MUMZwq9qg2lyVO7yFY/OI0qjQca6RMnzT/sRgUTw8AqaHiyjz1
 2Yhk72VKtgDOY+e7YslMoTts61Zom/uIaEdOzyyuDQwqqQZnd7DN/0GTv+XEKZHEDTgW
 wRzaBcTGZF2bFApgbO+5t2P9mjFZKilmSkDhHWEH1/Moi9iYUcXMoeOE+BYuV6u4Bx+q
 YraQ==
X-Gm-Message-State: AOAM5316NGRbFcg5ZrkDWEe4gAgnk9h4QaFdSKOjEIYn2voo36+af15b
 Pt+1gW1DW2Npesf3pHYwJw==
X-Google-Smtp-Source: ABdhPJwWfDOErqZzCQjf54gJc9fHJ8Up5VXN1xQ8G+SwjgqvNHngDAkHgslyzJpOfgzzODVEJusx8g==
X-Received: by 2002:a6b:5a07:: with SMTP id o7mr2716438iob.9.1644938575136;
 Tue, 15 Feb 2022 07:22:55 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.250])
 by smtp.gmail.com with ESMTPSA id m12sm23475626iow.54.2022.02.15.07.22.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Feb 2022 07:22:53 -0800 (PST)
Received: (nullmailer pid 3450866 invoked by uid 1000);
 Tue, 15 Feb 2022 15:22:45 -0000
From: Rob Herring <robh@kernel.org>
To: Corentin Labbe <clabbe@baylibre.com>
Cc: linus.walleij@linaro.org, richard@nod.at,
 linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, krzysztof.kozlowski@canonical.com,
 miquel.raynal@bootlin.com, vigneshr@ti.com, devicetree@vger.kernel.org,
 robh+dt@kernel.org
In-Reply-To: <20220211120842.3388592-1-clabbe@baylibre.com>
References: <20220211120842.3388592-1-clabbe@baylibre.com>
Subject: Re: [PATCH v3] dt-bindings: mtd: drop mtd/cortina,gemini-flash.txt
Date: Tue, 15 Feb 2022 09:22:45 -0600
Message-Id: <1644938565.093416.3450865.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220215_072256_172169_0C16FA00 
X-CRM114-Status: GOOD (  13.64  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, 11 Feb 2022 12:08:42 +0000, Corentin Labbe wrote:
> Drop mtd/cortina,gemini-flash.txt since it is nearly already handled by
> Documentation/devicetree/bindings/mtd/mtd-physmap.yaml.
> 
> We add jedec-flash to list of compatible because one board (gemini-dlink-dns-313.dts) needs it.
> See commit a10d862e585e ("ARM: dts: Fix the DNS-313 flash compatible")
> The flash on the DNS-313 needs to be probed as JEDEC, it does not conform to the common CFI standard.
> 
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
> ---
> Change since v1
> - fixed typo in syscon
> 
> Change since v2
> - Added reason of adding jedec-flash
> 
>  .../bindings/mtd/cortina,gemini-flash.txt     | 24 -------------------
>  .../devicetree/bindings/mtd/mtd-physmap.yaml  | 18 +++++++++++++-
>  2 files changed, 17 insertions(+), 25 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/mtd/cortina,gemini-flash.txt
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/patch/1591614


flash@0: compatible: 'oneOf' conditional failed, one must be fixed:
	arch/arm/boot/dts/r8a73a4-ape6evm.dt.yaml

nor@20000000: compatible: 'oneOf' conditional failed, one must be fixed:
	arch/arm/boot/dts/bcm53340-ubnt-unifi-switch8.dt.yaml


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
