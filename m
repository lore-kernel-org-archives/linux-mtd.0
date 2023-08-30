Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DB38C6FA8F
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Aug 2023 12:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P3WiaMroB1IrtOziGIa12wIk3hOFkZjCBNnNm/P3Y6A=; b=mhCfSfxrcg1yO8
	7tB+p5PnuI9RiHdMaQZTLd8xuRmxEjRB/s58ZqcqQ14oQ56jv3xwcCRfQ/K/uoHZ02E/LVDjnP3X5
	uEvXnnD4gtfQWT3GGOS3GujNTWX03rss1ya+/+fEWXLwwhhhPYe7AojxVAOjvArrKAQ9m8xZkoDIP
	c+jW+6GSoAg5HihaRpx9DwoLO1AdSUORyBch8xWBj9je9lpX/jm8nSL4/CgIFLIh9CAWNyYxOV7SX
	pczlzI5B+XTMb3C0rreJoV2mDZqntTY8cyPi5d9VAnd8bRTpQW80LBsLFJmMtKsNvPcipo5AoF5mA
	3HnmavDF0dtdVVEQKSpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbKAl-00DSn3-1G;
	Wed, 30 Aug 2023 12:19:47 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbKAi-00DSmh-0P
	for linux-mtd@lists.infradead.org;
	Wed, 30 Aug 2023 12:19:45 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9C92562644;
	Wed, 30 Aug 2023 12:19:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35276C433C7;
	Wed, 30 Aug 2023 12:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693397983;
	bh=0ZJakMDxCfcw2QZ9pOt6kXe0KlVTEjDGHCfwEPNgDRM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uc9Vso8xRKGBDD1JsnyeAauloHfTi+eHmouQXVWP8RurJW43pBA5sfSP7qwsUQdhz
	 tEUQZRkFZ7FMVw/cCZ7ykArxQXJ222UxNMz092/r54633OMkc+GMSKCrSYNtr4lKPl
	 F3bffAGjAXBEaeMKLOLagNAkoKZxquanpGgto3CMW0sEhkezXps9F+smCl4ahQR1X7
	 QWa88BZ5T2UKCfAbf5fbWGbIeCmGpjhJz6pBOHzckWZxi2S2DzYlRennf/kEjAx5dM
	 BFOdEtpfp4MiqlnXtVstAu9QcYqtDb7kXirCtX02jx5koVHnegmPIAGA8WUyuaGXhI
	 YUSqkLyOMlKfw==
From: Christian Brauner <brauner@kernel.org>
To: Christoph Hellwig <hch@lst.de>,
	Jan Kara <jack@suse.cz>,
	Richard Weinberger <richard@nod.at>
Cc: Christian Brauner <brauner@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org,
	linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH 0/2] mtd: switch to keying by dev_t
Date: Wed, 30 Aug 2023 14:19:26 +0200
Message-Id: <20230830-vorabend-tanzsaal-690a955d976b@brauner>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230829-vfs-super-mtd-v1-0-fecb572e5df3@kernel.org>
References: <20230829-vfs-super-mtd-v1-0-fecb572e5df3@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1313; i=brauner@kernel.org; h=from:subject:message-id; bh=0ZJakMDxCfcw2QZ9pOt6kXe0KlVTEjDGHCfwEPNgDRM=; b=owGbwMvMwCU28Zj0gdSKO4sYT6slMaS8N17XP8c4Ia/6llXepwVKKyLWZn3ft8KhxHmuprdc7aGY 4katjlIWBjEuBlkxRRaHdpNwueU8FZuNMjVg5rAygQxh4OIUgIncbmVkuHHo2XGB6D8BCU/CU1XSrh ztXv29TGCF2aspha3uop2LdBgZOm101kpluTNtdm7beMD80AGlM2reP5aahHvrXuuxuM7BCQA=
X-Developer-Key: i=brauner@kernel.org; a=openpgp; fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230830_051944_231738_2261914A 
X-CRM114-Status: GOOD (  15.04  )
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

On Tue, 29 Aug 2023 17:23:55 +0200, Christian Brauner wrote:
> Hey,
> 
> For this cycle Jan, Christoph, and myself switched the generic super
> code to key superblocks for block devices by device number (sb->s_dev)
> instead of block device pointers (sb->s_bdev).
> 
> Not just does this allow us to defer opening block devices after we
> allocated a superblock it also allows us to move closing block devices
> to a later point to avoid various deadlocks.
> 
> [...]

Applied to the vfs.super branch of the vfs/vfs.git tree.
Patches in the vfs.super branch should appear in linux-next soon.

Please report any outstanding bugs that were missed during review in a
new review to the original patch series allowing us to drop it.

It's encouraged to provide Acked-bys and Reviewed-bys even though the
patch has now been applied. If possible patch trailers will be updated.

Note that commit hashes shown below are subject to change due to rebase,
trailer updates or similar. If in doubt, please check the listed branch.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git
branch: vfs.super

[1/2] fs: export sget_dev()
      https://git.kernel.org/vfs/vfs/c/9c4d12957d16
[2/2] mtd: key superblock by device number
      https://git.kernel.org/vfs/vfs/c/ff7c9910eaad

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
