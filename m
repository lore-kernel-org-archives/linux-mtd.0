Return-Path: <SRS0=1hFJ=W5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2820CC3A59E
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Sep 2019 13:43:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF3E1216C8
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Sep 2019 13:43:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="owwUiemZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EF3E1216C8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Subject:To:From:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=whaBnxBXfCHWnhOarsOc6bf3t8ixE2ETytw5TQNORak=; b=owwUiemZFPeu1i
	3AO6fuYUtqVCanGQy2LYyurkEFRZ9kQndUeaE6IU+vFcH6bBbyxuyNPqvOo76FIyd8zfs9RlqC4KY
	cgMzckxdlmL1JUo8NxeacLumFh2InM/Untz/2uD8LmM+RnRdz85KvQixTqOMRiGChC5GeHjzZSiO3
	1gjknTbXB5oJTI2DRbKRu6ILaOKFXisoo/BCmhZKpwoaGEnSsAfc17Kvc0C4ov+WmG4ujga9hCzUH
	mz93KrwevnHssZc2u6zxBmKu27FkmNHXWg7MKcOJu9EcAAyl6a9Il5I4Mcaxkn5EsM3wsjvb1NIiX
	X9xFrHWYea67KyYHctag==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i4mc4-0007J3-Oh; Mon, 02 Sep 2019 13:43:20 +0000
Received: from mail-wm1-f65.google.com ([209.85.128.65])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i4mYB-0001j2-HG
 for linux-mtd@lists.infradead.org; Mon, 02 Sep 2019 13:39:20 +0000
Received: by mail-wm1-f65.google.com with SMTP id q19so5833891wmc.3
 for <linux-mtd@lists.infradead.org>; Mon, 02 Sep 2019 06:39:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:date:from:to:cc:subject:references
 :mime-version:content-disposition:in-reply-to;
 bh=PkDpB4sth3sTgCnaLAVjJ1mLztUz5Y7mplxR5CYkQGc=;
 b=ei22fVNtKeZ97GvMgtAs9TXorc6b7+oF677WAus66O9f76K5Yqk2v0/+RaCQ0Hsy/O
 i6bny240zhZJJty5DCD+ExHrPm9cpYBr5mwJN20EWI/oRoEQHG25NBAXiehet5v7xj6j
 LrYEhfnV0vePXMPNSSadQ9y2Iro/vRjhUaHGqrBgrbVC1FkU4iCp+92lpIM+vlLl2nkc
 S28svmzewhlnacXK9SJFZHQz4L8HKzqV0S8e+7O7TFgHQ2mNePCdFocpFBNPBg7VeEZV
 jQG2ThfwqSEV/gIgkg5MGW5DWIOhzrJ350ZtYCsOYlrno+M0JSDf/SwPQjD4PDYsbEvJ
 cV3g==
X-Gm-Message-State: APjAAAV6v9y+fdOrAaHC09gJMq0Lw2tRuVMIqug7Y6zUwfc7ame8rr9k
 nl49yq3hfXteBLYAXPSwwg==
X-Google-Smtp-Source: APXvYqwYm2s6Gmmrf6ryiQK0P0Y0VG6vrlmGJlljuLZ0cRK11tDXzUM3GY5iH8aQZK9NTww/KJUsIg==
X-Received: by 2002:a7b:ca5a:: with SMTP id m26mr5204994wml.177.1567431558279; 
 Mon, 02 Sep 2019 06:39:18 -0700 (PDT)
Received: from localhost ([212.187.182.166])
 by smtp.gmail.com with ESMTPSA id l9sm11671308wmi.29.2019.09.02.06.39.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2019 06:39:17 -0700 (PDT)
Message-ID: <5d6d1b85.1c69fb81.96938.0315@mx.google.com>
Date: Mon, 02 Sep 2019 14:39:17 +0100
From: Rob Herring <robh@kernel.org>
To: "Ramuthevar,
 Vadivel MuruganX" <vadivel.muruganx.ramuthevar@linux.intel.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: mtd: cadence-qspi:add support for
 Intel lgm-qspi
References: <20190827035827.21024-1-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20190827035827.21024-2-vadivel.muruganx.ramuthevar@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190827035827.21024-2-vadivel.muruganx.ramuthevar@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190902_063919_628399_B5EEFFBD 
X-CRM114-Status: UNSURE (   7.82  )
X-CRM114-Notice: Please train this message.
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
Cc: cheol.yong.kim@intel.com, devicetree@vger.kernel.org,
 tudor.ambarus@gmail.com, vigneshr@ti.com, boris.brezillon@free-electrons.com,
 richard@nod.at, qi-ming.wu@intel.com, linux-kernel@vger.kernel.org,
 david.oberhollenzer@sigma-star.at,
 Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com, jwboyer@gmail.com,
 computersforpeace@gmail.com, dwmw2@infradead.org, cyrille.pitchen@atmel.com,
 andriy.shevchenko@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, 27 Aug 2019 11:58:25 +0800, "Ramuthevar,Vadivel MuruganX"          wrote:
> From: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
> 
> Add new vendor specific compatible string to check Intel's Lightning
> Mountain(LGM) QSPI features enablement in cadence-quadspi driver.
> 
> Signed-off-by: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
> ---
>  Documentation/devicetree/bindings/mtd/cadence-quadspi.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
