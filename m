Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A9B0C4345F
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Apr 2024 18:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L6SubAHrKFA79sZ6jtkydpirvCdJ42w/AcSl5jGnKXo=; b=wF5Gq1Ebj1IqrG
	7ZAGXXIedLF137+QeyhflEtu1Mv7LTP6Yc9XfQwXiwcmCD6bFaAyX7E7Gh7zZPEZn1YVD72fZiHJ0
	RGqpXaUi9J48O3ohStjE0XtTFex2jTssQHY9OMJ1/qe2TGelQItEWTf4xrtnLIvmfEXZJXCda1TvG
	DWaxWgIl1D+rMoSTbLlkdY5x8fFpAHN9HN8dqr6E8wfDrwfn1XD1JPDQfRcvTpd1XzAhq2kAVuOeE
	9LdO7hAgK4zrDoee0PGO6v/EjYnZDyAuu5ALc/l8K5+WLoZA/F0Iqx8d3s614IfcU5SZgV8MCXc6O
	a3Hc/oI5OIhmZ3eqosVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxszA-00000006faV-0l6m;
	Fri, 19 Apr 2024 18:29:20 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxsz7-00000006fXN-1ua9
	for linux-mtd@lists.infradead.org;
	Fri, 19 Apr 2024 18:29:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4A11561A88;
	Fri, 19 Apr 2024 18:29:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94F87C072AA;
	Fri, 19 Apr 2024 18:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713551351;
	bh=6R+P+UeAxQGe+bDmE9m6x0YWHQzXSf7Vg9v8QpuqQ+E=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Bsamz1Ub8tO84zmAm44w4K/bujDprj6GzORuCSBYFXsWdTR+DEwii8xQZ4wMvAOB5
	 4IMNONXrgLiRdk1QSEnUi2dPfWFIWcWGmIer+qs9T+Ht4HOCDJx2/9gKCV4D0yY/MD
	 f9WBP0ewmLDw8Tgy+5KVxaLqpcMhHm25tj44c+Ktntnpto2oRtIJOSAT+oFrMdJLOg
	 F54tEdi4EWh8AwOsvax0n+yb9/CLNoRX6cq812xkw3gHr3oszB/Ix6+YTP7J0qKf9L
	 2cJxO9PZ2p6xNkWSCHUMnprXDnXErM49AHin+orzYNH9JCPiHYxJVYeYzJGnTBBiHQ
	 oPT1Kqp4azZJQ==
From: Pratyush Yadav <pratyush@kernel.org>
To: Michael Walle <mwalle@kernel.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,  Pratyush Yadav
 <pratyush@kernel.org>,  Miquel Raynal <miquel.raynal@bootlin.com>,
  Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Ricardo Ribalda <ribalda@kernel.org>,
  linux-kernel@vger.kernel.org,  linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2 4/6] mtd: spi-nor: get rid of SPI_NOR_NO_FR
In-Reply-To: <20240419141249.609534-5-mwalle@kernel.org> (Michael Walle's
	message of "Fri, 19 Apr 2024 16:12:47 +0200")
References: <20240419141249.609534-1-mwalle@kernel.org>
	<20240419141249.609534-5-mwalle@kernel.org>
Date: Fri, 19 Apr 2024 20:29:09 +0200
Message-ID: <mafs0plul5hqi.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240419_112917_565554_D20B231F 
X-CRM114-Status: UNSURE (   7.61  )
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

On Fri, Apr 19 2024, Michael Walle wrote:

> The evervision FRAM devices are the only user of the NO_FR flag. Drop
> the global flag and instead use a manufacturer fixup for the evervision
> flashes to drop the fast read support.
>
> Signed-off-by: Michael Walle <mwalle@kernel.org>

Reviewed-by: Pratyush Yadav <pratyush@kernel.org>

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
