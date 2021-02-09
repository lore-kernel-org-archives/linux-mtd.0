Return-Path: <SRS0=FWsg=HL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74590C433E0
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Feb 2021 21:23:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1C6EE64E8B
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Feb 2021 21:23:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1C6EE64E8B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4Am/QZIg9ZmHZATbYEwb2X4GbCJYb7QpCNFPXafZc3Y=; b=eh5eHEFrvyJH6HXyJmLEjJixS
	915K5nSEgPtql3A04wUFMaP2udNW1bEiyro3jAZcOORTW+2SCFCLO9romvVB7xvkFch+HFczCI9q8
	Zl4ambo+qsxwFSzgbrAzBreLKhSPwQsA4fbNbztyMHMIjWzgedAgt7feORICKoIgVoHgMNIsnnJOP
	lj8QCKoNHZvWL0+qsHCFUriYAxOEETTLoZdnj2t9u5NRD0KWzHQMpeNR+2mIoMWmsOQYALEAdqCPl
	47nOy+9Wvyk9+uCklvjUpQc3qd/c5fEoDmVjMwlbRO2hn3CmX+WUksXD6ECuKK8enhPbQYcLmb9Va
	sD1uJl6yQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9aTi-0002bB-HS; Tue, 09 Feb 2021 21:23:22 +0000
Received: from mail-ot1-f43.google.com ([209.85.210.43])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9aTg-0002al-BW
 for linux-mtd@lists.infradead.org; Tue, 09 Feb 2021 21:23:21 +0000
Received: by mail-ot1-f43.google.com with SMTP id s107so18831620otb.8
 for <linux-mtd@lists.infradead.org>; Tue, 09 Feb 2021 13:23:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=4U2uo28DRfOOEdpoc6H5T9KDb4rD1DuSo0Z2cCk8Ngo=;
 b=mBC7+OEjOt+6EbZeRRWgSNqhazWVhlrBVwHjS76nhyiDBnHU3V4IYW4L6SyEzPG/mX
 OPy4ypfBYtzYWdOpOus37+lUWzxYBlWEk1fXLDPn+LupxAoLbaQekk2wE//9kCcXWjE6
 M94jE7eNkEcIAdM3SZl69NoHfyFWKO35rjl0NSbxdOr3vkKVCUPypNLDMYr9tMSfvbKQ
 BMsM16HlpB9GpuZLM5hmwEcuRRib6iVEUq4GwFQzD/UszHOE6XUL/0nJRY31RhOs3WQM
 MueiWiRZ8LPx2Sm9TXiRwu6VV7LiLqdJNw3isX7IUfrh6MdxJ7SeF+zbXRcUdRq0wsW2
 XRhQ==
X-Gm-Message-State: AOAM530fv9P5OJO97pETpy7ZlvM3QLN8aMcmo1CXiMIUu4WKK0sZ1mpo
 NDDcVV9GtyL5+dOlrWR0Fg==
X-Google-Smtp-Source: ABdhPJwK6Bl9ku5ULbeXp9zDuv2tIt2fil758aM4hsnB7Lgz/dOTAg9MRqdE7CT1mVJDPeE9XQlSAQ==
X-Received: by 2002:a05:6830:113:: with SMTP id
 i19mr801004otp.219.1612905799863; 
 Tue, 09 Feb 2021 13:23:19 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id m10sm4610725oim.42.2021.02.09.13.23.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Feb 2021 13:23:18 -0800 (PST)
Received: (nullmailer pid 214374 invoked by uid 1000);
 Tue, 09 Feb 2021 21:23:17 -0000
Date: Tue, 9 Feb 2021 15:23:17 -0600
From: Rob Herring <robh@kernel.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: mtd: spi-nor: Convert to DT schema format
Message-ID: <20210209212317.GA214117@robh.at.kernel.org>
References: <20210202175340.3902494-1-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210202175340.3902494-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210209_162320_540740_04DABA61 
X-CRM114-Status: GOOD (  15.27  )
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
Cc: devicetree@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, 02 Feb 2021 11:53:39 -0600, Rob Herring wrote:
> Convert the SPI-NOR binding to DT schema format. Like other memory chips,
> the compatible strings are a mess with vendor prefixes not being used
> consistently and some compatibles not documented. The resulting schema
> passes on 'compatible' checks for most in tree users with the exception
> of some oddballs.
> 
> I dropped the 'm25p.*-nonjedec' compatible strings as these don't appear
> to be used anywhere.
> 
> Cc: Miquel Raynal <miquel.raynal@bootlin.com>
> Cc: Richard Weinberger <richard@nod.at>
> Cc: Vignesh Raghavendra <vigneshr@ti.com>
> Cc: linux-mtd@lists.infradead.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  .../devicetree/bindings/mtd/jedec,spi-nor.txt |  91 ----------------
>  .../bindings/mtd/jedec,spi-nor.yaml           | 102 ++++++++++++++++++
>  2 files changed, 102 insertions(+), 91 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt
>  create mode 100644 Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
> 

Applied, thanks!

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
