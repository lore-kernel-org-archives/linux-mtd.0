Return-Path: <SRS0=p38J=E6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A84FC63777
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Nov 2020 17:39:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9EB6B206F7
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Nov 2020 17:39:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="b3PxDQ/P";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M4BrkAke"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9EB6B206F7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hTrKSerR2/DqHKNzVJLhi9C5kXOZAgrJeepoHfFwEDg=; b=b3PxDQ/P5nkx5seS9GjeodRdc
	PRyVs8O4Uv3MmMt4HVDxzSp+ANqHVS8INLzAVRBek7aYSCjdw99soFDe6AxA4zPk8O/VSCO2rOJ+2
	xuHvI1gwuRR9o8rwYQRP9V7l114S+yxvbb5877x9qcsfpiSDZOKpe4mJ97ylhEV0gYYP9w+fXradZ
	IAlVRTHZpdgELUZgIeqJA0ekYOticwt0pXMCL/ioNxMs1la5wb77LXn3K582AzRk67fBE/v5SM1y6
	Gco5I0eFO0UV3LRXpxPtPbQz00AMAoZtg8x4QdkbD6Lpt+Wi9micSPzvrnqRxl0dqHCBxpwYKDCJv
	GAjDhSKcQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khcHe-0003fD-Mj; Tue, 24 Nov 2020 17:39:18 +0000
Received: from mail-qk1-x742.google.com ([2607:f8b0:4864:20::742])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khcHc-0003dg-Ji
 for linux-mtd@lists.infradead.org; Tue, 24 Nov 2020 17:39:17 +0000
Received: by mail-qk1-x742.google.com with SMTP id u4so21472290qkk.10
 for <linux-mtd@lists.infradead.org>; Tue, 24 Nov 2020 09:39:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=1gf+uZOc59XzmKEaDiZtFHdLCUgfXw7pOt3g9dTtDNI=;
 b=M4BrkAkexyVnkGUjwXdFjVYmVA9LVLj6ookNf5Ar0M5rW60FOFaco8NOC5V53XdKf3
 QJEfLqRZiaD+6aOYpsb7R05SzbB3BGYlmBRdin+nnS7Rl2/BZJIjCGem3ORrY6o5M9QB
 v9ss2oYhE9tLgFZfLE3LUECIa1myAFcsarnIGBk9Ar+eH0Bp+cdl7ZRZkZZx50CbTsHE
 K2VguikHFXg5qBSb0ELsCBeZfhaX/wrxj8/wztYcWOB/MjJmdrILJmWyfS//vV8R3Onf
 0IRpZT97EaMt3VXXj+9C8TX6D4SZ8wZliFCO/qY/oBmhfCgjCD7BmPqTXEJzXRSaVyYm
 sdFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=1gf+uZOc59XzmKEaDiZtFHdLCUgfXw7pOt3g9dTtDNI=;
 b=UX4+ytphf5Am9nnKOqBTLRK2vTKgqDn4mzhh/Z0OQlPnMNTWKeWWpOhCAVrWuXZPud
 lYf4wKc79EqZ+0i0AGFarH1Imh6WBD87axg9KC3Uo3dr3LTC9F67EH7UWxLivrxdWtAY
 9Jag6L04STsYBTQwZiGBh9JZPzLQbnsLL5PSOIHFQmbBN8VYirJOSty0fLDyDVKsyVRt
 TP7Tm2w/SAh60qVbOcLHAJPtNzT9UXqgizMCK9CRph/dBmy8k9RnSuPDh8qGKrNr0iBV
 tpUWOjxRDGhxPvjI/ibZbXn3PY2hb9qHmhFJP1t3QmTTm/iPCgvOKViD+e7l11dO9qis
 TdZw==
X-Gm-Message-State: AOAM5331f7/CypsUHWl000DgX/Vk+L8GdOAdhvGh7UMMmja03CVBiuHW
 2m8mwmxO/mQDomhGAKpSTd4=
X-Google-Smtp-Source: ABdhPJw/9uU36tM4rV+p5Q1FKg2O4RrQNewNe3FrRSf3D7AKvxn62XJtfvC4G0F74E53WmoixHdIOg==
X-Received: by 2002:a05:620a:569:: with SMTP id
 p9mr5395902qkp.119.1606239554812; 
 Tue, 24 Nov 2020 09:39:14 -0800 (PST)
Received: from localhost (dhcp-6c-ae-f6-dc-d8-61.cpe.echoes.net. [72.28.8.195])
 by smtp.gmail.com with ESMTPSA id o125sm13142963qke.56.2020.11.24.09.39.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Nov 2020 09:39:14 -0800 (PST)
Date: Tue, 24 Nov 2020 12:38:50 -0500
From: Tejun Heo <tj@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 18/45] init: refactor devt_from_partuuid
Message-ID: <X71FKqT9KtO4zTvw@mtj.duckdns.org>
References: <20201124132751.3747337-1-hch@lst.de>
 <20201124132751.3747337-19-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201124132751.3747337-19-hch@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201124_123916_726753_A9554770 
X-CRM114-Status: GOOD (  12.23  )
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
Cc: Jens Axboe <axboe@kernel.dk>, Jan Kara <jack@suse.cz>,
 Mike Snitzer <snitzer@redhat.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jan Kara <jack@suse.com>,
 Josef Bacik <josef@toxicpanda.com>, Coly Li <colyli@suse.de>,
 linux-block@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 dm-devel@redhat.com, linux-mtd@lists.infradead.org,
 Johannes Thumshirn <johannes.thumshirn@wdc.com>, linux-fsdevel@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-bcache@vger.kernel.org,
 linux-mm@kvack.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, Nov 24, 2020 at 02:27:24PM +0100, Christoph Hellwig wrote:
> The code in devt_from_partuuid is very convoluted.  Refactor a bit by
> sanitizing the goto and variable name usage.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Reviewed-by: Jan Kara <jack@suse.cz>

Acked-by: Tejun Heo <tj@kernel.org>

-- 
tejun

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
