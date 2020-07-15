Return-Path: <SRS0=+X7X=A2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B68C2C433E5
	for <linux-mtd@archiver.kernel.org>; Wed, 15 Jul 2020 17:55:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 894112065E
	for <linux-mtd@archiver.kernel.org>; Wed, 15 Jul 2020 17:55:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OI3qx1Zl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 894112065E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zsluv5o4dourGgcOw3q+u7sk4DWvyv1QjoeNUuhz4dw=; b=OI3qx1ZlWxJtra61PcRkyZwtR
	b/5CQcl3zkc4fmDbVxs/IQt+ZcmApGqgEcFRVEI6sQvgppBi/7r36hYMdsLpRJOgRr2J5n0ktbSn/
	lvnmZa/8Eq5tHP44BG7azi6Di2IdJaDCAB8Z3wLSPJTWw89pfPsxD1/hLVTPXaC5xxoYehRrDPvSI
	UkCJEl8ZTKAJq9dufW54RIgoKHwAn7CgUdnR/IymuSA1v8NZ2B/R3lvLn4Y4BerCQ5eBAFjj44cZH
	B1ZwOCNbHIl5fcCxUpMl5hpx46NJHSlh+wELG40n1ZdFtbe0XuB7c4RXPz8WDNBktRaf8vlOaCdIu
	l0Bgw/KfA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jvlbX-0004EZ-6n; Wed, 15 Jul 2020 17:54:03 +0000
Received: from mail-io1-f68.google.com ([209.85.166.68])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvlbT-0004DT-7r; Wed, 15 Jul 2020 17:54:00 +0000
Received: by mail-io1-f68.google.com with SMTP id k23so3161043iom.10;
 Wed, 15 Jul 2020 10:53:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=P3B3mLxesRLNcERsb3dRLB4kBnpbANKyx7xmsh9Ksh8=;
 b=GgtjY6Oyjr19ixXq2SOKIzWHttMNxV6JrNsUJByNxXvPWVzZd6aDC9KH1r2rYkE+2o
 vh8whwzVagxnVd6cOlh+x2DItiU/ndAuv7GP7S4feW+asC+xDe4DYju8i0snbrKgQqhb
 EWJQ8Evdhv6Wwu9nnsimF2Et8WaGsCXk1yjrTb4t2zM+5d8mWn/6h5H1cGbsewq7J3dg
 Kkccv4ln1zqq2hmagoegqhZb85bxVu4jdnzdBGxjZPerYe+CqUinTeDFASwDanUcz9M9
 JDpgEwh1rIYJlJ0PNlKn+03S2y1vl5njDR2gTllxJTxjepOMMDAwyw4+F7HjzHJumsta
 Xg9A==
X-Gm-Message-State: AOAM532aJzdbAOgDpJ/DyvbWnCRSUdFkW6GIY7aq4QUmc7ybjUrmN84J
 3r/Q8NEgSpFUIXZzN8uJeA==
X-Google-Smtp-Source: ABdhPJx5JOOO2YSgNc4SGZxFHsxJyNx/SGb0yWUOzjfTsY5cWxBY1ZnqpvTk5wIBElTlc0mSwwxtEA==
X-Received: by 2002:a6b:b74e:: with SMTP id h75mr428154iof.79.1594835638606;
 Wed, 15 Jul 2020 10:53:58 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id u6sm1359427ilg.32.2020.07.15.10.53.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jul 2020 10:53:57 -0700 (PDT)
Received: (nullmailer pid 504090 invoked by uid 1000);
 Wed, 15 Jul 2020 17:53:56 -0000
Date: Wed, 15 Jul 2020 11:53:56 -0600
From: Rob Herring <robh@kernel.org>
To: Yifeng Zhao <yifeng.zhao@rock-chips.com>
Subject: Re: [PATCH v7 1/8] dt-bindings: mtd: Describe Rockchip RK3xxx NAND
 flash controller
Message-ID: <20200715175356.GA502928@bogus>
References: <20200715090342.28339-1-yifeng.zhao@rock-chips.com>
 <20200715090342.28339-2-yifeng.zhao@rock-chips.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200715090342.28339-2-yifeng.zhao@rock-chips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200715_135359_299398_E66B2F12 
X-CRM114-Status: GOOD (  12.89  )
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
Cc: devicetree@vger.kernel.org, vigneshr@ti.com, richard@nod.at,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 robh+dt@kernel.org, linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com,
 linux-arm-kernel@lists.infradead.org, heiko@sntech.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, 15 Jul 2020 17:03:39 +0800, Yifeng Zhao wrote:
> Documentation support for Rockchip RK3xxx NAND flash controllers
> 
> Signed-off-by: Yifeng Zhao <yifeng.zhao@rock-chips.com>
> ---
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
> Changes in v2: None
> 
>  .../mtd/rockchip,nand-controller.yaml         | 162 ++++++++++++++++++
>  1 file changed, 162 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/rockchip,nand-controller.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mtd/rockchip,nand-controller.example.dt.yaml: example-0: nand-controller@ff4b0000:reg:0: [0, 4283105280, 0, 16384] is too long


See https://patchwork.ozlabs.org/patch/1329325

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
