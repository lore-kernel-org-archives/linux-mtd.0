Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55B13C433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Mar 2022 07:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qhipbA7TZxi5cw2m31xBjgFbgXBLpaf9jVuF3hwFGsg=; b=WhTAhFLwiWku6N
	jZ7NtZML8eMOb1Di9cXoJWdVp3kOhUTJirB0+Ng9VRe0Og/qCHAortwEDtUjCOcYhpHavDrah+abw
	qKp4IOt+7tLpORBBkYeCCPz9X9ToBOfu0pWTu7JB3MWnB+4y8Fl6kbaJPpDljqLuhLylIICok+UON
	YQXyIMyiAT81Wn2DjY6v7tvXh0GYzAC2twuT9AsaABxSY68VC6d788EbDWXAdFhqQ8udWs3jWyQpm
	gvxkLLPB63/SfGIjujg/BNpjiIFEnyLV3s4WmJRr3omI6YTWQ+GclaTEEpfnHWaata+eSd9pmMAAb
	bAHBAzXOY6qm/oJpp0UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUkcG-00FAfb-TI; Thu, 17 Mar 2022 07:32:13 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUkcD-00FAed-Ol
 for linux-mtd@lists.infradead.org; Thu, 17 Mar 2022 07:32:11 +0000
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 521D23F1B7
 for <linux-mtd@lists.infradead.org>; Thu, 17 Mar 2022 07:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1647502327;
 bh=oHoQI919lPScI8pcxdUo8Tf+IYeq3uFQUu2n8LB+qnw=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=W/FisBWkY8UpeScry/RTKb4idjAMOxiuPrAoEFAPxCM+gwuGtfL2i1geGlHMb8Ga1
 eT0Abz7mhbM1GG6/2McwMERb0ajLh4sZPf9snOJMa181jQMf5ecCD9Yc8dB6E8NE+X
 hc4FnfhMMJZNGSselI1Tq2fqNRDUYUkIC6kV9JNAkgyXZD25iE4u4jwIBF5q6jcC9W
 thKTbFjmzPDrhMw2cLD7KjQYKv7n9DzIsJ5MEDWEEL/8IgG+V/oAUFP5quVdMxshPv
 z3HbZD8r2cZfXtdVvWyLXMTbk+Ev3hSslAjMXH9Fp+oxTQZ7qBE3+GFhMb9ciyPUqS
 4+3Rg7xYsfKoA==
Received: by mail-wm1-f71.google.com with SMTP id
 f19-20020a7bcd13000000b0038c01defd5aso1808557wmj.7
 for <linux-mtd@lists.infradead.org>; Thu, 17 Mar 2022 00:32:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=oHoQI919lPScI8pcxdUo8Tf+IYeq3uFQUu2n8LB+qnw=;
 b=rRvPFF734boWobsuSWg3Yh5f1YcyrPBSJgfeuuCIURsZSxO9l2vmr+AckWPUyFc8It
 OAruKE51UoMa7SqC6scpg9TeJjIAQ499p/fs5F31QdDdn7UF5IJuATcDv8CSrs8T4r8h
 qsMWhhulwPbU/pFt9e43UbO+O5du9QblseOrqlTSNZnoTfTBiyuPaapLUDGhWqgkiId8
 f8Kns7+dWvbtt/0rn4A/8rGc6L3Het6ZVaG9O5AB4J4njacvgdc2I8QkpGYLBfmMa0Zn
 vvp8EqWW+CQ3dhwxwj0mvz8S0gtNFM1DnUoNap+E6Dp2dU9Jr4mvGVTF9ycCNEXAjTbV
 RZqA==
X-Gm-Message-State: AOAM530ur4XwKSrlqq+uAoDEAHYSgbdNyY71ZibYbPp3yfkzPTjhmSLC
 Won1Qpwm8eH6u40Puk0rPIAxjyoDcRwfm8BXa9hhIP3pe5OElg6aXSXXTFBS5h93wEPhZaQ1C/l
 hKkzbFsSRNPAqS8awCZOlaM24uuTiaC2cG5wAdKlPDMw=
X-Received: by 2002:a5d:6104:0:b0:203:df06:5d6a with SMTP id
 v4-20020a5d6104000000b00203df065d6amr2698686wrt.241.1647502326131; 
 Thu, 17 Mar 2022 00:32:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxMuVm41PcpwFF45N9YDh1EjaVU+KsZhQtSOmBQnnse4kLWp3Z6Ru+4Fe/v0TLdCHADPX8NUw==
