Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F332E77173
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Dec 2024 16:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SCTgoQCgYM8bhfEf4nAuqd4xqMh+7S9EtuigzgDjqmM=; b=ykL9dagQj5e5eR
	WfLtiTmSQynQwrGA1msZBuz9SEBQYpgTfPrhuHHHmSuy3DyFrn7FuN2qdzHnQc8gRiL/8yD0gy4hD
	vj073e9cef3QujIpSOdm0W60Pekk2UZBOqDBeXNeB6XSgiKwg/VVNCNDw0JdcWzXyU1Oj2U4XYjUu
	0l2pXCIEZ9MZdNY6eYHceLTH+slTX6AXDTe/iMooijGc2nby6193Z5armkag4YbYw5OI/PTWmctJn
	d1lu0AOsqJc9/W4mKUVBMImFhbBBxHNyzSmdx7HEbRv5QmgxqqTVO6SZAYnWZ6Wdru77qyrCJHoAV
	1dP8OwJdgYnSahm5btFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJb1y-0000000283K-1ZKZ;
	Fri, 06 Dec 2024 16:18:14 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJay8-000000026yY-1Xpp
	for linux-mtd@lists.infradead.org;
	Fri, 06 Dec 2024 16:14:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 21F405C748B;
	Fri,  6 Dec 2024 16:13:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2426FC4CEDC;
	Fri,  6 Dec 2024 16:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733501655;
	bh=egg6B1XJqelvLMOaLPHyotIig6IkJjdVlydbWKdcwkc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=uK/1iR9KLQw42qFVzDqumH9rtajoQUE/jPOMpBuCFAM8H9xKcYM6iBI+tOMVTgLif
	 gvcl1z0o+BU1OgYsFelfMFdhezrQ5qUZLZNEBAb5yXS0WtzFyJLxfbSeSeUi9HWkci
	 Ii9aAGw94PKiMCwUr8/gKoBGdDdOMngCfdlXkCIZo1rm5dyceLPyf49MYOmyZwCJpM
	 HwW1uI4Sb37yCEh4nQzNP6ZtaqDur+NUy/7ZUm5YxQM90mRB6iafYjUY0bxuZT7FZm
	 5BLZYt8HBLvacBe3P3WwI44y1l3H8TeGmv8mM882kHyQHFBZ46/eLSk3yIjj7WabIW
	 /nUynrTfWe++Q==
From: Pratyush Yadav <pratyush@kernel.org>
To: Parth Pancholi <parth105105@gmail.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,  Pratyush Yadav
 <pratyush@kernel.org>,  Michael Walle <mwalle@kernel.org>,  Miquel Raynal
 <miquel.raynal@bootlin.com>,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>,  Parth Pancholi
 <parth.pancholi@toradex.com>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mtd: spi-nor: macronix: remove mx25u25635f from
 parts list to enable SFDP
In-Reply-To: <20241105105844.257676-1-parth105105@gmail.com> (Parth Pancholi's
	message of "Tue, 5 Nov 2024 11:58:44 +0100")
References: <20241105105844.257676-1-parth105105@gmail.com>
Date: Fri, 06 Dec 2024 16:14:13 +0000
Message-ID: <mafs0y10s3i22.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_081416_449227_58B97D58 
X-CRM114-Status: UNSURE (   8.17  )
X-CRM114-Notice: Please train this message.
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

On Tue, Nov 05 2024, Parth Pancholi wrote:

> From: Parth Pancholi <parth.pancholi@toradex.com>
>
> The Macronix mx25u25635f flash device supports SFDP initialization.
> This commit removes the specific mx25u25635f entry (NOR ID 0xc22539),
> along with its size and flags, from the NOR parts list. By removing
> this entry, both mx25u25635f and mx25u25645g (which share the same
> NOR ID) will utilize the generic flash driver configuration.
>
> This change allows both devices (mx25u25635f and mx25u25645g) to
> leverage SFDP-defined parameters, enabling dual and quad read
> operations without the need for manual adjustment of no_sfdp_flags.
>
> Link: https://www.macronix.com/Lists/Datasheet/Attachments/8663/MX25U25635F,%201.8V,%20256Mb,%20v1.5.pdf
> Signed-off-by: Parth Pancholi <parth.pancholi@toradex.com>

Applied to spi-nor/next. Thanks!

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
