Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02252CCA472
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Oct 2025 12:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7tobGSpETMCniBwOHj+Pfk8wR1b0jCFCrEDrInnx/QQ=; b=PF9CqafERr3iqT
	9Uq0Kv3Rp2aaxhBRlGGP378Sq6LbktIYSrx5vtoJaUi+JbrHrrf4JFpJUnXy14gT0E9wxiSCvN32e
	qE9VqfhW+I6uAGsu0ukg73YnYRM6codgGeAVi9fnh4l7nl/NE5VjRdQT2dQYlMQ0zx8t7DMvcmLCf
	djK2Nvgxt1wC5D+aDdv2STdgA6fYyYvscvd5sFX/cIsAOIqAXI+viuR2DSL1cUOV9p4LdTNtm/Rxf
	UIjms8ETTFLmHaxWZhGmhsM8hXpdoW8CUAizwhgkp+uLNfWenqtIzTuHRkg4oMgthzYxPJpfyDiMs
	uwXme6GCDwvvS/IBk8cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6TR0-00000003pqE-0AMq;
	Wed, 08 Oct 2025 12:38:22 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6TQy-00000003ppr-1tHa
	for linux-mtd@lists.infradead.org;
	Wed, 08 Oct 2025 12:38:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 242A0409D3;
	Wed,  8 Oct 2025 12:38:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 725D6C4CEFF;
	Wed,  8 Oct 2025 12:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759927100;
	bh=ZhixgKI1C4ISlwRUAfei6v0l16wxlircNMUwJwT/hjo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=M2Ncq3Tcw7zaOSjLHS74BvWZskunIuF0UILJEHiR0RzmBiFCGqBKeIyl8hVp7r38u
	 ZIEJJKJouqGlWe37GzU9pE8VPqQ2q9kvqsAjeWkstS+DZqRHtc8H9b7maStL9DmmyC
	 I9ti2UVeU2nahceJTfjsmh67gHJz1bJzJbJ6XsMI/4z+Lgl40afu4iKthg+cJIYXgq
	 W8Y7QeySxgtQo4IvTi0kPITB9idw5/aDbiqEQHX6v/s/+7ZNqTG+CNWNS2PA11raPO
	 N5wNX7GjIZUCihtrra38I0iXMfREYo+W/j/C89Ha56k8a6whPlAI56sIwFh+JNsd/i
	 TAGbPHvF1oQLw==
From: Pratyush Yadav <pratyush@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Sean Anderson <sean.anderson@linux.dev>,  Pratyush Yadav
 <pratyush@kernel.org>,  Michael Walle <mwalle@kernel.org>,
  linux-mtd@lists.infradead.org,  Richard Weinberger <richard@nod.at>,
  linux-kernel@vger.kernel.org,  Miquel Raynal <miquel.raynal@bootlin.com>,
  Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH] mtd: spi-nor: Enable locking for n25q00a
In-Reply-To: <27d13306-79a7-40ae-af88-069d1f71f016@linaro.org> (Tudor
	Ambarus's message of "Wed, 8 Oct 2025 06:05:36 +0100")
References: <20251006223409.3475001-1-sean.anderson@linux.dev>
	<21760ebf-99f8-4ea3-8841-e023e00ae574@linux.dev>
	<27d13306-79a7-40ae-af88-069d1f71f016@linaro.org>
Date: Wed, 08 Oct 2025 14:38:17 +0200
Message-ID: <mafs01pndo9fq.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_053820_508062_9E1C0D29 
X-CRM114-Status: GOOD (  19.57  )
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

On Wed, Oct 08 2025, Tudor Ambarus wrote:

> Hi, Sean,
>
> On 10/6/25 11:38 PM, Sean Anderson wrote:
>> On 10/6/25 18:34, Sean Anderson wrote:
>>> The datasheet for n25q00a shows that the status register has the same
>>> layout as for n25q00, so use the same flags to enable locking support.
>>> These flags should have been added back in commit 150ccc181588 ("mtd:
>
> Were the flags removed upstream and then not added back?
>
>>> spi-nor: Enable locking for n25q128a11"), but they were removed by the
>> 
>> Sorry, this should be commit f80ff13135cb ("mtd: spi-nor: micron-st: Enable locking for n25q00")
>> 
>> https://lore.kernel.org/all/20200421063313.32655-1-js07.lee@samsung.com/
>
> The rule is still true today: I don't queue patches that are not 
> functionally tested, even if they are based on datasheet info.
>
>> 
>>> maintainer...
>
> Don't point fingers please. If you feel the context is worth
> mentioning, specify it in an impersonal way and add a link to the
> discussion in the commit message.

+1.

>
>>>
>>> Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
>>> ---
>>> Tested with a mt25qu01gbbb, which shares the same flash ID.
>
> Would you please let us know how you tested the support?
>
> If you feel generous and want to give back to the community, you can also
> describe your testing steps in the documentation from:
> https://docs.kernel.org/driver-api/mtd/spi-nor.html
>
> Also, if there's going to be a v2, please dump the SPI NOR sysfs and
> debugfs data, see how in the link from above. We're keeping a database
> and it will help us differentiate flashes that have the same flash ID
> but different functionalities.

There will need to be a v2. I'm not applying the commit message in its
current form.

Would be nice to have a sysfs and debugfs dump too. Sean, the data we
need can be found in
https://docs.kernel.org/driver-api/mtd/spi-nor.html.

[...]

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
