Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73A56C433FE
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Nov 2022 14:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Cafwt1OuKoE9RTRbEpd4PEuhLgk7d12xLjW+8R1I63w=; b=KoQOiAWeMD+1jH
	lUokERplau4p3dwWUr2E7SRmCxrcXEBi/rNN5woROmBH0/D8jaVFaUqko7BV9gSAFnYg/GZ22og1B
	0DZs64Ga+rZA4MSKW95Rykjuss7yiwNSiCW3XW+id0q7tXKWbOWf+2LHqixToo16FRrZSCBdj3sPz
	3qvEaWuAUEucbzvTs/YpC/g6l7k2JxQmI1L/J28E5o6vXpp7yEeHCEk7jYXAEzWTjl9/JQhZjdTaa
	swl4OQ5gx1FUtG8s3Ihb1jqh8f/p35xp0whS9/RieHzUvqi5jhnPbhb+oEdNA8/une9mM44kojnJY
	WzNJNCWejnDysTqPyNbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxr5B-000C6I-63; Wed, 23 Nov 2022 14:50:37 +0000
Received: from mail-qk1-f177.google.com ([209.85.222.177])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxr4l-000C3g-M0
	for linux-mtd@lists.infradead.org; Wed, 23 Nov 2022 14:50:13 +0000
Received: by mail-qk1-f177.google.com with SMTP id g10so12535269qkl.6
        for <linux-mtd@lists.infradead.org>; Wed, 23 Nov 2022 06:50:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NtDtDOhppRv+31z+yGSZ+dwXt5ca6W+mR7J4/BtnvWc=;
        b=Z8XSBGYFXgUFEiYRcetNJqBNYxuYSCLu2atHsbgP+G4NVGwLql67qBXMQOSu4VqSf0
         EkJ99Fz4ZR14e3BOcoLbR/nYk1dVBeSXR1EETvIt01FhlNeUwCt5CzXcDabdVY7y5Z9l
         NU+jvisnfaQ5acOoVYuZ4V4Lv6/6B66REiDhAKsQatgorbvzrPoQOeOxw+geWizfGSM5
         YTNVVai4N04TkdzxUGQX77MECgEc8Y1cH0RXTxZP7Bk3tBOoQkc03q4CUe2taETH66uC
         5AacouSaz3sew+EMVYsMYEwCiXy124MgyqI+Sm/Bsi3t1LR3p5u5oWlHmEAVaHHL/YNC
         7QMg==
X-Gm-Message-State: ANoB5pllj1cqa0aSYPjHLoOAdaPgrfSn6eCLddRq/clYLzoAb5tIRRiW
	DeRYNiGlAj+o4KnIFhtg6b7pqwEgxtAjAA==
X-Google-Smtp-Source: AA0mqf4R3SVU0l6fq1/om5dwvlCIX3e5iPe7tH7fyhmp36h8CwNCoM03zjaUh15Xoj4MMIlktZXiHA==
X-Received: by 2002:a37:e210:0:b0:6d9:91ee:3db5 with SMTP id g16-20020a37e210000000b006d991ee3db5mr14938586qki.614.1669215007055;
        Wed, 23 Nov 2022 06:50:07 -0800 (PST)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com. [209.85.219.180])
        by smtp.gmail.com with ESMTPSA id u20-20020a05620a0c5400b006cf8fc6e922sm12264954qki.119.2022.11.23.06.50.04
        for <linux-mtd@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Nov 2022 06:50:05 -0800 (PST)
Received: by mail-yb1-f180.google.com with SMTP id 7so21077664ybp.13
        for <linux-mtd@lists.infradead.org>; Wed, 23 Nov 2022 06:50:04 -0800 (PST)
X-Received: by 2002:a25:7204:0:b0:6f0:9ff5:1151 with SMTP id
 n4-20020a257204000000b006f09ff51151mr1298002ybc.543.1669215004429; Wed, 23
 Nov 2022 06:50:04 -0800 (PST)
MIME-Version: 1.0
References: <cover.1656341824.git.geert+renesas@glider.be> <923c057c77b146710a82d486f89ce3a8ebda7ccd.1656341824.git.geert+renesas@glider.be>
In-Reply-To: <923c057c77b146710a82d486f89ce3a8ebda7ccd.1656341824.git.geert+renesas@glider.be>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 23 Nov 2022 15:49:53 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU5rZVh_oJJjkkD1H33N=49sE3KGaHoRuW1DBc5x=3+PQ@mail.gmail.com>
Message-ID: <CAMuHMdU5rZVh_oJJjkkD1H33N=49sE3KGaHoRuW1DBc5x=3+PQ@mail.gmail.com>
Subject: Re: [PATCH 7/7] memory: renesas-rpc-if: Reinitialize registers during
 system resume
To: linux-renesas-soc@vger.kernel.org
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Sergey Shtylyov <s.shtylyov@omp.ru>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Mark Brown <broonie@kernel.org>, linux-mtd@lists.infradead.org, 
	linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Geert Uytterhoeven <geert+renesas@glider.be>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221123_065011_741203_445394F4 
X-CRM114-Status: GOOD (  29.38  )
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

On Mon, Jun 27, 2022 at 5:31 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> During PSCI system suspend, R-Car Gen3 SoCs may be powered down, and
> thus the RPC-IF register state may be lost.  Consequently, when using
> the RPC-IF after system resume, data corruption may happen.
>
> Fix this by reinitializing the hardware state during system resume.
> As this requires resuming the RPC-IF core device, this can only be done
> when the device is under active control of the HyperBus or SPI child
> driver.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

