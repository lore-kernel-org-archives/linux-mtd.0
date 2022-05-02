Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46B62C433F5
	for <linux-mtd@archiver.kernel.org>; Mon,  2 May 2022 20:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:Subject:From:References:Cc:To:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wWgmZLnLrv/SOMTGCyv5XTKOkdqYCURZ3q1KqSHQOqI=; b=xWZzEN1gmVqu7z
	IIb0696cMdgS+wP2bnmwb8uJtI8/2ovfzXU7FGvpf2i75kj0rFXpiizc76lJpj/ZGsNlJ6lu3YjFX
	RhSkdh5GH7KmcIth4+N1kxpFsIvHit3ULAN1bBkxYsaoI6aDI7LLvvUt6OSkmo16ciMkGTSMfTHzc
	RQlO2kvyrWkto6504n/KICe22mp0uOzurkMs8eYv1FSiQhRGNf0uP/jubMk6UiJDqFVGJbyDB7O8U
	lSVGZ5QY/r6x23+pc09PNllUkKo5Tkeuhlk0yK3apqiqwEX8ihoMeRZOYcIe758O708edSCSL8tPm
	YRPxANWZWOMMga5YjwFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nlclk-002c5b-JO; Mon, 02 May 2022 20:35:44 +0000
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nlclK-002buL-Bh; Mon, 02 May 2022 20:35:20 +0000
Received: by mail-oi1-x22d.google.com with SMTP id z8so16366792oix.3;
 Mon, 02 May 2022 13:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:content-language:to
 :cc:references:from:subject:in-reply-to:content-transfer-encoding;
 bh=Wbb/YCuXfU00DfHND/DHy2kwUE+lT6TSINXYpJ/qV5I=;
 b=FLLW/uyff9Ycgsqvr7B/1rKKbYcqxPHcB/Z4Dzkise/sBahurt9MkB5d2Pwdq0mBx6
 JBZ79EtlI9uPK5x9zPokW236sVzMczhGdVx1gIMZGk636HBXuHx4CTnG4GED7AvGzHUW
 Thvss09ZX4qJwF85xOtO/5anUeLJUCJLQqE2oTAv7ob7MgOQbZ8FIG2ataSCB11SLPi/
 zWRPk8cies0VayUBETQZF0ATO7Ph0YxmHCoLhEDbHA/tOq7AD79YUjIKnbLY1pjSmHsB
 fjVxpaNMsC7JbyjvdifBLlvwCFZr+BZVQ35H0Bzt/dw9KykTjCJryLdhyJ23VfF7JeHa
 F90Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:subject:in-reply-to
 :content-transfer-encoding;
 bh=Wbb/YCuXfU00DfHND/DHy2kwUE+lT6TSINXYpJ/qV5I=;
 b=oE5vvJqvZ+fbgOUBw4+Dc92fgsRnHkQfpYheh3VakYAdZZXvZsGI+oR+LBAFHXu37r
 Q0NyBGw3kE0/zLAXQEI9eHpyHJkNng/CVU5yko3i7SpbmQdFEdz5WOvyfPN0uYhIWXvt
 tKrXrI/mnyKHCwkefC1KClq0JHUpi/RIrkdNiqS976gvhzsgpyaQyvyCOT4N0eS/M+b2
 umGplfJB++RtxeqzpsF4ISbe3vZHDQETDJ30l76yLM08zQlXbI/VcpYsgWaqJVBUDDz6
 iE3a20vUjgD6WoIi4JRmENdYuuMJR3Dc1LOQNC5qbIUyW6tJpYvsQt8kVantX7Cx9k/5
 zYLg==
X-Gm-Message-State: AOAM533n+D+qkTDW1iVJtqyRLz4tAIlX58dOprtzcgKM5BR0w4MTJWdI
 EuG5yXy9WmXdJO/KcXiIVMY=
X-Google-Smtp-Source: ABdhPJwiM/GiwIXmL7hyCptsmhhiYotg3kbrvacK9o0+PJRo8UrmYe/PJoRe3aFR7xYQMKwGGCJYVg==
X-Received: by 2002:a05:6808:1311:b0:325:bb64:ced6 with SMTP id
 y17-20020a056808131100b00325bb64ced6mr454522oiv.13.1651523716162; 
 Mon, 02 May 2022 13:35:16 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c?
 ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 e2-20020a4aa602000000b0035ef3da8387sm1302819oom.4.2022.05.02.13.35.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 May 2022 13:35:15 -0700 (PDT)
Message-ID: <c001d58e-9a78-6338-a533-d0f215b3dfd1@roeck-us.net>
Date: Mon, 2 May 2022 13:35:11 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To: Arnd Bergmann <arnd@arndb.de>
Cc: Robert Jarzmik <robert.jarzmik@free.fr>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Philipp Zabel
 <philipp.zabel@gmail.com>, Lubomir Rintel <lkundrak@v3.sk>,
 Paul Parsons <lost.distance@yahoo.com>, Sergey Lapin <slapin@ossfans.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Dominik Brodowski <linux@dominikbrodowski.net>, Helge Deller
 <deller@gmx.de>, Mark Brown <broonie@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 IDE-ML <linux-ide@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>,
 Linux PM list <linux-pm@vger.kernel.org>,
 "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
 patches@opensource.cirrus.com, linux-leds@vger.kernel.org,
 linux-mmc <linux-mmc@vger.kernel.org>,
 linux-mtd <linux-mtd@lists.infradead.org>, linux-rtc@vger.kernel.org,
 USB list <linux-usb@vger.kernel.org>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>
