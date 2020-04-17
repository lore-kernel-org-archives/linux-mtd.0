Return-Path: <SRS0=sSnz=6B=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D997CC2D0EF
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Apr 2020 13:22:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC7BF20724
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Apr 2020 13:22:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fFzKK5uq";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="a0j5IILX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AC7BF20724
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Subject:
	References:In-Reply-To:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fkWXEgEISUrkpFmaVq8g2jsfURA3mo1pHyhKs4FarCY=; b=fFzKK5uqOTe9fc
	yP93Sy3kegvdh/kCwQ4WSuP45FskcCSoMTaXN7cBkcUjmKYextQBUhemQN3nfYm/4CmTaK3tq+39J
	GCjMczOTu4QXuPagyOONBZnYhExkwpIQiuRyFa9BDP0U4rq2icT149i7K03emPyPwhiKFJDpNAPHP
	iymk2WLcYHY5jtAFkZ4oQ4zTtZzg2qe/OKBNy4hQmF0gTW1BwbYHglcDI9coOUHSnTpLhCr8zdlD8
	2UR2ZWcjOK8tcadx0BHYaaxBBBUc3C25KAl7SKxXCVH8aArzV21HovMsf16DKFI+RDv4n5xo4Am3A
	Vx1I8uXGqsLPLXklf7fQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jPQwy-0004ua-Pk; Fri, 17 Apr 2020 13:22:32 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jPQwv-0004qX-2B
 for linux-mtd@lists.infradead.org; Fri, 17 Apr 2020 13:22:30 +0000
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EDB5F2087E;
 Fri, 17 Apr 2020 13:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587129748;
 bh=fDlDCrBXL1Hrgj28P+I0Wp6MAPvYyysu+6jvwshAplE=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=a0j5IILXh6EbQWLLTR5nivO1pcKu599TldGW4k0lPFG1EASWMZbIvIGD52H/8L+x5
 QhWmiHOw2lUzMsgV+G6WSu7I/5Ctq+8Lg0uZhMHOfeTSolY2oDUFaiwyW42gupM+LG
 m6IKkm1I+BLWZUM51MmaLQ1zgaSiP07cgmNyBTWk=
Date: Fri, 17 Apr 2020 14:22:26 +0100
From: Mark Brown <broonie@kernel.org>
To: Yicong Yang <yangyicong@hisilicon.com>, linux-spi@vger.kernel.org
In-Reply-To: <1587109707-23597-1-git-send-email-yangyicong@hisilicon.com>
References: <1587109707-23597-1-git-send-email-yangyicong@hisilicon.com>
Subject: Re: [PATCH] spi: hisi-sfc-v3xx: add error check after per operation
Message-Id: <158712973997.35869.11831394586423684759.b4-ty@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200417_062229_132944_F6298816 
X-CRM114-Status: GOOD (  10.94  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: john.garry@huawei.com, linux-mtd@lists.infradead.org, linuxarm@huawei.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, 17 Apr 2020 15:48:27 +0800, Yicong Yang wrote:
> The controller may receive instructions of accessing protected address,
> or may perform failed page program. These operations will not succeed
> and the controller will receive interrupts when such failure occur.
> Previously we don't check the interrupts and return 0 even if such
> operation fails.
> 
> Check the interrupts after per command and inform the user
> if there is an error.
> 
> [...]

Applied, thanks!

[1/1] spi: hisi-sfc-v3xx: add error check after per operation
      commit: 59fc9ad5cb108bce18043281c7cf67f2b425d55d

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
