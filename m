Return-Path: <SRS0=enRf=27=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88DBDC282DD
	for <linux-mtd@archiver.kernel.org>; Fri, 10 Jan 2020 17:14:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5AF0320842
	for <linux-mtd@archiver.kernel.org>; Fri, 10 Jan 2020 17:14:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="K9u0e3n9";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZR1SmNa4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5AF0320842
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=95S8gZiwXnWWdvpyo6LHZsJt+FFkEGHIKxazL1zwgo8=; b=K9u0e3n9Ac4TA1
	Y+KJU6cDHiFW/6jvSrDsAvX5zkX44GbTO47VmyIQzAGEeltw5xAMmXPTJ5BlaBVoQkCU8UzL+XO7C
	1b02Zg7/PYmSmJGFq1RppjitIQCt6/4AU91Bc/kDx7ewmNFKk14KU9UY84dtZ5i1B11LGwVOE5k7C
	ttkkMCj62FY66KyyiSAJBBZO1DNW/4R0lK7kxdQ3SLJO3Um04BRcQA6WEcfQzbcNHCljLMFoFkfUh
	HqDawlGBYYyhS44ZaxVHvQ4OKdU/T6Y6Cz8MzYvQYwGnhe5sPBDlPLZsExar2U9ttCHy721SNG/5t
	R2mP2LtdudKBnTwpyQ2A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ipxrQ-000544-7X; Fri, 10 Jan 2020 17:14:12 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ipxrE-0004tn-CY
 for linux-mtd@lists.infradead.org; Fri, 10 Jan 2020 17:14:02 +0000
Received: by mail-wr1-x441.google.com with SMTP id w15so2553984wru.4
 for <linux-mtd@lists.infradead.org>; Fri, 10 Jan 2020 09:13:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=TqK59IlRDTivNScIrv1p8mcek/6EynWWU6nqtJax3dI=;
 b=ZR1SmNa4ewMC+9bM1Qd4GEbT6TIUSkZWMhmNlR2/u1Q/XFPT4nonM1wMrjJxGix6n2
 vhJO/XCFrDTqySe7vOWbZrXp5bXcEGNf/rNQnFfGXEOjdrbyEsLjN+z9bEmAWZ8K0f0U
 kVbNfNmPt5U41w/4K4sAOgAwMx/hQF7n1iRnS/qWrZkBkn27LU/qN6GafSrJBsGhJ42B
 bVqiRWp4xbKWaabr9qGEpOxzZmwJSWfA5A2hMCUw2LPtafQIIelXj6hSS6iDAkqxJ5df
 tI7NsvhNpPaS2b1U91/Iw44l7T/lFaJh5jifN1UMwwLq4SSdJY1aSAcPIZkrEwiR6LN9
 Hwmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TqK59IlRDTivNScIrv1p8mcek/6EynWWU6nqtJax3dI=;
 b=HmAyLM62OmnXIazWpHYK0WdnFHCQZNW0W/stPzffSEzS+HQNSegL3+sMFGgIiftRFY
 bTBftmWUXYcAlH/f5A/2o/+Ely//2wFfVxROTgJEYABJHKpfGQztmOGVLOgG53FMMa+b
 BYgwCtKQ7wWzdS0c8usK4CucBsMhvZh+exowhatYRwRkSE2iH3uJVuJZIeIG93Y4Z/wN
 TvBjgRpUNpGs1ORUdbLVhIcrD2baHrDv/w6hZz1rFCpnxoDvxUJDYdPYMfMZNs9/q5ov
 A4v8cNm8GXfuvANxO9LBQ2FAOSt1X7BAmUteqio2sPNBD9OUEWXTuF094xaI8mznOqw2
 XNRg==
X-Gm-Message-State: APjAAAVIBEu1enx2eKG4pNxRXk5xnLgKlcS5e0VqHFtyd2rKUW8wphCP
 YEdgm3ogE8+uFGuqh9VoWkaqVUbV
X-Google-Smtp-Source: APXvYqzkM/IaRhGQUdWJmLCKFeuPcx4+bwvHlSzMI4PzLnvql8zHATRdwxGunpYHB7YsgHiLEaCBLg==
X-Received: by 2002:adf:ebc3:: with SMTP id v3mr4561515wrn.280.1578676438437; 
 Fri, 10 Jan 2020 09:13:58 -0800 (PST)
Received: from [192.168.1.4] (ip-86-49-35-8.net.upcbroadband.cz. [86.49.35.8])
 by smtp.gmail.com with ESMTPSA id
 t131sm2999586wmb.13.2020.01.10.09.13.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Jan 2020 09:13:57 -0800 (PST)
