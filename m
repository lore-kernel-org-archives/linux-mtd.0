Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85BA51061B07
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Mar 2026 14:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fa5BV+fSDplRzNKsrUyhC2B3UHs+GvmI88i25foU1fo=; b=0QBzejhv/uSnR9
	CXmUvl7+TwxjSZjx4WUKePH7yAvvIMZPVzls9HzJaYH7vaf66XS4D/Vmc+oNGBZEuuV3E7aMwIInH
	lpzjAv8V/ytDAwbDaqH/8ly1EDgriQTJkA4Qd2FuOuJ7q7r4SjgXsgpTWgRXuavskO+6cKr9wUXd5
	7VxjaZvJciFZ1I6BT1Tm8SRGmTIm2H9bDZYR1S+51baK+jTDJ36DkcYfN54k0W6mlu3DSWZdqpwA8
	q2EFkfuiIjXDyjDOBKTIvihIbqR5bd6XHX56Uj8BWBVOgWrhej/FT/xZwZdfSXqx+ovg6LfeefmuT
	pLqS4+RCJdDkARq60JVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7E3N-0000000BWmS-1cQi;
	Mon, 30 Mar 2026 14:57:21 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7E3L-0000000BWm4-2MfE
	for linux-mtd@lists.infradead.org;
	Mon, 30 Mar 2026 14:57:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D04F1440FC;
	Mon, 30 Mar 2026 14:57:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF0C2C19423;
	Mon, 30 Mar 2026 14:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774882638;
	bh=1gI6dUoAUj8KI/jS+DQQsDNccGUp1WnD6AMgHljigU4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=RWpcAbsWyohbBNVRI/28hU3kGOyBUH3bs3DIohP/HKwq1n+AOhBTqOKj0lsX36VJY
	 TINZAsardVUEhpNXMUIZrda66iipzfm0Zdgod0VcsNWdr8BXgGLqvK1QqM4xoqUT8U
	 TxhuhCQxEXE4HqAs2Oq29T3S72vrZkLi9zI0UvdSB8b2NUVjmCA4sz9CsSEjoeENUE
	 vA8I3n/O3a0/ZYrv3l1VRofzmBq+/288ppY3G/wepxo8MUlZ88/TNXGpZIOgtR0uRQ
	 87YLwiEzOpBcIeOZ1j8DsWZTou3EGY324VvfHNArWPyD2nYCoQRjVywLSj8R00OrfX
	 u6nwmcbfXXcdw==
From: Pratyush Yadav <pratyush@kernel.org>
To: Haoyu Lu <hechushiguitu666@gmail.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,  Pratyush Yadav
 <pratyush@kernel.org>,  Michael Walle <mwalle@kernel.org>,  Miquel Raynal
 <miquel.raynal@bootlin.com>,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: spi-nor: micron-st: Enable die erase support for
 MT35XU02GCBA
In-Reply-To: <20260323114636.2020-1-hechushiguitu666@gmail.com> (Haoyu Lu's
	message of "Mon, 23 Mar 2026 19:46:35 +0800")
References: <20260323114636.2020-1-hechushiguitu666@gmail.com>
Date: Mon, 30 Mar 2026 14:57:15 +0000
Message-ID: <2vxz4ilxjrg4.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_075719_619192_830942C5 
X-CRM114-Status: GOOD (  22.31  )
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

On Mon, Mar 23 2026, Haoyu Lu wrote:

> From: "haoyu.lu" <hechushiguitu666@gmail.com>
>
> The MT35XU02GCBA flash device does not support chip erase according
> to its datasheet, but supports die erase. The existing code had a TODO
> comment noting that the SPI_NOR_IO_MODE_EN_VOLATILE flag probably needs
> to be enabled and the driver implementation needs to be converted to
> use die erase.
>
> This patch enables the SPI_NOR_IO_MODE_EN_VOLATILE flag and adds the
> mt35xu01gbba_fixups to the MT35XU02GCBA entry, which includes the
> micron_st_nor_two_die_late_init() function that sets up die erase
> support.
>
> With these changes, the flash device can properly use die erase
> operations instead of chip erase.
>
> Signed-off-by: haoyu.lu <hechushiguitu666@gmail.com>
> ---
>  drivers/mtd/spi-nor/micron-st.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/mtd/spi-nor/micron-st.c b/drivers/mtd/spi-nor/micron-st.c
> index 88033384a71e..4e8c6ef14697 100644
> --- a/drivers/mtd/spi-nor/micron-st.c
> +++ b/drivers/mtd/spi-nor/micron-st.c
> @@ -220,7 +220,8 @@ static const struct flash_info micron_nor_parts[] = {
>  		.size = SZ_256M,
>  		.no_sfdp_flags = SECT_4K | SPI_NOR_OCTAL_READ,
>  		.mfr_flags = USE_FSR,

Since the TODO comment is now resolved with this patch, please remove
it.

> -		.fixup_flags = SPI_NOR_4B_OPCODES,
> +		.fixup_flags = SPI_NOR_4B_OPCODES | SPI_NOR_IO_MODE_EN_VOLATILE,
> +		.fixups = &mt35xu01gbba_fixups,

Also, rename mt35xu01gbba_fixups to something like "mt35_two_die_fixups"
so the naming isn't confusing.

With that,

Reviewed-by: Pratyush Yadav <pratyush@kernel.org>

>  	},
>  };

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
