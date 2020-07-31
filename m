Return-Path: <SRS0=HCZ/=BK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA465C433E0
	for <linux-mtd@archiver.kernel.org>; Fri, 31 Jul 2020 22:31:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 890F421744
	for <linux-mtd@archiver.kernel.org>; Fri, 31 Jul 2020 22:31:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="U9fN4jGU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 890F421744
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4a1femkrsf5ywkCTePhOI/96tJvmAIy1Z4I8IVskZek=; b=U9fN4jGUHC6SEHbRFHpXl89pb
	6sLk+/kVFAYeTNlUMUIrD5ouIL+r3sG9+dB2Vql4MbEqUI4ul+UfmvnZ34NC68PXE75v9qmN5U1hc
	OKuVd/RITSMhNJ5PUj1uqFw8rcJIbNLOXoXHQiiFrhk010cEOe2MYnsYYjuW4bf8n6iSNAz8NyBkT
	AX7adEXd8m8kHAQQo70GgeSjg56PUQ0M0RyQMExdIJVdGPkFb+dodeuYtjY8fpxKswCdggU89+Beh
	AyqeVFXMT5o70S0Ibnl1jENm22V/3NpWulkz1X9peWLSvE0jGaVLDdrQvle1Gw3iB8H4YEecVqpXD
	1mFfE/VBA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k1dXm-0003p4-Pg; Fri, 31 Jul 2020 22:30:26 +0000
Received: from mail-il1-f196.google.com ([209.85.166.196])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k1dXk-0003oN-7f
 for linux-mtd@lists.infradead.org; Fri, 31 Jul 2020 22:30:24 +0000
Received: by mail-il1-f196.google.com with SMTP id r12so26593629ilh.4
 for <linux-mtd@lists.infradead.org>; Fri, 31 Jul 2020 15:30:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=2maazcGZ5EmPVyaTxV1kqSQWG44Ku8XCmrKZS9b/6sw=;
 b=Gzx9droQojLNsJjK3Phztjr8RoqQEPkSuZGOVPEmZxxg9jr1i9/KEAHPGX8XtlR7B/
 i+8I0B1T4aDWKXFf7QJaakvuf9p9WkDXuDqzAnB0zgvAXnOYuvdOks72F+3inQYNnvzq
 eRFa3ncfGeo3ODqtTYAw+0LEK242RGsdAqZbC3VkDW2h4EoHfuRLJJ2DmfNJjFqZo0PT
 PcMMQZJVlAeJwuMVY6SHXqr+uLSea77FlaXPWOCg/x7GteC7qLFGZh2zIdPyvsiHrkI2
 ARsL9jq3FrcVddXmw4a0a138AvnbZcw6NZvYLBpCg1lS/59cxqGBk5ucR9+sYnZbMT6a
 cnUw==
X-Gm-Message-State: AOAM53013PK12tZK2WCXJxyqG614xOEM/enr70NxeXjzuj7IZM5rpQiv
 Pkkif2ZwbW+PeyLV5dSnDg==
X-Google-Smtp-Source: ABdhPJweVA/kIb9N17voplqDVaSgdP6Uo167HAzEoZY7A1QACN/CL+32OjS4NIvJD0JGn11TfvLrAQ==
X-Received: by 2002:a92:5bd8:: with SMTP id c85mr5466714ilg.35.1596234623651; 
 Fri, 31 Jul 2020 15:30:23 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id l16sm5507830ilj.78.2020.07.31.15.30.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jul 2020 15:30:23 -0700 (PDT)
Received: (nullmailer pid 922882 invoked by uid 1000);
 Fri, 31 Jul 2020 22:30:22 -0000
Date: Fri, 31 Jul 2020 16:30:22 -0600
From: Rob Herring <robh@kernel.org>
To: Anson Huang <Anson.Huang@nxp.com>
Subject: Re: [PATCH 1/2] dt-bindings: mtd: Convert gpmi nand to json-schema
Message-ID: <20200731223022.GA922797@bogus>
References: <1596113004-15548-1-git-send-email-Anson.Huang@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1596113004-15548-1-git-send-email-Anson.Huang@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200731_183024_286342_F2EC1D7F 
X-CRM114-Status: GOOD (  10.97  )
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
 miquel.raynal@bootlin.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-mtd@lists.infradead.org, Linux-imx@nxp.com,
 u.kleine-koenig@pengutronix.de, han.xu@nxp.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, 30 Jul 2020 20:43:23 +0800, Anson Huang wrote:
> Convert the gpmi nand controller binding to DT schema format
> using json-schema.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> ---
>  .../devicetree/bindings/mtd/gpmi-nand.txt          |  75 -------------
>  .../devicetree/bindings/mtd/gpmi-nand.yaml         | 118 +++++++++++++++++++++
>  2 files changed, 118 insertions(+), 75 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/mtd/gpmi-nand.txt
>  create mode 100644 Documentation/devicetree/bindings/mtd/gpmi-nand.yaml
> 

Applied, thanks!

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
