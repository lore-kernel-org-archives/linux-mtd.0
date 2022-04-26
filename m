Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 936A2C433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 26 Apr 2022 14:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q25mNQHXiaYOxHPEzN11k1JdlA1kRA8Fns4BL37HM3g=; b=t6oWRLKanIawJp
	6Z0F957KiWTfC8awh0ktUO3Uq1RbVECkh93pjGxw2P13V6fLchpbjD6jbrMxbFKlnfPs5vlph7XMW
	tzWtaP9M5fNsCcCLOW1VgId2dnEZP524EjonE0JSOsQsNWn3F54kgq21mO3YmSnf3ZQU1kewSXc+I
	5WFMXkjjN3P55h1H7gI2oZ8titqEgunWq/1KanJAUb2zIQgQAUfBe5rsveTe52moKBkfyVrOp3W+3
	1BQvctQIzuvse0Slsr7EOd1Xzw3xcoIaohcWkCVJaBXNf1KoKmnYxe1WLxsRbJ0jtRe0ADhonK2No
	auDa8X2gdKsd4fb7ieXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njLtz-00EtSn-As; Tue, 26 Apr 2022 14:10:51 +0000
Received: from mail-ot1-f49.google.com ([209.85.210.49])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njLpW-00Erav-4S
 for linux-mtd@lists.infradead.org; Tue, 26 Apr 2022 14:06:15 +0000
Received: by mail-ot1-f49.google.com with SMTP id
 w23-20020a056830111700b00603c6d1ce73so13117402otq.9
 for <linux-mtd@lists.infradead.org>; Tue, 26 Apr 2022 07:06:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=dq4sezhtXvWjGkw6cGqtobAkYrF6Rziq0liMCjl9hY4=;
 b=zSQGC45MnjKXJevfxOIwzziJH8FAmSiuvG6/fct3AfRKkl/wPcWAvf0elC4Uxz3C7W
 HEGpSVVe8+zNPQhNf8Sl1q8QgSs5/ylhq8HxIKoUO3zhBKm3kqDNozsVkLa7wRC8a/I2
 BC/vsM/dUxC8kWhT06YfrYeeK8Jit5nqqZAINsL7ivni6RcIv1ngLhq5oRgeb7O7DJta
 lMrtqF+0xCco/9tL+FSfty05Pbo2N1pZ0zdnq1Mcmnx5wPMwgz7mnZpq/1/VV50evY5b
 abVidNBVN3EwAIg6ZfOAg1RgYu/jVapPbgA5ttS97FOZ8T/1+F5O627Ca/Br37g1OuTW
 RBmg==
X-Gm-Message-State: AOAM530enDnObmJf12cgyN9KO0LlGBE7hdy5yvwXAlG9rJGFJnH8Tp2V
 gGYI6Si3oyg8Wn07Hf5o5Q==
X-Google-Smtp-Source: ABdhPJwuQX0Ade/O3VuDIyJktv/+LSYobOodBwi0egeYaqVmuGT2LJ039zBY7csrpgKSJa69CnyYzw==
X-Received: by 2002:a05:6830:304e:b0:5af:f66a:56ee with SMTP id
 p14-20020a056830304e00b005aff66a56eemr8623044otr.226.1650981971808; 
 Tue, 26 Apr 2022 07:06:11 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 m65-20020acabc44000000b002ed13d0fe6fsm4813724oif.23.2022.04.26.07.06.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 07:06:11 -0700 (PDT)
Received: (nullmailer pid 1894220 invoked by uid 1000);
 Tue, 26 Apr 2022 14:06:10 -0000
Date: Tue, 26 Apr 2022 09:06:10 -0500
From: Rob Herring <robh@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-rtc@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH] dt-bindings: Drop empty and unreferenced binding .txt
 files
Message-ID: <Ymf8UkekSzSIzuSp@robh.at.kernel.org>
References: <20220422191958.2589318-1-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220422191958.2589318-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220426_070614_225312_704B0B22 
X-CRM114-Status: GOOD (  10.84  )
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

On Fri, 22 Apr 2022 14:19:57 -0500, Rob Herring wrote:
> Drop a couple of old, empty .txt binding files which are no longer
> referenced.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  Documentation/devicetree/bindings/eeprom/at24.txt | 1 -
>  Documentation/devicetree/bindings/mtd/common.txt  | 1 -
>  Documentation/devicetree/bindings/rtc/rtc.txt     | 1 -
>  3 files changed, 3 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/eeprom/at24.txt
>  delete mode 100644 Documentation/devicetree/bindings/mtd/common.txt
>  delete mode 100644 Documentation/devicetree/bindings/rtc/rtc.txt
> 

Applied, thanks!

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
