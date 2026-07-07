Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAA10C43458
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Jul 2026 07:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c+P6yMXpvmqwRZHC+0aydpIM1FrwGbFyJzFWYdlXUVc=; b=LLJQ9Yqe1P/mSt
	TsDIHxYdqM/BLD4sM2JXseOZU9f0TNkvPG6xVZ+HkHqpgcFWwS7i5rf2nK8+O03+XTi6fRO6ZmxqN
	XKnW04UHhhGw2NjZ4bjmA4Q8WHzCCNFlVUQAz1+dk8TEjFRVokRTn2D7Pf6Wqt0moXnimuF3AugJv
	qjT/aIGQMTCiJGN6OjVoJp/9dxMQ+yDt48AdncIOajWLn3n5aBN9gnv/VUBB8zYvXM5MQG47oxw42
	MQIsXe+034qbwWfsolqfG8zvmSNKrR/vMShlZvgn8Lm8YalylyptOEgacNrd4T2ZIV05LJ7loWBW6
	SKPQOMKDluzOdz04CdWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh0gm-0000000EOEE-0aKJ;
	Tue, 07 Jul 2026 07:57:56 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh0gk-0000000EOCf-0crF
	for linux-mtd@lists.infradead.org;
	Tue, 07 Jul 2026 07:57:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783411075; x=1814947075;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MDXWwDyv4H+zTSE9teHwvvk4Sk0miT1w1S90181a0W0=;
  b=C/FaLeqgDsrkShB4dnZI39L39ohFmPZglYPyj+IaElN4g55NZPW68kSO
   zO2/QsGRPZwAJsUj/oZLK2o0ickiqyA8hPf5MzoJ5NS9IxKI7YG4T83G3
   zqF5iSs3WtE4FKuKmWjME+3eBlf8tjP7nmG4YVmPEndIW9MQGBqG9tSNw
   SXGeJvSwqYiVEEw80b81JzHWJK8dmwCX/iTekx22zuJxTQ3dbpUpd3LQw
   D5XZ0BooeZ11tIVwj2iWm2RDkZIT3ZOP9K9WcmO1HWAIaUMafZZxgqWFb
   7ZiNMCjTo5SuRAUH4RiUnohLFZ08/Y1a3XDKzVTqIyMnn5AdGBEtRqUDG
   g==;
X-CSE-ConnectionGUID: f3MmoBdHSK6mkrN7ltGwpQ==
X-CSE-MsgGUID: ymeylxd2R92VfiOtBz5fdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11839"; a="106851129"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="106851129"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2026 00:57:53 -0700
X-CSE-ConnectionGUID: 0+nViLfTQt+I+cab/HP/Jw==
X-CSE-MsgGUID: G5wplcShRpagvXOrELIvlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="252185974"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2026 00:57:51 -0700
Date: Tue, 7 Jul 2026 09:57:47 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Guangshuo Li <lgs201920130244@gmail.com>
Cc: Alexander Usyskin <alexander.usyskin@intel.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Lucas De Marchi <demarchi@kernel.org>,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: intel-dg: Fix runtime PM error path in probe
Message-ID: <akyxe9FteNZRULWD@black.igk.intel.com>
References: <20260705033107.276450-1-lgs201920130244@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260705033107.276450-1-lgs201920130244@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_005754_229195_7B50C848 
X-CRM114-Status: GOOD (  10.25  )
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

On Sun, Jul 05, 2026 at 11:31:07AM +0800, Guangshuo Li wrote:
> intel_dg_mtd_probe() allocates region names before enabling runtime PM
> and before calling pm_runtime_resume_and_get().
> 
> If kasprintf() fails while building a region name, the error path jumps
> to err, which calls pm_runtime_put(). At that point there has not been a
> successful pm_runtime_resume_and_get() call to balance, so the runtime PM
> usage count can underflow.
> 
> Jump to err_norpm from the kasprintf() failure path, as the runtime PM
> reference has not been acquired yet.
> 
> Fixes: 779c59274d03 ("mtd: intel-dg: Fix accessing regions before setting nregions")
> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>

Reviewed-by: Raag Jadav <raag.jadav@intel.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
