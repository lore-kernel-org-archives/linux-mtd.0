Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24A96C3DA78
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Jan 2023 19:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SgTRb1jD8PraP/XJtpNmadWMJ6yczunLCX19jWpS+is=; b=f0z2Iw8dQR40u9
	en6bdIQNOxY8E6nGzV4QHe5nAJGNHk8cCduPPjfOf99M84tXy1CMjCzLdY25gM0cHWWYCXvsbogt/
	YVeMlLyeJ8q274R5EK/KD/RtdezojzRXqiSu2Ylusnzg1OXgxSjUeUMne6LgFQAJqEwVAFByUuBIt
	5oEo6i3zvXyjQyzjY7zquy8/Yj9bc3LePy6khbwwCor5oNBLaMuA3r80FjuocPbhkye5aKpmTgB64
	yrL9ObFVGCeCXngtP75Wh+NXlQBX1koYFoiHix7o5yzf0V6fHXCGepMS1KC1OojdcmdO85pDeXtcn
	wXcImH4VYrco3qgR+7oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHrDd-00FWyr-Fa; Tue, 17 Jan 2023 19:02:01 +0000
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHrD4-00FWkd-FT
	for linux-mtd@lists.infradead.org; Tue, 17 Jan 2023 19:01:28 +0000
Received: by mail-oa1-x31.google.com with SMTP id 586e51a60fabf-15bb8ec196aso21231558fac.3
        for <linux-mtd@lists.infradead.org>; Tue, 17 Jan 2023 11:01:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=landley-net.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OgaymgAXi9Z6g6pYwBOzM02/P477EqWitgDVTE3LFbU=;
        b=7UFMvbpKkJyjWVLlq6ctk0nXiLL3RrLgvGqk+/g8pD0wAzMEFNodkoMNXxSPAzvJye
         T4nqVDpRCF5Pkw4fe0ROrd1BjE8DZbycDcUSRlgnihtqJaZkkqELJ7TzEZYyPHojRNxM
         MBh6YZCgcmJgLXwboxe3bvrjmez4qHhfCRIxGuc2G0+QOOJ/eKT38XBZ7MfSSmNLVm7z
         gDt6C3Ymsnj+eKLcMZ0dj5q2KFKnZutgcY/1C6+IgeLmT5DwAU4QsUhG6TCQdnlD6nEb
         fYtWfawIuB6wYahQA/cq89ISwAR2GZXbrrCFpCVxRJqHc9Mn337ID3jg/QgfKjbyHIu6
         BObQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OgaymgAXi9Z6g6pYwBOzM02/P477EqWitgDVTE3LFbU=;
        b=FhecGpNPG5Q7qU2CxXXwoNblp9ukji5inSvq2ulZYHxY2FMm3EC/eiZ9UcVpGRGIPP
         6xgj/4JMS+vONWd52QBuel3960/n20+P+6zNy5rkA/J4ngEaWs4aH3Ry8jpCUCviq+Om
         3F0zu9NTLyOc8MWQil3Bse/VbKVrQxIoHaeCFf5xmszau1kx6bKzHIpF/VdHb4SuKIDs
         L8EXhw7lEa6x0tey6QMBc1VBw19QNq+0S+GEkbcTsmqT2Bznv4H4Q0VbuBvIuyXCYU5j
         HJJ8X/gsclGq6Pz8PIAJHMjnFXc6a5WaJl8rrmCsU2i99Re5JDY8MB9Qy3RGEdByA3+E
         isUA==
X-Gm-Message-State: AFqh2kqfd9DBByrVRdkFi2d89YBuJv/ZwgWMagBb0OEtQ18iTtLK+jte
	sqj2gZwSgIBSw9C2umF8zS7wgw==
X-Google-Smtp-Source: AMrXdXsgzCxMhqm+bb3il7EsJjEv0NbGPCzT1qf9VREFYRxVllxrk/YEzaFAyrBdtefAaDgGfnk/UQ==
X-Received: by 2002:a05:6870:c190:b0:15e:cfca:b312 with SMTP id h16-20020a056870c19000b0015ecfcab312mr2807015oad.52.1673982083592;
        Tue, 17 Jan 2023 11:01:23 -0800 (PST)
Received: from [192.168.86.224] ([136.62.38.22])
        by smtp.gmail.com with ESMTPSA id r18-20020a05687080d200b0012763819bcasm16664335oab.50.2023.01.17.11.01.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jan 2023 11:01:22 -0800 (PST)
Message-ID: <9325a949-8d19-435a-50bd-9ebe0a432012@landley.net>
Date: Tue, 17 Jan 2023 13:13:38 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: remove arch/sh
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker
 <dalias@libc.org>, Arnd Bergmann <arnd@arndb.de>,
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
From: Rob Landley <rob@landley.net>
In-Reply-To: <20230116071306.GA15848@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230117_110126_840588_0DD00E46 
X-CRM114-Status: GOOD (  19.43  )
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

On 1/16/23 01:13, Christoph Hellwig wrote:
> On Fri, Jan 13, 2023 at 09:09:52AM +0100, John Paul Adrian Glaubitz wrote:
>> I'm still maintaining and using this port in Debian.
>>
>> It's a bit disappointing that people keep hammering on it. It works fine for me.
> 
> What platforms do you (or your users) use it on?

3 j-core boards, two sh4 boards (the sh7760 one I patched the kernel of), and an
sh4 emulator.

I have multiple j-core systems (sh2 compatible with extensions, nommu, 3
different kinds of boards running it here). There's an existing mmu version of
j-core that's sh3 flavored but they want to redo it so it hasn't been publicly
released yet, I have yet to get that to run Linux because the mmu code would
need adapting, but the most recent customer projects were on the existing nommu
SOC, as was last year's ASIC work via sky130.

My physical sh4 boards are a Johnson Controls N40 (sh7760 chipset) and the
little blue one is... sh4a I think? (It can run the same userspace, I haven't
replaced that board's kernel since I got it, I think it's the type Glaubitz is
using? It's mostly in case he had an issue I couldn't reproduce on different
hardware, or if I spill something on my N40.)

I also have a physical sh2 board on the shelf which I haven't touched in years
(used to comparison test during j2 development, and then the j2 boards replaced it).

I'm lazy and mostly test each new sh4 build under qemu -M r2d because it's
really convenient: neither of my physical boards boot from SD card so replacing
the kernel requires reflashing soldered in flash. (They'll net mount userspace
but I haven't gotten either bootloader to net-boot a kernel.)

I include sh4 in the my mkroot builds each toybox release, I have a ~300 line
bash script that builds bootable toybox systems for a dozen-ish architectures,
including building a kernel configured to run under qemu:

  https://github.com/landley/toybox/blob/master/scripts/mkroot.sh

And I ship the resulting bootable system images, most recent release is at:

  https://landley.net/toybox/downloads/binaries/mkroot/0.8.9/

As described at:

  http://landley.net/toybox/faq.html#mkroot

Various people in Japan have more hardware, but I haven't made it physically
back there since 2020. (My residency card expired during the pandemic.)

Rob

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
