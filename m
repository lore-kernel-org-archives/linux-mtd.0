Return-Path: <SRS0=LUPw=I4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 362B6C433DB
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Mar 2021 18:13:55 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ACDFA614A7
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Mar 2021 18:13:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ACDFA614A7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:Cc:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nZk5P5qGYAV5pF9pCoTH5aFguGEv/6ZNJ1YjIVLb1Mk=; b=dJd6gV37RV6pw9KtGxuEsOos8
	P1zw/EQg84TvkH1xuVYNI5i26pQeysNO8iT3V0p6v1a5yUVgZt+2D5Og/fI5y1VI/dwR7WfHtxuED
	ePnwcvgoAEfEilnkC/NdENmhAfuDw8u1BWhQ1gh2ORiiIsQWHqLdd5BwMNPC9/S0YcJ6Sh9LJiSkp
	7pHgiiNumzJ0EMMto47esLoHjt+oLCL9iVeC5uue8T0+BCZUad4tQ3mJiI+88k/4nqGQ7UcvT0SgR
	FcE/jThuqPOg9O6yVh8OxGAKuyb1mqoHDHuJhbYc3xOa+BhndcoYAAemfzYjg2O1WKJgLGFDrtJh1
	3ibsW41hA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRIrK-004YQ4-QM; Tue, 30 Mar 2021 18:12:58 +0000
Received: from smtprelay0164.hostedemail.com ([216.40.44.164]
 helo=smtprelay.hostedemail.com)
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRIrD-004YOF-2U
 for linux-mtd@lists.infradead.org; Tue, 30 Mar 2021 18:12:53 +0000
Received: from omf20.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
 by smtprelay04.hostedemail.com (Postfix) with ESMTP id 3AC15180355C1;
 Tue, 30 Mar 2021 18:12:46 +0000 (UTC)
Received: from [192.168.1.159] (unknown [47.151.137.21])
 (Authenticated sender: joe@perches.com)
 by omf20.hostedemail.com (Postfix) with ESMTPA id AF43D18A614;
 Tue, 30 Mar 2021 18:12:44 +0000 (UTC)
Message-ID: <703d46e209b0e7163e46b807aba761c93b4a90c9.camel@perches.com>
Subject: Re: [PATCH] mtd: intel-spi: add is_protected and is_bios_locked knobs
From: Joe Perches <joe@perches.com>
To: Tomas Winkler <tomas.winkler@intel.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Tamar Mashiah <tamar.mashiah@intel.com>, Mika Westerberg
 <mika.westerberg@linux.intel.com>
Date: Tue, 30 Mar 2021 11:12:43 -0700
In-Reply-To: <20210330155414.58343-1-tomas.winkler@intel.com>
References: <20210330155414.58343-1-tomas.winkler@intel.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
X-Stat-Signature: gpcomsfuenzpb86i8o6mfuisqwfphgw8
X-Rspamd-Server: rspamout05
X-Rspamd-Queue-Id: AF43D18A614
X-HE-Tag: 1617127964-882415
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210330_191251_445927_26437B67 
X-CRM114-Status: UNSURE (   9.20  )
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

On Tue, 2021-03-30 at 18:54 +0300, Tomas Winkler wrote:
> From: Tamar Mashiah <tamar.mashiah@intel.com>
[]
> the region protection status is exposed via sysfs file
> as the manufacturing will need the both files in order to validate
> that the device is properly sealed.
[]
> diff --git a/drivers/mtd/spi-nor/controllers/intel-spi.c b/drivers/mtd/spi-nor/controllers/intel-spi.c
[]
> +static ssize_t intel_spi_is_protected_show(struct device *dev,
> +					   struct device_attribute *attr, char *buf)
> +{
> +	struct intel_spi *ispi = dev_get_drvdata(dev);
> +
> +	return sysfs_emit(buf, "%d", ispi->is_protected);

These should also include a newline in the format.  i.e.:

	return sysfs_emit(buf, "%d\n", ispi->is_protected);


> +static ssize_t intel_spi_bios_lock_show(struct device *dev,
> +					struct device_attribute *attr, char *buf)
> +{
> +	struct intel_spi *ispi = dev_get_drvdata(dev);
> +
> +	return sysfs_emit(buf, "%d", ispi->is_bios_locked);

etc...



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
