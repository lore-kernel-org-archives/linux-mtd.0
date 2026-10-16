Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F0B0CC6B38
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Oct 2026 06:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/nGVVDU5ioBn7zeToNDgPphgofOosNKF5kDCozygbpo=; b=tL7hlrU9DKPVEB
	coRBNyzMXuzy0xA6esWsPQoCwGytQT5Wcl5BGsevS18vMYsxI60iJK3LrnM7Un+yz+vQ3+8OCtchP
	Y8K81M/CfFGZne0791DfSg2pDzMx4mHx94PZa/5lV7ErsSQhiwpgAJtiZaEXepam5cYz+THPcERMG
	LJVblR3l5rVq14IItzAgZmbtCaajEhR9jJHgLWZVpfm6z0BfqGmNkXuIwrZmgpEIC6gh8lxwhwmMl
	xPXF5dOuMTqSFFN94MYwe4T2y8Sej7CYzpaVogVewlJEnhO1zC7SLS4uLoChuoRlpp8mCHj8WSomc
	xwO/N5pe9ooZXbn9Emcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHbdD-000000028o0-3EH2;
	Fri, 16 Oct 2026 06:41:31 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHbdC-000000028nu-3FCa
	for linux-mtd@lists.infradead.org;
	Fri, 16 Oct 2026 06:41:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 437EE41917;
	Fri, 16 Oct 2026 06:41:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C5AE1F000C4;
	Fri, 16 Oct 2026 06:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792132890;
	bh=VdouQ0ydHfSbTZsgO+bOmYzH+PNr65ZVU+s/MbMiUME=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Di2K7ZEkf7s+7Q+o8I6cxtw3iGM3sFyhOI/i69++P58ngosuyS+0BwMLP8lIxi3lM
	 4UQnU36cdDnXs0O9uL3xoUmEstXF3G9oh5kGkKCFeMCzJw4FSVzuPjwJQtvKYr9PcR
	 MgfVNyKecl2xEwniZB6ilBPbidVPflHM/ugzX30rFWCPPEzqS+dUT3uUb2asw8rcyG
	 TTj7bu7pTeML+B6LCJkblz/Xw8axDz543wrat7Wv8hkNvGcUMVHS+VgIgAiezFvcPH
	 4ggZF4tNoOS+wcbVuy2dcBtlC+BP8h5UxzkNn2xHu4PomDXgu2aGvzCkvfpLSXpgx4
	 Rpr8/5Sf2ycdQ==
From: Michael Walle <mwalle@kernel.org>
To: Pratyush Yadav <pratyush@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Michael Walle <mwalle@kernel.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel test robot <lkp@intel.com>
In-Reply-To: <20261015084219.887963-1-mwalle@kernel.org>
References: <20261015084219.887963-1-mwalle@kernel.org>
Subject: Re: [PATCH] mtd: spi-nor: sfdp: fix missing kernel-doc
Message-Id: <179213288823.1140554.3724392142186032224.b4-ty@b4>
Date: Fri, 16 Oct 2026 08:41:28 +0200
MIME-Version: 1.0
X-Mailer: b4 0.16.0
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


On Thu, 15 Oct 2026 10:42:14 +0200, Michael Walle wrote:
> Commit 69d9d7dabbeb ("mtd: spi-nor: move spi_nor_post_bfpt_fixups() into
> sfdp") added the kernel-doc but missed one description for bfpt. Fix it.
> 
> While at it, also add documentation for the return value.

Applied, thanks!

[1/1] mtd: spi-nor: sfdp: fix missing kernel-doc
      commit: 7dc9a4e7b9fcee871d021765c90943c4bab91474

Best regards,
-- 
Michael Walle <mwalle@kernel.org>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