For v2, I dropped this patch from the series.

Apparently this patch is not needed, nor does it have any impact on
HyperFLASH read operation on Salvator-XS with R-Car M3-N ES1.0 and
Ebisu-4D with R-Car E3 ES1.0.

On Salvator-X with R-Car M3-W ES1.0, there is a different issue causing
random bit flips (which is not solved by the Strobe Timing Adjustment
bit (STRTIM) fix for R-Car M3-W ES1.x in the BSP).

On Salvator-XS with R-Car H3-ES2.0, corruption is seen after s2ram.
TL;DR: while this patch does have impact on that, RPC operation after
s2ram is still not guaranteed, and the core issue is still not
understood.

---
For testing, I use the following command to read /dev/mtdblock1 (which
contains the BL2 bootloader) and check its checksum 100 times:

    time sha256sum -c <(yes $(cat mtdblock1.sha256sum) | head -100)

After boot and s2idle, the success rate is 100%.

1. Without this patch, the failure rate after s2ram is ca. 65%.

When splitting and comparing the data read back, some blocks of 64 KiB
(but not always the same on different runs) have been replaced by bad
data, containing either data from elsewhere, or all ones.  The latter is
probably the same symptom as the former, as the HyperFLASH does contain
blocks with all-ones data.

The data from elsewhere looks like e.g.:

    00046f10  75 75 69 64 5f 64 69 73  75 75 69 64 5f 64 69 73
|uuid_disuuid_dis|
    00046f20  64 72 27 0a 20 20 20 20  64 72 27 0a 20 20 20 20  |dr'.
  dr'.    |
    00046f30  6c 69 67 6e 65 64 20 74  6c 69 67 6e 65 64 20 74
|ligned tligned t|
    00046f40  61 64 64 72 32 20 63 6f  61 64 64 72 32 20 63 6f  |addr2
coaddr2 co|
    00046f50  0a 6d 6d 63 20 72 70 6d  0a 6d 6d 63 20 72 70 6d  |.mmc
rpm.mmc rpm|
    00046f60  20 6c 61 72 67 65 72 0a  20 6c 61 72 67 65 72 0a  |
larger. larger.|
    00046f70  6d 32 00 63 6d 6d 31 00  6d 32 00 63 6d 6d 31 00
|m2.cmm1.m2.cmm1.|
    00046f80  32 5f 64 61 74 61 34 00  32 5f 64 61 74 61 34 00
|2_data4.2_data4.|
    00046f90  31 00 47 50 5f 35 5f 31  31 00 47 50 5f 35 5f 31
|1.GP_5_11.GP_5_1|
    00046fa0  65 78 63 65 65 64 65 64  65 78 63 65 65 64 65 64
|exceededexceeded|
    00046fb0  30 34 2d 72 63 34 2d 30  30 34 2d 72 63 34 2d 30
|04-rc4-004-rc4-0|

which seems to originate from two copies of the first 8 bytes of each of
the following lines, found elsewhere in the HyperFLASH:

    006f1000  75 75 69 64 5f 64 69 73  6b 3d 00 6e 61 6d 65 3d
|uuid_disk=.name=|
    ...
    006f2000  64 72 27 0a 20 20 20 20  20 20 70 61 73 73 69 6e  |dr'.
    passin|
    ...
    006f3000  6c 69 67 6e 65 64 20 74  6f 0a 20 20 20 20 20 20
|ligned to.      |
    ...
    006f4000  61 64 64 72 32 20 63 6f  75 6e 74 00 6d 65 6d 6f  |addr2
count.memo|
    ...
    006f5000  0a 6d 6d 63 20 72 70 6d  62 20 6b 65 79 20 3c 61  |.mmc
rpmb key <a|
    ...
    006f6000  20 6c 61 72 67 65 72 0a  00 75 6e 7a 69 70 00 75  |
larger..unzip.u|
    ...
    006f7000  6d 32 00 63 6d 6d 31 00  63 6d 6d 30 00 63 73 69
|m2.cmm1.cmm0.csi|
    ...
    006f8000  32 5f 64 61 74 61 34 00  73 64 68 69 32 5f 64 61
|2_data4.sdhi2_da|
    ...
    006f9000  31 00 47 50 5f 35 5f 31  32 00 47 50 5f 35 5f 31
|1.GP_5_12.GP_5_1|
    ...
    006fa000  65 78 63 65 65 64 65 64  00 0a 25 73 3b 20 73 74
|exceeded..%s; st|
    ...
    006fb000  30 34 2d 72 63 34 2d 30  30 30 38 32 2d 67 35 34
|04-rc4-00082-g54|

For both hexdumps above, offsets are absolute FLASH offsets, not relative
partition offsets.  Still, there is some similarity (e.g. 0x46f10 vs.
0x6f1000).

2. With this patch, the failure rate of 100 reads after s2ram is either
0%, or 100%.  The same is true after subsequent s2ram operations.

Contrary to before this patch, in case of corruption, the data read back
is always the same: i.e. either the good data is read back, or the exact
same bad data is read back.  In case of bad data, some blocks of 64 KiB
have been replaced by blocks containing either data from elsewhere,
or all ones again....

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
