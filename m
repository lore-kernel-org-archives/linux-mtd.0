Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3424C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 10 Jan 2022 19:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UFmUzQ5Eu4aXzRs3eTR7/AcKUJBMdQerwk1or8TdWYU=; b=t/g8ugGg8diIz7
	+0Hb2GfMEZM1T9CtB8ifF9D9xYzvwUFjssgNWpGd2+vg5E/Ktzi+++vB/uSE8Xm8f9OwLtC4ObLDf
	bqp/ANLusyu/m9fPjkspWEETiZU/364tkm+hx1XRjzQ2XvLav6e0/vggcCpzHd9rDQpDv0hw5iHsv
	UrIIltqWuJFDh84AucpCP0QtuGnhs698Y/DVP+8r51kGpcyyoUza+rq0kykWQHxNuaCzypH1ozb+c
	rhuYBiU7YDZXKkDvYmgfDrcU5ZHXYjilwt50AhxVa3iskOSitTHqKKlIKXqUf7Iu/Sn1C/xyXjWo4
	iiWLAbkrlfwQxvOYjpZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n700D-00CwSR-D4; Mon, 10 Jan 2022 19:06:45 +0000
Received: from mail-oi1-f182.google.com ([209.85.167.182])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n700A-00CwR6-Si; Mon, 10 Jan 2022 19:06:44 +0000
Received: by mail-oi1-f182.google.com with SMTP id s127so20003196oig.2;
 Mon, 10 Jan 2022 11:06:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Wwk6x/ZR37nweD32vHsQk5bV8DeKWS9G1MuQnQEcbQM=;
 b=fMOrv4NdF4lJYCYioEIAZtPp/+SkChC0WtycIr5DjI3QfOLoiD/cEU3z/Vwz9zL1do
 CkTGnKhg2xk7g0VhOzPnpPyvvJE8T9GEMKKPjiQbK4gP0vHlLMpgNECWiUigv/dAI77J
 Ic1WtuRGdaQxus5ZCMeYjwmy9z4FY36NZtyyJQ6ocFYaZrWkp0/i3yDHDbjAzxIwsYGr
 UQ8el0A49TFbZGHUDEoPu0bVVfzqLskj17T1KW6YoNtKIUG/ReYtChytAaPZko3JL9Im
 YI/NfSRt91v5qWhJLfqAlYtltpDXt4qESc6dQYjVXqyRP6TBqeAuv1aY0U1X/40J1eo0
 RP8w==
X-Gm-Message-State: AOAM531tuFxv+ybDaWIOrVGmJDzm4WUS9BdbuE8PPMNyKtgS5lFvoNxP
 bvJ7Ks1Jh2WVFiZzZg7rnQ==
X-Google-Smtp-Source: ABdhPJx5ZBjyXM4U8hax5nPjSCYA9zsja6YzyYe4DefjUE4k0aeTDsQSOoG5Ymd24O+VmO0kjBJV3w==
X-Received: by 2002:a05:6808:1a1e:: with SMTP id
 bk30mr663998oib.26.1641841601494; 
 Mon, 10 Jan 2022 11:06:41 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id q189sm656483oib.8.2022.01.10.11.06.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jan 2022 11:06:40 -0800 (PST)
Received: (nullmailer pid 1302633 invoked by uid 1000);
 Mon, 10 Jan 2022 19:06:39 -0000
Date: Mon, 10 Jan 2022 13:06:39 -0600
From: Rob Herring <robh@kernel.org>
To: Michael Walle <michael@walle.cc>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 netdev@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>,
 Frank Rowand <frowand.list@gmail.com>,
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Ansuel Smith <ansuelsmth@gmail.com>, Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH 1/8] of: base: add of_parse_phandle_with_optional_args()
Message-ID: <YdyDv1/WbNi3CMbu@robh.at.kernel.org>
References: <20211228142549.1275412-1-michael@walle.cc>
 <20211228142549.1275412-2-michael@walle.cc>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211228142549.1275412-2-michael@walle.cc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220110_110642_959055_88303965 
X-CRM114-Status: GOOD (  27.55  )
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

On Tue, Dec 28, 2021 at 03:25:42PM +0100, Michael Walle wrote:
> Add a new variant of the of_parse_phandle_with_args() which treats the
> cells name as optional. If it's missing, it is assumed that the phandle
> has no arguments.
> 
> Up until now, a nvmem node didn't have any arguments, so all the device
> trees haven't any '#*-cells' property. But there is a need for an
> additional argument for the phandle, for which we need a '#*-cells'
> property. Therefore, we need to support nvmem nodes with and without
> this property.
> 
> Signed-off-by: Michael Walle <michael@walle.cc>
> ---
>  drivers/of/base.c  | 23 +++++++++++++++++++++++
>  include/linux/of.h | 12 ++++++++++++
>  2 files changed, 35 insertions(+)
> 
> diff --git a/drivers/of/base.c b/drivers/of/base.c
> index 5b907600f5b0..fb28bb26276e 100644
> --- a/drivers/of/base.c
> +++ b/drivers/of/base.c
> @@ -1543,6 +1543,29 @@ int of_parse_phandle_with_args(const struct device_node *np, const char *list_na
>  }
>  EXPORT_SYMBOL(of_parse_phandle_with_args);
>  
> +/**
> + * of_parse_phandle_with_optional_args() - Find a node pointed by phandle in a list
> + *
> + * Same as of_parse_phandle_args() except that if the cells_name property is
> + * not found, cell_count of 0 is assumed.
> + *
> + * This is used to useful, if you have a phandle which didn't have arguments
> + * before and thus doesn't have a '#*-cells' property but is now migrated to
> + * having arguments while retaining backwards compatibility.
> + */
> +int of_parse_phandle_with_optional_args(const struct device_node *np,
> +					const char *list_name,
> +					const char *cells_name, int index,
> +					struct of_phandle_args *out_args)
> +{
> +	if (index < 0)
> +		return -EINVAL;

I'm not sure why we didn't do this from the start, but just make index 
unsigned and then this check is not needed.

> +
> +	return __of_parse_phandle_with_args(np, list_name, cells_name,
> +					    0, index, out_args);
> +}
> +EXPORT_SYMBOL(of_parse_phandle_with_optional_args);


With the above, just make this static inline. Bonus points if you want 
to do the same changes on the other variants.

Rob

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
