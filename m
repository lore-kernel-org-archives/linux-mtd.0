Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FFD6C43334
	for <linux-mtd@archiver.kernel.org>; Fri, 10 Jun 2022 23:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nyUa4kLgcbWNagZ1AWZQTqJxPpZsNKhddyJR+U4uaEo=; b=n2xGeeyZnNp+Id
	/lpdFBjt9gPwJNu3Y15J0fy/aMP9NHWa8SrjCbysvDJRL4U3I+mymnRSye97KmD+R09YnIaEw416p
	tJM5dKTnN4hKVzOV6HRy1QwpZQ9tkYij0ZieQ+FKDDBtXmc//h8HBobXuDCFsYCTtJu97jWLuA6Fg
	9KB2+RaFIhr/AhByTxqYfbgPRxMYoxx7yYATWAQ+lxJOFPwiTTkkamoH23VeWKdn/icqXPwoVe8ij
	anx7URe406raxklVwis0adhemlRjYqb196MaGMZB4dBQ4EKHnRc10/hPFWjW/QNIcF/jjp8Zxifj7
	02nlfHJSAu5Kd94csBpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nznuM-00AMrD-7u; Fri, 10 Jun 2022 23:19:14 +0000
Received: from mail-io1-f54.google.com ([209.85.166.54])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nznuI-00AMqR-WB
	for linux-mtd@lists.infradead.org; Fri, 10 Jun 2022 23:19:12 +0000
Received: by mail-io1-f54.google.com with SMTP id d123so529483iof.10
        for <linux-mtd@lists.infradead.org>; Fri, 10 Jun 2022 16:19:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=I85nzJQvpanBbnKRqJtMLn+dRbMroiljIODt3AC3sUA=;
        b=8PUKXhI+HJnxp8AINjD0jQuXlLiKAFVqU58pseSPn61jAHRyJTSIdukwsr99DEgK7/
         Cmb0cX5SxyoXpSBN4xU0z7+QKb1hmQ0/uC2og9TFERvQaMnw74GJ6XiejJK4fWZABHRz
         8uUglAAwHi+cUrGQOw6oREC50QyuUBL5iLykFJLcZq51imhEF5tZqjvXGJqEdlWLCrlr
         NfeV4GVBOb8tgOxMpIJrDx/VlO30PJhL7XJdGb65R1HDgLwwE/8ay9ifKeZlL05N9bej
         qDm/us+D5bxCqQ0Vr7QcDoMgR4mfXxcDxWDo4W0XnxAjkAhdYdAJokmLI8ZrihztAFpc
         UO7Q==
X-Gm-Message-State: AOAM533QjBfbTemxUF3YhR0rQmLtVxKL6mYVbZ05ZPUnrIij9pTsG2CW
	J46HiZ3n6O03krZAwTxzlw==
X-Google-Smtp-Source: ABdhPJyek+/IffazigJpKri07/SwvYOlBtivddM8UGvJatPh3EPESw3a8N+6KkBOSBAS1qj4+6zFxg==
X-Received: by 2002:a6b:2c87:0:b0:669:c37b:342b with SMTP id s129-20020a6b2c87000000b00669c37b342bmr1736787ios.158.1654903149861;
        Fri, 10 Jun 2022 16:19:09 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id y21-20020a027315000000b00331c06bf620sm176633jab.154.2022.06.10.16.19.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jun 2022 16:19:09 -0700 (PDT)
Received: (nullmailer pid 2450359 invoked by uid 1000);
	Fri, 10 Jun 2022 23:19:06 -0000
From: Rob Herring <robh@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Linus Walleij <linus.walleij@linaro.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, devicetree@vger.kernel.org, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>
In-Reply-To: <20220610203746.2191518-1-robh@kernel.org>
References: <20220610203746.2191518-1-robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: mtd/partitions: Convert arm-firmware-suite to DT schema
Date: Fri, 10 Jun 2022 17:19:06 -0600
Message-Id: <1654903146.326838.2450358.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220610_161911_075440_97213C67 
X-CRM114-Status: GOOD (  12.19  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, 10 Jun 2022 14:37:44 -0600, Rob Herring wrote:
> Convert the arm,arm-firmware-suite partition binding to DT schema
> format. Simple conversion as there's only a compatible property.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  .../mtd/partitions/arm,arm-firmware-suite.txt | 17 -----------
>  .../partitions/arm,arm-firmware-suite.yaml    | 30 +++++++++++++++++++
>  2 files changed, 30 insertions(+), 17 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/mtd/partitions/arm,arm-firmware-suite.txt
>  create mode 100644 Documentation/devicetree/bindings/mtd/partitions/arm,arm-firmware-suite.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/mtd/partitions/arm,arm-firmware-suite.example.dts:18.17-22.11: Warning (unit_address_vs_reg): /example-0/flash@0: node has a unit name, but no reg or ranges property

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
