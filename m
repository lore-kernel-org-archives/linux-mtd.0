Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DB42C38142
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Jan 2023 23:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jhq1cP9JEqGSWrRPwMlZiLgyzMTrXESBxKZwQm/5VoY=; b=eaJPtOEB0gH7xU
	4widfxKfIbQb+jT6pcsKb5hyr6aluaL1ECEBGSZ0bVLrSdxfbTSYP+aiN/97ewN0Ay66Pbh8GDPqD
	bhT9yWvyO7UJy1fGTw87wr2NRcHcqIm8zE2R96i1V+sUufzHz4uuw7EMgwSXjQYRGwK1u+JNE2tj1
	Fcqm45Sh5XNN/Ipgf+09+aSSMm0D2lzCQhit1lgxfsaKoIOqgY49nKdl0n0KjgWVUX3lxm/iB57mN
	Yf9LfNuBecx1pVRAsDwAx/1c3OeMqEHM6hiKMAq90zbcJde6EIwoq36X1dak9qriRrcx9cnJEDC2k
	i6QY8y8X5aB9deDf/47Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHv17-00GBgM-NG; Tue, 17 Jan 2023 23:05:21 +0000
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHv14-00GBfw-HF
	for linux-mtd@lists.infradead.org; Tue, 17 Jan 2023 23:05:20 +0000
Received: by mail-oa1-x2a.google.com with SMTP id 586e51a60fabf-1442977d77dso33693461fac.6
        for <linux-mtd@lists.infradead.org>; Tue, 17 Jan 2023 15:05:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=4AE2HZs9Ij2bBJhhAjrwEjzLChQl9bR57MnvWzA7x6U=;
        b=DW8ifSPAga42dfR5FsmeN7ktP7xrF85FXw0C/+Pm5lDatitnt6M1CQj7M2iuNxfpn/
         8Lqyqdz46gcYI65b7HEV2rZB0b9w18a0Vu2j5uxJKOihSIilp5BJI4J3to3fBGZBSOAg
         qKZTbOqyIEM6sy28abPqdGt+yArW2Z23B5BMGrPIlI9/cDODcnnJxtAxcNyDFXPVHMXf
         R48P+80RHdZ3pZH8azCzarSBYjkryNQm8JI66tMAqXqouswoKpLIWF/td2aT/9AEdW3K
         k98TjNYTCV9B45cWKs661R8TJB1gnbsipfyvYuHwtR9zJJna1byThoO89hC/942uN+q5
         JvyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4AE2HZs9Ij2bBJhhAjrwEjzLChQl9bR57MnvWzA7x6U=;
        b=coR1Y2+rqprkQz46bSU/qFYCu2I6VGfZykpaXqm/K+MeZo8Yeio6OLvB4bC/dWboK6
         sbuXNGIl+uMrdwllJjBad2mYe7bM7Fo+khI2w/jQoeVa4RE1gYr3IJf+8MhDuqcKZT8s
         0cY+nU4gb5vb1YyJ18vckI06hLHNEm9rcqjSG3XK3zn3yP3NlCboikhxbc8neuPFl723
         YhdlaCsx9QtmLaRf0ftNcPdWLApVlk5Fj9vmRO8mLVZ/n7b4nkvB6wGRAIKyUWwmOn1f
         nqoPN3Ob+hQcLCA5nIm5VRnhddsn+0Bt3QECQj3/uoVWF3520EShJ26eKuQGVlbmt5YE
         ZESA==
X-Gm-Message-State: AFqh2kqnbjRuJTsMYM/CLFiTd4qIR4mEP0BsvPMzsLiNoJDbTLRSDCr/
	l38/Fjuw75K7+wzWMVHaueg=
X-Google-Smtp-Source: AMrXdXtHuS2LexOqaSnPiZkh1ICiW0LO3fAy28p2lWPRYUg8JIB1z86k++pUvGweLF5SJ5SaQKIaNA==
X-Received: by 2002:a05:6870:5386:b0:15f:385c:720c with SMTP id h6-20020a056870538600b0015f385c720cmr3233662oan.30.1673996717252;
        Tue, 17 Jan 2023 15:05:17 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id cm18-20020a056870b61200b0012b298699dbsm17151555oab.1.2023.01.17.15.05.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jan 2023 15:05:16 -0800 (PST)
