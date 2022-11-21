Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA6D3C433FE
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Nov 2022 09:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QBl1+OgoU+ubZH9wF676NeOQxV5O39vKPrU/kkCjCrE=; b=sHavTckozYBO6a
	Y+RkXNcxBTVu3VZ07EFTxuE68UXCHUjymZ9yFRpcaSIsWyk0RdQEo2kexEg31bujYdLNWOfpHXfmC
	5r8PRa7fOcozYCJaNVdFJwhhLIdwMtdktc8UJhM3uYoHtc7I31Bvxd4jC8GVFSjT0f3A9Ii6/IsnB
	vLU6a8SoX1EMZvYm6cFyaMvxZqAWr3XBnqwWCmE5+NxW46bJ4NDB/taPudiP+T32iPfLu1zxWZFjo
	aG+KoQPbO+KGkMuEyLqPUskvUmlll8iGvicEKjp1T7S3DWkP4IJErHNdWeOId7kRrH8Pt0bw6GGY7
	c0liqm6GYiAqsnKKUkzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox3Hv-00BtMb-DJ; Mon, 21 Nov 2022 09:40:27 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox3Ht-00BtKq-Ag
	for linux-mtd@lists.infradead.org; Mon, 21 Nov 2022 09:40:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E2F8860F83;
	Mon, 21 Nov 2022 09:40:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC026C433D7;
	Mon, 21 Nov 2022 09:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669023623;
	bh=01ChJ7lHcaolTsQ+hYYCRANcBEQXVdZ7npJ/JfpKVOA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SvmWny1l2R3IIVEFZ5Y0PhB/4cfluZtJkYd0Kfsxv/CNlGBcJTiURjgqpkXTkxVq1
	 PA0/UGxZgapYhwUHAhoHAN1HWPWxRkidC3mPP+znciEJipgTL+qTlsNA3HS7XCLpkp
	 pzaROOXBTLpGQBIRQjveLL8drAzaWXcr7XwvgKA+RQOqACg+texmceXfD1BCE4rXRu
	 zxwJiWOOTbJWy6iD4EjhPnXnXLNw7XVFPxFVVb6eXPDpIcqnPt4aQeIlaKQpQPNbBS
	 9++WrfIOBtyvS1c+IkFDlEkyMeQ4pumgnch9V21AuVPYEQDooDp6ZzqrqATrdlo8DS
	 yYmaOrAIA7ZfQ==
Date: Mon, 21 Nov 2022 10:40:20 +0100
From: Pratyush Yadav <pratyush@kernel.org>
To: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH 0/2] Measure read while write latency
Message-ID: <20221121094020.4ezpibat7az3ya6g@yadavpratyush.com>
References: <20221110155938.820334-1-miquel.raynal@bootlin.com>
 <c3a9add5-673a-2d86-f46b-7720c56c41fc@sigma-star.at>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c3a9add5-673a-2d86-f46b-7720c56c41fc@sigma-star.at>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_014025_420039_733052D4 
X-CRM114-Status: GOOD (  10.20  )
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

On 21/11/22 08:37AM, David Oberhollenzer wrote:
> Applied to mtd-utils.git master.

But SPI NOR does not yet support read-while-write. The patches are still 
under review [0]. So does this even work? Should mtd-utils test a 
feature that has not been merged into the driver yet? I think it should 
not.

[0] https://lore.kernel.org/linux-mtd/20221110155513.819798-1-miquel.raynal@bootlin.com/T/#mf4fdf32e77b1b21bd30ca01eed999f0efc3db6ee

> 
> Thanks,
> 
> David

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
