Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CD80C61DB2
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Jun 2025 12:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DX4qTzBYX6feZy7Jd8Hf97GYEfwhf+rCmhJIqg4+wPA=; b=JA6wgHiTxK6VN1
	4eZJ793Mzl93ApsmOtHuHGTB7TOtE6lO0fXd1B0Oj/E1669o/+2rFxeOKAtjefPbvx9FnkHjjjhSr
	GCktQNXqGxR/JV05dkirSVYAhPl4kaemZ52Sg7U0sQ5nbfS+tSXYpRpYkBGSFuso6vTQxbYTV+jsg
	3v4pbPUAcojpEPdQLgStg1l7to3Rc3jy82O20xUq39DX5zYLUGq/OZUxcUFcVET6LG9fBmfTMD0EZ
	pDMV6u5Vd79llJlFG91LF2UWyJmClb9g3XOq9yQJc+xsG9AZdZhmXcGbJ4NXviBVB6g0sE9jlMq8U
	sEk8aY1iNi5HLoc2P3nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ3oe-0000000GPKd-2s9r;
	Fri, 13 Jun 2025 12:47:28 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ3od-0000000GPKK-2i9r
	for linux-mtd@lists.infradead.org;
	Fri, 13 Jun 2025 12:47:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D0B65629D7;
	Fri, 13 Jun 2025 12:47:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22C82C4CEEF;
	Fri, 13 Jun 2025 12:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749818846;
	bh=g2dogdyJeVzP2bnvCVd+eFIZvlGUbvWyHRKGyaI4D/Y=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=EBNyP5DXETncZtV1JHQ+ZCQFsd3cBPfzAK2Nr1O7QDKcrT6uY+9BVEg5ArooY1y6D
	 5PVDbWSx/bkXdkJMU/M/OVRQmAEtXxXWM/FNXCqm8fUU1D6MLRo4mamW+SSXlxLfI7
	 ljBMON5bM1U4x7IX0LC2jhmr+/X144Ciw4OkxD5LKppBkKEKt1XLVKaBVXRDv7Tji1
	 06avPcTGaTY5w3f4U66yGLHBpuUzqtMVSzccfLhzQDeAHuNewkAVaY3TqqVz8qP75S
	 r9iyqQ5u6wihKaIx5mlIU20G1K7Sy4FaK6qRjNxdEVWI9YIOmy+IKEYgi2tBRHUF53
	 tkJt29aNRMyMA==
From: Pratyush Yadav <pratyush@kernel.org>
To: tkuw584924@gmail.com
Cc: linux-mtd@lists.infradead.org,  tudor.ambarus@linaro.org,
  pratyush@kernel.org,  mwalle@kernel.org,  miquel.raynal@bootlin.com,
  richard@nod.at,  vigneshr@ti.com,  Bacem.Daassi@infineon.com,  Takahiro
 Kuwano <Takahiro.Kuwano@infineon.com>
Subject: Re: [PATCH v2] mtd: spi-nor: spansion: Fixup
 params->set_4byte_addr_mode for SEMPER
In-Reply-To: <20250612074427.22263-1-Takahiro.Kuwano@infineon.com>
References: <20250612074427.22263-1-Takahiro.Kuwano@infineon.com>
Date: Fri, 13 Jun 2025 14:47:24 +0200
Message-ID: <mafs05xgzolk3.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
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

On Thu, Jun 12 2025, tkuw584924@gmail.com wrote:

> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
>
> Infineon SEMPER flash family does not support E9h opcode as Exit 4-byte
> mode (EX4B). Therefore, params->set_4byte_addr_mode is not determined by
> BFPT parse. Fixup it up by introducing vendor specific EX4B opcode (B8h)
> and function.
>
> Fixes: c87c9b11c53ce ("mtd: spi-nor: spansion: Determine current address mode")
> Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>

Acked-by: Pratyush Yadav <pratyush@kernel.org>

[...]

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