Subject: Re: mtd raw nand denali.c broken for Intel/Altera Cyclone V
To: Tim Sander <tim@krieglstein.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>
References: <5143724.5TqzkYX0oI@dabox> <23083624.r2bJSIadJk@dabox>
 <CAK7LNASG+b03NDhrenB9yfvgYDVpYSnb2vSCu_-DB8dh70boMg@mail.gmail.com>
 <2827587.laNcgWlGab@dabox>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <0cc8ef75-8263-d8c8-b545-8d55c14ab2f4@gmail.com>
Date: Fri, 10 Jan 2020 18:13:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <2827587.laNcgWlGab@dabox>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200110_091400_449002_885FD2A5 
X-CRM114-Status: GOOD (  28.35  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Dinh Nguyen <dinguyen@kernel.org>, linux-mtd <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 1/10/20 5:46 PM, Tim Sander wrote:
> Hi Masahiro Yamada

Hi,

> Sorry for the large delay. I have seen the patches at 
> https://lists.infradead.org/pipermail/linux-mtd/2019-December/092852.html
> Seem to resolve the question about the spare_area_skip_bytes register.
> 
> I have now set the register to 2 which seems to be the right choice on an Intel  
> SocFPGA. But still i am out of luck trying to boot 5.4.5-rt3 or 5.5-rc5. I get the 
> following messages during bootup booting:
> [    1.825590] denali-nand-dt ff900000.nand: timeout while waiting for irq 0x1000
> [    1.832936] denali-nand-dt: probe of ff900000.nand failed with error -5
> 
> But the commit c19e31d0a32dd 2017-06-13 22:45:38 predates the 4.19 kernel
> release (Mon Oct 22 07:37:37 2018). So it seems there is not an obvious commit
> which is causing the problem. Looking at the changes it might be that the timing
> calculations in the driver changed which might also lead to a similar error.
> 
> I am booting via NFS the bootloader is placed in NOR flash.  The corresponding 
> nand dts entry is updated to the new format and looks like this:
>                 nand@ff900000 {
>                         #address-cells = <0x1>;
>                         #size-cells = <0x0>;
>                         compatible = "altr,socfpga-denali-nand";
>                         reg = <0xff900000 0x100000 0xffb80000 0x10000>;
>                         reg-names = "nand_data", "denali_reg";
>                         interrupts = <0x0 0x90 0x4>;
>                         clocks = <0x2d 0x1e 0x2e>;
>                         clock-names = "nand", "nand_x", "ecc";
>                         resets = <0x6 0x24>;
>                         status = "okay";
>                         nand@0 {
>                                 reg = <0x0>;
>                                 #address-cells = <0x1>;
>                                 #size-cells = <0x1>;
>                                 partition@0 {
>                                         label = "work";
>                                         reg = <0x0 0x10000000>;
>                                 };
>                         };
>                 };
> 
> The last kernel i am able to boot is 4.19.10. I have tried booting:
> 5.1.21, 5.2.9, 5.3-rc8, 5.4.5-rt3 and 5.5-rc5. They all failed. Unfortunately the 
> range is quite large for bisecting the problem. It also occurred to me that
> all the platforms with Intel Cyclone V in mainline are development boards
> which boot from SD-card not exhibiting this problem on their default boot path.

There are also patches for U-Boot which you need to get this whole thing
working, unless you have reset support for the Denali NAND in mainline
Linux. See

https://patchwork.ozlabs.org/project/uboot/list/?series=152289

Sadly, all of the efforts thus far crashed on various review pushback.

> Best regards
> Tim
> 
> PS: Here is some snippet from an older mail i didn't sent to the list yet which
> might be superseded by now:
> To get into this matter i started reading the "Intel Cyclone V HPS TRM" 
> Section 13-20 Preserving Bad Block Markers:
> "You can configure the NAND flash controller to skip over a specified number of 
> bytes when it writes the last sector in a page to the spare area. This option 
> write the desired offset to the spare_area_skip_bytes register in the config 
> group. For example, if the device page size is 2 KB, and the device 
> area, set the spare_area_skip_bytes register to 2. When the flash controller 
> writes the last sector of the page that overlaps with the spare area, it 
> spare_area_skip_bytes must be an even number. For example, if the bad block 
> marker is a single byte, set spare_area_skip_bytes to 2."
> 
> 
> 
> 
> 


-- 
Best regards,
Marek Vasut

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
