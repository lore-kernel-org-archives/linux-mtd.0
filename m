Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7675CC433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Jan 2022 14:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VWFBgkJaYD9mVaro+Md8Za8h/uF1oXjlxbT5YnDpVnk=; b=Zf8k6cfG+UYaOp
	U2xGM8o+LetRsnRQXQ7yRzApE6+L2c2Yof9FeWNDYHm2HOx1zdyRihHGrMbTRB/uLoOUqpehyY16I
	TVqjJdvKtalASWFcpUXDyRvE98TmXvkvvzDihRFIu9QlyrRfY7kgZkO1BAphmcZZzUdqgPU1nE93Q
	GjHyU8Ne5VBuUvRqoDTd2r6dCJv8wlyQAC5eHpqRGdJy+A8tp7OGxWJE/nnQh7jlvzfebnyVcd6vu
	pxgYp3uSsmUB6rIlleA2zpnkWluneAoZXYD07tZAQHmi44+PRjU+uD+EzoB06ikKcACgQLV++DZHY
	/p5EU9fMkWpkYiSLG8cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCMUN-00847q-UB; Tue, 25 Jan 2022 14:08:03 +0000
Received: from mga11.intel.com ([192.55.52.93])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCMUL-00847J-2D
 for linux-mtd@lists.infradead.org; Tue, 25 Jan 2022 14:08:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643119681; x=1674655681;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=XgfYTpAKCUjsVgEWndslqumPAtQ3LFT5BEWLwncUR10=;
 b=hxyVdYspr08bTAH6u77yBGwL4BBRlzUJPKU653nhjQhPN6fI/b2CMuM/
 Dh/HGrN/Ot46PV4ul8ITSdoHaRjY/dSgp5evpkL036pXwa8O+Ng2NCng4
 9fkJX4dCfLYhLMrFnRuigoF7Hehus9ylcqboE2XD+zY9LpEwouDhfJhVw
 tImWGgw5BgcjEXX+iDE83juTj44gi4dPDv95gFkXpZf9LV+O6UhCT45Q9
 8j17RmztskaaVUqmgfN3wGXbpcU0iA9YKSm6d9HqQobF46au7fxI8GdiC
 cFIfJ16tX1I/48itvLhKhDB/WHK8SiSXjKNM5sBZnkxwokh2+1Pi1ZrgA A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10237"; a="243904639"
X-IronPort-AV: E=Sophos;i="5.88,315,1635231600"; d="scan'208";a="243904639"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2022 06:05:21 -0800
X-IronPort-AV: E=Sophos;i="5.88,315,1635231600"; d="scan'208";a="580757906"
Received: from smile.fi.intel.com ([10.237.72.61])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2022 06:05:18 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1nCMQd-00EGe2-Nv; Tue, 25 Jan 2022 16:04:11 +0200
Date: Tue, 25 Jan 2022 16:04:11 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Andreas Noever <andreas.noever@gmail.com>,
 Michael Jamet <michael.jamet@intel.com>,
 Yehezkel Bernat <YehezkelShB@gmail.com>
Subject: Re: [PATCH v2 1/5] nvmem: core: Remove unused devm_nvmem_unregister()
Message-ID: <YfADW9YZ8Hbt8Phq@smile.fi.intel.com>
References: <20220124180040.50660-1-andriy.shevchenko@linux.intel.com>
 <11caff0e-6bf3-9d66-6312-c2c2a6fc862a@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <11caff0e-6bf3-9d66-6312-c2c2a6fc862a@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220125_060801_145496_A1EB9AED 
X-CRM114-Status: GOOD (  11.67  )
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

On Tue, Jan 25, 2022 at 10:35:24AM +0000, Srinivas Kandagatla wrote:
> On 24/01/2022 18:00, Andy Shevchenko wrote:
> > There are no users and seems no will come of the devm_nvmem_unregister().
> > Remove the function and remove the unused devm_nvmem_match() along with it.

> Applied 1/5, 2/5 and 3/5 patches.

Thanks!

> Others can go via there own subsystems as I do not see any dependencies.

They are dependent on the patch 3 ("nvmem: core: Check input parameter for
NULL in nvmem_unregister()"). Since there are tags, can you apply them as
well?

-- 
With Best Regards,
Andy Shevchenko



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
