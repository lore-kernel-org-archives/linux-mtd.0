Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29774C4345F
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Apr 2024 18:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ISxph60aWhfKhU0kP9QrFrxx/guMXJXqMngGeugQuUQ=; b=HN9r0I17NVUEZO
	UG+gCmuw+ph4wWDcKOWbwN0vTGJtSxHs0fM/QF9/qqu4BJ74hA4GQYG/G4DQnAE6Zv+Y5gSIvdRS8
	MvMjzQekY//QSXUjsBFTyGDuL3lQ2oHl4vKeWWLDPCYtnbI8iXVtjUWo3EZI4ouH31LRI+U0PRdQn
	7iwxUWYuV5JScYKT/K080X6SwSCs1KuN5H3UlpR/c2bflWHUng4J9vtYDRAaUotYAJvrKTotfAAD+
	yrKNHZIUzRHVMKaoDDMqTEwSvCMYvf1netJGhJfgNiNcTZQVavAxJu+jRqikwoeV0Ch7m0/c78GLP
	LGCCintc3zZcbvFtQdnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxt87-00000006gfz-3FrO;
	Fri, 19 Apr 2024 18:38:35 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxt83-00000006gey-2oR5
	for linux-mtd@lists.infradead.org;
	Fri, 19 Apr 2024 18:38:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 896F4CE1B62;
	Fri, 19 Apr 2024 18:38:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45FEAC072AA;
	Fri, 19 Apr 2024 18:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713551908;
	bh=ZOS9L6gLwP6b/xeU427rZP/WZ0gaX15ZtL62rJMAeJc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=iaHh+Q6yNq9xvqNAIvxIbUtg0d/8uQ3OD676NsKqlHm8D/MkNk+0n/NqokZrE8uTe
	 oWK+MoJnpjq2PGd4ddvLMNv8KIC5ZV6Vd3H/qwSX+0VXOU6SBQJNmJ4ZM+Oac77Zsi
	 A2kjcFKIibOhNANF0AYafbYk8ECAHcGmDTafERY8+d/V5B9rhH3SRK6yNIpl859c8d
	 ZCVu0InCWfQKscimmy2Q/hQwsyPFIgxpqSJKxcdtZVFGi7CGk0ixZxTBRQgX6i0LFJ
	 GVQ+wuUvCKCbm4RD72099kxbo31IF1ZU/eSozFKJQf2R4Cx1IHdxGEFf2Ldr6Dh7sW
	 EZtpzQgWRAKcA==
From: Pratyush Yadav <pratyush@kernel.org>
To: Michael Walle <mwalle@kernel.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,  Pratyush Yadav
 <pratyush@kernel.org>,  Miquel Raynal <miquel.raynal@bootlin.com>,
  Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Ricardo Ribalda <ribalda@kernel.org>,
  linux-kernel@vger.kernel.org,  linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2 6/6] mtd: spi-nor: introduce support for displaying
 deprecation message
In-Reply-To: <20240419141249.609534-7-mwalle@kernel.org> (Michael Walle's
	message of "Fri, 19 Apr 2024 16:12:49 +0200")
References: <20240419141249.609534-1-mwalle@kernel.org>
	<20240419141249.609534-7-mwalle@kernel.org>
Date: Fri, 19 Apr 2024 20:38:26 +0200
Message-ID: <mafs0le595hb1.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240419_113831_940064_2BF010E8 
X-CRM114-Status: GOOD (  10.81  )
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

> SPI-NOR will automatically detect the attached flash device most of the
> time. We cannot easily find out if boards are using a given flash.
> Therefore, add a .deprecation_version to the flash_info struct which
> indicates the kernel version after which the driver support will be
> removed.
>
> Signed-off-by: Michael Walle <mwalle@kernel.org>

Reviewed-by: Pratyush Yadav <pratyush@kernel.org>

Would also like to get an ACK from Tudor for this patch.

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
