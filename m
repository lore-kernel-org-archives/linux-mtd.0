Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64BFBC74A5B
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Mar 2023 10:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:From:To:MIME-Version:Date:Message-ID:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Qa7fvQIoaJ8f86ZvRrZ3SRoS2fuTIj2XHmPGMgvV/Co=; b=HGn6fu8uxq3KB6
	k5/IHONDDvoCrlPRHcIQ77gMj533MYCnXYBqnR0q4A+IK8T/PN98qhbgg10lD/KzXOhIdP9MLHOhB
	qddlJcvK0Xi281vj/qV2MK9qXpMZmYEUxWVaFrgqbHXi4jSIuL6AuVVChXgqUTzZRp2zvc2VqSRBr
	8MF0ReIVNy7qKqxsQuJ0Iy2vSROZwmQUBRCVwqL/v2eImU93iG6qKS7cGR9rutcMxg9F2kbyXz9Ya
	oQUZN5peWdEpF5SzO9yrMAVzFv4HV8i85LI7At4mLMw7lXueTx9aZB8fP7tzJi/WzrcfOscuSZBiA
	OR5zymV14aDKTB8qq28w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pd6ul-001pXo-36;
	Fri, 17 Mar 2023 10:02:23 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pd6ui-001pV4-1X
	for linux-mtd@lists.infradead.org;
	Fri, 17 Mar 2023 10:02:22 +0000
Received: by mail-lf1-x131.google.com with SMTP id bi9so5759949lfb.12
        for <linux-mtd@lists.infradead.org>; Fri, 17 Mar 2023 03:02:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679047338;
        h=content-transfer-encoding:subject:from:to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9eeXpy6H8yVQu/J+zK/P14XqNfA5ICBlylety0kmfWE=;
        b=l2+3ZGioV/xd27HWk9bsZkZkPdhI6AhBmPEmeRC82rB4jTJegJ9NW9u0PO3cGe7OMW
         sFv4nK/WLCon2YDFH7p7e7F4IIipCh6ZTUG/rQcWhUoT/3inDK6JVyQPSINmYYalK2f6
         CeC4zD8yGHghiidpu6Bt3AalJBP9HlYOu2kRoc/GG80268Dx289dspxbeanOz1y0b0LH
         vnSFmDjkQiDpu6E9mXcqvq1bcRsQctP8DQGZyQgqpcqtvZukiPpRcjW9pwNYQj7IwsFQ
         Tor9ln0+hqmrpEdoPciQfxG5ZcBPJz7IbC4eRonjxOY6abdY0sO/tkRfCtavsb7Zjn4c
         hTJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679047338;
        h=content-transfer-encoding:subject:from:to:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9eeXpy6H8yVQu/J+zK/P14XqNfA5ICBlylety0kmfWE=;
        b=IgaR4z5dJF4tq0024Q1O91dHfvJaxLin3vsd/ei+WuZ1NtmayQ3WONv3AbTnRzRoRY
         SLhDZ8e1yXXqLJTvlYHXRdwp3gTQeOSu7oIcghVW2JF3i5JS87iR7kp+tAVIbcHMW7eb
         qVhezOKJn4XQXShhbwSzndHT/ggSBtzsJklbrVS6p0AJLjVPk20nUg77H5TVA7O87Vqc
         At5O19cvuoOSQ+bHhVeHbPpotB1xzziI4qTJyfxEAkwIeQQedYizzwbyZ7OLbwFmYinE
         NV0YGiEpPJJyXkO7CqnKoqOV+zMZIhtf62QHAv6pfbuRDsUHKsdF0GSlnHVG36I6Tqdl
         J1lg==
X-Gm-Message-State: AO0yUKWHHIQHB/rZ6ecnocOoCK7VhnMtIzL4VaVE94ognZFa2Q1jGtuz
	Uw9AESYmNOgnUeyCc9uhyXzCHxKWho4=
X-Google-Smtp-Source: AK7set8Tm3fHhcsR2/TeyQWDbWsJv4+LyPW4hXo1mqVZCmpRzAmSuYWWRt1LllYOjcSFxxf+5B/YCA==
X-Received: by 2002:a19:7512:0:b0:4dd:99cf:8788 with SMTP id y18-20020a197512000000b004dd99cf8788mr3991527lfe.54.1679047337504;
        Fri, 17 Mar 2023 03:02:17 -0700 (PDT)
Received: from [192.168.26.149] (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.googlemail.com with ESMTPSA id t27-20020ac243bb000000b004cc9c2932a9sm297228lfl.302.2023.03.17.03.02.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Mar 2023 03:02:17 -0700 (PDT)
Message-ID: <399d2f43-5cad-6c51-fe3a-623950e2151a@gmail.com>
Date: Fri, 17 Mar 2023 11:02:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:96.0) Gecko/20100101
 Thunderbird/96.0
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Brian Norris <briannorris@chromium.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Subject: Probing devices by their less-specific "compatible" bindings (here:
 brcmnand)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230317_030220_512796_4D45627D 
X-CRM114-Status: GOOD (  12.38  )
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

Hi, I just spent few hours debugging hidden hw lockup and I need to
consult driver core code behaviour.

I have a BCM4908 SoC based board with a NAND controller on it.


### Hardware binding

Hardware details:
arch/arm64/boot/dts/broadcom/bcmbca/bcm4908.dtsi

Relevant part:
nand-controller@1800 {
	compatible = "brcm,nand-bcm63138", "brcm,brcmnand-v7.1", "brcm,brcmnand";
	reg = <0x1800 0x600>, <0x2000 0x10>;
	reg-names = "nand", "nand-int-base";
}:

Above binding is based on the documentation:
Documentation/devicetree/bindings/mtd/brcm,brcmnand.yaml


### Linux drivers

Linux has separated drivers for few Broadcom's NAND controller bindings:

1. drivers/mtd/nand/raw/brcmnand/bcm63138_nand.c for:
brcm,nand-bcm63138

2. drivers/mtd/nand/raw/brcmnand/brcmnand.c for:
brcm,brcmnand-v2.1
brcm,brcmnand-v2.2
brcm,brcmnand-v4.0
brcm,brcmnand-v5.0
brcm,brcmnand-v6.0
brcm,brcmnand-v6.1
brcm,brcmnand-v6.2
brcm,brcmnand-v7.0
brcm,brcmnand-v7.1
brcm,brcmnand-v7.2
brcm,brcmnand-v7.3

3. drivers/mtd/nand/raw/brcmnand/brcmstb_nand.c for:
brcm,brcmnand


### Problem

As first Linux probes my hardware using the "brcm,nand-bcm63138"
compatibility string driver bcm63138_nand.c. That's good.

It that fails however (.probe() returns an error) then Linux core starts
probing using drivers for less specific bindings.

In my case probing with the "brcm,brcmnand" string driver brcmstb_nand.c
results in ignoring SoC specific bits and causes a hardware lockup. Hw
isn't initialized properly and writel_relaxed(0x00000009, base + 0x04)
just make it hang.

That obviously isn't an acceptable behavior for me. So I'm wondering
what's going on wrong here.

Should Linux avoid probing with less-specific compatible strings?
Or should I not claim hw to be "brcm,brcmnand" compatible if it REQUIRES
SoC-specific handling?

An extra note: that fallback probing happens even with .probe()
returning -EPROBE_DEFER. This actually smells fishy for me on the Linux
core part.
I'm not an expect but I think core should wait for actual error without
trying less-specific compatible strings & drivers.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
