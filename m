Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBB11C433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 23 May 2022 11:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qSmZnhkcBYcv0ZWemBB4wK4HHZ5yW5oFLThI/7IMBpg=; b=siwk2VHFDWPKhG
	Gna6dwXcQUp7L33iOZK1sCYFxiKAa0PAJUuqlFh+pWX7ayoOgoWBwnuXR7iLbgkrxE1Je8z4Bb8Jx
	1OE0DCQ/AhM8hEKpOtSZbfdRu6bgHxdIUyYdwZ9wxxbNnbeWATE9/ZdExFMZLdBduod4qnxAs4YQf
	lPvD1L9JR3RDzRWjtbdAUaXWYmwqgWTYdcMdMH/XXsB172mNRxtQhRjdeLwJcTl7xGE8k6iMJDpZd
	Byd19fp01L0AVV0kSnLqMK2a5tbTAs6WuMqO6ZCH0onlK0ntxJMRrECUscd031zNx0qJAYHSvaXFz
	0CYSYrVJ72q4z0G19/FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nt5zu-003aWO-A7; Mon, 23 May 2022 11:13:14 +0000
Received: from mga11.intel.com ([192.55.52.93])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt539-0038Pn-NI
 for linux-mtd@lists.infradead.org; Mon, 23 May 2022 10:12:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653300751; x=1684836751;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=nWXkE7lW8MkTgBO60OVdoFgbRHxwYQCVcL9YumhXIps=;
 b=ib8t89ZUqOXaslUW2iKlf5vqlDMT0XiOS5jTqeF2pju9AlnJm+sWkCwu
 chPXt9Ou9HSX/RYU2fBKVuNq1Erch1jE7KX6eO2iJg/p9fXdgeRs1hZcO
 koO+XGlvObS697Rwn+9TUsdbp7nS1gYhAVHdv3yBLKU+YzNGLkXvc5p4t
 1lLvoBq+ifVNGbZBwbPosN2igCvDRtChz0w1ItrytYhwapav2g0ABDbdv
 +bHtpadiaGQPcKvlM/wh889TVwu5CZ4xx5VCW6GEeDLh/36TEqpfRhSRe
 j1tY7v9vBNU3EmlfP1DyI87Y9e8I9xIQJilxXCFq7qQ5MFPjq4TP1nCaS w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10355"; a="270743697"
X-IronPort-AV: E=Sophos;i="5.91,246,1647327600"; d="scan'208";a="270743697"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2022 03:12:28 -0700
X-IronPort-AV: E=Sophos;i="5.91,246,1647327600"; d="scan'208";a="600566709"
Received: from jiaqingz-mobl.ccr.corp.intel.com (HELO [10.249.171.16])
 ([10.249.171.16])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2022 03:12:26 -0700
Message-ID: <2bf3394e-0a78-c760-16ce-936c12b66b93@linux.intel.com>
Date: Mon, 23 May 2022 18:12:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 1/2] mtd: spi-nor: macronix: Add support for mx66l2g45g
Content-Language: en-US
To: Michael Walle <michael@walle.cc>
Cc: linux-mtd@lists.infradead.org, Tudor Ambarus
 <tudor.ambarus@microchip.com>, Pratyush Yadav <p.yadav@ti.com>
References: <20220522054802.1719443-1-jiaqing.zhao@linux.intel.com>
 <04c432289041752d113c15245361ade8@walle.cc>
 <b3e85d41-9415-b911-6f61-941885af1955@linux.intel.com>
 <fac4b7877f600a4067534fca672dc842@walle.cc>
From: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
In-Reply-To: <fac4b7877f600a4067534fca672dc842@walle.cc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_031231_817792_E3F62F86 
X-CRM114-Status: GOOD (  10.87  )
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

> Am 2022-05-23 10:50, schrieb Jiaqing Zhao:
>> Hi,
>>
>> Yes this one supports SFDP according to its spec.
>>
>> On my setup, I cannot see the sysfs object. Do I need to enable some specific
>> kernel config or it's SPI controller related? My setup is running kernel 5.15.
> 
> No, it should be there since v5.14. See commit 36ac02286265. And you shouldn't
> need to enable any special configuration option.
> 
> Did you do a "find /sys -name sfdp"?
> 
> -michael 

I tried, it give empty result. The system I'm working on disables kernel module,
and the SPI controller driver calls spi_nor_probe() directly, will this be the
issue?

And is it possible to manually load the spi-nor driver via the bind interface?
If it is possible, what should the parameters be?

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
