Return-Path: <SRS0=sICc=D2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 929C0C433DF
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Oct 2020 19:59:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 01825222B8
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Oct 2020 19:59:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="vek442fh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 01825222B8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=s3sZwLDzS9sOrta/1TikTW/pWkhAtNb8r29+OIwuIVo=; b=vek442fhVS+XZkxntJvQicjt2
	QqVeCpbGaYktLOyEEIzANPKV4OxIL1Yzj1WqahKvq4nfb/bOj4g5I5BM2qFYT4R58Tin6YRk4bxWQ
	vPkMa3ee/ukjZHxAq/aQG+eyohL1Z7UrpQdD+qVdJ4hEShl8FfD9n3SlzUfoJ0y8TtutJPaeOLhNQ
	oCBFfbf0QXQ0sioBY846h+zFrgkmX+XI+SHTJcX7ZZ6kmF+Ze9Nq4orOdc3x5a+w1KMMKGbSe3Vxd
	D55oZXJ0kW2XeGble6WGRJfO4lYX1KtHUAKHXz/j9Q8bW5f3EVR4miAQwmeo6gEcugnoCp3dsTGiB
	V6UXI8qFg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kUbIo-0001D5-VB; Mon, 19 Oct 2020 19:58:43 +0000
Received: from mail-oi1-f196.google.com ([209.85.167.196])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kUbIl-0001Bv-MY; Mon, 19 Oct 2020 19:58:40 +0000
Received: by mail-oi1-f196.google.com with SMTP id x62so1276264oix.11;
 Mon, 19 Oct 2020 12:58:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=iMcpjCjjlBEs+GFINxvVleDr5N6Oj32gn5NcfucJpXI=;
 b=Wuwn74TighhPQAUlnwZQbuk9VlQZjlDeWBdWmy9kogoRY6Cu6Amh48V9tYKiWviAVW
 PjLf5abehv5DRtp/h+108c5sMWtqhUzQM4R5Mfqg29jJoLIzoCUdsfkB/LlFLOGxialG
 ovwGubHifJ7x6wjUpuz2sAZzbd8jp2kU4Kx6uNmCyNUGq73PpiiSP63o5eFFd+4XVfAC
 5ewYxQTL+Cj0l8nCgqQw81aMM9enDlOVMv7umBro0qYy/RCvjggYDr2d6ra4yaCaA7UH
 HlPEeVfIdCfBuvfsfUhDTNpF+4SuwkQACvx8Cemmwaqt/Eu0bYsjq/2jPtNFuyrkhouJ
 CQNg==
X-Gm-Message-State: AOAM533ZsgIURrKptEFAu+gf+KQfzumsQ0TULis8I0aBkBVG+1XXQ5X+
 mzppUmyeV6JhVC+6wZ106cO0d19JDg==
X-Google-Smtp-Source: ABdhPJxVetBxNF3wbgnA9NSr9IsdFHypWN7ATmupsq8ibMJqkLHVvEhvBI/C96CZZePXbzF7ok4YRw==
X-Received: by 2002:aca:b256:: with SMTP id b83mr700269oif.116.1603137518838; 
 Mon, 19 Oct 2020 12:58:38 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id y194sm208402oie.22.2020.10.19.12.58.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Oct 2020 12:58:38 -0700 (PDT)
Received: (nullmailer pid 3509370 invoked by uid 1000);
 Mon, 19 Oct 2020 19:58:37 -0000
Date: Mon, 19 Oct 2020 14:58:37 -0500
From: Rob Herring <robh@kernel.org>
To: Yifeng Zhao <yifeng.zhao@rock-chips.com>
Subject: Re: [PATCH v11 1/8] dt-bindings: mtd: Describe Rockchip RK3xxx NAND
 flash controller
Message-ID: <20201019195837.GA3508930@bogus>
References: <20201019083358.32621-1-yifeng.zhao@rock-chips.com>
 <20201019083358.32621-2-yifeng.zhao@rock-chips.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201019083358.32621-2-yifeng.zhao@rock-chips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201019_155839_761245_2C0A6E44 
X-CRM114-Status: GOOD (  15.21  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, heiko@sntech.de, richard@nod.at,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 robh+dt@kernel.org, linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com,
 linux-arm-kernel@lists.infradead.org, vigneshr@ti.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, 19 Oct 2020 16:33:55 +0800, Yifeng Zhao wrote:
> Documentation support for Rockchip RK3xxx NAND flash controllers
> 
> Signed-off-by: Yifeng Zhao <yifeng.zhao@rock-chips.com>
> ---
> 
> (no changes since v8)
> 
> Changes in v8:
> - Fix make dt_binding_check error
> 
> Changes in v7:
> - Fix some wrong define
> 
> Changes in v6:
> - Fix some wrong define
> - Modified the definition of compatible
> 
> Changes in v5:
> - Fix some wrong define.
> - Add boot-medium define.
> - Remove some compatible define.
> 
> Changes in v4:
> - The compatible define with rkxx_nfc.
> - Add assigned-clocks.
> - Fix some wrong defineChanges in.
> 
> Changes in v3:
> - Change the title for the dt-bindings.
> 
>  .../mtd/rockchip,nand-controller.yaml         | 162 ++++++++++++++++++
>  1 file changed, 162 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/rockchip,nand-controller.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

./Documentation/devicetree/bindings/mtd/rockchip,nand-controller.yaml:92:9: [warning] wrong indentation: expected 10 but found 8 (indentation)
./Documentation/devicetree/bindings/mtd/rockchip,nand-controller.yaml:101:9: [warning] wrong indentation: expected 10 but found 8 (indentation)


See https://patchwork.ozlabs.org/patch/1384067

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
