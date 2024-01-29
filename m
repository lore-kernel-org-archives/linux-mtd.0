Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEF7AC47422
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Jan 2024 13:26:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ABtauNOYXn/YpnoRO1+v1cEBZnquA49Su+m7paof2RA=; b=dMN6bt8+CiZe8o
	VSkpgwZ0kfSZ9KDcbZwS5qKxofhSoxtmiBw6pTmOpT7US9J+1OIh6dY4pE3/ybE2rL32Zwk3J2O5h
	l/yIq4JQqE22DbulhrSOcfSU2nSvJoaLnbywKMBXf30qLXmVfELEmQFFlxzsArO0OVgs1yQfqpfJR
	Ckf1Bp5KmcQb8gP5H1lJ9hTTDn6VGTWBs/WOniuQImlAyF7kctax24l+Mv7vpvP6vmQ2e/ZUmlcOu
	x41NkZp6koApZokAaPyi3JiLKcP1kDzHjROZ9VWtkXtk8Lf5+vT/c2PXvMb96wpvH8jeRAv6zcSmr
	jmUrw8qolQTBcqgCbM8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUReN-0000000Cqxe-3D6q;
	Mon, 29 Jan 2024 13:26:11 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUReK-0000000CqwN-2rk2
	for linux-mtd@lists.infradead.org;
	Mon, 29 Jan 2024 13:26:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 01D24CE12AC;
	Mon, 29 Jan 2024 13:26:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 174E0C43399;
	Mon, 29 Jan 2024 13:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706534766;
	bh=B9azg97gvfK4Td1aCifOHkTCJtHZ+EM7jryOwYC5Ivg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=ByjR9RCxWhEtabgn2vOUB7EC3aJJ8x3MBQ90aw3vtEhiMXUF55XbpKOCMg0ZSZ1xY
	 WW0232pOokov6MLkD0AGziMEm5pDXng4CzSewP+QfNHXEB36vwAQS64NWFmmy0jncB
	 mJLzK3uclzRi/QMLSvipNaJ8ULKwmfKBv2YDQDtXciVxFseAzSRdP/gOD4bVWFjEfi
	 zlToiDyEy4byiQZjUmQS4qRzRi6IznUNpRs8g2EiwdxODd8buosk/w6NwlQEOebrXc
	 v6vSNkN1eMo27LdVpb4Y6atEz3CwhSZM8KchbDdQiOhisubQwCuS8zQ6CBD4NOoEDr
	 6wCkIcSM87IGA==
From: Pratyush Yadav <pratyush@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: pratyush@kernel.org,  michael@walle.cc,  miquel.raynal@bootlin.com,
  richard@nod.at,  jaimeliao@mxic.com.tw,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] mtd: spi-nor: drop superfluous debug prints
In-Reply-To: <120bf090-0c07-4971-a18a-a1b326f1b139@linaro.org> (Tudor
	Ambarus's message of "Fri, 15 Dec 2023 10:24:42 +0200")
References: <20231215082138.16063-1-tudor.ambarus@linaro.org>
	<20231215082138.16063-5-tudor.ambarus@linaro.org>
	<120bf090-0c07-4971-a18a-a1b326f1b139@linaro.org>
Date: Mon, 29 Jan 2024 14:26:03 +0100
Message-ID: <mafs0v87cs238.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240129_052608_936501_79DDF5FC 
X-CRM114-Status: GOOD (  10.72  )
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

On Fri, Dec 15 2023, Tudor Ambarus wrote:

> I missed to drop some unused variables. Will drop them if everything
> else is fine.
>
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index a708c3448809..92c992eb73d5 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -3492,9 +3492,7 @@ int spi_nor_scan(struct spi_nor *nor, const char
> *name,
>  {
>         const struct flash_info *info;
>         struct device *dev = nor->dev;
> -       struct mtd_info *mtd = &nor->mtd;
>         int ret;
> -       int i;
>
>         ret = spi_nor_check(nor);
>         if (ret)


With these, 

Reviewed-by: Pratyush Yadav <pratyush@kernel.org>

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
