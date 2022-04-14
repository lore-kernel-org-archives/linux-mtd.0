Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BD2CC433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Apr 2022 16:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9PT9sS+xhGMsKjfNo8+DRtasmA6DZIT92DKHXASdUWo=; b=BSg5t9PEMg2KL/
	QOchUL7djCcbs0csBIH3zvkpKZrNcF6qJIPmg5F2ZcCBqdt3hZ5HYWGAjCb6dmP2nxpOn2wsD0isc
	KbOLysl4Hm4UUokw01kfArtZSyv37BS2vZMEkxL/FaQZomg47efrdycYedLyOU3eq6txw80gxcdZu
	K8Kvs70qI1Pk/Fe87S66HJ6/SkQfgQNFy26HlEODlqMjxGLfPR7Ibs2j/uIPXqmXH0zKgvgXacFvg
	sR4nENu0UiVFal7OXKQraOWL63lz8R3SDz8eTSV+emvAdnNKpvuOIWFUUNWl4afK/NUnXjKM5CyHK
	KC9hed31YQvlRl3Ghp5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nf1v5-006Kzw-54; Thu, 14 Apr 2022 16:02:07 +0000
Received: from mail-oa1-f53.google.com ([209.85.160.53])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nf1v3-006Kyl-8K
 for linux-mtd@lists.infradead.org; Thu, 14 Apr 2022 16:02:06 +0000
Received: by mail-oa1-f53.google.com with SMTP id
 586e51a60fabf-d6ca46da48so5663235fac.12
 for <linux-mtd@lists.infradead.org>; Thu, 14 Apr 2022 09:02:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=7KsLQRipqF2R1uTMIte3i9/IDcR/0h8XgddwnNJ3ITE=;
 b=1gR+aIk/gj67Oq7EPEyozAZ9Qy+5/IcsRnzCZFPgxRbranaxSu+zY+AZSaSiGr1171
 u3svXT1dQ33BLl/A8yNj0JGxTZNeON0sAxYZBC0L6E91YfpHc0kD1FO+J1RgNdOLyirO
 TbeyyJ/Ti4L+sZ55sIwLySE9KVSDTSnyph6Vvlf9WCB7x8eSCdHopSPBfcP9Z/kW1+H0
 E89zXw6n5zeA7xksoptAEJTyypAOoTyir+DHEbXyuEGjaauJgeLs7VE+MeXQtLgu5ns5
 eB7ZRzxgaCuT3t12WkEQaYQyY40nqaj0vAKCTlXH9J8d7O2tpFgiTqgubqUDg5sBAC8A
 XsGw==
X-Gm-Message-State: AOAM530L1IPeur0Cta8gOEqpe4CmFFM4uL6LV2AWbYbF+yVGnGXH0DEf
 8KFmkv1dOVggOlRbZoNC2w==
X-Google-Smtp-Source: ABdhPJzuFrRAnqEOjn2Y036KhsZvM/oPgRNGTA4p69Jxmvf28J/M6tED0pEVCoQb189X/X79bsYoqQ==
X-Received: by 2002:a05:6871:1d0:b0:da:b3f:2b28 with SMTP id
 q16-20020a05687101d000b000da0b3f2b28mr1845203oad.199.1649952121431; 
 Thu, 14 Apr 2022 09:02:01 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 j16-20020a544810000000b002fa6ba4317esm138611oij.44.2022.04.14.09.02.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Apr 2022 09:02:00 -0700 (PDT)
Received: (nullmailer pid 2136331 invoked by uid 1000);
 Thu, 14 Apr 2022 16:02:00 -0000
Date: Thu, 14 Apr 2022 11:02:00 -0500
From: Rob Herring <robh@kernel.org>
To: Vincent Whitchurch <vincent.whitchurch@axis.com>
Cc: vigneshr@ti.com, richard@nod.at, miquel.raynal@bootlin.com,
 joern@lazybastard.org, kernel@axis.com, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, krzk+dt@kernel.org, frowand.list@gmail.com,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/4] mtd: phram: Allow probing via reserved-memory
Message-ID: <YlhFeEvOPHHsMC34@robh.at.kernel.org>
References: <20220412135302.1682890-1-vincent.whitchurch@axis.com>
 <20220412135302.1682890-4-vincent.whitchurch@axis.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220412135302.1682890-4-vincent.whitchurch@axis.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220414_090205_326372_1D67B4E3 
X-CRM114-Status: GOOD (  10.99  )
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

On Tue, Apr 12, 2022 at 03:53:01PM +0200, Vincent Whitchurch wrote:
> Allow phram to be probed from the devicetree.  It expects to be in a
> reserved-memory node as documented by the bindings.  This allows things
> like partitioning to be specified via the devicetree.
> 
> Signed-off-by: Vincent Whitchurch <vincent.whitchurch@axis.com>
> ---
> 
> Notes:
>     v3:
>     - Add missing semicolon after MODULE_DEVICE_TABLE causing build errors on some
>       configs.
> 
>  drivers/mtd/devices/phram.c | 67 ++++++++++++++++++++++++++++++++++---
>  drivers/of/platform.c       |  1 +

For DT,

Acked-by: Rob Herring <robh@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
