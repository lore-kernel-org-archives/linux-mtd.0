Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC1D3C433FE
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Jan 2022 15:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NnEJyXiFk5Lt246fEzbQlr8noMt+L7CNxPVqJm3YUo8=; b=nzPCYNvNrhMriI
	ld0+VewN0j0z9xmJHVFHdEVTNdqnhAH2e6xWPCUrmUYKPkBIbRUmksHetbZbzfbzWLKXoLNd4anDs
	j13MXRrtpDAuWo8hVpkBr3JS3f+d0bA1xDLmjWyQo+O4JsZgW8/RveuEEp9JiwQ4gxBaJaMjAQwVQ
	J/LXBeVV/j6Ap4EuZrVIHVx4G/RnpJ73FnHsxcHJwV5EcazRULcbU5fDO88HUp6sx2XfZQaSsCMfj
	VLjlydwkavkIuLvyGzkVP3G+AbFlwUBHFLrntvXLDK2lfWyzWjV1Wq+sdWCZjX9D9bbzqf1Om2N/1
	mT0ZM7sn8e3lywlaYkuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4ljH-00Bvs2-3v; Tue, 04 Jan 2022 15:28:03 +0000
Received: from mga01.intel.com ([192.55.52.88])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4ljE-00BvrA-4y
 for linux-mtd@lists.infradead.org; Tue, 04 Jan 2022 15:28:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641310080; x=1672846080;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=slqc+GZKvR4BwvK+tcSNwUuglkJ5OqLCdfP9vfTJWpM=;
 b=n5xmFzyZRUAX9N/oMnlAbfdEDw/Gx9MHWX6uksGxQKN8H/KPVIvLPRFp
 o2pMPxDon95Ent/E9lWJUn5AGgCZtrq3Mwn9GwipsI3WwPs8jC4Wr2Kxv
 okDIqhZ8LC151fCidYL2CgGTvkxZ+IePyKLMHxvukM3IfnYV8Zb/sAxqB
 YpFG1tUh3lRLMI880yUxRaQ6OXEMZOMNzmkE9zrn2AdjbRkZ0YCN8G+w+
 TIj8eCFuRsIeDsbX0dwXLYUUNc38DvhWS4jLLg3twLbpi/6Qyq1/thgqz
 lqvyrDnAyATyMrng0egbQqcTKV1HxzSGsfIQVUAU8EZQSbI1f+OpQgZEP w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10216"; a="266509757"
X-IronPort-AV: E=Sophos;i="5.88,261,1635231600"; d="scan'208";a="266509757"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2022 07:27:55 -0800
X-IronPort-AV: E=Sophos;i="5.88,261,1635231600"; d="scan'208";a="760464912"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.162])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2022 07:27:51 -0800
Received: by lahna (sSMTP sendmail emulation); Tue, 04 Jan 2022 17:27:48 +0200
Date: Tue, 4 Jan 2022 17:27:48 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Andreas Noever <andreas.noever@gmail.com>,
 Michael Jamet <michael.jamet@intel.com>,
 Yehezkel Bernat <YehezkelShB@gmail.com>,
 Alexander Usyskin <alexander.usyskin@intel.com>
Subject: Re: [PATCH v1 5/5] thunderbolt: Drop duplicate NULL checks around
 nvmem_unregister()
Message-ID: <YdRndPUqeOfCqQgo@lahna>
References: <20220104133843.44272-1-andriy.shevchenko@linux.intel.com>
 <20220104133843.44272-5-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220104133843.44272-5-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220104_072800_226504_E994A453 
X-CRM114-Status: UNSURE (   9.65  )
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

On Tue, Jan 04, 2022 at 03:38:43PM +0200, Andy Shevchenko wrote:
> Since nvmem_unregister() checks for NULL, no need to repeat in
> the caller. Drop duplicate NULL checks.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
