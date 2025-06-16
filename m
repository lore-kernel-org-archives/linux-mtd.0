Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E35D9C71135
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Jun 2025 09:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u/fTmJaSH+Nsmyo/O8XiZfhCYfLwHz7ivch9f+AOywo=; b=Pv/LrwWxCoRDxwmJ/RdKzyNGRw
	ljL157dhioiP+q+7CBF8/CAIemkWeJHMcuCey+NWffRHWL+dMvgzAvh2Zn6TulO1kZY3Me1nNsVPe
	5+vgNUFHFmN2rZgTcEBZyonMcRTzTbX7sL8Fw2St/YVpRDUQ1PJBWMs3rqZI+u8aJlUqkS8Ec9iFn
	yN9N1RnoR0IMl4UQyYer731W7JiQ2rbEz4+wKdwa5fvmnwsGXhE7aDMBVPU98AmdUeG3KAOk6KluE
	PUkEm1dHNwK6bjgnjrsXF+iW5RDj1QGAtUg+/sVUsa1/AFwaw+Tuj1u3DdDHHH25fNazsQOV7FaRI
	m26dQqMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR5pa-00000003sYs-3n1o;
	Mon, 16 Jun 2025 09:08:42 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR51t-00000003lh1-01BO
	for linux-mtd@lists.infradead.org;
	Mon, 16 Jun 2025 08:17:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4C2BA60008;
	Mon, 16 Jun 2025 08:17:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34AB0C4CEEA;
	Mon, 16 Jun 2025 08:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750061840;
	bh=RX/BGpsttVos4YNus/F7PX/r2GOyG9GOp1sUAp5LHxE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=LkcRlDinZzYAd1pAJ7dYRWUupjd1G8KsV16M4mhVZ/WxDG1KeenEHweZWMsmxcomE
	 dNa8MNb1Gv4AoqcoelR5i83xksTKcfqc6amvhzPONk/v1gC8CF09686KyTZQkGzhnz
	 OYZotvvgQEO+2xYxdTrgkYJEYWZM23B1zEqhjTMsyt6l31QewN0cytbWFnnDjo97jR
	 8KXy4NFxgFDpPEIw1P5btXSRhYRY3A01HRmtR+SC0KO2Yzm8AUhVgFV0awfbraym6n
	 zuY6y8iH8qgEfJrKWnG3KyYOq6qMhC+aA6oua5LZGwvBbNV9/oNS+W3XDAGWwGanwj
	 27nKZJ4F+MyVw==
MIME-Version: 1.0
Date: Mon, 16 Jun 2025 10:17:15 +0200
From: Michael Walle <mwalle@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Tudor Ambarus <tudor.ambarus@linaro.org>, Pratyush Yadav
 <pratyush@kernel.org>, linux-mtd@lists.infradead.org, Alexander Usyskin
 <alexander.usyskin@intel.com>, Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] Revert "mtd: core: always create master device"
In-Reply-To: <20250613180722.1268159-1-miquel.raynal@bootlin.com>
References: <20250613180722.1268159-1-miquel.raynal@bootlin.com>
Message-ID: <b16dbc82976e2454afb6aa53ea97bd0f@kernel.org>
X-Sender: mwalle@kernel.org
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

> The idea behind this patch was to always let a "master" mtd device
> available to anchor runtime PM. Historically, there was no mtd device
> representing the whole storage as soon as partitions were coming into
> play. The introduction of CONFIG_MTD_PARTITIONED_MASTER allowed to keep
> this "master" device, but was not enabled by default to avoid breaking
> existing users (otherwise the mtd device numbering would be totally
> messed up with an off by 1, at least).
> 
> The approach of adding an mtd_master class on top of partitioned mtd
> devices is breaking the mtd core in many creative ways, so better think
> again this approach and revert the faulty changes for now.
> 
> This reverts commit 0aa7b390fc40a871267a2328bbbefca8b37ad307.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Should this have a Fixes tag?

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
