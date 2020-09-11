Return-Path: <SRS0=H+qW=CU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66887C433E2
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Sep 2020 15:39:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E202520770
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Sep 2020 15:39:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Y6Duw8/B"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E202520770
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c4uacoISKW8e/M5uoy1Aae4uxGjrOLpRauMLZMZmOWo=; b=Y6Duw8/BMKrc+YEgGJmxg3szfg
	9ftm1cZSIHd9PXg5EVle9E2UPpx9gYRcYiEIXbpdStfqIQl7CwSN6V+doUgT9uFzX2+TtrcIay6Mj
	h1OEBxvGs+iRGtqbYeqMgqUBAwiEBlghb/GoddKRUtI9m1DBNAnCyFR+zlBuH8ba38v8x5TVFBYcm
	CYYDZJJvnPIytudLTXgZ12IBE7CpOO+QynoEh4utc58AodqTXoyXvn3xJXckPTKMiQq2G9kyd+N3P
	xSJwZB3jYe1zPxY1jCCaRYpPON3mZml2FrXpQvVdXMHpsNcqPyJpU5ECccB87bdndOUv6Gtz1T9A6
	4fX8ifWw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGl7p-0007gX-2d; Fri, 11 Sep 2020 15:38:09 +0000
Received: from mail-ed1-f68.google.com ([209.85.208.68])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGl7m-0007fk-M7
 for linux-mtd@lists.infradead.org; Fri, 11 Sep 2020 15:38:07 +0000
Received: by mail-ed1-f68.google.com with SMTP id g4so10462471edk.0
 for <linux-mtd@lists.infradead.org>; Fri, 11 Sep 2020 08:38:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=7DjrxY7Lk4EK6rFC1XPIpw7t8L5lPZ8egTPE4yUmjhU=;
 b=FK9eOYqKzu84+KTLKHnmJjj0S5spozmQGsn9B4t0UtkGqqOQEyOdY7xvNMYayiaIpG
 g+8fljN1s8IuECaGwUSIzJs8LVLVlcCRSI4xrJ5Y+JkkQVvC+9jG7DhcwpM5j6aRRNU5
 6P9bvAKhGqnf9QZTZiWI0s222zHl05pf+kscmpk/fnXjMNLTL1jgsVJYISBTqI1y5rmy
 a5sSmrZvKalxdUs6VzKhl3GvrS6E1clFvABwOB1IxmBOgUz9U3lVM2eDkxEgXo07DXuq
 x7zGwaBzTbi4BcGXwCZqgQ+3H83xHvXQ32ARknXWSO/KKGJbToDcjcYUR5IsGGhOqhKE
 +Dxg==
X-Gm-Message-State: AOAM531rkGFLPTftx2QptprrmpQK2r/SDhENa2VrP6axBci+kG7vBM/x
 hRi6qvhts93NcHjL0DfOgN4=
X-Google-Smtp-Source: ABdhPJx1oFowCxvi4gz9N5G5FJwtdy3gLuMaWdJJuUaR6LNVTy9hGMGrP1GbxlAQ+8eJwfAJUzN1Yw==
X-Received: by 2002:a05:6402:8:: with SMTP id d8mr2549402edu.15.1599838685470; 
 Fri, 11 Sep 2020 08:38:05 -0700 (PDT)
Received: from kozik-lap ([194.230.155.174])
 by smtp.googlemail.com with ESMTPSA id bm2sm1951756edb.30.2020.09.11.08.38.03
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 11 Sep 2020 08:38:04 -0700 (PDT)
Date: Fri, 11 Sep 2020 17:38:02 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Paul Cercueil <paul@crapouillou.net>, Rob Herring <robh+dt@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Harvey Hunt <harveyhuntnexus@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-mips@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2 1/2] MAINTAINERS: Remove JZ4780 DMA driver entry
Message-ID: <20200911153802.GA18279@kozik-lap>
References: <20200817184131.907-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200817184131.907-1-krzk@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200911_113806_760130_19410160 
X-CRM114-Status: GOOD (  14.24  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, Aug 17, 2020 at 08:41:30PM +0200, Krzysztof Kozlowski wrote:
> The entry for MIPS Ingenic JZ4780 DMA driver is not up to date anymore.
> Zubair Lutfullah Kakakhel's email bounces and no maintenance is
> provided.
> 
> Suggested-by: Paul Cercueil <paul@crapouillou.net>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> ---
> 
> Changes since v1:
> 1. New patch
> ---
>  MAINTAINERS | 5 -----
>  1 file changed, 5 deletions(-)
> 

Hi all,

Any comments on these two patches?

Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
