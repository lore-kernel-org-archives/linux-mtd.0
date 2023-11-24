Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DD52C61DF4
	for <linux-mtd@archiver.kernel.org>; Fri, 24 Nov 2023 14:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mpIMwEi4abQlBTD62GGHHnXA8yrXiqR4wEfMrEns3gU=; b=BKc1zRg56+ytU8
	AOzev3gHyLwN3IWaQFbyBWDK9tp42KNIVQNg+77Wu+259z7PjrRbad7Jut+3pU9oF9u7U5hw7Mz8H
	zfSMrqxqc2MJ7wYdqGAxsN8jgwaCdPGONSbtfEB19sVjww3TvhfZU5wOApBFwNp/m/5xCb8IWQ8Ee
	q+wvPvlUoPxa6z4/xWUoeccyY1sw70iYAbrO3UUTvPnkvHjJfkRg1l5E+DyPdwNH5FtYaTQxHOuoQ
	pDRMjSrCKvlCBDzCVO8K/FDREn8qeTNaN2BnLcV8Ayk4FEsyPIA3A3miO4AezBGPlVGx93U04V8ou
	vP5vJgIqXxKhE85Aiwtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6XIb-007QFM-0f;
	Fri, 24 Nov 2023 14:36:53 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6XIX-007QDG-2y
	for linux-mtd@lists.infradead.org;
	Fri, 24 Nov 2023 14:36:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D54EC622B7;
	Fri, 24 Nov 2023 14:36:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95C6DC433CA;
	Fri, 24 Nov 2023 14:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700836604;
	bh=MdOhhUKumd3kzb9H02LyP8oNeaYzZ+2LZ3UTYMLXOVE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=rzqSDjKnVMIT1WOvjbr9cWJa/zbBDJL1pf4jeyHfhOTVq83WXx9Qk+UXtUnUDQFaG
	 rIW4sQC4/HBhQJzo+2g4ffQ8N7oW3f0ZsljPKUjUzDiy9LrPHscy67npgbuhPQOWQb
	 luGHy5jTRMLkfoor6lk44wZF51xP2ysfsrluz0l+0uIOicSKhjdb7MIslKMTxuV7O+
	 z0D9ydOrFyErQi92VsJ6RNBvEZppmeCYPeqICtO+lZ3jQvF0ZE8EmFmyZZ6ndY+hfV
	 MxlVMQIBlaTFtpRil+H+MObpob3N/Ej0/oJn7NaJw4KWgA/V8KCSpZg6vqcxfqFBcU
	 feDGnYbW/6Stg==
From: Pratyush Yadav <pratyush@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: pratyush@kernel.org,  michael@walle.cc,  linux-mtd@lists.infradead.org,
  linux-doc@vger.kernel.org,  corbet@lwn.net,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] docs: mtd: spi-nor: add sections about flash
 additions and testing
In-Reply-To: <20231123160721.64561-2-tudor.ambarus@linaro.org> (Tudor
	Ambarus's message of "Thu, 23 Nov 2023 18:07:20 +0200")
References: <20231123160721.64561-1-tudor.ambarus@linaro.org>
	<20231123160721.64561-2-tudor.ambarus@linaro.org>
Date: Fri, 24 Nov 2023 15:36:42 +0100
Message-ID: <mafs0sf4vdxqd.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231124_063650_022530_F8D9D9CA 
X-CRM114-Status: GOOD (  19.22  )
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


On Thu, Nov 23 2023, Tudor Ambarus wrote:

> Add sections about how to propose a new flash addition and about the
> minimum testing requirements.
>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---
>  Documentation/driver-api/mtd/spi-nor.rst | 189 +++++++++++++++++++++++
>  1 file changed, 189 insertions(+)
>
> diff --git a/Documentation/driver-api/mtd/spi-nor.rst b/Documentation/driver-api/mtd/spi-nor.rst
> index c22f8c0f7950..cc8e81e09544 100644
> --- a/Documentation/driver-api/mtd/spi-nor.rst
> +++ b/Documentation/driver-api/mtd/spi-nor.rst
> @@ -63,3 +63,192 @@ The main API is spi_nor_scan(). Before you call the hook, a driver should
>  initialize the necessary fields for spi_nor{}. Please see
>  drivers/mtd/spi-nor/spi-nor.c for detail. Please also refer to spi-fsl-qspi.c
>  when you want to write a new driver for a SPI NOR controller.
[...]
> +4/ Use `mtd-utils <https://git.infradead.org/mtd-utils.git>`__
> +and verify that erase, read and page program operations work fine.
> +
> +a/ Generate a 2 MB file::
> +
> +    root@1:~# dd if=/dev/urandom of=./spi_test bs=1M count=2
> +    2+0 records in
> +    2+0 records out
> +    2097152 bytes (2.1 MB, 2.0 MiB) copied, 0.848566 s, 2.5 MB/s
> +
> +b/ Verify erase::
> +
> +    root@1:~# mtd_debug write /dev/mtd1 0 2097152 spi_test
> +    Copied 2097152 bytes from spi_test to address 0x00000000 in flash

Perhaps mention that the 2 MiB region should already be erased.
Otherwise some flashes might refuse the writes (like the ones with ECC
-- Cypress S28 family comes to mind). Experienced engineers should know
this already but it might trip up some beginners.

Looks good otherwise. Thanks for working on this.

Reviewed-by: Pratyush Yadav <pratyush@kernel.org>

> +
> +    root@1:~# mtd_debug erase /dev/mtd1 0 2097152
> +    Erased 2097152 bytes from address 0x00000000 in flash
> +
> +    root@1:~# mtd_debug read /dev/mtd1 0 2097152 spi_read
> +    Copied 2097152 bytes from address 0x00000000 in flash to spi_read
> +
> +    root@1:~# hexdump -C spi_read
> +    00000000  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
> +    *
> +    00200000
> +
[...]

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