Message-ID: <c9ce648e-e63e-8a47-03c6-7c7e30d8dbc7@roeck-us.net>
Date: Tue, 17 Jan 2023 15:05:12 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: remove arch/sh
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>, Rob Landley <rob@landley.net>
Cc: Christoph Hellwig <hch@lst.de>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-kernel@vger.kernel.org,
 linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arch@vger.kernel.org, dmaengine@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-input@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-mtd@lists.infradead.org, netdev@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-fbdev@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-sh@vger.kernel.org
References: <20230113062339.1909087-1-hch@lst.de>
 <11e2e0a8-eabe-2d8c-d612-9cdd4bcc3648@physik.fu-berlin.de>
 <20230116071306.GA15848@lst.de>
 <9325a949-8d19-435a-50bd-9ebe0a432012@landley.net>
 <CAMuHMdUJm5QvzH8hvqwvn9O6qSbzNOapabjw5nh9DJd0F55Zdg@mail.gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <CAMuHMdUJm5QvzH8hvqwvn9O6qSbzNOapabjw5nh9DJd0F55Zdg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230117_150518_622676_DFA73380 
X-CRM114-Status: GOOD (  28.36  )
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

On 1/17/23 12:26, Geert Uytterhoeven wrote:
> Hi Rob,
> 
> On Tue, Jan 17, 2023 at 8:01 PM Rob Landley <rob@landley.net> wrote:
>> On 1/16/23 01:13, Christoph Hellwig wrote:
>>> On Fri, Jan 13, 2023 at 09:09:52AM +0100, John Paul Adrian Glaubitz wrote:
>>>> I'm still maintaining and using this port in Debian.
>>>>
>>>> It's a bit disappointing that people keep hammering on it. It works fine for me.
>>>
>>> What platforms do you (or your users) use it on?
>>
>> 3 j-core boards, two sh4 boards (the sh7760 one I patched the kernel of), and an
>> sh4 emulator.
>>
>> I have multiple j-core systems (sh2 compatible with extensions, nommu, 3
>> different kinds of boards running it here). There's an existing mmu version of
>> j-core that's sh3 flavored but they want to redo it so it hasn't been publicly
>> released yet, I have yet to get that to run Linux because the mmu code would
>> need adapting, but the most recent customer projects were on the existing nommu
>> SOC, as was last year's ASIC work via sky130.
> 
> J4 still vaporware?
> 
>> My physical sh4 boards are a Johnson Controls N40 (sh7760 chipset) and the
>> little blue one is... sh4a I think? (It can run the same userspace, I haven't
>> replaced that board's kernel since I got it, I think it's the type Glaubitz is
>> using? It's mostly in case he had an issue I couldn't reproduce on different
>> hardware, or if I spill something on my N40.)
>>
>> I also have a physical sh2 board on the shelf which I haven't touched in years
>> (used to comparison test during j2 development, and then the j2 boards replaced it).
>>
>> I'm lazy and mostly test each new sh4 build under qemu -M r2d because it's
>> really convenient: neither of my physical boards boot from SD card so replacing
>> the kernel requires reflashing soldered in flash. (They'll net mount userspace
>> but I haven't gotten either bootloader to net-boot a kernel.)
> 
> On my landisk (with boots from CompactFLASH), I boot the original 2.6.22
> kernel, and use kexec to boot-test each and every renesas-drivers
> release.  Note that this requires both the original 2.6.22 kernel
> and matching kexec-tools.  Apparently both upstreamed kernel and
> kexec-tools support for SH are different, and incompatible with each
> other, so you cannot kexec from a contemporary kernel.
> I tried working my way up from 2.6.22, but gave up around 2.6.29.
> Probably I should do this with r2d and qemu instead ;-)
> 
> Both r2d and landisk are SH7751.
> 
> Probably SH7722/'23'24 (e.g. Migo-R and Ecovec boards) are also
> worth keeping.  Most on-SoC blocks have drivers with DT support,
> as they are shared with ARM.  So the hardest part is clock and
> interrupt-controller support.
> Unfortunately I no longer have access to the (remote) Migo-R.
> 

Since there are people around with real hardware .... is sh in big endian mode
(sheb) real ? Its qemu support is quite limited; most PCI devices don't work
due to endianness issues. It would be interesting to know if this works better
with real hardware.

Thanks,
Guenter


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
