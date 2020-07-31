Return-Path: <SRS0=HCZ/=BK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 664CDC433E0
	for <linux-mtd@archiver.kernel.org>; Fri, 31 Jul 2020 22:31:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E26321744
	for <linux-mtd@archiver.kernel.org>; Fri, 31 Jul 2020 22:31:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="p6DK0Cik"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2E26321744
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rIdpJzUDoe1IFwdh/j8LF2zvEkqKIAmfLs2MDrAz37o=; b=p6DK0CikqsD0fY3bffzpVFeap
	bKMnBm2l/VJKXISCYeqQZeDWLIk5McVWw/z6NaaHRRluQtEOm3IOqLRBUpdt6l0iwch9wq8kW5Zw6
	TmCYBf0nZxGTD6R2+tioU3b3NMM//YQeK8MvrMGPF6vFvP8Yt21c1g1er3fC/rvZpCUyqFySz/Cpr
	D0b/+wtCV7cIS+zdqgCKTRTm7VwoC4k1WgGzIUVq+SnjiZ0cqlWYEyQHREgpQTSGQ0EJUJ496YkCW
	snAzvFyGsjhp6o8TmmBXvxIC/xNBBrJs/txj8cKqetjcEht7UrGs/yCQgsUH4q+90vNpqAssOm75b
	a6ukyA4fg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k1dY1-0003qa-LK; Fri, 31 Jul 2020 22:30:41 +0000
Received: from mail-io1-f68.google.com ([209.85.166.68])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k1dXz-0003q0-L1
 for linux-mtd@lists.infradead.org; Fri, 31 Jul 2020 22:30:40 +0000
Received: by mail-io1-f68.google.com with SMTP id w12so19560006iom.4
 for <linux-mtd@lists.infradead.org>; Fri, 31 Jul 2020 15:30:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=45H1JgCHHdhQApbjvQq9Pb4Y3l2t3RueYD94Macm5D8=;
 b=MstACMATxqG6JGZghHUWIK4LebJ2/9OV9Fh1be3PowemJImGLpO0d4KMnwbAcjLWDB
 IKluIqOQI9cP1IDVYuPXykGLDc8L8uXfRbHQgn6gTTanCmSFYJqeCS+jT/wNPedeJCtn
 xWJOw0Y/pTX3ljo0SzYWRXnPMyWKKbPsuShSRcBf9qBIHdLNmw1l+vPM6gnSWcLiJlCM
 KyUEBMfQDjjOSrememcvIGPomvXgEwHV0tYgF03w9KkydfYQz+IuEL/I/fxAUAdZ2MK5
 7uhZyZGKQjZp8QGSynSuC0aKgUQTxHJGlalYgkZfzjlMvGwFP7L2X3lgSkIwzkfzGqk3
 /LsQ==
X-Gm-Message-State: AOAM530Kh0DMv6fw+mZsX/LhfgEORgmrT0alxBHKoAnk/jUVvDC3stbC
 ZQplbK8KKRdqqWHYAZg60w==
X-Google-Smtp-Source: ABdhPJzZAaX6MlFfNyrl50UMUoKtOe2pALDSo+xUOpiSIJ57RHBGhOQHylD+u3088MEWzsbuB1YUyQ==
X-Received: by 2002:a5e:d80e:: with SMTP id l14mr5802006iok.65.1596234638546; 
 Fri, 31 Jul 2020 15:30:38 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id f132sm5171450ioa.45.2020.07.31.15.30.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jul 2020 15:30:38 -0700 (PDT)
Received: (nullmailer pid 923415 invoked by uid 1000);
 Fri, 31 Jul 2020 22:30:35 -0000
Date: Fri, 31 Jul 2020 16:30:35 -0600
From: Rob Herring <robh@kernel.org>
To: Anson Huang <Anson.Huang@nxp.com>
Subject: Re: [PATCH 2/2] dt-bindings: mtd: Convert imx nand to json-schema
Message-ID: <20200731223035.GA923337@bogus>
References: <1596113004-15548-1-git-send-email-Anson.Huang@nxp.com>
 <1596113004-15548-2-git-send-email-Anson.Huang@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1596113004-15548-2-git-send-email-Anson.Huang@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200731_183039_728442_9BAC53DE 
X-CRM114-Status: GOOD (  11.07  )
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
 u.kleine-koenig@pengutronix.de, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, linux-mtd@lists.infradead.org, Linux-imx@nxp.com,
 miquel.raynal@bootlin.com, han.xu@nxp.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, 30 Jul 2020 20:43:24 +0800, Anson Huang wrote:
> Convert the i.MX nand controller binding to DT schema format
> using json-schema.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> ---
>  Documentation/devicetree/bindings/mtd/mxc-nand.txt | 19 ----------
>  .../devicetree/bindings/mtd/mxc-nand.yaml          | 42 ++++++++++++++++++++++
>  2 files changed, 42 insertions(+), 19 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/mtd/mxc-nand.txt
>  create mode 100644 Documentation/devicetree/bindings/mtd/mxc-nand.yaml
> 

Applied, thanks!

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
