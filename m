Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 338DEC636CC
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Feb 2023 02:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9T7641581dVlKMVyNDnlDXk5beJkuktdPo1lXlhKiUk=; b=DapHInQYiI4XVK
	wErUx8GkUmzQWQOFV6YP+7OvOAHb1/qHzkkPvhy7bXQSGiPM8n2xX938FNB43kH4sHa3LNIHavhYX
	5i1RTRuETKJXTjiB7eE0SYvsq47qJM27495GKOHxQWolmn+J45no5hErxhfLTjMt+mpDpyLZXJYZj
	wzOICBRgRPWEMtatzuYC1e+dTeuO0BajrpDJkcLS5pbfTpw3at54RuaxLp3l4e6fnfjRkrerR4YKp
	QuxGJjh+U9F973IDEqOfxIk3tfOQQduyO0hANeXIp8ggFimwFwGr4aWFMdYXmBbAMUgmZdVc6qfq1
	kRjQH5L5nKhEJEarTzWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPx3y-00HYBP-AD; Thu, 09 Feb 2023 02:53:30 +0000
Received: from mail-oa1-x36.google.com ([2001:4860:4864:20::36])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPx3t-00HYAC-Oi
	for linux-mtd@lists.infradead.org; Thu, 09 Feb 2023 02:53:27 +0000
Received: by mail-oa1-x36.google.com with SMTP id 586e51a60fabf-142b72a728fso957698fac.9
        for <linux-mtd@lists.infradead.org>; Wed, 08 Feb 2023 18:53:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=landley-net.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uim76Lm5dMHI6OEZRl5dYh1Pi4k74h79vxsD8ejV228=;
        b=cGJLZWh92YeqRetjDZ7mm7cWN9+7V9DkC4NxT3TFyzxOr/dT+y9RySdTXQJoGNFodj
         Lhk5mURgRjvFpcDTTz997u4uYb5mXXSYufkvOHW16uecAigBafpKfrfPhjupqfB69TqU
         CpdJtnnu16tBfQsfiDPbx5CJt8woI9p/61QJECQkg6ib53DsbPoG/6qEIFtT82h7XZEd
         bH7zIZ7zeIu+guqsHWHH7HwzmCW5uJfaHSVq8vhoIZZxTs9cCuui2tEeecApAXxH34Kl
         VCUo/SLo54vsVKd1HLhUdcTfFi+wK+KZOUpQFgXm1zVH8Gmha3IwtqAbksT7XdA8QMjg
         0+9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uim76Lm5dMHI6OEZRl5dYh1Pi4k74h79vxsD8ejV228=;
        b=a3Bqs0bX9737ni9VI5RU6hC03Mv+bV5nafH129UXN0oh1lwbvLinTOu2JPRb6fGPOx
         U1UkSCv7KQVl/PjjjKaLakGIdYss953efrfptjOizHqa9VC5Uj3sPudSphoBIjlnKbtC
         f0wh229Ui5g0u+VUUfO0GFCAqG75UnEj9LgXcP4F9psf31jBcqoGXj4a7dk1gJLGl7TL
         jTEwVwk9E3gFRf6dY9zaLJbsDhWyu9fStCnZA5HtTEcqZg+gZt8Xb9t/3+AaOhpXnS/b
         E61iZAQFiIxa08qoZcsTFJbvdX+RQ/4tC/qbiphgTWM1ka77npINVHd8jbm/471EyAEt
         oQwQ==
X-Gm-Message-State: AO0yUKUQ9/DRdYs9qyzwsPYqGYqwqjGnuIjKmDF7trnvhY2Yw+1sVeL/
	tt5yBAWM3+hnyxoLqNcSYocldQ==
X-Google-Smtp-Source: AK7set/IY8hpNoA4Lil9GPnYxD0kM8QMzh26dc48QApuMMt+T/W+mzLQoVZI9oh721NfnL8VF3E7Fg==
X-Received: by 2002:a05:6870:7386:b0:163:ad96:f89c with SMTP id z6-20020a056870738600b00163ad96f89cmr5551951oam.15.1675911202632;
        Wed, 08 Feb 2023 18:53:22 -0800 (PST)
Received: from [192.168.86.224] ([136.62.38.22])
        by smtp.gmail.com with ESMTPSA id v6-20020a4a5a06000000b00517b076e071sm100253ooa.47.2023.02.08.18.53.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Feb 2023 18:53:21 -0800 (PST)
Message-ID: <b394bf10-2fc5-6498-955f-a904a756e0c9@landley.net>
Date: Wed, 8 Feb 2023 21:06:19 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: remove arch/sh
Content-Language: en-US
To: Randy Dunlap <rdunlap@infradead.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Christoph Hellwig <hch@lst.de>,
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
 <40dc1bc1-d9cd-d9be-188e-5167ebae235c@physik.fu-berlin.de>
 <20230203071423.GA24833@lst.de>
 <afd056a95d21944db1dc0c9708f692dd1f7bb757.camel@physik.fu-berlin.de>
 <20230203083037.GA30738@lst.de>
 <d10fe31b2af6cf4e03618f38ca9d3ca5c72601ed.camel@physik.fu-berlin.de>
 <CAMuHMdUitVfW088YOmqYm4kwbKwkwb22fAakHcu6boxv7dXDfQ@mail.gmail.com>
 <f6a60193-a5d1-c42c-158a-4b0bfe9c7538@infradead.org>
