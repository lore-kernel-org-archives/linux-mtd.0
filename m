Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FC43C05027
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Jan 2023 02:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bsf7gq9p3YnDgCdBIMUsFqromsET+JaMyDPUTSunpr4=; b=JL7E28N1boOHFN
	IY+InVhUBdH6GyXNug8RRA+zXto335EGNfQyOwGt42cEMn8fsIZ1d/7hINPUanU9190etDmMdVors
	noW42rZQ7tZbBSRVou7XJODAKQMFqdA57K2+gsroOW8ETZTc2KOmz2ogpCZoGp5pmQqH+YKqrwWS1
	QGd/6m0ns8EYbNmGtJgRu5333avHuLcrk4MaTCaLrNfMUnwQwkkhV4sBmzVX9TiBlQ6tRZbnjj89F
	XCOpqKV5aAtlIfjxw1bflP41iH+tX7Be0lzdBSkXjac/zv5BxfgQ0tKgxAAT1XnSpa73Nw9ReIoVh
	6iUVfT18FDA7iqmtffkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pK8kO-0024h2-3u; Tue, 24 Jan 2023 02:09:16 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pK8kB-0024en-KT; Tue, 24 Jan 2023 02:09:05 +0000
Received: by mail-pl1-x62a.google.com with SMTP id p24so13320470plw.11;
        Mon, 23 Jan 2023 18:09:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cDOI66t0q/oP7E/pKikemgOCe2s0l8GcG5GBgKQtNXE=;
        b=fLS/Ec7hGZGwOF2csyyx7asmruxOhiKoolimG+J143sZaS3Dd9SI4B9Y+jRI/smyYM
         7FTlvkrIihPwyL7KIhzRT5OmgwHmi0Ol2iPA72h6Ac6DsOK1n/8kUnfY/qv8dbaNArwt
         K1LO71u0KJukhXLFhDqCcDJwxbkCfiCGzz1tJMsxGcxkZuw3dzWO97kbGLpt6gaPPWZY
         IRrhV3aMPdfIa8kKQ4ii62OGb3odO2SvVHrnM5xrTO2zdYFb2LZ3H1FsdkinNkyqZesb
         lDxkTRPtaLQidsvcONDyXXRDLab+zGkI36MC73q5SudTjGFm8sOUj90aitBwQfeeZR/q
         F7ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cDOI66t0q/oP7E/pKikemgOCe2s0l8GcG5GBgKQtNXE=;
        b=EECj2pFXGRm8DrGZKrmvR/hHdS2gYkpaiZjNpbmeDX3BjcbSm6cmM/NwRM8tT3fRPl
         jghsoxDJ85zAFWcxVExYdUKKDZOBP/qF//i2BkbKW3eAhE9Lex9fgZjcq/2RpNH389O3
         2MpxkMHOKbxZQj3iFSrbnonOf/Wu7R0RVg2HxcbipD9+GVMbQoCeH+4VvvG4Ri0M+8pR
         8/YY41xdap7s45QmU+6YrCp0tXFC4DD+XbF2I/E22+7RPdFGL3a0Ii59qB/6HPT1m5VM
         zdbBa+PJmDkN67V9A/dsf9V7rrrukhHR5VXDdXGX4+B6LnrjOgRdOvyg3zxLGQJdgcHN
         jCXg==
X-Gm-Message-State: AFqh2kpd6ZXuaEu8stFV9wnJRk+taK8agsSWRbVdlWmUwDVGK/6Uybhp
	QqggWUStrwdjZH5TdOOnd48=
X-Google-Smtp-Source: AMrXdXvg/EPy6kakIOxMYkNEGMjnT9H8lLzdCwftb8iaw8taUrONL/r/vPS4ux4xrk13uYltzaEQhA==
X-Received: by 2002:a17:902:7881:b0:192:bb38:c412 with SMTP id q1-20020a170902788100b00192bb38c412mr26040498pll.44.1674526141197;
        Mon, 23 Jan 2023 18:09:01 -0800 (PST)
Received: from [192.168.43.80] (subs02-180-214-232-19.three.co.id. [180.214.232.19])
        by smtp.gmail.com with ESMTPSA id y7-20020a170902d64700b001929568afe9sm346624plh.306.2023.01.23.18.08.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jan 2023 18:09:00 -0800 (PST)
Message-ID: <679a3bed-e3fc-832e-8e5a-e6bca638ad26@gmail.com>
Date: Tue, 24 Jan 2023 09:08:49 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 00/15] Ambarella S6LM SoC bring-up
Content-Language: en-US
To: Arnd Bergmann <arnd@arndb.de>, Li Chen <lchen@ambarella.com>
Cc: =?UTF-8?Q?Andreas_B=c3=b6hler?= <dev@aboehler.at>,
 Brian Norris <briannorris@chromium.org>,
 Chris Morgan <macromorgan@hotmail.com>,
 Christian Lamparter <chunkeey@gmail.com>, Chuanhong Guo
 <gch981213@gmail.com>, "Conor.Dooley" <conor.dooley@microchip.com>,
 Daniel Palmer <daniel@0x0f.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Florian Fainelli <f.fainelli@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Guenter Roeck <linux@roeck-us.net>, =?UTF-8?Q?Heiko_St=c3=bcbner?=
 <heiko@sntech.de>, Hitomi Hasegawa <hasegawa-hitomi@fujitsu.com>,
 Jean Delvare <jdelvare@suse.de>, Jonathan Corbet <corbet@lwn.net>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Liang Yang <liang.yang@amlogic.com>, Li Chen <lchen@ambarella.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 "moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:MEMORY TECHNOLOGY DEVICES (MTD)" <linux-mtd@lists.infradead.org>,
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Randy Dunlap <rdunlap@infradead.org>, Richard Weinberger <richard@nod.at>,
 Rickard x Andersson <rickaran@axis.com>, Rob Herring <robh@kernel.org>,
 Roger Quadros <rogerq@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Shawn Guo <shawnguo@kernel.org>, Sven Peter <sven@svenpeter.dev>,
 Yinbo Zhu <zhuyinbo@loongson.cn>
References: <20230123073305.149940-1-lchen@ambarella.com>
 <a69a5ffc-0820-4adc-9ac4-f827ebf66cf0@app.fastmail.com>
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <a69a5ffc-0820-4adc-9ac4-f827ebf66cf0@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230123_180903_738688_117479CA 
X-CRM114-Status: GOOD (  16.10  )
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

On 1/23/23 15:39, Arnd Bergmann wrote:
> I seem to only have part of the series, please add both me and
> the linux-arm-kernel mailing list to each part of the initial
> submission.
> 
> It's possible that some patches were already Cc'd to
> linux-arm-kernel but did not make it through because the Cc list
> was too long (it has to fit within 1024 characters for many lists).
> I think you too the Cc list from get_maintainers.pl, but when
> sending new drivers this does not work well because it picks
> up everyone that recently touched the Makefile/Kconfig.

Hi Arnd,

It is possible (and common) that people who recently touched these
files, when given new drivers patches, aren't interested in reviewing
them for many reasons.

In that case, you may want to see Alison's trick posted on kernel
outreachy list [1]. In summary, pass `--no-gitfallback` (don't give
addresses of recent commit authors) and `--norolestats` (only name and
email are printed; MLs don't get open list:-generated names). Also,
another trick that I use is to condense the list by passing
`--separator , ` so that it can be easily copy-pasted to
git-send-email(1).

Thanks.

[1]: https://lore.kernel.org/outreachy/20211015171331.GA431883@alison-desk/

-- 
An old man doll... just what I always wanted! - Clara


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
