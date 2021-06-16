Return-Path: <SRS0=4SWJ=LK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E576C48BE5
	for <linux-mtd@archiver.kernel.org>; Wed, 16 Jun 2021 03:51:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D8C7C61055
	for <linux-mtd@archiver.kernel.org>; Wed, 16 Jun 2021 03:51:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D8C7C61055
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Yh8qS0JnfYyquV1fL355wAh12YoCC7rfIxS/GC8PZSk=; b=lKfLcf7wuZ2573
	aIC3+yK6JSC5IirwuEAmdat+DMZED0WomEnPW+BIGjHw1kFeMRRSROjQF9l3Il/y1uJ27dzjuW7OT
	vjz2oCia5pg+9NrddNbzUJFEkTx3+6DIAvyROKd+HaTgcjddYE9iZYkgs2MbK7Ry7D5DU9rnF3s8j
	GdQGaixg85k1RhmmzRo6xzSGh+jG1S1zv+ZKz09JTabt8lsr+VGAc/3S/2tOq75W6LwnbhcBlKLti
	Vls/KwJTfH2Dhi3lcjUmy1g0ylJzh58PV4YNLZpQxbE/QH2GxfdfKrQCl6MbIJz6ihunY5QXhzj01
	YcJgV9FJg2XtsO6PyPig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltMaE-004dpx-6s; Wed, 16 Jun 2021 03:51:18 +0000
Received: from verein.lst.de ([213.95.11.211])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltMaA-004dnj-OD
 for linux-mtd@lists.infradead.org; Wed, 16 Jun 2021 03:51:16 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 2CDD268AFE; Wed, 16 Jun 2021 05:51:10 +0200 (CEST)
Date: Wed, 16 Jun 2021 05:51:10 +0200
From: Christoph Hellwig <hch@lst.de>
To: Kees Cook <keescook@chromium.org>
Cc: linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
 Al Viro <viro@zeniv.linux.org.uk>, gmpy.liaowx@gmail.com,
 Anton Vorontsov <anton@enomsg.org>,
 Colin Cross <ccross@android.com>, Tony Luck <tony.luck@intel.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-doc@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-block@vger.kernel.org,
 linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] pstore/blk: Improve failure reporting
Message-ID: <20210616035109.GA25873@lst.de>
References: <20210615212121.1200820-1-keescook@chromium.org>
 <20210615212121.1200820-2-keescook@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210615212121.1200820-2-keescook@chromium.org>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210615_205115_010226_01A42617 
X-CRM114-Status: GOOD (  12.03  )
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

On Tue, Jun 15, 2021 at 02:21:18PM -0700, Kees Cook wrote:
> -	if (!dev || !dev->total_size || !dev->read || !dev->write)
> +	if (!dev || !dev->total_size || !dev->read || !dev->write) {
> +		if (!dev)
> +			pr_err("NULL device info\n");
> +		else {
> +			if (!dev->total_size)
> +				pr_err("zero sized device\n");
> +			if (!dev->read)
> +				pr_err("no read handler for device\n");
> +			if (!dev->write)
> +				pr_err("no write handler for device\n");
> +		}
>  		return -EINVAL;
> +	}

I still find this style of checks pretty strange..

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
