Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AD34C001DD
	for <linux-mtd@archiver.kernel.org>; Thu, 13 Jul 2023 03:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H3zT0WmH6iBKFxOlAQbgrqAhGliNJRZC0jjdrLxjWck=; b=GETsCo+kmMkmkF
	v+fL0/a7AoSl1mAyz6aw/pij9w/iaSJkJdK+0VocChCn6wa2iyGgv7X/wA0cKES0nlrThNQxbyE/A
	sRFumX5Qz/VehGWFS7Am2gm4ZLBZhR4jXmj90gqym3L9kcfqQXBRsKUTm8zt/LwG7RhVNoxvyVrEC
	Oj/X46tYBTMywHDb+hqB+wNkzUiGc23FBFTc871Rkr4u+SsB01z2NipyfkcbPIzjEk/v00SQQbK8P
	Gpl3x9r7tPQbf99pVNPGoUWzEkVoyZHv3bUZW0vrZ63V9yOiwGmrUIwdKYdQ3Ob0TBCMIimpiDsMX
	RAfFs7TBY96FENxeRVmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJnTs-001rhm-1g;
	Thu, 13 Jul 2023 03:59:04 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJnTp-001rgo-3B
	for linux-mtd@lists.infradead.org;
	Thu, 13 Jul 2023 03:59:03 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-31454996e06so349048f8f.2
        for <linux-mtd@lists.infradead.org>; Wed, 12 Jul 2023 20:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689220740; x=1691812740;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BFW6tqBAxT55agMZmiEFwB6JiIx6o3r1moqtycR28gM=;
        b=sqtOqbOMGsZ/+23+X1nR4wUn1C5ui47aYlSieK8DaCIn+hlDjdMeaBAqBM4QDNfzoi
         tg1PMzZngUeBC+4n+X+v5AyvdmDaNSnJwinpHlNrvDswC4sozGqbQ7RQcduezQtZBzE6
         ywtjjYpvZaUu5ORn4puAux/ti1zDOL5fj1EaIASkYUR/9avpCDgfksSpl2HublbEHswC
         FjjHLCoPqW5DsvrskCZWOrlno+QzY0rf9U23lnR8RvdWZptAN35sFveFdTPyq2BFbh3a
         dSC4MC7kS+kYmtNItkyPbfRK4B3KXlgyhekapXpn2fGVv/e+maVl0Ai6w4fTkbVImeh/
         izqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689220740; x=1691812740;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BFW6tqBAxT55agMZmiEFwB6JiIx6o3r1moqtycR28gM=;
        b=Sc6/cKIAFrwYFyx30YfDl4U6m0n8ObDd1V6iKhZ8A2pay/T7UOs0KUBYJ/mz4ftbOi
         ba8beqO36RZBPHjpTkbXU0GKy29reeBxcwyZXivYkGwPZ8YhfgqcWKIgPwLopnU3RRGv
         9QnRF2t+SYY2Q5biOrVlVowH6pGOSrKPi5rNs+hISZNg4N1I9YDqsNHdKJBwEDRb/Sz7
         ofB+e6Tn7dfACzMMT080vpL/a+kvPldvHJVU1kDORzFREt2zPX9feOnDiNO8D8D/6Wm2
         JVYlbQSHj4JwK/5tlwCrYli00K8jaeA4pvaToK9orOcBmRym/loloY8F3+l1/rSX/ghO
         mKpQ==
X-Gm-Message-State: ABy/qLYWQYXoceJP1nmPVGwjcSdKVNcxa98IJ9lkl+R5RVBkCos2AJaf
	XB6qanm7jDB24/Fhl/cpgZa8dw==
X-Google-Smtp-Source: APBJJlF/ygydXtHK2WcQNwIKWn1rvchM1vP5X4HM9fxjmdLjwiZaVb+zEwVYoMQskpjEIkVIxT4lKw==
X-Received: by 2002:adf:e983:0:b0:314:149a:4f28 with SMTP id h3-20020adfe983000000b00314149a4f28mr320572wrm.23.1689220740127;
        Wed, 12 Jul 2023 20:59:00 -0700 (PDT)
Received: from [192.168.0.173] ([79.115.63.146])
        by smtp.gmail.com with ESMTPSA id t14-20020a5d690e000000b003112f836d4esm6633993wru.85.2023.07.12.20.58.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Jul 2023 20:58:59 -0700 (PDT)
Message-ID: <59d54d8a-7c23-c6d3-5608-b06b1ce31bda@linaro.org>
Date: Thu, 13 Jul 2023 06:58:58 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] mtd: micron-st: enable lock/unlock for mt25qu512a
Content-Language: en-US
To: Michael Walle <michael@walle.cc>,
 Mamta Shukla <mamta.shukla@leica-geosystems.com>
Cc: pratyush@kernel.org, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, bsp-development.geo@leica-geosystems.com
References: <20230705130010.2999839-1-mamta.shukla@leica-geosystems.com>
 <419d80f252f12f091b9c555da0965c84@walle.cc>
 <582915cc4adc89b8ce16568f4d0421ca@walle.cc>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <582915cc4adc89b8ce16568f4d0421ca@walle.cc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230712_205902_035733_0FA68A14 
X-CRM114-Status: GOOD (  12.43  )
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



On 06.07.2023 10:26, Michael Walle wrote:
> Am 2023-07-05 15:22, schrieb Michael Walle:
> 
>> FWIW, I noticed the difference between MT25QU and MT25QL here. But
>> I don't think we can do anything about it. It is just another example,
>> that the name is mostly irrelavant/cannot be trusted. Vendors tend to
>> reuse the id for different (software compatible probably) parts. Maybe
>> we can get rid of it entirely. Tudor, Pratyush?
> 
> I must have been blind, the ID is different (ba vs bb), but my point
> is still valid.
> 

the name is good for debug purposes to differentiate between flashes
that use the same ID. But otherwise I too don't see a great benefit of
showing/printing the flash name.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