References: <20220419163810.2118169-1-arnd@kernel.org>
 <3b4046ed-fd75-13ea-fac3-06469172806c@roeck-us.net>
 <CAK8P3a1LzEG1vo+5nMrnL3TOMcbSKJ3u=StcfY8dajV2raUBjA@mail.gmail.com>
 <3df135a2-17f5-d6c6-b4a8-e1a60e254297@roeck-us.net>
 <CAK8P3a2EHMQPN4ny9sXXuReFG0jN0hyRV7h9v_AR_0pqpOU41w@mail.gmail.com>
 <CAK8P3a09+nFS3g1rgvTW9da3tMiAhHjkjZVs1QOJOj8TJ-9MDg@mail.gmail.com>
 <6f1b27fa-96d1-4be7-ac6a-762610314f2a@roeck-us.net>
 <8d6d453a-e6fc-439b-2f34-e60c22fc9e98@roeck-us.net>
 <CAK8P3a2Ekvis1YcrJZtuga+XQdbeTC98PkOszCpS2DiZri7VMQ@mail.gmail.com>
 <149509dd-f43d-1b27-4395-81eab4ff3455@roeck-us.net>
 <CAK8P3a05vFdBnXXAMPVS82xX29+uinvWPcWxAgvj0TfoOk+1kg@mail.gmail.com>
 <b13783aa-9225-d52a-3800-c97ad772688b@roeck-us.net>
 <CAK8P3a3S5OjkKq_u5FpnwzYv+0+typya6Z4MzTez5ZH+do00xQ@mail.gmail.com>
 <CAK8P3a3jiqf_zpBsZyvAb5ZtkwDa7KkqExqDAdpY_pYqkr_NgQ@mail.gmail.com>
 <4dcdbfe2-9edf-320b-d123-3b62c8b5e28e@roeck-us.net>
 <CAK8P3a0ogn1wgPBDHkT=Fb8ufA+y8Ax1Qov2-vRXfC08QqnrQA@mail.gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v2 00/48] ARM: PXA multiplatform support
In-Reply-To: <CAK8P3a0ogn1wgPBDHkT=Fb8ufA+y8Ax1Qov2-vRXfC08QqnrQA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220502_133518_456642_60ECEAC3 
X-CRM114-Status: GOOD (  20.52  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 5/2/22 12:21, Arnd Bergmann wrote:
> On Mon, May 2, 2022 at 6:26 PM Guenter Roeck <linux@roeck-us.net> wrote:
>>
>> With v5.18-rc1-49-gcb813018b5c1, I still get:
>>
>> [    0.797668] RAMDISK: Couldn't find valid RAM disk image starting at 0.
>> [    0.805262] /dev/root: Can't open blockdev
>> [    0.805487] VFS: Cannot open root device "(null)" or unknown-block(0,0): error -6
>> [    0.805674] Please append a correct "root=" boot option; here are the available partitions:
>>
>> when trying to boot z2 from initrd.
>>
>> The other problems are gone.
> 
> Ok, progress!
> 
> What is your qemu command line? I see that z2 has no pcmcia device, so
> I tried booting
> from MMC, but this already fails with 5.18-rc1 without any of my
> patches, giving me
> 
> [    0.697481] Creating 3 MTD partitions on "physmap-flash":
> [    0.698161] 0x000000000000-0x000000040000 : "U-Boot Bootloader"
> [    0.702815] 0x000000040000-0x000000060000 : "U-Boot Environment"
> [    0.706541] 0x000000060000-0x000000800000 : "Flash"
> [    0.718066] pxa2xx-mci pxa2xx-mci.0: incomplete constraints, dummy
> supplies not allowed
> [    0.718501] pxa2xx-mci pxa2xx-mci.0: incomplete constraints, dummy
> supplies not allowed
> 

To boot from initrd:

qemu-system-arm -M z2 -kernel \
      arch/arm/boot/zImage -no-reboot -initrd \
      rootfs-armv5.cpio --append \
      "panic=-1 slub_debug=FZPUA rdinit=/sbin/init console=ttyS0" -nographic \
      -monitor null -serial stdio

where rootfs-armv5.cpio is from my repository at github.com.

https://github.com/groeck/linux-build-test/blob/master/rootfs/arm/rootfs-armv5.cpio.gz

> Do  you have MMC or some other rootfs working without my patch series?
> 

I can boot z2 from mmc and flash, but I have a number of configuration
flags enabled on top of pxa_defconfig. That also works with your latest patch
series. See
https://kerneltests.org/builders/qemu-arm-testing/builds/75/steps/qemubuildcommand/logs/stdio

     # Always enable ...
     enable_config "${defconfig}" CONFIG_DEVTMPFS CONFIG_DEVTMPFS_MOUNT CONFIG_BLK_DEV_INITRD
     # Options needed to be built into the kernel for device support
     # on pxa devices
     # MTD, squashfs
     enable_config_cond "${defconfig}" CONFIG_MTD_BLOCK CONFIG_MTD_PXA2XX CONFIG_SQUASHFS
     # MMC
     enable_config_cond "${defconfig}" CONFIG_MMC_BLOCK CONFIG_MMC_PXA
     # PCMCIA
     enable_config_cond "${defconfig}" CONFIG_ATA CONFIG_BLK_DEV_SD CONFIG_PCCARD
     enable_config_cond "${defconfig}" CONFIG_PCMCIA CONFIG_PATA_PCMCIA CONFIG_PCMCIA_PXA2XX
     # USB
     enable_config_cond "${defconfig}" CONFIG_USB CONFIG_USB_STORAGE CONFIG_USB_OHCI_HCD CONFIG_USB_OHCI_HCD_PXA27X

Hope this helps,
Guenter

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
