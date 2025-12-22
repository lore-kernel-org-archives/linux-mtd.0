Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADCAEE677EA
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Dec 2025 15:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0+MB4z2zwNN8qOWTEQXYvbqs28c9tIurZHxmUIIdyTM=; b=sObVyZNbpSVxA3
	oNAqisoRB+WgQ6wtx5hhNfLlHNs5SCU7tGNZ9bHIG8BZDhhdOC+I+wYHYU97l9T8fIL4v/3lqIr7Q
	RgtksG902ahr13gliv/t979wzm5elLIMvUrAbrDkyvCgRI2AMoHpyqUbDwmHu4nsB/vG33LSjRMtG
	5Cscs+BueCBZNP/6tPuMrfpYv1reeIhV2d6k9A9X/6b0X+Yf4qQ7P3L21mEUzZ60UBH4izryaAtAm
	FaKHvzli+SRHGysOgXYI0hbe1nizcf1+RrzGvxE2Nyg2sJjBcQHcilNNJJD5TZzrphuLxXP98KzWh
	ojq0w/2aeDA1GMI3dcwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXi2S-0000000Dvxl-0l1P;
	Mon, 22 Dec 2025 15:41:36 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXi2P-0000000DvxS-2ESV
	for linux-mtd@lists.infradead.org;
	Mon, 22 Dec 2025 15:41:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CC28C41995;
	Mon, 22 Dec 2025 15:41:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3F94C4CEF1;
	Mon, 22 Dec 2025 15:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766418092;
	bh=8IA9HvtxR5e7nLsJzjscOyKSWQDoJYG2fj8b52Rg5xQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=CinNhiTMrDXg5wq2oG5VXEL5Dg/jw9mlhWHV4SU6PAZy9e3ysxMGxbe5mZXbdwjc3
	 iZg2agGsg/3B2NuX9g3j2leG+MLckugfIu3ZXz2TjKtH4vINa4H9+uwND7DxWEidR2
	 xpULi3aS42CPjlWeoUsdQZXDqOSL9cZSIpC7IAgBsOV8qQIzYpQJGSD/j8NvXidLvA
	 Mup+ZqVmj7CdaG4DRZi8K7H761MmtBxJTrINs8yBWd94HDaf/sg1ur2ZWuTK3Xx5CA
	 LkgC8ml7lAhXPeMj4fwB6tpiz5ENvERAmx37r1ZdOwnLy9FuOm7rKSfpiYYSulNGJQ
	 igszOKeiWI2RQ==
From: Pratyush Yadav <pratyush@kernel.org>
To: Jonas Gorski <jonas.gorski@gmail.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,  Pratyush Yadav
 <pratyush@kernel.org>,  Michael Walle <mwalle@kernel.org>,  Miquel Raynal
 <miquel.raynal@bootlin.com>,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>,  Pratyush Yadav <p.yadav@ti.com>,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: spi-nor: update spi_nor_fixups::post_sfdp()
 documentation
In-Reply-To: <20251218095430.30103-1-jonas.gorski@gmail.com> (Jonas Gorski's
	message of "Thu, 18 Dec 2025 10:54:30 +0100")
References: <20251218095430.30103-1-jonas.gorski@gmail.com>
Date: Tue, 23 Dec 2025 00:41:25 +0900
Message-ID: <86bjjqcymy.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_074133_616588_AE0A97AB 
X-CRM114-Status: UNSURE (   7.59  )
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

On Thu, Dec 18 2025, Jonas Gorski wrote:

> After commit 5273cc6df984 ("mtd: spi-nor: core: Call
> spi_nor_post_sfdp_fixups() only when SFDP is defined")
> spi_nor_post_sfdp_fixups() isn't called anymore if no SFDP is detected.
>
> Update the documentation accordingly.
>
> Fixes: 5273cc6df984 ("mtd: spi-nor: core: Call spi_nor_post_sfdp_fixups() only when SFDP is defined")
> Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>

Reviewed-by: Pratyush Yadav <pratyush@kernel.org>

Thanks!

[...]

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
