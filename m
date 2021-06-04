Return-Path: <SRS0=b8TW=K6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4A13C07E94
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Jun 2021 15:32:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7971761400
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Jun 2021 15:32:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7971761400
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lSK22HN9fQZfoUHwEsQ/H9Jb83862UEIRJVXTsPrkD8=; b=jPHXIqC9qPL5Pp
	mTSwW1sJauJ9sWTVVQrefTzgoI5AZgl/ZEkL+2oZ9TRi8+DHBXb6Bj33EE0oncUZxasfJY7dSuf6T
	UWe4G7zaqPj4E/nVVHZ7n9gmX1W5/wr0B9tng4vifJqgn0ropZp4dFm0f99i033wOCf9z/dm/yLm/
	UXIuCueMoGWUKOqboUCu+SrEwlmdkYN4zehmDGTN42ls8yw0Uch204/NhW4CL51aII8nmcHJPhQrB
	oezXUb4wJJFS3KPay0gX/Etf5wq+Vj4DiJ1mTmSpAnYHHHsggpPyqo95tykH48h8nRUi5AYQ3s2Ll
	Pe0Vn90poRGGoqGSsNbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lpBnS-00EAxK-8G; Fri, 04 Jun 2021 15:31:42 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lpBnL-00EAuv-OK; Fri, 04 Jun 2021 15:31:39 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 47C43611CA;
 Fri,  4 Jun 2021 15:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622820695;
 bh=y9dsSXNbMIcEq8UnJffs0wbh+86AlXMXqDArzpL1ejg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=qvnHZHbpffI4bqhcsPom8cj8ywwplHDIrc9BTtw2VJQW22aAhnSk0tGSEEuLIxgD0
 aecNikxqo9pq4hFXt+43hnxxsZtXY2H3qhmwR3DoCw/uhKHc1MzFXR+gN0gxVqDRAV
 moAPMX959OTsuQ2HGzintUxzs/LEhfZK1rybKZ/+hNQ0ovS82GKQQRIOdwbXTX5/32
 gaQ6EkN2ZXPdsPeAnwg/dX56kRwnNbEu6WbI4MGQDB61mslSNlF4Pm/KddQhkFJOBY
 HPMZPgDBIqa6FWc7QGUI2jh3OLXGN7yiNrkRanbH45s4FORW+khrMAMJ2M2+inKh+2
 LQ+cIAetFn8jQ==
Received: by mail-ed1-f54.google.com with SMTP id cb9so11667261edb.1;
 Fri, 04 Jun 2021 08:31:35 -0700 (PDT)
X-Gm-Message-State: AOAM533u46ErxiMy2YiyUixsPEZ5H6FRPbox+o9SGykv0EnT29KtSsgp
 MYKR1KUv50DByKcbGqiFq5lrw1chjmhHqBsboQ==
X-Google-Smtp-Source: ABdhPJzcNx6WawZZJzBsETgZj/plciRUPlBKfn+5IWd+JFZZlDznsldrTyNutB1G8lqArdulvKaZyERBaxGHdyBjwR4=
X-Received: by 2002:aa7:cb19:: with SMTP id s25mr5374606edt.194.1622820693842; 
 Fri, 04 Jun 2021 08:31:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210604151055.28636-1-macroalpha82@gmail.com>
 <20210604151055.28636-2-macroalpha82@gmail.com>
In-Reply-To: <20210604151055.28636-2-macroalpha82@gmail.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Fri, 4 Jun 2021 10:31:21 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJyk95R=t8xWC3r2=PpARsHAYMUeNENqquW9j0LBT8gxw@mail.gmail.com>
Message-ID: <CAL_JsqJyk95R=t8xWC3r2=PpARsHAYMUeNENqquW9j0LBT8gxw@mail.gmail.com>
Subject: Re: [RFC v4 1/8] dt-bindings: rockchip-sfc: Bindings for Rockchip
 serial flash controller
To: Chris Morgan <macroalpha82@gmail.com>
Cc: linux-spi@vger.kernel.org, jon.lin@rock-chips.com, broonie@kernel.org, 
 heiko@sntech.de, jbx6244@gmail.com, hjc@rock-chips.com, 
 yifeng.zhao@rock-chips.com, sugar.zhang@rock-chips.com, 
 linux-rockchip@lists.infradead.org, linux-mtd@lists.infradead.org, 
 p.yadav@ti.com, Chris Morgan <macromorgan@hotmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210604_083135_845389_EADACD64 
X-CRM114-Status: GOOD (  10.11  )
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

On Fri, Jun 4, 2021 at 10:11 AM Chris Morgan <macroalpha82@gmail.com> wrote:
>
> From: Chris Morgan <macromorgan@hotmail.com>
>
> Add bindings for the Rockchip serial flash controller. New device
> specific parameter of rockchip,sfc-no-dma included in documentation.
>
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> ---
>  .../devicetree/bindings/spi/rockchip-sfc.yaml | 85 +++++++++++++++++++
>  1 file changed, 85 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/spi/rockchip-sfc.yaml

Please resend to the DT list if you want DT patches reviewed.

Rob

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
