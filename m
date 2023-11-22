Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4443C61D97
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Nov 2023 12:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SkDDSU7iz6mMSeSs+N/Ln1JXccC1BZvrnpqWzVRw9WQ=; b=afxb57rIBKz9vM
	lB9pmEdp8Jvxd5J+gtD8/OdETZJX6LXxKML3zGAF0rG0TrJj0+yyuXRQf041QjnUs92Mz0VXf+rpc
	csNvuctXldqqhMX5bju3wN+z+pALDEHn8MhCKHTD+IVyEzjkW+SQsFgkyAZh+Yux0uHUqKHjml5Ww
	/t7ZXMEGD3J38hhdRWCH+qlaSpOJEdYOU2hDQ8SOm0s4FUnFK8PKfxmbN0wIWyXiUFkTg3jSOknHZ
	OxXrzQP4xAfsqVaMw7rezl1mYdaictV5d461AcZv0+szqjMvVE0vHt2kE5+o9JE+X7BS8UkhcjiXw
	fW2irmt2bsbt/Rc7HSoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5mHU-001nTu-2u;
	Wed, 22 Nov 2023 12:24:36 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5mHS-001nQu-0V
	for linux-mtd@lists.infradead.org;
	Wed, 22 Nov 2023 12:24:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700655874; x=1732191874;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SX370jZj/iiF375wRpaiuBBt7qWPi41IvDXuLfaDWac=;
  b=AQfCbK6uD8TgXhGZd/ySXJdwBDXpCvN3gDsbGQgtdf3O+DcsI0Eoy3T7
   iDvmv6z3MQEGiX9l1WRnPw5RSTp0r44pNxkycNuRm6ubv6xhe9+rmBXPL
   TrHwR8UEM+7K+0gUzZJAWCvLpmz9/F4l2iz7Er8q1tWBtP5L7wifyZtj3
   Ww1VcAKprCatMf/Q+GbRWT62EnfOs/ujVTXbuDMk0CXFIWdkwjoGbSFBy
   di7YX8P51ws/BWCF3baHWLvmtckr3sl6hBRoxbQbzf5yD/I7EIt/TC+SF
   ExM0d1/HzRxFzRq9nR9XJs000iOs//N65Xdn9zvtWozEOHC1XEKnd3rDT
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="5184357"
X-IronPort-AV: E=Sophos;i="6.04,218,1695711600"; 
   d="scan'208";a="5184357"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 04:24:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="1014216736"
X-IronPort-AV: E=Sophos;i="6.04,218,1695711600"; 
   d="scan'208";a="1014216736"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 04:24:28 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1r5mHJ-0000000G5Qe-04tS;
	Wed, 22 Nov 2023 14:24:25 +0200
Date: Wed, 22 Nov 2023 14:24:24 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Nikita Shubin <nikita.shubin@maquefel.me>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Daniel Golle <daniel@makrotopia.org>,
	Jean Delvare <jdelvare@suse.de>,
	Christophe Kerello <christophe.kerello@foss.st.com>,
	Chris Packham <chris.packham@alliedtelesis.co.nz>,
	Johan Jonker <jbx6244@gmail.com>, linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>
Subject: Re: [PATCH v5 19/39] mtd: rawnand: add support for ts72xx
Message-ID: <ZV3y-IJ7JSD3fJeI@smile.fi.intel.com>
References: <20231122-ep93xx-v5-0-d59a76d5df29@maquefel.me>
 <20231122-ep93xx-v5-19-d59a76d5df29@maquefel.me>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231122-ep93xx-v5-19-d59a76d5df29@maquefel.me>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231122_042434_256440_D5B16D12 
X-CRM114-Status: GOOD (  13.84  )
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

On Wed, Nov 22, 2023 at 11:59:57AM +0300, Nikita Shubin wrote:
> Technologic Systems has it's own nand controller implementation in CPLD.

...

> +static int ts72xx_nand_attach_chip(struct nand_chip *chip)
> +{
> +	switch (chip->ecc.engine_type) {
> +	case NAND_ECC_ENGINE_TYPE_SOFT:
> +		if (chip->ecc.algo == NAND_ECC_ALGO_UNKNOWN)
> +			chip->ecc.algo = NAND_ECC_ALGO_HAMMING;
> +		chip->ecc.algo = NAND_ECC_ALGO_HAMMING;
> +		break;
> +	case NAND_ECC_ENGINE_TYPE_ON_HOST:
> +		return -EINVAL;

> +	default:
> +		break;
> +	}
> +
> +	return 0;

Move this to default.

> +}

...

> +		for (i = 0; i < instr->ctx.addr.naddrs; i++)
> +			iowrite8(instr->ctx.addr.addrs[i], data->base);

iowrite8_rep() ?

> +	case NAND_OP_DATA_IN_INSTR:
> +		ioread8_rep(data->base, instr->ctx.data.buf.in, instr->ctx.data.len);

Hehe, you are even using it...

...

> +	if (instr->delay_ns)

What will happen if you drop this check?

> +		ndelay(instr->delay_ns);

...

> +	int ret;
> +
> +	ret = mtd_device_unregister(nand_to_mtd(chip));
> +	WARN_ON(ret);

Is this a requirement by MTD to have return value being checked?

-- 
With Best Regards,
Andy Shevchenko



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
