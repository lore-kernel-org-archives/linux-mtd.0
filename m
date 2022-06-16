Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5BB3C433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Jun 2022 13:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mFPCsEMxADQNZ0n77Oo8Uq+1rcdSbVTqYbCYtbx+JWQ=; b=hcrAP3eNRbihE9
	GZIoJO7mkcUk0XoU6l6QfvgpQWOatHMBw6ZwvzPaeacy17Hqb8KsrXG8PH7w62+GKe8vLeiaAe1k+
	PF9f4j3nSCsWPCdGQ+FywODZ9hamHeFvRCZToq179LV6CdR+WKatP4fjUBzhwhg1oBpbw2LbP7+gB
	rsvb/qTQIX18lbIjPiRSYxwIOLNebmInmgOBNgWazTt3W6bizqyJiuWtdIlaOdUCGe+aHG8sDvdvk
	Wzialmg/LfniwzakfUlgmacMDLjoRaNnTDgeCd9DhNaV3EtTCl3UMIlkwRDUnWdXk3cJQ721pAKQz
	qf/DRvZMXGNEWoykBITg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1peG-002U5y-Mz; Thu, 16 Jun 2022 13:35:00 +0000
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1peD-002U4h-Hl
	for linux-mtd@lists.infradead.org; Thu, 16 Jun 2022 13:34:58 +0000
Received: by mail-yb1-xb2e.google.com with SMTP id t1so2231476ybd.2
        for <linux-mtd@lists.infradead.org>; Thu, 16 Jun 2022 06:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=E4oRD4fpeOcIe9J3CDXeLQW7t2RI1ucb4W5YyAxRXTc=;
        b=i+aNtOa0+P+UbHlJ+UN0VZmv+j16VlraJF77uRCdHFS9DDTc2ta8XYvSfxc1rbXh52
         C9Hwy4bHsghReeEsAOr5frAUR0h/6yvnL98uuM/BV5p6LF6ip1BxtdTvaIJRzEoCoJy7
         HA80uJ9DSen54oYDsfLIsIyXI8ieNXW53l/JP7kirV0mPi57XiWfohaX1D1/TOvEvTg/
         mTMITFgeJolEY5F43ftAl1AFapXqkYT57sFcHPxuWR/BDsZNk/fViXrCbaIOdIWGRapw
         Ef4Vs2gqSuHK2KLCX2E/zi9ktMQtWwZS2eAYxgKkkO8lJ6Wtt4oRt1hPRH4iksDjaemh
         +Gbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=E4oRD4fpeOcIe9J3CDXeLQW7t2RI1ucb4W5YyAxRXTc=;
        b=aQICFH5ndhgNP545pczXqMp8EAVEOkHkL7/iVnMGFfbNwmeqNraXtTpzGRSyQMYEQh
         Xe4LNze1SrfE0FrY8OsYHGPzZgK/AMpJW7zpw1VWiaRMsRKQp8uZKre4T2tYiHJX2VD8
         R6GLpEzNFAnsT1WirZPvvsM8D3fYoB0ck0A8/2ZND4oojbd8uTyLxrMASPYErv5fHus6
         2LTaosLkcHihAqs0A3CPuzrgbMAy819EtnRrHzJ3Y+4eEzBX7XhHq0ENIm68knfSmD/+
         OXRhfEgK9iSrznG8F5Bq0FIajhC4V3g7007okLGoYlBgMMk6CvBwSDhu7tt2Nd8kuYot
         eXSw==
X-Gm-Message-State: AJIora/B6SbIHbReYMmxsW5zFmlHBPQDbLtCiD6xi4erK9iW/af86nhr
	NElEYEJNIIOkQH/eymwj+AHgftE4XhknqTHwTcLwu3DbiXk=
X-Google-Smtp-Source: AGRyM1tOESzLLHsKWOfNIxiAJfDhdbEqfPn3s2ZPVjXgSzXCZ24IEI92hnqOwbzdBIKkU7b9sRdugwSZhPXLa08JRCI=
X-Received: by 2002:a25:3417:0:b0:664:aab3:7c44 with SMTP id
 b23-20020a253417000000b00664aab37c44mr5233002yba.533.1655386495611; Thu, 16
 Jun 2022 06:34:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220610203746.2191518-1-robh@kernel.org>
In-Reply-To: <20220610203746.2191518-1-robh@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 16 Jun 2022 15:34:44 +0200
Message-ID: <CACRpkdaayHZaeC4X1+d_jC0nCvAtw=w2t2m1txj4OtV_LqcnoA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: mtd/partitions: Convert arm-firmware-suite
 to DT schema
To: Rob Herring <robh@kernel.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220616_063457_639977_97095FC6 
X-CRM114-Status: UNSURE (   8.19  )
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

On Fri, Jun 10, 2022 at 10:38 PM Rob Herring <robh@kernel.org> wrote:

> Convert the arm,arm-firmware-suite partition binding to DT schema
> format. Simple conversion as there's only a compatible property.
>
> Signed-off-by: Rob Herring <robh@kernel.org>

I see your own robot bit you about the unit name but with
that fixed:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