X-Received: by 2002:a5d:6104:0:b0:203:df06:5d6a with SMTP id
 v4-20020a5d6104000000b00203df065d6amr2698667wrt.241.1647502325875; 
 Thu, 17 Mar 2022 00:32:05 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 t7-20020a05600c198700b00389fb24f397sm6819411wmq.21.2022.03.17.00.32.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Mar 2022 00:32:05 -0700 (PDT)
Message-ID: <31a776ed-3371-55d6-747b-8e70e72619d7@canonical.com>
Date: Thu, 17 Mar 2022 08:32:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH RFC] memory: renesas-rpc-if: Fix HF/OSPI data transfer in
 Manual mode
Content-Language: en-US
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Sergey Shtylyov <s.shtylyov@omp.ru>, Lad@rox.of.borg,
 Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Andrew Gabbasov <andrew_gabbasov@mentor.com>,
 linux-renesas-soc@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <27107f2d578b198078df841ee2e4d7b71b183898.1647017136.git.geert+renesas@glider.be>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <27107f2d578b198078df841ee2e4d7b71b183898.1647017136.git.geert+renesas@glider.be>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220317_003210_048887_ED454A0F 
X-CRM114-Status: GOOD (  21.99  )
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

On 11/03/2022 17:53, Geert Uytterhoeven wrote:
> HyperFlash devices fail to probe:
> 
>     rpc-if-hyperflash rpc-if-hyperflash: probing of hyperbus device failed
> 
> In HyperFLASH or Octal-SPI Flash mode, the Transfer Data Enable bits
> (SPIDE) in the Manual Mode Enable Setting Register (SMENR) are derived
> from half of the transfer size, cfr. the rpcif_bits_set() helper
> function.
> 
> Hence when converting back from Transfer Data Enable bits to transfer
> size, the bus width must be taken into account, and all Manual Mode Data
> Register access sizes must be doubled when communicating with a
> HyperFLASH or Octal-SPI Flash device.
> 
> Fixes: fff53a551db50f5e ("memory: renesas-rpc-if: Correct QSPI data transfer in Manual mode")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Marked RFC, a (1) we should avoid the back-and-forth conversion between
> transfer size and Transfer Data Enable bits, and (2) actual HyperFlash
> data reads (which follows a completely different code path) still return
> all zeros.
> 
> On Salvator-XS with unlocked HyperFlash, the HyperFlash is now detected
> again, cfr. (with DEBUG_CFI enabled):
> 
>     Number of erase regions: 1
>     Primary Vendor Command Set: 0002 (AMD/Fujitsu Standard)
>     Primary Algorithm Table at 0040
>     Alternative Vendor Command Set: 0000 (None)
>     No Alternate Algorithm Table
>     Vcc Minimum:  1.7 V
>     Vcc Maximum:  1.9 V
>     No Vpp line
>     Typical byte/word write timeout: 512 \xc2\xb5s
>     Maximum byte/word write timeout: 2048 \xc2\xb5s
>     Typical full buffer write timeout: 512 \xc2\xb5s
>     Maximum full buffer write timeout: 2048 \xc2\xb5s
>     Typical block erase timeout: 1024 ms
>     Maximum block erase timeout: 4096 ms
>     Typical chip erase timeout: 262144 ms
>     Maximum chip erase timeout: 1048576 ms
>     Device size: 0x4000000 bytes (64 MiB)
>     Flash Device Interface description: 0x0000
>       - x8-only asynchronous interface
>     Max. bytes in buffer write: 0x200
>     Number of Erase Block Regions: 1
>       Erase Region #0: BlockSize 0x40000 bytes, 256 blocks
>     rpc-if-hyperflash: Found 1 x16 devices at 0x0 in 16-bit bank. Manufacturer ID 0x000001 Chip ID 0x007000
>     Amd/Fujitsu Extended Query Table at 0x0040
>       Amd/Fujitsu Extended Query version 1.5.
>     rpc-if-hyperflash: CFI contains unrecognised boot bank location (0). Assuming bottom.
>     number of CFI chips: 1
> 
> At first, the failure looked like an endianness-issue, as reading two
> bytes resulted in e.g. 0x51 0x00 instead of 0x00 0x51.  But it turned
> out to be reading a single 8-bit value of 0x51 instead of a 16-bit value
> of 0x5100.
> 
> Note that commit 0d37f69cacb33435 ("memory: renesas-rpc-if: Correct QSPI
> data transfer in Manual mode") in the BSP does not suffer from this bug,
> as it bases its decision on the real number of bytes to transfer, not on
> the SMENR.SPIDE register bits.
> ---
>  drivers/memory/renesas-rpc-if.c | 20 ++++++++++++++++----
>  1 file changed, 16 insertions(+), 4 deletions(-)
>

Some reviews and tests will be useful. Anyway it's too late upcoming
cycle, so I will pick it up after merge window.


Best regards,
Krzysztof

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
