Return-Path: <SRS0=Yojm=UM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E33D6C31E45
	for <linux-mtd@archiver.kernel.org>; Thu, 13 Jun 2019 22:51:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B6C552080A
	for <linux-mtd@archiver.kernel.org>; Thu, 13 Jun 2019 22:51:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VHLZy8dd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B6C552080A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rlBsNKOyCmUywf5/5y/J2RqBUXT14YdxUyp3P2Qrwv8=; b=VHLZy8ddVaDOrh
	jFAJMGYY/HY1SmNPe9oO1JPE3OQGZgR8eGgHoebefnZ1Mxwxh5k71gw2Tv3q7orPR4YAFLt04KpNf
	JSLXknd2umQvsm/g1CJujwfFuzIr/HYlpXXqpVO7qDWhZajoAXI2M6HJ1OjYf3B0cSonnPmukEZHK
	rcSxoY6SZHHQ3o+zhSDbSNk/ihVUZwq1pvuNrmfnHHKnVKMpdFTKm2O8mZozwThjKZ9mcG/2Ugntb
	hwn+YcXpQpu16nXuEWRMUI8TMmxecWZ11qCHAf1IRfysEFayoTnsiK5xvw9IWA24KQ6SYiNQa+S0b
	5wEuODVtHNI1Dv2okqMg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hbYZS-0002dI-He; Thu, 13 Jun 2019 22:51:50 +0000
Received: from mail-qt1-f196.google.com ([209.85.160.196])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hbYZQ-0002cy-Cc
 for linux-mtd@lists.infradead.org; Thu, 13 Jun 2019 22:51:49 +0000
Received: by mail-qt1-f196.google.com with SMTP id 33so344277qtr.8
 for <linux-mtd@lists.infradead.org>; Thu, 13 Jun 2019 15:51:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=H1jLdvJZozzrqHX1esdeObu7Bz6wiJlvCPsfxGMitgE=;
 b=PfuVWWfjfvlIbF62vtYUvqnkn3pHatohJ+yLKY6/M+vdDu4i3E2yqNySmfYZKVFRZU
 pWA22kgkJHlFzojC2XTxmuJnFyTDn60FRzr+Gig+dLusKzsMqk7q55EtqIRJzFgMWA/4
 RD5A+yfkqHWvYCAMEX5/eqABlBXM5CqI2XTx5Vk2eaxOWK+R6MmnfP7uQk0X8Mf1pj3S
 L9Qr0w1sT/p8E7hHdh94j+8TSI3MIaTxSSlqFIqnvl16MpCyQlwlTbpwR9HaUnOvdKm3
 6CiDZdPtzAmunRdCT4esSyetGW35ocZzBfejvPFkjD7vbPRVHFQDaydW4VKLKb5LBe22
 7P2w==
X-Gm-Message-State: APjAAAWTtd3cyipBoz6ERyQfbtIy6W57opz+ujF804hEgV6z4CdXbWgR
 KjJrMxCeg4ZmxhzxokVIIA==
X-Google-Smtp-Source: APXvYqzem4zi3kuCmkw6IRou/aoStUJUuSg911SowZ5Ya3+lMo/6NDr6HMK6vxTNwt20ngySVoIIkw==
X-Received: by 2002:ac8:3345:: with SMTP id u5mr79299891qta.219.1560466307557; 
 Thu, 13 Jun 2019 15:51:47 -0700 (PDT)
Received: from localhost ([64.188.179.243])
 by smtp.gmail.com with ESMTPSA id g53sm548681qtk.65.2019.06.13.15.51.46
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 13 Jun 2019 15:51:47 -0700 (PDT)
Date: Thu, 13 Jun 2019 16:51:46 -0600
From: Rob Herring <robh@kernel.org>
To: Kamal Dasu <kdasu.kdev@gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: mtd: brcmnand: Make nand-ecc-strength
 and nand-ecc-step-size optional
Message-ID: <20190613225146.GA17725@bogus>
References: <1558117914-35807-1-git-send-email-kdasu.kdev@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1558117914-35807-1-git-send-email-kdasu.kdev@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190613_155148_423511_116FDCD7 
X-CRM114-Status: GOOD (  11.82  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Vignesh Raghavendra <vigneshr@ti.com>, Kamal Dasu <kdasu.kdev@gmail.com>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 Marek Vasut <marek.vasut@gmail.com>, bcm-kernel-feedback-list@broadcom.com,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, 17 May 2019 14:29:54 -0400, Kamal Dasu wrote:
> nand-ecc-strength and nand-ecc-step-size can be made optional as
> brcmanand driver can support using the nand_base driver detected
> values.
> 
> Signed-off-by: Kamal Dasu <kdasu.kdev@gmail.com>
> ---
>  Documentation/devicetree/bindings/mtd/brcm,brcmnand.txt | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