From: Rob Landley <rob@landley.net>
In-Reply-To: <f6a60193-a5d1-c42c-158a-4b0bfe9c7538@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230208_185325_812123_FDEE2600 
X-CRM114-Status: GOOD (  33.45  )
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

On 2/3/23 09:57, Randy Dunlap wrote:
> Hi--
> 
> On 2/3/23 02:33, Geert Uytterhoeven wrote:
>> Hi Adrian,
>> 
>> On Fri, Feb 3, 2023 at 11:29 AM John Paul Adrian Glaubitz
>> <glaubitz@physik.fu-berlin.de> wrote:
>>> On Fri, 2023-02-03 at 09:30 +0100, Christoph Hellwig wrote:
>>>> On Fri, Feb 03, 2023 at 09:24:46AM +0100, John Paul Adrian Glaubitz wrote:
>>>>> Since this is my very first time stepping up as a kernel maintainer, I was hoping
>>>>> to get some pointers on what to do to make this happen.
>>>>>
>>>>> So far, we have set up a new kernel tree and I have set up a local development and
>>>>> test environment for SH kernels using my SH7785LCR board as the target platform.
>>>>>
>>>>> Do I just need to send a patch asking to change the corresponding entry in the
>>>>> MAINTAINERS file?
>>>>
>>>> I'm not sure a there is a document, but:
>>>>
>>>>  - add the MAINTAINERS change to your tree
>>>>  - ask Stephen to get your tree included in linux-next
>>>>
>>>> then eventually send a pull request to Linus with all of that.  Make
>>>> sure it's been in linux-next for a while.
>>>
>>> OK, thanks for the pointers! Will try to get this done by next week.
>>>
>>> We're still discussing among SuperH developer community whether there will be a second
>>> maintainer, so please bear with us a few more days. I will collect patches in the
>>> meantime.
>> 
>> Thanks a lot!
>> 
>> If you need any help with process, setup, ... don't hesitate to ask
>> (on e.g. #renesas-soc on Libera).
> 
> While Adrian and Geert are reading this, I have a question:
> 
> Is this "sh64" still accurate and applicable?

I hadn't noticed it was there... Randy Dunlap added that in 2018 (commit
09b1565324cba). I wonder why?

> from Documentation/kbuild/kbuild.rst:

There isn't an active 64 bit superh architecture for the moment: sh5 was a
prototype that never shipped in volume, and support was removed in commit
37744feebc08. From the j-core side j64 hasn't shipped yet either (still planned
last I heard, but j-core went downmarket first instead due to customer demand,
and multi-issue is on the roadmap before 64 bit address space).

The general trend in linux kernel architectures has been to merge 32 and 64 bit
anyway, and just have the .config set CONFIG_64BIT to distinguish: arch/x86 was
created by merging arch/i386 and arch/x86_64 in 2007, arch/powerpc merged the 32
and 64 bit directories in 2005, arch/s390 and s390x are in the same dir,
arch/mips... (For some reason arm and arm64 are still split, but that might be
fallout from Arm Ltd trying to distinguish aarrcchh6644 from "arm" for some
reason? Dunno.)

I wonder why is this going the other way? I thought $ARCH mostly just specified
the subdirectory under arch/ with a few historical aliases in the top level
Makefile:

# Additional ARCH settings for x86
ifeq ($(ARCH),i386)
        SRCARCH := x86
endif
ifeq ($(ARCH),x86_64)
        SRCARCH := x86
endif

# Additional ARCH settings for sparc
ifeq ($(ARCH),sparc32)
       SRCARCH := sparc
endif
ifeq ($(ARCH),sparc64)
       SRCARCH := sparc
endif

# Additional ARCH settings for parisc
ifeq ($(ARCH),parisc64)
       SRCARCH := parisc
endif

But you could always just specify the correct ARCH directory directly and it
would work. (Always did when I tried it, although I haven't built sparc in years
because there's no musl-libc support, and never built parisc64 because I
couldn't get it to work with uClibc even before musl. I _am_ still building both
32 bit and 64 bit x86 with ARCH=x86 both times...)

> But some architectures such as x86 and sparc have aliases.
> 
> - x86: i386 for 32 bit, x86_64 for 64 bit
> - sh: sh for 32 bit, sh64 for 64 bit <<<<<<<<<<<<<<<
> - sparc: sparc32 for 32 bit, sparc64 for 64 bit

Randy also added the sparc alias in commit 5ba800962a80. That at least exists in
the top level Makefile.

Did he mean parisc64 and typoed sh64? Because that's the only other alias in the
top level Makefile...

In any case, these are historical aliases for old builds, which can probably get
yanked because it should be a trivial fix to use the right ARCH= value for
modern builds? (I'd think?)

You'd even be able to build a 64 bit version of ARCH=i386 just fine if it wasn't
for the ONE place in arch/x86/Kconfig that actually checks:

config 64BIT
        bool "64-bit kernel" if "$(ARCH)" = "x86"
        default "$(ARCH)" != "i386"

Same for arch/sparc/Kconfig:

config 64BIT
        bool "64-bit kernel" if "$(ARCH)" = "sparc"
        default "$(ARCH)" = "sparc64"

Nothing else anywhere seems to care...

> Thanks.

Rob

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
