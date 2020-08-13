Return-Path: <SRS0=wA1i=BX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEDF6C433E1
	for <linux-mtd@archiver.kernel.org>; Thu, 13 Aug 2020 07:52:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C3AB2078B
	for <linux-mtd@archiver.kernel.org>; Thu, 13 Aug 2020 07:52:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="glokj+Jl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9C3AB2078B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=WPcrQPkmo96ZhJlCKOYtD9MU+L3fwaXxJ9lKv8JyEtI=; b=glokj+Jl5gT2hg7YjoIE9YqmB
	Vj/9gvMQggcptTXjKeRihrZC2pBNZSNr5jbX1l34PJNt7ODqOPSKYd3N28M9P+HMo6nbTudDgtbJY
	uFKcXYE7AAZdaqg7wq6Qj4o+OEW82PoOR3XXH+he+Wz2UYxpSUKlQmU9+RwNNxJbiWlRaMMe0Se7v
	m3DanBpOJQxaJZyoN0BiezCyqRdLzusoejJwcWgUphdDwDxPyZ11VtzQDtDhxvm2Y2ScB9CeOtS6B
	5jquqWAtrAV7/sb10FDAwqY9XHDhLagmEfcwM6Ah0q2jFCMAB60W7Sm1vUCcRUGnMzhAfvDsJ04Vb
	dm55hNcTg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k6815-0004k7-FC; Thu, 13 Aug 2020 07:51:15 +0000
Received: from mail-ot1-f65.google.com ([209.85.210.65])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k680y-0004jc-Br; Thu, 13 Aug 2020 07:51:09 +0000
Received: by mail-ot1-f65.google.com with SMTP id 93so4120359otx.2;
 Thu, 13 Aug 2020 00:51:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eU62SrftExeZEPFtSlHLsBRzbUkLx1KNOgZc6VKFeBQ=;
 b=d6lrIjVbgRA8kC6d5bG/a+g+f8nEtnCHUW8OoPoOusKwaAL8r8RZuCMSqtXXXqVO5P
 D2qH90zfOCTJAFuh+QkaHsdtDzOHG3zIWmRVs0AFpRlTTRheEwHACTU68c9IUkXjL6lo
 LVvjtrrNhcV1xCQnsCA6106iqWWIcM+1A9WGq5QsDhjDDv06QLrrjsothcS32Cu+NepM
 j3aCTHyaMgYatIiquuBntlj8smi+6YQqvJS+sIpxbCRivJJ3JbTvUsvx/IMLpTqThCtx
 0RpAU1QCJeTHDjEFDPc3s3aFWN5VjAXacE+W9FTdqDW6d7ypy8G6hI4otzWHlGdf0IV0
 96vQ==
X-Gm-Message-State: AOAM533Pjk/CRFNckz5kha1TDdMMi8Qay9hToU1u4JNd7AyrrKjIXFVs
 5ZkVMnKgpEj9s94eQ7cTAXWOne+wcFXj8U+MRCyvoK0F
X-Google-Smtp-Source: ABdhPJzAAKS8g3t/W5mSJd2Vboc2FEvoNvVXoru7u4kNP7jabPCwVCki2JjTk/fEfMzVv8QAFC24k07bLAU2LYhSK+k=
X-Received: by 2002:a05:6830:1b79:: with SMTP id
 d25mr2990956ote.107.1597305067462; 
 Thu, 13 Aug 2020 00:51:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200812203618.2656699-1-robh@kernel.org>
In-Reply-To: <20200812203618.2656699-1-robh@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 13 Aug 2020 09:50:55 +0200
Message-ID: <CAMuHMdVXvSRF-G_TYu4P+Bqa2FZJWsUCyzqFur3Rb-tBExfbsw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: Whitespace clean-ups in schema files
To: Rob Herring <robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200813_035108_464864_224B323E 
X-CRM114-Status: GOOD (  14.18  )
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 linux-iio@vger.kernel.org,
 "open list:REMOTE PROCESSOR \(REMOTEPROC\) SUBSYSTEM"
 <linux-remoteproc@vger.kernel.org>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Linux I2C <linux-i2c@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>,
 linux-rtc@vger.kernel.org,
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 linux-input@vger.kernel.org,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Linux PM list <linux-pm@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-hwmon@vger.kernel.org,
 netdev <netdev@vger.kernel.org>, USB list <linux-usb@vger.kernel.org>,
 Linux MMC List <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-spi <linux-spi@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Rob,

On Wed, Aug 12, 2020 at 10:36 PM Rob Herring <robh@kernel.org> wrote:
> Clean-up incorrect indentation, extra spaces, long lines, and missing
> EOF newline in schema files. Most of the clean-ups are for list
> indentation which should always be 2 spaces more than the preceding
> keyword.
>
> Found with yamllint (which I plan to integrate into the checks).

> Signed-off-by: Rob Herring <robh@kernel.org>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/clock/renesas,cpg-clocks.yaml
> +++ b/Documentation/devicetree/bindings/clock/renesas,cpg-clocks.yaml
> @@ -24,9 +24,9 @@ properties:
>        - const: renesas,r8a7778-cpg-clocks # R-Car M1
>        - const: renesas,r8a7779-cpg-clocks # R-Car H1
>        - items:
> -        - enum:
> -            - renesas,r7s72100-cpg-clocks # RZ/A1H
> -        - const: renesas,rz-cpg-clocks    # RZ/A1
> +          - enum:
> +              - renesas,r7s72100-cpg-clocks # RZ/A1H
> +          - const: renesas,rz-cpg-clocks    # RZ/A1

This change breaks alignment of the comments at the end of each line.

>        - const: renesas,sh73a0-cpg-clocks  # SH-Mobile AG5

(I only checked the files I care about)

If you don't update commit  e0fe7fc6f2ca0781 ("dt-bindings: Whitespace
clean-ups in schema files"), I can send a patch after v5.9-rc1.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
