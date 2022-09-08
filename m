Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 471C6C38145
	for <linux-mtd@archiver.kernel.org>; Thu,  8 Sep 2022 11:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MapIfqfyVoxMpvGqowFd0YcQngyLCZVidVbTXw50CMI=; b=S2brOuN+mBvD91
	ZcUI/kJtgv4O3/pPm34IX65uCMzBUw6+WmjmabB1P/PGCoYpMcE06BgsXGjq1S8Fk5X1QMPWlx8P2
	Uk8c4kxRXgxWWzMY7lyuNU9R56eglHaPtkp+SU/lgcdjcyqZuihqfctdzu7qrochb9L6o+MxknjjR
	FoY5hTBOmrJew/Wcn5csYlHm/qJoDGFCFfU+Kkk6GKzdbSzwUwmP7OsjTJkhFzCa1ggRLFSRABqEg
	afnYCS772UjRZdautFxOx/uhHW8ovFHCBUyYbTmJfhKEwgBfij2DYNWSpYA66Xj48dD68+8+YCx9q
	avrKlavcB4Hl2rz6CNug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWFLg-002YYv-2Q; Thu, 08 Sep 2022 11:05:32 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWFLb-002YUD-TA
	for linux-mtd@lists.infradead.org; Thu, 08 Sep 2022 11:05:29 +0000
Received: by mail-lf1-x12b.google.com with SMTP id p7so27109668lfu.3
        for <linux-mtd@lists.infradead.org>; Thu, 08 Sep 2022 04:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=p3mPC2cPaInFmAeklC56oT75879Idr5XG9yjUxhv44U=;
        b=wTpC8oQXo/zokqRb+8UFUd++gVxpmEjj8BADNnoHGguwvxCjc2h/4FnB2J5nt+CBgw
         g9/i81nZjGtVVlzpN4o56DsD8sIyoAfRU8pry9YoTQmO+FI8CdV942vljnqjlGUFvmfT
         lTiohJg6lIzUY+hsKG4gnCdZXq7VEOI8S41XAF1e+2iYxfn4NW4lnzkte8s3gbg4PhmA
         LiiAeI/ECdl8CHw1xMg5llHY3iQvbIG7+THQg450jUyJ6ZdqpbBual9auJh3vPmZPBTF
         1MuFIU/eu2tWrtf3qQF2etbiAsGemmI2uxno4tCmjxR+xw8KL2ikM+1hNVjdT8Uda0CY
         Ygeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=p3mPC2cPaInFmAeklC56oT75879Idr5XG9yjUxhv44U=;
        b=ML0j5H7c53e3ujQVBsJEHfOaIaOdoI7WOPOFuZco3dlaMuFqjLx2vH9KvV9EzfKFvA
         Uih9/zTEwAeAKgp3MxGMS3bigMNyJ3fcs6GSlY5C19n2QbNxjfFVz/dZFzWeh6foInAD
         GWW5lVAzCt5YAgsZ5WARLe+sAtfuy1AcsNS2tE2N44eP56JSiza+9kahsfzJ6rI/nE6T
         FlEtb3/1GeBH/p4hAjZ7zZ9KtLyUL05157iTP6YKItQDDsxyXOX2iFdmYL8Ws1cD1JkV
         MrTWlYprfmUjafBkLZkuGAkmXI0EGfTLe1YgX3FcRcckQ371afFVqp8o73w6div1H4gn
         RYGQ==
X-Gm-Message-State: ACgBeo1rJuHXhUYk4mvq/wAofHTPf93nj1LKEqtMMONw92zHUCv6T3aN
	MOog+EhbNhX3bSmG3vhT8/q4fA==
X-Google-Smtp-Source: AA6agR4cZ5EPIlWxxRiIKQtdKXOw1kzJkEpr2MWTgEF8O31rgh2d8JLtxo42CjbNp808ul2r6ZWGcg==
X-Received: by 2002:a05:6512:39cc:b0:498:4acc:2908 with SMTP id k12-20020a05651239cc00b004984acc2908mr972179lfu.282.1662635124177;
        Thu, 08 Sep 2022 04:05:24 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id b14-20020a056512070e00b004945c1c5cccsm273619lfs.268.2022.09.08.04.05.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Sep 2022 04:05:23 -0700 (PDT)
Message-ID: <9d743233-158a-fe77-f3e2-d83a0b10bd81@linaro.org>
Date: Thu, 8 Sep 2022 13:05:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v3 1/2] dt-bindings: mtd: spi-nor: Add reset-gpios
 property
Content-Language: en-US
To: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, saikrishna12468@gmail.com, git@amd.com
References: <20220908064428.2962-1-sai.krishna.potthuri@amd.com>
 <20220908064428.2962-2-sai.krishna.potthuri@amd.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220908064428.2962-2-sai.krishna.potthuri@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220908_040527_983764_EE71439C 
X-CRM114-Status: GOOD (  10.17  )
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

On 08/09/2022 08:44, Sai Krishna Potthuri wrote:
> SPI-NOR flashes have RESET pin which can be toggled using GPIO
> controller, for those platforms reset-gpios property can be used to
> reset the flash device.
> 
> Signed-off-by: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
