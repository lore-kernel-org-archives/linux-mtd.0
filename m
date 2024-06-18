Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A9E0C27C4F
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Jun 2024 09:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vRDu49PXcFxaZrbvZakfwBrMSVicb0dhDUepDw8/WA8=; b=Laf2vPoOhbxpwo
	zVp0HqdHPkz6vMdBRq5VC4HzqxT9znkNXmNBCEfvpaYbfZM4fTJjetVbKk6j1NxupAKR0U01IHOMb
	dzQI/UKem4HeqkEmHSVCrYcBv9sKHeKpXD5cv2Xfh7EeOCjl9I8PBKNIWRwRDiDdBSt1XWnrkDmxB
	pdL7bbrZvYwOXLxOkl6geYPropr+F9446ZLHhQGBcDINkneJvJoctuEoMpY25qCP/+NbirkZwHiNH
	EF4IlImYpsyjTRSe8oGrT2vJU7RV4zNMTHjjypV8GLfas2qsAZNkW9EopYOxCilYS/qB79LVAwcpb
	6b8t1XtW+WnMteYZ1JpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJVQg-0000000EDbS-3Zrw;
	Tue, 18 Jun 2024 09:47:06 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJVQe-0000000EDaA-0f0t
	for linux-mtd@lists.infradead.org;
	Tue, 18 Jun 2024 09:47:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 28D3FCE1267;
	Tue, 18 Jun 2024 09:46:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E279C3277B;
	Tue, 18 Jun 2024 09:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718704017;
	bh=6O3sFl1pZpZZR7SQOG6oCoyieI6o9fo/6vwo1TZ8Wb4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=oAfCJI6zKvN7RB+joh5rZyjUoh4d23/H3rCgGKBpWs4veguDH+mFphpXI7pvF+POm
	 EJDR19dfgBNWF0/2i65g5jVapyL7RV1074+9f9L0cJD3uUVrcnT87z3q5nUgZ7YPxw
	 bfDxqGyN4E9c0GOC9uebMe3zXuD0kYPeUqJj5X/bu5fyt5/UDCj6YofaCgrVS2i8Kl
	 womM3dkhiZl9/LU41MRac6EVfofsTQUicVsKBSup1T0RHBR7Gfhg9T3tFjIZuGqdMW
	 EX/npAuHyM0JkbMMQzyn021AB5dQ6Aw3nL8RnumkxVVZZic4/l6nIoB2UiWG/RBnEz
	 ASW5KyZKgGR7w==
From: Pratyush Yadav <pratyush@kernel.org>
To: Michael Walle <mwalle@kernel.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,  Pratyush Yadav
 <pratyush@kernel.org>,  Miquel Raynal <miquel.raynal@bootlin.com>,
  Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] mtd: spi-nor: simplify spi_nor_get_flash_info()
In-Reply-To: <20240603134055.1859863-1-mwalle@kernel.org> (Michael Walle's
	message of "Mon, 3 Jun 2024 15:40:55 +0200")
References: <20240603134055.1859863-1-mwalle@kernel.org>
Date: Tue, 18 Jun 2024 11:46:54 +0200
Message-ID: <mafs08qz2fur5.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240618_024704_706221_6D87C103 
X-CRM114-Status: GOOD (  13.73  )
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

Hi Michael,

On Mon, Jun 03 2024, Michael Walle wrote:

> Rework spi_nor_get_flash_info() to make it look more straight forward
> and esp. don't return early. The latter is a preparation to check for
> deprecated flashes.
>
> Signed-off-by: Michael Walle <mwalle@kernel.org>

Reviewed-by: Pratyush Yadav <pratyush@kernel.org>

Applied to spi-nor/next. Thanks.

> ---
> v3:
>  - rework the handling quite a bit, thanks Tudor.
>  - drop the spurious comment about the partitions, it goes way back
>    until the initial support. I don't think it's accurate anymore.
>    If the flash has the same size, the partitions can be trusted. If
>    not, anything can happen.. We don't know.
>
> v2/v1:
>  - none, this is a remaining patch of my spring cleanup series.

Do you also plan to re-roll the deprecation patch some time in the
future?

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
