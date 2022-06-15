Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F265BC433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 15 Jun 2022 09:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o87qGmyJPSOZDaQYQNq+FaB3SXKZtnjbWjGaAUk34po=; b=ZpwsLB0SCGim76
	z6qisgG/sxtn4SRdi/x/A5CefhfxjWrqZT/+iDfkKhD60eB+2rgs3wsGIe6lu1/oAT5EmAfBWGuxu
	mjy0nD5ULJ29mOCoETPS2/JHdS8TLt7crYiZxqQaR6pePHGUT9QKxGWanY0pUXVG5hWD6Sim892hj
	VKRxgGCQWwASAlQ42llrrE28gw2Dnvq6Xgu5MLjHN6O5ULM1vv+HUPFi85anSGXgnpW42OS84f4+3
	5zlezTPhM9SU8WHahLtrJVyPRArJV9tELRJAAzk+VQyAuY052k5DELmzvJ8dUe2WqF0PGoe5564pi
	9amCK5dT970+jJa6C+cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1Phh-00DavP-TV; Wed, 15 Jun 2022 09:52:50 +0000
Received: from mga18.intel.com ([134.134.136.126])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1PgQ-00DZGU-FE
	for linux-mtd@lists.infradead.org; Wed, 15 Jun 2022 09:51:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655286690; x=1686822690;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fgoP/mzTE5gjuDZ8g87/11obiI4NZu5ZOraq//7+Q64=;
  b=WTz1L3rtwPFvXvkup4tiIq27luQPOSDqmE3darSP8UUDYiUBmRis/Ae5
   5emyogH5Mm65h+qRWdoGPj4pzLBLQQ+9ZE4tjJc3Fr+BModIZflbeUVXS
   N60ggo/a9hY/M+ZT234m28PVqJgZ0ET3E3L+7xzb6YsDrwODCgxsH6Jz+
   43NH+nJr9S0sf5e1JaEB1Vw3Kkff9TbwVrtzsXhZV6CpqGzaX3Y5Ydvgl
   FZv+bwRVkgU6XiyGDhxL8Gx23eFOvsdEuuEgy0sFjVRNHoIfdl7BezAzt
   wv6qx5x1j07zo0n7S47lyOOzYhSYHofDdkZWJMfbe2zDUTN+wNlT9u8zc
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10378"; a="261929676"
X-IronPort-AV: E=Sophos;i="5.91,300,1647327600"; 
   d="scan'208";a="261929676"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2022 02:49:29 -0700
X-IronPort-AV: E=Sophos;i="5.91,300,1647327600"; 
   d="scan'208";a="618386934"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.162])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2022 02:49:24 -0700
Received: by lahna (sSMTP sendmail emulation); Wed, 15 Jun 2022 12:49:22 +0300
Date: Wed, 15 Jun 2022 12:49:22 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: "Oleksandr Ocheretnyi -X (oocheret - GLOBALLOGIC INC at Cisco)" <oocheret@cisco.com>
Cc: "tudor.ambarus@microchip.com" <tudor.ambarus@microchip.com>,
	"miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
	"p.yadav@ti.com" <p.yadav@ti.com>,
	"michael@walle.cc" <michael@walle.cc>,
	"richard@nod.at" <richard@nod.at>,
	"vigneshr@ti.com" <vigneshr@ti.com>,
	"broonie@kernel.org" <broonie@kernel.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
	"mauro.lima@eclypsium.com" <mauro.lima@eclypsium.com>,
	"lee.jones@linaro.org" <lee.jones@linaro.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"xe-linux-external(mailer list)" <xe-linux-external@cisco.com>
Subject: Re: [PATCH] mtd: spi-nor: handle unsupported FSR opcodes properly
Message-ID: <YqmrIsOEsFoKTwEK@lahna>
References: <YmZUCIE/ND82BlNh@lahna>
 <20220610191548.3626218-1-oocheret@cisco.com>
 <YqbWt9f3of+7Z76e@lahna>
 <BYAPR11MB27570F2863F7BCDFE629B3DFCDAA9@BYAPR11MB2757.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <BYAPR11MB27570F2863F7BCDFE629B3DFCDAA9@BYAPR11MB2757.namprd11.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220615_025130_629045_535C4A69 
X-CRM114-Status: GOOD (  15.23  )
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

Hi,

On Tue, Jun 14, 2022 at 05:56:54PM +0000, Oleksandr Ocheretnyi -X (oocheret - GLOBALLOGIC INC at Cisco) wrote:
>    Hello Mika,
> 
>    in my case (I work with memory chip n25q128a13 for recent kernels) I'm
>    getting return value -ENOTSUPP from spi_mem_exec_op() call in the
>    micron_st_nor_read_fsr() method
>    [[1]https://elixir.bootlin.com/linux/v5.19-rc2/source/drivers/spi/spi-m
>    em.c#L326]. So I decided to provide the same errorcode to
>    intel_spi_hw_cycle() method because older kernel versions throw the
>    error there. It is fine to use -EOPNOTSUPP return value instead.
> 
>    I suspect we need to cover both cases to check -ENOTSUPP as well as
>    -EOPNOTSUPP to let the driver work properly.
> 
>    if (ret == -ENOTSUPP || ret == -EOPNOTSUPP)

I think we should follow the same in the Intel driver and return
-ENOTSUPP too.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
