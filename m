Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5829BC4332F
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Nov 2023 16:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yaB3bKjDjlh5K5HM7IFvSe5+vETb7m4w/cKOPSHzZgk=; b=s83RW35+5bKZIm
	245sWOtqF+7CfYj4C/lvDo/ekc33d9evpVbITHp7nTh6nE3vxRo0p1SKcWWMfbqI9p9sgr2+UZbdO
	AJfcJxstOMux0ciBelEqfGm/AbGxEOI11eDG/tshkKxcAzieRTeeMz5rrcIJrq1J0O8mXTXzOG2d8
	5K+o+qZR5ioXc57NooszTBgZaZxgV4MiZZNjWuQqrcGlqNRZP8jxVGV9fFlV/8pUVyGTyD3slB3lS
	8S7TP6uOrs0J9JHkwvg7HdyrcFnbH3cckNqBoKuQq7KhyzbXEBzuym2E2Yvxg49pGXZL/FBQjj+y6
	yfRpq7NcfwlGYswsC9Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2ZQU-00EIVE-24;
	Mon, 13 Nov 2023 16:04:38 +0000
Received: from mgamail.intel.com ([192.55.52.115])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2ZQR-00EIUV-0O
	for linux-mtd@lists.infradead.org;
	Mon, 13 Nov 2023 16:04:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699891475; x=1731427475;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UdkN8SAfBpH02zQkollG8VPGzspJGCrccWU1tYOSG0Y=;
  b=jziK3cYQ3hfJXS6m4ZPISoBWf9u00X3ZlsCQ2ftKL3JsaTbq7kkZ3jIS
   swN4h+rWeRb7fHmRxntvo7xxkdbEAuysnagQKGgj3oKo/M5OlzKFLharl
   ewUb0z+ck+OIMKMzfCWDUEwfdn5SAkg1U4ew9wIeB6aL7RcE9Vbx3hso2
   oWVR/oVMUnR7q8vgXt7xjA8LQVzW6/ONoPdnw98HFuNX392y8UGr23rn+
   c8qRrxXHGCf8/64Zxxe1ZaMnl9sXBKqRrRr1yiP/8XDp2crWQ92RhIHDr
   mprK9YivmEmww6HFyPafPlr6nurwg9TZRXa7yZ4dDpCtB16vSFxbXHoX4
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="390261710"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="390261710"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2023 08:04:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="1095789129"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="1095789129"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2023 08:04:21 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97-RC3)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1r2ZQ9-0000000DbIO-31UC;
	Mon, 13 Nov 2023 18:04:17 +0200
Date: Mon, 13 Nov 2023 18:04:17 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Ronald Monthero <debug.penguin32@gmail.com>
Cc: richard@nod.at, vigneshr@ti.com, heiko@sntech.de,
	martin.blumenstingl@googlemail.com, paul@crapouillou.net,
	robh@kernel.org, u.kleine-koenig@pengutronix.de,
	AVKrasnov@sberdevices.ru, r.czerwinski@pengutronix.de,
	jaimeliao.tw@gmail.com, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v2] mtd: rawnand: Increment IFC_TIMEOUT_MSECS for nand
 controller response
Message-ID: <ZVJJAReXiEVc35HZ@smile.fi.intel.com>
References: <20231113131634.614467-1-debug.penguin32@gmail.com>
 <20231113155354.620298-1-debug.penguin32@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231113155354.620298-1-debug.penguin32@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231113_080435_229086_B8283684 
X-CRM114-Status: GOOD (  11.25  )
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

You are too quick with v2, below my comments (new and old).

On Tue, Nov 14, 2023 at 01:53:51AM +1000, Ronald Monthero wrote:
> Under heavy load it is likely that the controller is done
> with its own task but the thread unlocking the wait is not
> scheduled in time. Increasing IFC_TIMEOUT_MSECS allows the
> controller to respond within allowable timeslice of 1 sec

Missing period at the end?

> fsl,ifc-nand 7e800000.nand: Controller is not responding

> main/smp_fsm.c:1884 <inrcu: rcu_preempt detected stalls on CPUs/tasks:
> rcu:    Tasks blocked on level-0 rcu_node (CPUs 0-1): P116/2:b..l
>         (detected by 1, t=2102 jiffies, g=7729, q=754)
> task:irq/31-arm-irq1 state:D stack: 0 pid: 116 ppid: 2 flags:0x00000000
> [<8064b97f>] (__schedule) from [<8064bb01>] (schedule+0x8d/0xc2)
> [<8064bb01>] (schedule) from [<8064dacd>]
> [<8064dacd>] (rt_mutex_slowlock_block.constprop.0) from [<8064db57>]
> [<8064db57>] (__rt_mutex_slowlock.constprop.0) from [<8064dbf7>]
> [<8064dbf7>] (rt_mutex_slowlock.constprop.0) from [<804b2047>]

At least above 9 lines are not important and may be removed.

> [<804b2047>] (nand_get_device) from [<804b5335>] (nand_write_oob+0x1b/0x4a)
> [<804b5335>] (nand_write_oob) from [<804a3585>] (mtd_write+0x41/0x5c)
> [<804a3585>] (mtd_write) from [<804c1d47>] (ubi_io_write+0x17f/0x22c)
> [<804c1d47>] (ubi_io_write) from [<804c047b>] (ubi_eba_write_leb+0x5b/0x1d0)

...

> -#define IFC_TIMEOUT_MSECS	500  /* Maximum number of mSecs to wait
> +#define IFC_TIMEOUT_MSECS	1000  /* Maximum number of mSecs to wait
>  					for IFC NAND Machine	*/

While at it, you may improve the comment, e.g.,

  "Maximum timeout to wait for IPC NAND Machine"

-- 
With Best Regards,
Andy Shevchenko



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
