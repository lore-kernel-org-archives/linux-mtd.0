Return-Path: <SRS0=4Ctu=KQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C337C433ED
	for <linux-mtd@archiver.kernel.org>; Fri, 21 May 2021 01:52:57 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6B62A6135C
	for <linux-mtd@archiver.kernel.org>; Fri, 21 May 2021 01:52:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6B62A6135C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1mBEw5mTE1nuhz1YpZ/GC5OAP5ys0B2YV4VNqMtHCuY=; b=IkI4ULHQ9Tp4AYQkaHN/F9/Er8
	n82v+tKwT2mLjwIbp6AWDzfCXbBwfwxd+/EzUVzuEKmlOuX0tkH0+T7peHOiLYcYKwFa8j1Kou2E0
	n2cxpfcjfHASwcvt58c7XFWjjHqpLb/I+QUrvThs4kzhp0WNTtdwupgVUDL7WAnuwlaCVRHJ5LIh2
	TUd8UP0s513mcNwnkiesiPujgII+6JQF3JH0VWw0w4N26ImChM2vH/bYneYE8xH8L09JekUcOlM5h
	732yDPY3u4RFpjaIj6tfUbdsnQJIv3REfFSOKhJGUe77cFB7zU5D9rC5hFgAQHQ8LYJWIAFevmkkU
	IvblMrgQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ljuKb-003Moh-7T; Fri, 21 May 2021 01:52:05 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ljuKX-003Mmt-S2
 for linux-mtd@desiato.infradead.org; Fri, 21 May 2021 01:52:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=ebKIpo/U5Im5t5DrUZKKUiU83lrK2yYkjJaZaQ7BQj8=; b=hW926aDJpXaMRXDtGPHWaI6K9E
 YgMHb15AzkdQYU3ap3BlIv/nvC6fZZeYnoiARTzQ5KuiNjVlVETrTre1xyE5t8nkH55iJm22j/0pl
 ei1RPQqaBQxnxJgcM76KEKDHvCmegzWV2xeMuu7RW0/3U/UsXzP9NyAPhi44PlnqgwRatxxpEyuzl
 LWE46gwqU3WzlOsjtLpgJ3nWIz3t4AGR4uncSHwMhmFvy3Ndd/QHPHMjRX/l+kPA+tWAAAvWM/1Yt
 slvbbEiCwYbU3eGPC8bfmqNGITnAQ0hcy0GxM1c/Bfpo+BiOhBXgtUHuTQaLV4SUFs2fjVSOs/9Oh
 SOQ9l6Yg==;
Received: from mail-oi1-f175.google.com ([209.85.167.175])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljuKV-00Gkzs-DA
 for linux-mtd@lists.infradead.org; Fri, 21 May 2021 01:52:00 +0000
Received: by mail-oi1-f175.google.com with SMTP id t24so2765318oiw.3
 for <linux-mtd@lists.infradead.org>; Thu, 20 May 2021 18:51:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ebKIpo/U5Im5t5DrUZKKUiU83lrK2yYkjJaZaQ7BQj8=;
 b=RNMCFsXjtuFI6kQhKzhqCgYIGB5HW5MAzulcsJtbl+vwfUdlzv0Fm+yDVLZL5jpfpy
 vrKteF5UdTia1apUyeC09BLs99Y+/yxhMIc/+OlN5O5h/lcplIvu6bCdDOLXiKOn4Ail
 VSnHzZ/+NT538Q42t6qtyxH8OvUGLZBhzwGhuI+Jm3Y8QmBt+ypXId5aajkJwIuxfOry
 ODYEBJ6JYNOufemUBdaz4UUznN32EeRVNwkwv/1+oilIuvYHiI3CYu0LTVXmAX50g2hi
 s2IY9DvJ9Ce103Sm7PMFrl43GfgD43ea7wQg0u8/I+YrBHiDzOD8enl9xn7tFsazZZig
 aBAw==
X-Gm-Message-State: AOAM533KIdpLFvCxKvPQ/Wyn75F0pmj52a8pMxSRIMP3+Lwtywij+XE9
 vWnruCIoTkFGnLPjRIEtOQ==
X-Google-Smtp-Source: ABdhPJytGTz21FqcBPIO+itCvblm5s0Ngtzf2eso9fjniOmIpY/TNIAWq6FKMB9qAbqhyET5/v9OmA==
X-Received: by 2002:aca:d409:: with SMTP id l9mr301812oig.77.1621561917660;
 Thu, 20 May 2021 18:51:57 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id n17sm917860oij.57.2021.05.20.18.51.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 18:51:57 -0700 (PDT)
Received: (nullmailer pid 2483654 invoked by uid 1000);
 Fri, 21 May 2021 01:51:55 -0000
Date: Thu, 20 May 2021 20:51:55 -0500
From: Rob Herring <robh@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Michal Simek <monstr@monstr.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>,
 Naga Sureshkumar Relli <nagasure@xilinx.com>,
 Helmut Grohne <helmut.grohne@intenta.de>, Srinivas Goud <sgoud@xilinx.com>,
 Siva Durga Prasad Paladugu <sivadur@xilinx.com>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Amit Kumar Mahapatra <akumarma@xilinx.com>
Subject: Re: [PATCH v20 01/19] dt-binding: memory: pl353-smc: Rephrase the
 binding
Message-ID: <20210521015155.GA2483595@robh.at.kernel.org>
References: <20210519182636.1110080-1-miquel.raynal@bootlin.com>
 <20210519182636.1110080-2-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210519182636.1110080-2-miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210520_185159_462472_AAF83EDC 
X-CRM114-Status: UNSURE (   9.44  )
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

On Wed, 19 May 2021 20:26:18 +0200, Miquel Raynal wrote:
> Reword this document before converting it to yaml.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  .../bindings/memory-controllers/pl353-smc.txt         | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
