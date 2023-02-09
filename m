Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2140CC05027
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Feb 2023 02:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f3i4KfZDAogf4+oSXqt3bY/WUYIOHkVWjiFmTMjBYgw=; b=ciSZTr+elM7UP2
	+R7/6RNT4PZhW0jDcob2FBW0ROoRIIWrShgN3MScg0Hfh6lRh/1vtFv9TAaYZTNN9KHOKjiOJybP3
	jBHtlm4VZV+TDttL0pFXpI28S7p/CCr84CFkA9b5G2S9NdBQyVl2GZZnCsnxSXDAxaiNSu8O9bMYU
	J+ACOasarzq6s0pyrRBEkyBAz/SzvmPUwSLgiGBMeZ7uEWa13WO6y4E2Hb0dApYBLnn705z53K541
	kzd5DBMelJ+7U7Xb3bqUeW2fnCsSRx2nU81AATSOmqSstEh7Z3AkP8OOqGQfMvYZgKi4Qf0y9jOAr
	KVdXxh4La71Yd4gE6Apg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPx75-00HYuW-FF; Thu, 09 Feb 2023 02:56:43 +0000
Received: from mail-oo1-xc35.google.com ([2607:f8b0:4864:20::c35])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPx72-00HYsD-6u
	for linux-mtd@lists.infradead.org; Thu, 09 Feb 2023 02:56:42 +0000
Received: by mail-oo1-xc35.google.com with SMTP id y13-20020a4ae7cd000000b0051a750e2ebdso97035oov.5
        for <linux-mtd@lists.infradead.org>; Wed, 08 Feb 2023 18:56:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=landley-net.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MeuDR87mT5oZz0xYPlgMzWTRgnSVFdT+RIi9fTOHK48=;
        b=cpXzCzr+cz0YwMg8OioZbOdFT6x6Xm6HxQuCqdoPsmS9hedulw1eO6Kk/3hEebcpma
         XmVmNXfmMApG2N79Si3uHiYwQf3pkrY8yoF8TXhNqwM63RW+rXEAr2c9GvCwLnpdMizZ
         /i8XL5yNmB4lLP5zpVm7le3plURiLI5xI0pF39yvS1te1cCGkPno0+9YUYvh8/jIQets
         PkfeCX7kq7oaaZINx71/ntTci+5+uSn1VJ3kfEYljJIBKf1cp8PDE/LSANc9+WdWamP2
         UdiemMHM1/q9NSBnjYTg3Wlj/GIvYnBRMQxV2QKkM2GCOhCzUuRGyTbkMr557hPEVKAp
         8+Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MeuDR87mT5oZz0xYPlgMzWTRgnSVFdT+RIi9fTOHK48=;
        b=BGOMiLZeNMWeStqHpkn2J7OjI+D6cEiKCTlA9xPO+6b/uatvddlKF0FMvxBW3csP6G
         iGa9VieZfrJ5s90KZ5chi9Q7uSVpqeQ5S22ziV0TtXcscdoc7thpJeB0F4YVgQGEJMg8
         3Wh8tPAjam1Ri+g+N2WYJ2K5XfXiIQcd2/K80/aKuLSqoQDX7AMiBpu45Tn1z7/aqw0K
         eetvRz0zFYDkv9wfFyOIepAMLU/RCECFhuQebZxJCoz0X0cx6uEA/++vko8Jnxtj/8C6
         Gw7/vPKUJGJZuc46rOXmDjXV6WJVK+7rFB0Bud2U3cJkfK72wX1vVnzHbHX8VbmsA/NU
         0HQg==
X-Gm-Message-State: AO0yUKW/+WXKPGxw/jdl3w0veciQysZcBiIFHNHvj5IKbPYvAf6zIsT8
	xJf9bZo0Jigowz8a/HQ/cEWLHw==
X-Google-Smtp-Source: AK7set/z8RwoK5zLi99e0gYyO0saoOIvr4Qi+M0w1VEg8sxij2tCPL/DbU7DENRObgoCAx8yBLGhmQ==
X-Received: by 2002:a4a:9b8e:0:b0:51a:48f4:75de with SMTP id x14-20020a4a9b8e000000b0051a48f475demr241022ooj.0.1675911397288;
        Wed, 08 Feb 2023 18:56:37 -0800 (PST)
Received: from [192.168.86.224] ([136.62.38.22])
        by smtp.gmail.com with ESMTPSA id bm9-20020a056820188900b004f8cf5f45e9sm133765oob.22.2023.02.08.18.56.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Feb 2023 18:56:37 -0800 (PST)
Message-ID: <1c6e7a19-a650-1852-6f74-ca5547db44c4@landley.net>
Date: Wed, 8 Feb 2023 21:09:35 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: remove arch/sh
Content-Language: en-US
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Randy Dunlap <rdunlap@infradead.org>, Christoph Hellwig <hch@lst.de>
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
 <40dc1bc1-d9cd-d9be-188e-5167ebae235c@physik.fu-berlin.de>
 <20230203071423.GA24833@lst.de>
 <60ed320c8f5286e8dbbf71be29b760339fd25069.camel@physik.fu-berlin.de>
 <0e26bf17-864e-eb22-0d07-5b91af4fde92@infradead.org>
 <f6317e9073362b13b10df57de23e63945becea32.camel@physik.fu-berlin.de>
From: Rob Landley <rob@landley.net>
In-Reply-To: <f6317e9073362b13b10df57de23e63945becea32.camel@physik.fu-berlin.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230208_185640_256700_8DC1226F 
X-CRM114-Status: GOOD (  23.91  )
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

On 2/8/23 06:13, John Paul Adrian Glaubitz wrote:
> Hi Randy!
> 
> On Tue, 2023-02-07 at 17:31 -0800, Randy Dunlap wrote:
>> 
>> On 2/7/23 01:06, John Paul Adrian Glaubitz wrote:
>> > Hello Christoph!
>> > 
>> > On Fri, 2023-02-03 at 08:14 +0100, Christoph Hellwig wrote:
>> > > On Mon, Jan 16, 2023 at 09:52:10AM +0100, John Paul Adrian Glaubitz wrote:
>> > > > We have had a discussion between multiple people invested in the SuperH port and
>> > > > I have decided to volunteer as a co-maintainer of the port to support Rich Felker
>> > > > when he isn't available.
>> > > 
>> > > So, this still isn't reflected in MAINTAINERS in linux-next.  When
>> > > do you plan to take over?  What platforms will remain supported and
>> > > what can we start dropping due to being unused and unmaintained?
>> > 
>> > I'm getting everything ready now with Geert's help and I have a probably dumb
>> > question regarding the MAINTAINERS file change: Shall I just add myself as an
>> > additional maintainer first or shall I also drop Yoshinori Sato?
>> > 
>> > Also, is it desirable to add a "T:" entry for the kernel tree?
>> 
>> Yes, definitely.
> 
> Geert has suggested to wait with adding a tree source to the entry until I get my
> own kernel.org account. I have enough GPG signatures from multiple kernel developers
> on my GPG key, so I think it shouldn't be too difficult to qualify for an account.

So you're not planning to use https://lk.j-core.org/J-Core-Developers/sh-linux
but push to kernel.org and ask Linus to pull from there?

> Adrian

Rob

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
