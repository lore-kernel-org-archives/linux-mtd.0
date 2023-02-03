Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F5FBC61DA4
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Feb 2023 10:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mThRG9L6VRESSCahwlcLNNad63W2wpVSKyr4RpFeWY8=; b=xDIQ3LPuOZWWcv
	3HYQF09/BH+5Wf8VJCon+VG14Be7QXD5eZrZaVFOmWiyeqWrVLxx8I0xJS9eLm+RTxYXExYYt+1rT
	tqqd/s6R4WAVVhutgAfjAhIjus9ksoP4htVAf0K+uGMXOTwXbgufMsalT/TfmU2SkTghb5O5nj9d6
	f8qRe3NDMdQdZ1efW2e8oMdkE9kyWZPwzz80qVbfykzLqyW7POarlqdVo+/K+dV9DuzLsh9MQYJqp
	VKU7ZqIUAsw5qKnBpGIgf3KS6VO7dZn9fTLd1+G8ZSQ5zB4eQoBJRvitxeg52pmGux72wlhslxkgZ
	iwOvL2RO/mA9tJWBouqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNtJ0-001Nug-2t; Fri, 03 Feb 2023 10:28:30 +0000
Received: from mail-qt1-f182.google.com ([209.85.160.182])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNtIq-001Nrs-BB; Fri, 03 Feb 2023 10:28:21 +0000
Received: by mail-qt1-f182.google.com with SMTP id h24so4881529qta.12;
        Fri, 03 Feb 2023 02:28:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OONFnhP6I7zS1Y45r5yPBZWg15dDNXvDl8f/Zu5HTcU=;
        b=0yIdso4umS16xnOnzVPlNgaOBogZB+TjiR6pKZ/VpDXHbh6ehXU/v+0Ys68joRyySx
         r1nEJ5m8fe7fY9mYTeBSD5zhLQgYyYjELpSx81dN5sj1ncONwjyqKSd5eB/bKldN4ETy
         ETzmnWqbXXHeql4w711XOHpPeVJYjiK20BnauCS14UiHwTwqManuzM8Fs97W6NfZSFDW
         Zw9+LqXXXiFjt/PvFHY7g195NEGfsyPhgzlDpYE8tH72wlBkD+pKlSHbPv0KA6yhtW4h
         XmF1uZ+Ojs/BQpPwjPvKcp9FyCeXEMVgs8tP/xAEkD6neFFuCPnogetI1HOmllqMdJAp
         nglQ==
X-Gm-Message-State: AO0yUKUFQ+A7N8VU/ChmdBwGM/IpfEo6oDumvzBJbNfQC0pNMzgXImsH
	R9+UTDD5880X+cyFT01WKybIPxVf8KwJUw==
X-Google-Smtp-Source: AK7set9e7IQJAoFDm1eCs+JSG7aWql/gNFe7Lrl9xyl7FSiGjUr/FaW2ju/M0IdDobBYtcNXWNqNpw==
X-Received: by 2002:a05:622a:1755:b0:3b9:c7f1:a655 with SMTP id l21-20020a05622a175500b003b9c7f1a655mr12201695qtk.24.1675420096268;
        Fri, 03 Feb 2023 02:28:16 -0800 (PST)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com. [209.85.219.174])
        by smtp.gmail.com with ESMTPSA id bs37-20020a05620a472500b00728b8f26939sm1579294qkb.103.2023.02.03.02.28.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Feb 2023 02:28:15 -0800 (PST)
Received: by mail-yb1-f174.google.com with SMTP id 129so5745030ybb.0;
        Fri, 03 Feb 2023 02:28:15 -0800 (PST)
X-Received: by 2002:a25:820a:0:b0:7d5:b884:3617 with SMTP id
 q10-20020a25820a000000b007d5b8843617mr1035225ybk.380.1675420094927; Fri, 03
 Feb 2023 02:28:14 -0800 (PST)
MIME-Version: 1.0
References: <20230203101624.474611-1-tudor.ambarus@linaro.org>
In-Reply-To: <20230203101624.474611-1-tudor.ambarus@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 3 Feb 2023 11:28:03 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVeDbTGLBAk5QWGQGf=o6g25t341FjGTmNsHw0_sDOceg@mail.gmail.com>
Message-ID: <CAMuHMdVeDbTGLBAk5QWGQGf=o6g25t341FjGTmNsHw0_sDOceg@mail.gmail.com>
Subject: Re: [PATCH] tree-wide: trivial: s/ a SPI/ an SPI/
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: trivial@kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-iio@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-leds@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mmc@vger.kernel.org, netdev@vger.kernel.org, linux-spi@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-acpi@vger.kernel.org, 
	linux-gpio@vger.kernel.org, alsa-devel@alsa-project.org, 
	linux-mips@vger.kernel.org, linux-mtd@lists.infradead.org, 
	linux-wireless@vger.kernel.org, chrome-platform@lists.linux.dev, 
	linux-rtc@vger.kernel.org, linux-fbdev@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-usb@vger.kernel.org, 
	Mark Brown <broonie@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230203_022820_399250_730355F6 
X-CRM114-Status: GOOD (  16.31  )
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

Hi Tudor,

On Fri, Feb 3, 2023 at 11:17 AM Tudor Ambarus <tudor.ambarus@linaro.org> wrote:
> The deciding factor for when a/an should be used is the sound
> that begins the word which follows these indefinite articles,
> rather than the letter which does. Use "an SPI" (SPI begins
> with the consonant letter S, but the S is pronounced with its
> letter name, "es.").

While I agree with your pronunciation, I believe the SPI maintainer
(which you forgot to CC) pronounces it in James Bond-style, i.e. rhymes
with "spy" ;-)

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
