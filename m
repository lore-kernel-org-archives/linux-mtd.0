Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 057E6109B492
	for <linux-mtd@archiver.kernel.org>; Tue, 31 Mar 2026 15:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=37JBw9NlFB8V+Qf9B0pcx6JpGZwKSlWefsFDECLLDjk=; b=LXHufLaNOhiaqy
	nL0xblynTbVXgZGoBAn6u5ZeG23cUbmvyDpzpSPLyAUzgjGRubBGh+x4IMSEiSQZqvrm4feu+myIm
	TkZRTQlKzqk5E3Xnpf/ITBJZkYQBCzvGvHsXqOLaVR6RZ4TXZVk0s3sVpk5KLXP4Kg00gbrPqv/Qs
	Y89tHY/Lo+pwgH9cDdpCAIAIQQ3dXEi80yTL0ffktPbO4EnQGwKW+bYL08mOYewUmhdqswKgAIAPW
	qOWshXBNZZPaSEksgDPhu0vn4c5vyi0+zGRjum6C0WKCgzFu3CR5d7dSgHp7uVouzrGRGCeHKKhvI
	0Nvt5bztKSvUDq4SAj7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7bJm-0000000DCoY-0F04;
	Tue, 31 Mar 2026 15:47:50 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7bJk-0000000DCoA-002n
	for linux-mtd@lists.infradead.org;
	Tue, 31 Mar 2026 15:47:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9095C4182B;
	Tue, 31 Mar 2026 15:47:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8206BC19423;
	Tue, 31 Mar 2026 15:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774972065;
	bh=mBuDfTfKpWYecd6eibKj5laXng98qmkBlzzEIdVW96E=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=planXvJXlOFswX4ewCUATOalFLYqwyE7p1yvcD9nonS1a8eiFUktJX55jQGAf+Qi1
	 YdGkt/Nyx79m7e1scxk22OXp8UZolYdufGcnExwaaiJC6TAMQuml9QSV5NscDQvyIt
	 RckgoATXBNWU6U5wrUgX6dcfTw/a5P9HnvjkK5dxC5rtrIoTQR9shFVq0KGKNlhHi1
	 tyijEsBr0sTmt/3ZAqiueUZZciBHb4xhiVPb6Nnre7dHQ3UH7gDYeYqaYH7UsB/qsM
	 ambxmKe7eJYMrJbkt+5275TrYPqeZfKMGmQ8j22ebEr8kQfu9izZ8i210CxxfcS57w
	 BVTqCBDWpMueQ==
From: Pratyush Yadav <pratyush@kernel.org>
To: Haoyu Lu <hechushiguitu666@gmail.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,  Pratyush Yadav
 <pratyush@kernel.org>,  Michael Walle <mwalle@kernel.org>,  Miquel Raynal
 <miquel.raynal@bootlin.com>,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] mtd: spi-nor: micron-st: Enable die erase support
 for MT35XU02GCBA
In-Reply-To: <20260331095354.1861-1-hechushiguitu666@gmail.com> (Haoyu Lu's
	message of "Tue, 31 Mar 2026 17:53:51 +0800")
References: <20260331095354.1861-1-hechushiguitu666@gmail.com>
Date: Tue, 31 Mar 2026 15:47:41 +0000
Message-ID: <2vxza4vohug2.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_084748_063477_78FDE9D8 
X-CRM114-Status: GOOD (  12.46  )
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

On Tue, Mar 31 2026, Haoyu Lu wrote:

> The MT35XU02GCBA flash device does not support chip erase according
> to its datasheet, but supports die erase. The existing code had a TODO
> comment noting that the SPI_NOR_IO_MODE_EN_VOLATILE flag probably needs
> to be enabled and the driver implementation needs to be converted to
> use die erase.
>
> This patch enables the SPI_NOR_IO_MODE_EN_VOLATILE flag and adds the
> mt35_two_die_fixups to the MT35XU02GCBA entry, which includes the
> micron_st_nor_two_die_late_init() function that sets up die erase
> support.
>
> With these changes, the flash device can properly use die erase
> operations instead of chip erase.
>
> Signed-off-by: Haoyu Lu <hechushiguitu666@gmail.com>

Applied to spi-nor/next. Thanks!

[...]

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
