Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45008C54E64
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Mar 2024 15:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nJVCc9b7+3HL41mrMckDoUa8Dmz9tUPnS98MxymJbbQ=; b=o7X+ke1+1vNb8I
	byFuEGywsKJR6tBkHyTd3nG/9kiEnaUfZWV7jp8qJTF08BjD/cbaJeXtyI/yLEgeq/myXMB295RfH
	1i+gDd4aKId4CLVnVJ+5Gl44SSIt5ndSYJKwuTvt+g809ijA5IWOXZe6I6RtOfF+mbPCvZmk+I8CJ
	bGoZQvNyi520KjYyp5fhPJPY5wPpmik9AxcUz5bXoUE6SHEhwMVMljh6T/s7tkYDDFyVOCBRDy077
	E8af3KNmr2oVM9mpp2ssGVsLP8Fg/bUasPcYXlndAzHhrPR7aFIwT1gfDoRDmsTiIJ7LJ8ytohgiB
	2F1rKnON0nAXjHKUFgLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1romSw-00000000Yaf-44FG;
	Mon, 25 Mar 2024 15:42:27 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1romSu-00000000YXi-06mY
	for linux-mtd@lists.infradead.org;
	Mon, 25 Mar 2024 15:42:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711381344; x=1742917344;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KcgY73DDippwTtUzWOvcJOeO8SjdhHQhBOlxrmtlBug=;
  b=OsMndNEqZS27TGUCyW2f5fkGf20FJ90T29maa6Pk7vCPyHPvRmJ/61yJ
   M6oMIcRgCoX1wZmXcU+n/5FyC0acP4tnXSeq97gRwX/Nigt0QNlV7bifq
   K/9zordDElpVttB2XfwX2bKyx+PhUPzPPml/zcM3JNxpRL7GGDm/krvB2
   UaE9K5vKr4GqmSIB1Zrwd0fys+sF1mkltBAYZj3hUOhZaQcA/inxq+S02
   ioL+lcyBvu0M2qeBEBpM/05MGARSURKaL77sQMzAjMVozJnHhIFClIHbj
   00dvWDXddwzsCva4ARN0CoHL8Eh5o7FpZyAyZZGNsgtK1buvMLhoBLTvo
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="31828844"
X-IronPort-AV: E=Sophos;i="6.07,153,1708416000"; 
   d="scan'208";a="31828844"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2024 08:41:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11023"; a="914846903"
X-IronPort-AV: E=Sophos;i="6.07,153,1708416000"; 
   d="scan'208";a="914846903"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2024 08:41:36 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1romS5-0000000G1lm-1KA9;
	Mon, 25 Mar 2024 17:41:33 +0200
Date: Mon, 25 Mar 2024 17:41:33 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Maxim Korotkov <korotkov.maxim.s@gmail.com>
Cc: Boris Brezillon <bbrezillon@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Hector Palacios <hector.palacios@digi.com>,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org
Subject: Re: [PATCH] mtd: rawnand: hynix: fixed typo
Message-ID: <ZgGbLe4XTy1FUP0C@smile.fi.intel.com>
References: <20240313102721.1991299-1-korotkov.maxim.s@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240313102721.1991299-1-korotkov.maxim.s@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240325_084224_240308_BA846314 
X-CRM114-Status: GOOD (  13.10  )
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

On Wed, Mar 13, 2024 at 01:27:20PM +0300, Maxim Korotkov wrote:
> The function hynix_nand_rr_init() should probably return an error code.
> Judging by the usage, it seems that the return code is passed up 
> the call stack.
> Right now, it always returns 0 and the function hynix_nand_cleanup()
> in hynix_nand_init() has never been called.
> 
> Found by RASU JSC and Linux Verification Center (linuxtesting.org)

> Fixes: 626994e07480 ("mtd: nand: hynix: Add read-retry support for 1x nm MLC NANDs")
> 
> Signed-off-by: Maxim Korotkov <korotkov.maxim.s@gmail.com>

FWIW, the tag block shouldn't have blank lines.

-- 
With Best Regards,
Andy Shevchenko



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
