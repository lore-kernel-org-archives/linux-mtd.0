Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2EFFC433FE
	for <linux-mtd@archiver.kernel.org>; Sun, 20 Nov 2022 15:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SYABNkPVOmEptusQkvY0sbAy62w1C4Rn9UkL4dHXD2Y=; b=40uAHoqmltzwa9
	D5rTPox2bN6DS6OBScAx/1k1ztJCntNZRM9qKPkTxStGn5XJiMGBM//+cMWMm137AZ2DsWwlTh6mZ
	4w/+r/cRDT12D7RdqMiodbYyzRSJ9Ujp2XlvrYXim4/y8vM7a+6Y54j2SiUeM6yUsO+sGTQZ20qti
	ATYhVOh4VzsUC+0IhU93F/LQkheyvJtQ2+iUAFaIGcK0+b3v1ypS8aNJMDNyF8HoHFA6NvW6xK6qb
	lSLGTPcU894TBQGKqy4dI4q1bg4Wi1CQEius5eJQbKpmFkDYaAwYH/A3/s4lsWJlEk37deeJHGxKg
	q/VspaaW5EUhbmLLPztQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owlzS-0059Lr-MR; Sun, 20 Nov 2022 15:12:14 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owlzQ-0059JA-MV
	for linux-mtd@lists.infradead.org; Sun, 20 Nov 2022 15:12:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id AFDE7B80ACA;
	Sun, 20 Nov 2022 15:12:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 028D8C433C1;
	Sun, 20 Nov 2022 15:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668957122;
	bh=OptdsyuD6uPrHmZmntrSB3Cvr0WP7pXgeP/BVx5u/Vg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HHrpSSsgJCRQ591jzNDSzvLB79e8nznwNyikVfZSlsGpo6X7nE/qL2kzMvwQqJBse
	 A9W+ADwVfvTzecF7bKDckTKMVCyX5HSKsDrajyrg8cekLXIfWhKB4EVHf0zSVVOkcx
	 xSc5wnD+3HZbOaEZFCMsoNvSF/2TX0moPW19usXdMasK3q8s8A/s8HMNsJJZHg19v6
	 jyvWAYmby6hzPThn9F+I+aNHYQJ/tJpU9wWlTEorHdkgC+rTNo9K1IowYo6o8Qeyir
	 gjr7LHsfC/KWZKHCKp2ikb9bpRGWjTFRK+/bhMOANuCjNuvKvN2ILzD+EKqyOqQXnd
	 6Ev0syqsk1AJw==
Date: Sun, 20 Nov 2022 16:11:58 +0100
From: Pratyush Yadav <pratyush@kernel.org>
To: Dinh Nguyen <dinguyen@kernel.org>
Cc: linux-mtd@lists.infradead.org, tudor.ambarus@microchip.com,
	michael@walle.cc, linux-kernel@vger.kernel.org,
	Niravkumar L Rabara <niravkumar.l.rabara@intel.com>
Subject: Re: [PATCHv2] mtd: spi-nor: macronix: Add support for mx66u1g45g
Message-ID: <20221120151158.p5jukj7r6yj5t7sm@yadavpratyush.com>
References: <20221111164015.165581-1-dinguyen@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221111164015.165581-1-dinguyen@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221120_071212_903746_79D26AFE 
X-CRM114-Status: GOOD (  18.36  )
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

On 11/11/22 10:40AM, Dinh Nguyen wrote:
> The MX66U1G45G is the smaller sibling (128MB) of the MX66U2G45G (256MB)
> that is already supported.
> 
> Tested on Intel N5X socdk board,
>   - random data write, erase, read   - verified erase operations
>   - random data write, read and compare  - verified write/read operations
> 
> Signed-off-by: Niravkumar L Rabara <niravkumar.l.rabara@intel.com>
> Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
> ---
> v2: fixed compile error by removing , after PARSE_SFDP
> ---
>  drivers/mtd/spi-nor/macronix.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
> index d81a4cb2812b..07ace9da74b7 100644
> --- a/drivers/mtd/spi-nor/macronix.c
> +++ b/drivers/mtd/spi-nor/macronix.c
> @@ -97,6 +97,10 @@ static const struct flash_info macronix_nor_parts[] = {
>  			      SPI_NOR_QUAD_READ) },
>  	{ "mx66l1g55g",  INFO(0xc2261b, 0, 64 * 1024, 2048)
>  		NO_SFDP_FLAGS(SPI_NOR_QUAD_READ) },
> +	{ "mx66u1g45g",  INFO(0xc2253b, 0, 64 * 1024, 2048)
> +		PARSE_SFDP
> +		FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
> +		FIXUP_FLAGS(SPI_NOR_4B_OPCODES) },

Why do you need these extra flags? Can't they be discovered by parsing 
the SFDP? If they can't, then you should explain in your commit message 
why that is so.

I would suspect they can be, so perhaps you should try using your flash 
with just PARSE_SFDP and see if it works.

>  	{ "mx66u2g45g",	 INFO(0xc2253c, 0, 64 * 1024, 4096)
>  		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
>  		FIXUP_FLAGS(SPI_NOR_4B_OPCODES) },
> -- 
> 2.25.1
> 

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
