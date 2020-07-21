Return-Path: <SRS0=j43f=BA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDD0EC433E0
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Jul 2020 01:54:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B989A20658
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Jul 2020 01:54:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PUun+s9f"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B989A20658
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9sHqZMD+VB+ojThmXVZgMKPZi5qLsmqPFcxRJ5VuvHQ=; b=PUun+s9fmRBFOCzDIswbJtPCg
	19WtoDdc+VoxBj9NH17GRpoLtbiJkXwtwKnwKo9brtvbeBk2sRqBlnzQITtrblB4lo0EZxepVunVx
	BJXzmt5kXtzdYeSY8+VFrjK9sWIpaZbLtDcU39q0FEUT2easIIIJmqgyfQd4O3Z6Qs6MX10saQAey
	2sVgUl9MsUcw7AxCrcuSy0lt+/q1ADwz9E3JUPTixvRItIVcT7U58TLIk5GqQwSx019LTCVOvAYy7
	9GQKjFIipedItS5aOOk4yFHef21c4VxhKZ9zRcq61cnMEr+OCrPpt/90HOqESlHiA/MIGN2kfyrcb
	vE4jQ77Sg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxhSu-00063c-0w; Tue, 21 Jul 2020 01:53:08 +0000
Received: from mail-io1-f67.google.com ([209.85.166.67])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxhSm-000633-Ux
 for linux-mtd@lists.infradead.org; Tue, 21 Jul 2020 01:53:01 +0000
Received: by mail-io1-f67.google.com with SMTP id v8so19736341iox.2
 for <linux-mtd@lists.infradead.org>; Mon, 20 Jul 2020 18:53:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=9KP0Rc8u4bVobD9Gj1dIehnk+YvHsu8cH9wSojjS1pw=;
 b=jdf3jkOfBE7Rb33abX+YGVJDP8j+hJvY8+l/9KZ24Pf+YBDMzOAGielCNjyltjo9/Y
 U8yN4GxLnEGiP+9gRedV9F3JNZf5lfV1c3pZgeWJVbW3Ac3di+8xj9mf0Km7sActlpyi
 hCYtnBkXDMoUvkpywg3/tLEnj0WelCtxlXCDo8yDNzaEdJT7YH4fG1a2wnZAtqIxePkP
 5/AXcrDZ71bdhFJYhllEV+3Bv92iJlcJbo33ecOPeynNh6h5AuswZADlAxOThbyAducT
 IG1gamQpG2TCyVNHQe+HNCMGIQCiHZfC5zbnSut7bnPDzRKgX3RxubC+VC4fMbSG2xrp
 K2/Q==
X-Gm-Message-State: AOAM532OiogDbSXFh93M6p0i6j2+g+z2KUJPtZ3SOrr7MmSTxPTMs9ZD
 7YDdONTSNQSfTOKPgJHDMw==
X-Google-Smtp-Source: ABdhPJzaNK68W25st0exLMoy7RKom9FavgqN/p9iQOTVKMA8AHlp6hlZqOPW4z86KxVY7tE/qv2QBA==
X-Received: by 2002:a02:9109:: with SMTP id a9mr30142492jag.130.1595296380320; 
 Mon, 20 Jul 2020 18:53:00 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id x71sm9924564ilk.43.2020.07.20.18.52.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2020 18:52:59 -0700 (PDT)
Received: (nullmailer pid 3362142 invoked by uid 1000);
 Tue, 21 Jul 2020 01:52:58 -0000
Date: Mon, 20 Jul 2020 19:52:58 -0600
From: Rob Herring <robh@kernel.org>
To: "Alexander A. Klimov" <grandmaster@al2klimov.de>
Subject: Re: [PATCH] mtd: Replace HTTP links with HTTPS ones
Message-ID: <20200721015258.GA3362089@bogus>
References: <20200713165408.36229-1-grandmaster@al2klimov.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200713165408.36229-1-grandmaster@al2klimov.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200720_215301_212248_BE0D04E0 
X-CRM114-Status: GOOD (  16.49  )
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
Cc: devicetree@vger.kernel.org, vigneshr@ti.com, arnd@arndb.de, richard@nod.at,
 linus.walleij@linaro.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, 13 Jul 2020 18:54:08 +0200, Alexander A. Klimov wrote:
> Rationale:
> Reduces attack surface on kernel devs opening the links for MITM
> as HTTPS traffic is much harder to manipulate.
> 
> Deterministic algorithm:
> For each file:
>   If not .svg:
>     For each line:
>       If doesn't contain `\bxmlns\b`:
>         For each link, `\bhttp://[^# \t\r\n]*(?:\w|/)`:
> 	  If neither `\bgnu\.org/license`, nor `\bmozilla\.org/MPL\b`:
>             If both the HTTP and HTTPS versions
>             return 200 OK and serve the same content:
>               Replace HTTP with HTTPS.
> 
> Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>
> ---
>  Continuing my work started at 93431e0607e5.
>  See also: git log --oneline '--author=Alexander A. Klimov <grandmaster@al2klimov.de>' v5.7..master
>  (Actually letting a shell for loop submit all this stuff for me.)
> 
>  If there are any URLs to be removed completely or at least not just HTTPSified:
>  Just clearly say so and I'll *undo my change*.
>  See also: https://lkml.org/lkml/2020/6/27/64
> 
>  If there are any valid, but yet not changed URLs:
>  See: https://lkml.org/lkml/2020/6/26/837
> 
>  If you apply the patch, please let me know.
> 
>  Sorry again to all maintainers who complained about subject lines.
>  Now I realized that you want an actually perfect prefixes,
>  not just subsystem ones.
>  I tried my best...
>  And yes, *I could* (at least half-)automate it.
>  Impossible is nothing! :)
> 
> 
>  Documentation/devicetree/bindings/mtd/davinci-nand.txt | 4 ++--
>  drivers/mtd/chips/Kconfig                              | 2 +-
>  drivers/mtd/maps/Kconfig                               | 2 +-
>  drivers/mtd/maps/sc520cdp.c                            | 2 +-
>  4 files changed, 5 insertions(+), 5 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
