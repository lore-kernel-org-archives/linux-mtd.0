Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C49B7C6FA8E
	for <linux-mtd@archiver.kernel.org>; Sat,  4 Mar 2023 05:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GbCwsj2cgp6CsXPUGTQ2eDed8OBuxYzrvmfg8kKHMPc=; b=4wJw9hJ3kakDIH
	l/s6wcY9LwtySj+/D8L1UkMT1qEkiQ5d2tTE/sRZb1ZQ1Pleu43ilt+lnzVQ/gw805RLRxqIv6w2T
	KGAk0cgijI9dmnQIA52VYwgCEc4HwMMd1UMk8cHJwyyBfrciJ970EiSz+ZsOJKOjysImaW+3R1p++
	ovIhBYJpBkn+evLlMANEzw+xXMPZXuPaTTrOEJPpCdcw3uqETQCSjpWqza52gYsIA41Pq1zim1feM
	W1e3Q7PR+r6eJYgOWiocAkeH0mWzJ44Q/LaiXjqFJ4SH74uzV1sOSd5APUYyOb5vqnU4lgLyePQLu
	P+5ZEpH8F+7AGq39Ol6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pYKvY-008OXM-27; Sat, 04 Mar 2023 05:59:28 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pYKvU-008OWZ-Ha; Sat, 04 Mar 2023 05:59:25 +0000
Received: by mail-ed1-x534.google.com with SMTP id o15so18262381edr.13;
        Fri, 03 Mar 2023 21:59:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cZdOR2mQrM2Yh/ZdXBDU9hVL0HlZsZVueh/CEeqYueU=;
        b=Spc5p3ovs3CEvWjvB15Lsxi3xGjMUIlNSYNFAcggChHEqyh1XQIV3ghzRysFCQdwot
         B+Pzk25ozrx9jxO/cugIqFD/r06/RjYzQnBpUsHfl/0KYoxab8FIKN/6rnu8co2Z7lxk
         Mz/CVbIsMog2abpNbYK7pFe96zz3t3Rm2GralvuU2HiegQXFXYRGe79tiCnlqDK3Rrl6
         8VS8m3lEou653ypRcub4hORgngyVE/4CfwaI/6Ymv9PPP20xwlEC+gP0A5TBq1L9JjQx
         WqrbysUxMMTh2VK+L+GDogxIkZBJXxBrm5+58547IY4AFuOrd0rJYXORJ4HKz5lJfuqe
         f6og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cZdOR2mQrM2Yh/ZdXBDU9hVL0HlZsZVueh/CEeqYueU=;
        b=q/QsZwObnFgpAJiPaWXwdcOTDuzr9UN057xeiqlTQ5o3r43+hQCf3AbY8xFRFZaipW
         qjSAgDt4gawTYaLplWejiZB4a6QLvoKG0lqURqQ2GjHwxVReC/yUz262n1Jdy4P2DDrH
         903u4sLkP17D+09B7Izd/ZsPuXTMPLUrbaoQ/5v3YR0UVZRKgeVvuVi6XF4/wIGEg9ED
         MWO378c0JIjgGUhB/Tn3im0S4TSbmQxyceW61dZ1KxYRnHAHI9a0jqZ+9aZhC5dhwH8u
         YWmudV8haT1Ycbvg5q5Y+kEOHiTXvJm/PJiErzQVP2xOnU46q+tKjYuf37VUXGfmqWOV
         sAtQ==
X-Gm-Message-State: AO0yUKXm8K1nczHbsuvtevNuSvXA03dTqXIwv//WxHPhqpzSwxfaKHKc
	iGCHP3hIkJs/VMwSIiej9co=
X-Google-Smtp-Source: AK7set8UXUFWR2ui/AgXkHFAvLBJPzNPX6LhnlTox4YZzu7Cyy9qpwNmgZWB6VYga3nqRk1K4I90aA==
X-Received: by 2002:a05:6402:510:b0:4bb:83fa:5e83 with SMTP id m16-20020a056402051000b004bb83fa5e83mr4125414edv.12.1677909561087;
        Fri, 03 Mar 2023 21:59:21 -0800 (PST)
Received: from [192.168.0.173] ([79.115.63.78])
        by smtp.gmail.com with ESMTPSA id v12-20020a50c40c000000b004bb810e0b87sm2030841edf.39.2023.03.03.21.59.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Mar 2023 21:59:20 -0800 (PST)
Message-ID: <5bd48f09-f7ba-e5b3-60ba-49ecd1493e36@gmail.com>
Date: Sat, 4 Mar 2023 07:59:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] spi: Replace `dummy.nbytes` with `dummy.ncycles`
To: Sergiu Moga <sergiu.moga@microchip.com>, pratyush@kernel.org,
 michael@walle.cc, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, broonie@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, claudiu.beznea@microchip.com,
 chin-ting_kuo@aspeedtech.com, clg@kaod.org, joel@jms.id.au, andrew@aj.id.au,
 kdasu.kdev@gmail.com, fancer.lancer@gmail.com, han.xu@nxp.com,
 john.garry@huawei.com, matthias.bgg@gmail.com, avifishman70@gmail.com,
 tmaimon77@gmail.com, tali.perry1@gmail.com, venture@google.com,
 yuenn@google.com, benjaminfair@google.com, haibo.chen@nxp.com,
 yogeshgaur.83@gmail.com, heiko@sntech.de, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, michal.simek@xilinx.com, tkuw584924@gmail.com,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>, tudor.ambarus@linaro.org
Cc: bcm-kernel-feedback-list@broadcom.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 openbmc@lists.ozlabs.org, linux-mediatek@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
References: <20220911174551.653599-1-sergiu.moga@microchip.com>
From: Tudor Ambarus <tudor.ambarus@gmail.com>
Content-Language: en-US
In-Reply-To: <20220911174551.653599-1-sergiu.moga@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230303_215924_634065_C6D8EEC3 
X-CRM114-Status: UNSURE (   6.46  )
X-CRM114-Notice: Please train this message.
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

Hi,

Sergiu changed his interests, I'm going to send a new version of this
patch. We really need the conversion in SPI NOR as there are flashes
that require a number of dummy cycles that is not multiple of 8.

Cheers,
ta

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
