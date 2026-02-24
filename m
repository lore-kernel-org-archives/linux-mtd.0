Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 523E6EFB815
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Feb 2026 08:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZQIj2gZvkH3HqJptSTpGgpGg+wTPFJhV3lQ8yTmVnBs=; b=jUk6ov8WODTj+o
	3sh6ap6SIF1pBY5fP3lT7B+hKm9cTic5d2QWZpODVQYKsZ7/RcuiaIFJAl3JXd0eG6IjLIvln0v6O
	16lTLWPUBaPGt2j3USOCfq1q15CqNH/9UPR8IujlmGQywJ2BsTV93hPQBHlmHmp5H92gWuW1nlMNc
	4Hdf9k9gSh/YmVnAJ+pbIAm7veU0HsToj6Ggoa3vG1pSyI2PYDRlcIYSk4+R2/EiHDaxeJ8y3aOaJ
	myB5vVM8e9tImCpzoW/sCJv0rk+W/5nijH6aSa38OVIppVuIZLD0GkqN600a1z+Y9vjGA35kLXr6T
	tsZ/2dX9rsp47hlncnQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuniY-00000001ddu-1bJo;
	Tue, 24 Feb 2026 08:24:30 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuniV-00000001ddJ-17oP
	for linux-mtd@lists.infradead.org;
	Tue, 24 Feb 2026 08:24:29 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id AA340C143DC;
	Tue, 24 Feb 2026 08:24:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1ADE05FD9D;
	Tue, 24 Feb 2026 08:24:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5C44410368B4A;
	Tue, 24 Feb 2026 09:24:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1771921463; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=zPjzKhw1AxnfmEmjJdRMUR5r5zdOO8JlzBDPEyp693o=;
	b=HeB57+fnClU0MrGfFUoN6r+rkSjHGumxUq0UAYjtBPYwGwpAcxuGyUEnZ5oCeZOS4AY9Zk
	CB9fBoPMe6z//UALVcZNpwFFgvTEQm2/PQIO/3vGLnf0bRqf8RD4/bF+1Pxab5UQ8zCc0U
	dfIh4+cspJA9uU6mVcE+HWLagj/jrun70e9dsZVWf4jJfpDsNa8A35Iers9UWyLcQB9AFC
	AZDwAuE92KyOj/KVgvcNYJW0huwIUc0wWyyi2YEsQoUmFccQFi8CQDW4Pjed8b+uomSqoP
	C0G7YYARMrsJtXE2JWEoAy8A949405fEU4u6Yq0WVURYCot8KgHzfzg2VymNCw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Cheng Ming Lin <linchengming884@gmail.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,  Pratyush Yadav
 <pratyush@kernel.org>,  Michael Walle <mwalle@kernel.org>,  Richard
 Weinberger <richard@nod.at>,  Vignesh Raghavendra <vigneshr@ti.com>,
  Jakub Czapiga <czapiga@google.com>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  alvinzhou@mxic.com.tw,  Cheng Ming Lin
 <chengminglin@mxic.com.tw>
Subject: Re: [PATCH] mtd: spi-nor: core: Fix false positive in Read CR
 capability check
In-Reply-To: <20260224025550.1102660-1-linchengming884@gmail.com> (Cheng Ming
	Lin's message of "Tue, 24 Feb 2026 10:55:50 +0800")
References: <20260224025550.1102660-1-linchengming884@gmail.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Tue, 24 Feb 2026 09:24:15 +0100
Message-ID: <87ecmar1lc.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_002427_466175_F4F92CC5 
X-CRM114-Status: GOOD (  20.65  )
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

Hi Cheng Ming,

On 24/02/2026 at 10:55:50 +08, Cheng Ming Lin <linchengming884@gmail.com> wrote:

> From: Cheng Ming Lin <chengminglin@mxic.com.tw>
>
> The current code uses spi_nor_spimem_check_op() to check if the SPI
> controller supports the Read CR operation. However, this leads to a
> false positive where capable controllers are wrongly flagged with
> SNOR_F_NO_READ_CR.
>
> SPI_NOR_RDCR_OP defines an operation without an address phase
> (addr.nbytes = 0, addr.buswidth = 0). When this operation is passed
> to spi_nor_spimem_check_op(), the function overwrites op->addr.nbytes
> to 3 or 4 to test addressing capabilities (as it was originally designed
> for data read/write ops).
>
> This modified operation is then rejected by spi_mem_check_op() in the
> core spi-mem.c because it has a non-zero address length but a zero address
> buswidth, which is an invalid combination.
>
> Fix this by bypassing spi_nor_spimem_check_op() for register operations.
> Instead, directly call spi_mem_supports_op() to test the exact operation
> without altering its address phase.
>
> Fixes: 5008c3ec3f89 ("mtd: spi-nor: core: Check read CR support")
> Signed-off-by: Cheng Ming Lin <chengminglin@mxic.com.tw>

That is indeed a problem, I already sent a patch for that but there is a
bit of turnover in the spi-nor team. It hasn't been acked so I didn't
took it through the final MR. The problem now exists in 7.0-rc1, see:

https://lore.kernel.org/linux-mtd/20260108121430.1096844-1-miquel.raynal@bootlin.com/

> ---
>  drivers/mtd/spi-nor/core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 8ffeb41c3e08..13201908a69f 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -2466,7 +2466,7 @@ spi_nor_spimem_adjust_hwcaps(struct spi_nor *nor, u32 *hwcaps)
>  
>  		spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
>  
> -		if (spi_nor_spimem_check_op(nor, &op))
> +		if (!spi_mem_supports_op(nor->spimem, &op))
>  			nor->flags |= SNOR_F_NO_READ_CR;
>  	}
>  }

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
