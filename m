Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAB68D167E7
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Jan 2026 09:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MhugjWhLSAeqh1nf6wG/Fpi9X3gNsY/6EGnUfIY3tyw=; b=wbuV30CKqbJUUA
	wr5kIymnnfBKVFwwJrFH0N98qBSJSp/zFrJvzQS1jyccSGpG/Zpa+yPBgvGQJ3LmE4xQ+0eK4oXcg
	G6C4CCgnyf2IvRlywmgQhRtpoe0i6hbNntnfSJhBZBybCpUirxYqDb6GdiMnMErFM+HUTdzTvkdiF
	joORhtVz3WY4pyi78dbUSHsEgRQu7CFDEQVnMKojvW3zAtto08w/SBsi8uVinJ+21H+nN6PaFHXa+
	Co9GY/flW4jk/CqdxSLU6nAc2WtWY30MyT7yG2tEK+SJIYwLatHbZIvYsss553hOgurNj41hpqxSq
	fvWyNQDsLbCSP25RCgVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve8zf-000000022iQ-1qWW;
	Fri, 09 Jan 2026 09:41:19 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve8zc-000000022i4-3S0b
	for linux-mtd@lists.infradead.org;
	Fri, 09 Jan 2026 09:41:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767951676; x=1799487676;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=O9MruM0fwwjauRsMoHWSXGet6CfPAq6e5XybIlgAVUY=;
  b=T2ZxNhdUN7wesFjVCRTPnmCnkUy4/NujGzJEzm1foFxa2wioA34KO9xj
   GeCVl5c4rFIZ1saaNSNgA5zDFoN/Udqrsrhl3fIMx+uMuR5Qb+64xUHIv
   7rm6jfw9xVWN1PhpOW+QTt6Yu1L66jw0TzrMEHq3j6pxfzVkNmKrfPzdG
   s3EiVL9K8ct8O5lpnbG+KG5PTFMDemNXlgho+21izebLKCx+IEsmAuCNo
   3lHy8pWQvIe3Shct/3ojUYSiIOoVlIDmY5jRXRkSbtn9yA1PnUIPm1KiX
   xj1zJ7EibRezPpL4qxYg1oMnuERZ9sWA5dK+cqRr11gyyDdrxXo1rY1tr
   A==;
X-CSE-ConnectionGUID: CbE6O+qvQrWjcVjrmjMIMA==
X-CSE-MsgGUID: N6d8FLXITtuuX/+KsmO3Yw==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="79628930"
X-IronPort-AV: E=Sophos;i="6.21,212,1763452800"; 
   d="scan'208";a="79628930"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2026 01:41:13 -0800
X-CSE-ConnectionGUID: oLprbKeGRhmwqBa2x2BRjg==
X-CSE-MsgGUID: Vv4xSCnMRVe/7PXwM/ZMHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,212,1763452800"; 
   d="scan'208";a="207581160"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2026 01:41:11 -0800
Date: Fri, 9 Jan 2026 10:41:08 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Alexander Usyskin <alexander.usyskin@intel.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tomas Winkler <tomasw@gmail.com>, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH] mtd: intel-dg: fix array-index-out-of-bounds in
 intel_dg_mtd_probe()
Message-ID: <aWDNNOoYTa0Mi7LM@black.igk.intel.com>
References: <aUZFLezigzZQVt55@kspp>
 <aUZLNTOMgvJ8WrIy@black.igk.intel.com>
 <0c69b711-4c88-4e64-afe7-f7de147a490b@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0c69b711-4c88-4e64-afe7-f7de147a490b@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_014116_938435_8FB59681 
X-CRM114-Status: GOOD (  15.38  )
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

On Wed, Jan 07, 2026 at 03:17:40PM -0800, Randy Dunlap wrote:
> Hi,
> 
> On 12/19/25 11:07 PM, Raag Jadav wrote:
> > On Sat, Dec 20, 2025 at 03:41:49PM +0900, Gustavo A. R. Silva wrote:
> >> Fix the UBSAN: array-index-out-of-bounds issue below by updating
> >> counter nvm->nregions before the first access to flexible-array
> >> member nvm->regions[].
> >>
> >> from kernel bugzilla:
> >> https://bugzilla.kernel.org/show_bug.cgi?id=220823
> >>
> >> Dec 15 22:01:52 orpheus kernel: UBSAN: array-index-out-of-bounds in /var/tmp/portage/sys-kernel/gentoo-kernel-6.18.1/work/linux-6.18/drivers/mtd/devices/mtd_intel_dg.c:750:15
> >>
> >> Notice that this flexible array is annotated with the counted_by()
> >> attribute, hence the counter must always be updated before the
> >> first access to the array.
> > 
> > Already fixed[1], but not sure if it's landed yet.
> > 
> > [1] https://lore.kernel.org/linux-mtd/20251111-mtd-nregions-v1-1-61db61e78c63@intel.com/
> 
> What's the status of this patch, please?

I'm assuming it'll go through mtd tree? Miquel?

Raag

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
