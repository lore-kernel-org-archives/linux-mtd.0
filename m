Return-Path: <SRS0=lgj1=BW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D291C433DF
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Aug 2020 22:33:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C7CC920774
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Aug 2020 22:33:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dAMXo0f9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C7CC920774
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=LIDgtcq/FtO7T6dLrf4CQE31gLXjQPGeX5/SqCJhZWg=; b=dAMXo0f9G2vvZ90KHMotE/a8F
	SmP5BwHT8HzsB80s6D9LlMZt7UMNstyL7fnbyMN8gW4nu2G7IPhjbjweNUHZETPi+5gk0nqEqvLk1
	+Nx7zA3WYyNID05gspSyTb5QijTSrV2t30VWgnjEgGYVlJvSnxYYz85bWLgeaUua9foanyC2dQeN/
	U+X5sZBY9aUuk2rMOZCGUmegKs3ZoIQ8Cb7Qrq+G8+qRv/sTt0liqYMNuP8HVtbSTQDRy6fGBxt23
	CaWeMaZNQHRv9zGAbOYtcPPkq1f9OIv6Jwrg7j1NyLrYKyTTWY/BXWLhEu+/vZwuJ/Sp3+LFQLPIh
	suEPEKS8A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k5zIY-00008o-Md; Wed, 12 Aug 2020 22:32:42 +0000
Received: from smtprelay0182.hostedemail.com ([216.40.44.182]
 helo=smtprelay.hostedemail.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k5zIU-00007s-N8; Wed, 12 Aug 2020 22:32:39 +0000
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay01.hostedemail.com (Postfix) with ESMTP id C315D100E7B65;
 Wed, 12 Aug 2020 22:32:36 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: board29_4d052b526fef
X-Filterd-Recvd-Size: 2655
Received: from XPS-9350.home (unknown [47.151.133.149])
 (Authenticated sender: joe@perches.com)
 by omf16.hostedemail.com (Postfix) with ESMTPA;
 Wed, 12 Aug 2020 22:32:33 +0000 (UTC)
Message-ID: <f5dedf2d8d8057de3eaa2f9126f44cebb0653b09.camel@perches.com>
Subject: Re: [PATCH] dt-bindings: Whitespace clean-ups in schema files
From: Joe Perches <joe@perches.com>
To: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Date: Wed, 12 Aug 2020 15:32:32 -0700
In-Reply-To: <20200812203618.2656699-1-robh@kernel.org>
References: <20200812203618.2656699-1-robh@kernel.org>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200812_183238_820645_1651CA44 
X-CRM114-Status: GOOD (  10.64  )
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
Cc: linux-hwmon@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-fbdev@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-pm@vger.kernel.org, linux-iio@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-spi@vger.kernel.org, linux-gpio@vger.kernel.org, netdev@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-i2c@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-input@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, 2020-08-12 at 14:36 -0600, Rob Herring wrote:
> Clean-up incorrect indentation, extra spaces, long lines, and missing
> EOF newline in schema files. Most of the clean-ups are for list
> indentation which should always be 2 spaces more than the preceding
                                     ^
> keyword.
[]
> diff --git a/Documentation/devicetree/bindings/arm/arm,integrator.yaml b/Documentation/devicetree/bindings/arm/arm,integrator.yaml
> index 192ded470e32..f0daf990e077 100644
> --- a/Documentation/devicetree/bindings/arm/arm,integrator.yaml
> +++ b/Documentation/devicetree/bindings/arm/arm,integrator.yaml
> @@ -67,9 +67,9 @@ patternProperties:
>        compatible:
>          items:
>            - enum:
> -            - arm,integrator-ap-syscon
> -            - arm,integrator-cp-syscon
> -            - arm,integrator-sp-syscon
> +              - arm,integrator-ap-syscon
> +              - arm,integrator-cp-syscon
> +              - arm,integrator-sp-syscon

Confused a bit here.
          - enum:
	10 spaces to dash
old line:
            - arm,integrator-ap-syscon
	12 spaces to dash
new line:
              - arm,integrator-ap-syscon
	14 spaces to dash

Is it supposed to be 2 spaces more than the preceding line
or 4 more?



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
