Return-Path: <SRS0=R+0z=OL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 526BFC433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Sep 2021 20:48:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1EDE760F6E
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Sep 2021 20:48:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1EDE760F6E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YEUZlqXHsjDSeuwZQcjgRWmtSZmCZeDKN/3l9PeyWYU=; b=3VjuGeK4JIVt7r
	3B6WIzy60NYLbOmv3nQzWeK2Ad0T+HgtYx9w/9rw1TuIz6LFeztflU9/0EccSeuvmmTjf7j9eixOQ
	xPji0xuX7sR8qklbJSJUceBAGwfS4sr+YLP64XvMNcwCXy6FsUwcSj8XLAs6exoi7ZX8gGZi723HO
	cFIC9T3tSwKPbGAO/ucyS/O5lwqPI3GQTFuuDgro2962yQMcMLCkDLw0zLABZhwNO6kNT6dpKnZ+3
	gsJpFBDwyrdFjxDS3AI1xPAX/ADCIwxjTVqgvcv5ZQMtvE3XCUbo1xgiVcmaagE9Dil6nupggTCv5
	X4DtK6RbAMEytOf/FGXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mSmfm-005kI3-42; Tue, 21 Sep 2021 20:47:26 +0000
Received: from mail-ot1-f53.google.com ([209.85.210.53])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mSmfi-005kGf-7M
 for linux-mtd@lists.infradead.org; Tue, 21 Sep 2021 20:47:23 +0000
Received: by mail-ot1-f53.google.com with SMTP id
 c42-20020a05683034aa00b0051f4b99c40cso420373otu.0
 for <linux-mtd@lists.infradead.org>; Tue, 21 Sep 2021 13:47:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ngLxYzAUznjWSLFmvKia/nTu1IkrbcVJEhriv6IKScU=;
 b=6wDZEPSh0Gpojz9GJIwqOswMqCsx9DHD24ir0bEmfMWcYcit4+QCA4xZzB0+LvZpzl
 RmIRlkcdwTNoivBJIoo/sAjJ+tq+gIDMdYejoHsM1673pXA/9xFsPk8URR7ckFyXWpXW
 q2pVijtrdUzoDGDBSs6yt3gf9A9pLEseQ6vhhO4MOpr4q0Kty+giUzhe9r+0TUhUj5XE
 evuFKXMYmqYuhhpUozLwrFgLvyao570ml3mSQkR718o1BW1K6J8tXYvaw1K7+sVzy7Yt
 tXtw5n6/YORDYAH9REtAKIy62f4wp0koTTU9+liV5wax1rrU9/Qe1Edm5SqijOVh3Far
 W7bA==
X-Gm-Message-State: AOAM530njZYUWGWCjfgeaNko0tqYerMy2pTxQbmwW4KD+AlFg+vEuwrs
 l4dvN0D4Skz/OlhymQdv8Q==
X-Google-Smtp-Source: ABdhPJyxA75ILu4OIkNdfN8D3bBIqHF+zc2A+ALEEcje+US3CUJMYK5KMX0DOFOZSqk3dr4qD52SqQ==
X-Received: by 2002:a9d:724a:: with SMTP id a10mr27075485otk.323.1632257240826; 
 Tue, 21 Sep 2021 13:47:20 -0700 (PDT)
Received: from robh.at.kernel.org (rrcs-192-154-179-36.sw.biz.rr.com.
 [192.154.179.36])
 by smtp.gmail.com with ESMTPSA id j10sm18834oiw.32.2021.09.21.13.47.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Sep 2021 13:47:20 -0700 (PDT)
Received: (nullmailer pid 3300155 invoked by uid 1000);
 Tue, 21 Sep 2021 20:47:18 -0000
Date: Tue, 21 Sep 2021 15:47:18 -0500
From: Rob Herring <robh@kernel.org>
To: Roger Quadros <rogerq@kernel.org>
Cc: grygorii.strashko@ti.com, linux-omap@vger.kernel.org,
 devicetree@vger.kernel.org, nsekhar@ti.com, tony@atomide.com,
 linux-kernel@vger.kernel.org, miquel.raynal@bootlin.com,
 krzysztof.kozlowski@canonical.com, robh+dt@kernel.org,
 linux-mtd@lists.infradead.org, lokeshvutla@ti.com, nm@ti.com
Subject: Re: [PATCH v4 7/8] dt-bindings: memory-controllers: ti, gpmc: Convert
 to yaml
Message-ID: <YUpE1mBqElmjv+wV@robh.at.kernel.org>
References: <20210914122705.15421-1-rogerq@kernel.org>
 <20210914122705.15421-8-rogerq@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210914122705.15421-8-rogerq@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210921_134722_323311_B6F287F1 
X-CRM114-Status: UNSURE (   9.60  )
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

On Tue, 14 Sep 2021 15:27:04 +0300, Roger Quadros wrote:
> Convert omap-gpmc.txt to ti,gpmc.yaml.
> 
> Signed-off-by: Roger Quadros <rogerq@kernel.org>
> ---
>  .../bindings/memory-controllers/omap-gpmc.txt | 157 ----------------
>  .../bindings/memory-controllers/ti,gpmc.yaml  | 172 ++++++++++++++++++
>  2 files changed, 172 insertions(+), 157 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/memory-controllers/omap-gpmc.txt
>  create mode 100644 Documentation/devicetree/bindings/memory-controllers/ti,gpmc.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
