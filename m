Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 604B0C433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 17 May 2022 00:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lFAWBMLUylX3UMk85TeNizP5DCS/js4RfzK7Ea+y/UM=; b=ZUEw4eVMlbG10m
	6kpWSoB9NT23rLg4hakz+4WcFgkmDp3CsB50Yfvjcc4Pr+2V1kB6+I9VHSng0ALktdFcJPoBLiaug
	DisQ3cPX4IM4P7MDF1koxYaZymMRVQ/hhfy+q8Mq2volNioYq0MQs0wk4iSlaJfK3YpwQvMTlolyK
	PT/Ek+zLPZWiGCj2Mj04ADXbI+WoKbvlGN0helPHB8KtpgZYOJidYDWc43k2NzcSYQzB1v6LX6i/Q
	kwADb7qE82Vz4DAX/CAY3OWudbaFFnn5X16EQVqXbYWSHI5zhN9PZsihhi+H9DTQtW3lywghfviwW
	nftcRcyQDNnGLP0xXX7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqlQl-00B2eP-7z; Tue, 17 May 2022 00:51:19 +0000
Received: from mail-oa1-f45.google.com ([209.85.160.45])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqlQi-00B2e0-Ae
 for linux-mtd@lists.infradead.org; Tue, 17 May 2022 00:51:17 +0000
Received: by mail-oa1-f45.google.com with SMTP id
 586e51a60fabf-d39f741ba0so22377509fac.13
 for <linux-mtd@lists.infradead.org>; Mon, 16 May 2022 17:51:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=BN4iM9sQbJEV3JEbs6Nxmd/DqEFeyh4AGc2qP9BhUps=;
 b=EH1JZH6H9a3uoJzzoh0MvqO4QABUF4MJIx0OemHqkP4OqAj+Qh04RGq4azfImESN4I
 N1Q1kA/E32d8a5M4mExzmRF4K/R7eQmXMk07oeY1AsQzzCV9v9XZ8M+U1xiI9sz8GrVt
 gwufi6+j3mhTKncyg1JBAVWJDPut/5ddpC78gx2yOQqTQQhl4mqj3EuIn1BX8vNI4AEd
 BbszZmhJCKMoXM88yTZbFL1I1TTe9co+oMf9YiQMCd2BmsZWm33nkN5vPKFvKZTwRiEJ
 Y0cHF1+jaxltGVE3QlNLMJAFs+pI7pcJCGoiXXdVdBnARXjEmZaihDj3r5JJyr83Dr9n
 wSmQ==
X-Gm-Message-State: AOAM5326cFeWdfaCEWp94Bfk2fUrkqq1v5USAaw3k6a6REosAi8aqFpf
 vdIdM2PCyEta7LBrKoqobQ==
X-Google-Smtp-Source: ABdhPJyBYMgt9qDgNwOKWlMSsg9Hins9woDar0FSMx89U7YzHjdTwYL0S9eYbYUUCjOUN8uMnjFa+w==
X-Received: by 2002:a05:6870:b620:b0:f1:8837:ecd0 with SMTP id
 cm32-20020a056870b62000b000f18837ecd0mr6844838oab.22.1652748674772; 
 Mon, 16 May 2022 17:51:14 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 f27-20020a056830309b00b0060603221268sm124759ots.56.2022.05.16.17.51.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 17:51:14 -0700 (PDT)
Received: (nullmailer pid 3690141 invoked by uid 1000);
 Tue, 17 May 2022 00:51:13 -0000
Date: Mon, 16 May 2022 19:51:13 -0500
From: Rob Herring <robh@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Bastian Hecht <hechtb@googlemail.com>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH/RFC] dt-bindings: mtd: Remove Renesas FLCTL NAND
 controller support
Message-ID: <20220517005113.GA3685447-robh@kernel.org>
References: <ef70e24a57d2342458fe11b7b13775ffac1f1bd0.1652098726.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ef70e24a57d2342458fe11b7b13775ffac1f1bd0.1652098726.git.geert+renesas@glider.be>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220516_175116_407883_BB7B8A2E 
X-CRM114-Status: GOOD (  14.52  )
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

On Mon, May 09, 2022 at 02:27:52PM +0200, Geert Uytterhoeven wrote:
> The DT bindings for the Renesas FLCTL NAND controller document only support a
> single SoC, namely the Renesas R-Mobile AP4 (SH7372).
> Linux dropped support for this SoC in commit 59b89af1d5551c12 ("ARM:
> shmobile: sh7372: Remove Legacy C SoC code") in v4.1.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> The FLCTL NAND controller (or an enhanced version) is also present on
> SH-Mobile AG5 (sh73a0) and R-Mobile A1 (r8a7740), but the sole boards
> supported upstream (KMC KZM-A9-GT resp. Atmark Techno Armadillo-800-EVA)
> use eMMC NAND instead of raw NAND FLASH.
> 
> What's the policy w.r.t. stale DT bindings?
> Should it be converted to json-schema instead?

Wouldn't be high on my list.

> drivers/mtd/nand/raw/sh_flctl.c still implements these bindings.
> The driver cannot be removed, as it is also used on the non-DT
> SH7723-based AP-325RXA platform.

But you could remove the DT support in the driver? I'd just leave this 
as-is if you don't do that.

Rob

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
