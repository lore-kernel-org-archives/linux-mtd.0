Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06244C433EF
	for <linux-mtd@archiver.kernel.org>; Tue,  3 May 2022 15:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pvLpDQ7VkbxsBX9kvXyfbBCzNbvwYGxhoBeMuLw6TWs=; b=e9/Tf0mlPq66Qm
	t3m3/yi6Hr/lJucU0DRkVlm+Tsgb+WGzXH4aBGJU6KCTyFr5fcRYyOmuQ4nM2WSuG0JHTP5hubtCD
	1DGSyKrYVw2JHpXKLSIp13qeLYw0Egaf7FpCvAlaMultduipO9kqQA/RzQJU+ESbRI7QypEmh4ig2
	pDS+n1gIHmnmNcrSk2XlkVXEzOF1YhvgBgcPnrAhWzEaMLe41Ojn8c1tWRyW+fUG6XNDzKBOACmcD
	QXhXEfsqkPMuUIuj3Fpa5meW8Dit0Ta2VPS46cum+tob3EPt2Vt1fsuYtJYgrOPbFNcrXJnUdnsz4
	uLOJvbHHjRyIQf1wEuxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nluuZ-006d0M-Dx; Tue, 03 May 2022 15:58:03 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nluuV-006cyP-Ot
 for linux-mtd@lists.infradead.org; Tue, 03 May 2022 15:58:01 +0000
Received: by mail-ed1-x532.google.com with SMTP id k27so20351677edk.4
 for <linux-mtd@lists.infradead.org>; Tue, 03 May 2022 08:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=D+3ayXGiIWunG5xftXtSVJKt5SyAcJy2+fwwapTKiuY=;
 b=r5n8OtbrS3K9irtBKE+b++XUYBykqYPbxxjb16ReRhJbBOoiJG15shu5v90AGUTXNB
 Zgja5/5KVmxkqpIDW8QBQcPdjKo2qiy7ztbJSbMWWU0Qegxdi53Q2PjiNtGQxyQH+YQK
 qajUFNtnae9QpldA1oUuOAM8BZbjb/3nttvp6/R5W/6pZv4Wy1KbX5DCrouoUe1GkU0i
 iO83KG6mUY5Ho1WB/DBL2xrrha0HXRiwXBciFlhkQPuRf8xwB2VZRGPb7td/FHdSpQ8a
 d3kvyBWMdyuMPAb3dqHzCPfCC9o9ZMbH+ohFE4hSbcbR1NlZVI/KBIq0dD308+VXDIua
 fDJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=D+3ayXGiIWunG5xftXtSVJKt5SyAcJy2+fwwapTKiuY=;
 b=ijKoFphnUxM6RmW71dVg1tz8IUate0pDGQb/sFqeqQOs57JlaWyK3kIGVJq56rq3JY
 +2kBKKW0oEDW0GPQ7CfcfqE1IK6H3Dd74+lMD4QVGNNFsIMyzYFrphdfies7PW1EEZ8B
 06AZboIjhGP3a9++cv9fnpciSEeRF1fVDABH+Ea31uLYTBJypcmSYS+w7kx6gKMqhKZb
 7adxE0GeqYqEcj1DZgBUglCz11ldbMrVg043Dry+/l7aOtrA+aSfqF95o4EL84TPf5mF
 fcDvRJu4rDeBwgsuPMOmexRK5G1RGqP6vNk42MuRyMoSDgBZAWjbs8sewdXHyhXDp+NU
 Baxg==
X-Gm-Message-State: AOAM531fO16q0gL7SEQVhRsVFpYpoDEBXzvV7dBry7Nh6gkGru1aEI4j
 sSIdPnT3HBZZqLcgKTBa4la9lw==
X-Google-Smtp-Source: ABdhPJxKrhXYiytBuBL2uMw9/17lCFEgVDX5YAwj0edRfiBrkDBcoqsP3eMgwqKrnOsYZ/vZMCTb8Q==
X-Received: by 2002:a05:6402:1770:b0:425:b2b5:6248 with SMTP id
 da16-20020a056402177000b00425b2b56248mr18454740edb.281.1651593475606; 
 Tue, 03 May 2022 08:57:55 -0700 (PDT)
Received: from [192.168.0.206] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 jz1-20020a17090775e100b006f3ef214e27sm4814174ejc.141.2022.05.03.08.57.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 May 2022 08:57:54 -0700 (PDT)
Message-ID: <0df2fd83-951c-d253-6494-3b70f5762aae@linaro.org>
Date: Tue, 3 May 2022 17:57:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [RFC v2 2/2] arm: hisi: enable Hi3521a soc
Content-Language: en-US
To: "Marty E. Plummer" <hanetzer@startmail.com>
Cc: arnd@arndb.de, cai.huoqing@linux.dev, christian.koenig@amd.com,
 devicetree@vger.kernel.org, gengdongjiu@huawei.com,
 krzysztof.kozlowski+dt@linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux@armlinux.org.uk, michael@walle.cc,
 miquel.raynal@bootlin.com, mturquette@baylibre.com, novikov@ispras.ru,
 olof@lixom.net, p.yadav@ti.com, rdunlap@infradead.org, richard@nod.at,
 robh+dt@kernel.org, sboyd@kernel.org, soc@kernel.org,
 sumit.semwal@linaro.org, tudor.ambarus@microchip.com, vigneshr@ti.com,
 xuwei5@hisilicon.com
References: <20220501054440.2434247-1-hanetzer@startmail.com>
 <20220501173423.2473093-1-hanetzer@startmail.com>
 <20220501173423.2473093-3-hanetzer@startmail.com>
 <4cda3645-c4e8-1b3c-bd80-891afd56449a@linaro.org>
 <20220503134459.pplgvhcckja4ivcg@proprietary-killer>
 <75a48dfa-6fc9-aed9-b00e-d928bd9f33af@linaro.org>
 <20220503155141.ekbysx6fjom5el2h@proprietary-killer>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220503155141.ekbysx6fjom5el2h@proprietary-killer>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220503_085759_880260_1AA7B024 
X-CRM114-Status: UNSURE (   9.87  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 03/05/2022 17:51, Marty E. Plummer wrote:
>>>> A bit weird interrupts... the same?
>>>>
>>> Yes, though I am aware that some sp804 timers do have a separate
>>> interrupts per pair.
>>
>> They have also separate interrupts, one combined interrupt or one sole
>> interrupt. However what you described here is one interrupt line
>> physically connected to two separate pins on the device yet still not
>> being somehow shared (shared as "combined interrupt"). I don't think it
>> is your case...
>>
> Unsure. datasheet just says '33 | Timer0/Timer1'. I don't think these
> timers are attached to pins, however.

So it looks like a combined interrupt, doesn't it?


Best regards,
Krzysztof

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
