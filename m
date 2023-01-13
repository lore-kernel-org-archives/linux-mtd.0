Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C419BC3DA78
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Jan 2023 23:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DZuSyxlga0YNPjk34uicguBvAhkoZ/2aRkKJwjtoP9Y=; b=AVClwdObIGiAJ1
	vOa7MV8jsfpm5oMrbkSduClt4ekUTu/ridAR5dM0Xi3jMDfk7s97xYZFM//JbtFdVzjem4MF3yQp/
	lQ5n6ZPtr8vHziJPyqQHyjLgUxoL6CGmBTCTem9QDvVQRsoQNjj/Qhi9+otLq2vT0ghLbF4ZQRVJJ
	YWtQbD6JC+yQkrcP83o2MAfBSWSDdm0t1YvC1TEodcFrt7jZmIQ4cyVjyVS3EWoHNP7dbwK3XxoK6
	ihmkkedcC2DeOq6vD5RcCig7GkZJ4ssL0m78LlyqWQeJAU2RnpVIPYhSF6uhbEvyDRD91+mCLgxth
	phsZ5JjG0iTT21qAPfAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGTLN-004oAA-Pb; Fri, 13 Jan 2023 23:20:17 +0000
Received: from mail-oa1-x36.google.com ([2001:4860:4864:20::36])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGTLJ-004o9A-Jv
	for linux-mtd@lists.infradead.org; Fri, 13 Jan 2023 23:20:15 +0000
Received: by mail-oa1-x36.google.com with SMTP id 586e51a60fabf-142b72a728fso23904437fac.9
        for <linux-mtd@lists.infradead.org>; Fri, 13 Jan 2023 15:20:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=landley-net.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TQ9PrP3iNHpghVpkywhiMHcSFTwXN8kLEUSP7zNfGWk=;
        b=HEeiDnUeOlaMmzrHg6LtTWNe2KIF6Q5d6PASMOjvpBnFNwlXnpxtBoyLsjdUSiFic5
         Zy4GrupmECG1CN3m99XRInimzLkAyFlnAC1yFwr9ZV5WqZ8Mxia0axE41+SyDlpGZHOF
         b9/hPmk9ZzrDZTerjRuPw9aOBuwmuFZgGCgGCyi5DNv5BOgrp6hpzWbx8PiSSS3PCS6S
         UoJjpLq7r0mXx6nv8CL2PCVxH6W+Fc0fSdqCoguiOJxRwovXLajxMhMVOFQITRvWQd2L
         +x8hdq/wHJdMhQD25h3cEnBEwX4srdIbxyBywCRXQlXO+4KVbgaam+X20emmeoxJCckb
         5wPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TQ9PrP3iNHpghVpkywhiMHcSFTwXN8kLEUSP7zNfGWk=;
        b=gwPbyZ1Om4Aa++o1LFurp9N5Fyqq90Ov8Eq+tGE544nHkiRnclZIP5rO1DLrwhmpqT
         CP0dY/4NDlrNJl27AJIkciHRo08C1hSrKo5yWCdmN6quJTVfLn5K1BrpPj/Hk/YhfOat
         B/rW3ix5dMy/jt6uKlW9jEO132REfpgJfp3teGruYkhY1JE7Xz7zJ2KmdzgRs15xC0S5
         pgP5NceHRT4TAVB6ul+wByYaFHgIctqWNNTFUmcRiOwKRKY2Uubj1dqSTemZcRgRTla3
         DiII4TN60jhsY+zbX4h6tCvRVK9sZtpgklr+F3j4m8ntGHxNuTlZjhatP7FD3Hyfk0yo
         J8+g==
X-Gm-Message-State: AFqh2krbbXnnZQ6zafjrDaRalU55IbU78hl5aUZZ2U04/bwikCT/FF3c
	4sYsIZ1cgvV8GMXLW4Ku0s27MA==
X-Google-Smtp-Source: AMrXdXu9HHEo/oiUtz2RMFCVU9bzsQZjZJ6cJq7QQE+EgrBS53y1RWYqF/4GpGuzhXIiUysKwMTRjQ==
X-Received: by 2002:a05:6871:4090:b0:155:cb39:7325 with SMTP id kz16-20020a056871409000b00155cb397325mr16579350oab.6.1673652012126;
        Fri, 13 Jan 2023 15:20:12 -0800 (PST)
Received: from [192.168.86.224] ([136.62.38.22])
        by smtp.gmail.com with ESMTPSA id z13-20020a056870738d00b0013ae39d0575sm11411907oam.15.2023.01.13.15.20.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jan 2023 15:20:11 -0800 (PST)
Message-ID: <38200b53-c743-4396-6603-7274f4a29c86@landley.net>
Date: Fri, 13 Jan 2023 17:32:20 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: remove arch/sh
Content-Language: en-US
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Geert Uytterhoeven <geert@linux-m68k.org>
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
 <CAMuHMdUcnP6a9Ch5=_CMPq-io-YWK5pshkOT2nZmP1hvNcwBAg@mail.gmail.com>
 <142532fb-5997-bdc1-0811-a80ae33f4ba4@physik.fu-berlin.de>
 <6891afb6-4190-6a52-0319-745b3f138d97@landley.net>
 <fe09d811-e290-821d-ec8b-75936b6583c2@physik.fu-berlin.de>
From: Rob Landley <rob@landley.net>
In-Reply-To: <fe09d811-e290-821d-ec8b-75936b6583c2@physik.fu-berlin.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230113_152013_911414_533C24E7 
X-CRM114-Status: GOOD (  16.29  )
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

On 1/13/23 13:05, John Paul Adrian Glaubitz wrote:
> Hi Rob!
> 
> On 1/13/23 20:11, Rob Landley wrote:
>> There is definitely interest in this architecture. I'm aware Rich hasn't been
>> the most responsive maintainer. (I'm told he's on vacation with his family at
>> the moment, according to the text I got about this issue from the J-core
>> hardware guys in Japan.)
> 
> Well, maybe we can just give it a try together ...

Jeff Dionne said he'd make himself available to answer hardware questions. (He
said he maintained some Linux ports 20 years ago, but isn't current with Linux
plumbing. Last month he was digging through the guts of vxworks, and the project
before that was some sort of BSD I think?)

I _do_ maintain Linux patches, I just generally don't bother to repost them
endlessly. Here's my "on top of 6.1" stack for example, each of which links to
at least one time it was posted to linux-kernel:

https://landley.net/toybox/downloads/binaries/mkroot/0.8.9/linux-patches/

>> The main reason we haven't converted everything to device tree is we only have
>> access to test hardware for a subset of the boards. Pruning the list of
>> supported boards and converting the rest to device tree might make sense. We can
>> always add/convert boards back later...
> 
> There is a patch by Yoshinori Sato which adds device tree support to SH. Maybe we
> can revive it.

The turtle board is device tree and has been since it was merged. The
infrastructure is there, the question is converting over boards and testing
them, or deciding to prune them. Did Sato-san convert many boards? (I'm not
finding his patch via google...)

> Adrian

Rob

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
