Return-Path: <SRS0=ZJz0=G6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3949C433DB
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Jan 2021 17:17:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 335B464DA3
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Jan 2021 17:17:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 335B464DA3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:References:
	In-Reply-To:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1COF8C9DE5nSAyEy+rK9S7RNm7MxLoA5/zkbwrPcs/c=; b=alveMzdN0ej9V1uaI+U/ncRS4
	QSiTPbGEpouCU9S2I8zLGMf0N/TXd8rzdm8iMCCVhemoTdxLCeRz1mcNlY+WarncNaG7eehhXNCqn
	nLF2fFe4ycpXAnLa7c7O4mnmLEepT/fFEwy70X7htHHhvkyFo0/XiCNOirBfaa9A51SeHqAl+lsxx
	oxWhd/73wl/ADpvnlduvdJ1rm/7CP8xhP8iMXHmp82PW1wjnMEsaju5ucNLQ2ENw5RXLIWqte0AU+
	pp5QCZN3lonoaMtdmYdNJZa9JLwWzM3NGkH2C7gKfEtnMc1ybkOWpngBmCIerh3IMLCFwlqVYh+OK
	/2T0ODurA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l4oQj-0003H6-EW; Wed, 27 Jan 2021 17:16:33 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l4oQV-0003CL-Vw
 for linux-mtd@lists.infradead.org; Wed, 27 Jan 2021 17:16:21 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 909D860187;
 Wed, 27 Jan 2021 17:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611767779;
 bh=tgc2UpnkFEr+6Oo2VTYkvyACd+6I6bE9ssogdiQszhw=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=jGMjbqt7jRh8sraHfE9Ul/AJPDHzlAyqHNyuRtfeqyEWthQR7DvQC2F9j7WHgIzdq
 0zNH72dhj8ecNcizagYbKTPmKfDDjKg/LCMZKfp22IQyhhVL/tosmxf07rZ8X3W861
 I/DZSCcdigP2cTF2h8AEWyvPnG7xOHjlCRXdw8Sio7lkkTG3xnQso79XsjgrDI2Aq6
 ZqYRXKnfBHa7Hyf6/IdaUC3dSIbqWTRezow51OX9qoDZQBdgRXgh7B1p/UeNtw2eVH
 2HFbWjsYkaEiSSzZZ9zZBMtLQNm3lm8xWZ7nQeMKULVL1NNtNrAHBAjq+00E7hf2Yn
 FP3O+lV22na5Q==
From: Mark Brown <broonie@kernel.org>
To: richard@nod.at, vigneshr@ti.com, miquel.raynal@bootlin.com,
 linux-spi@vger.kernel.org, Yicong Yang <yangyicong@hisilicon.com>,
 tudor.ambarus@microchip.com, linux-mtd@lists.infradead.org
In-Reply-To: <1611740450-47975-1-git-send-email-yangyicong@hisilicon.com>
References: <1611740450-47975-1-git-send-email-yangyicong@hisilicon.com>
Subject: Re: (subset) [PATCH 0/2] Add check of 4-byte when parsing SFDP 4bait
 table
Message-Id: <161176773014.34911.1124682946060569750.b4-ty@kernel.org>
Date: Wed, 27 Jan 2021 17:15:30 +0000
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210127_121620_184968_C2951C44 
X-CRM114-Status: GOOD (  12.01  )
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
Cc: john.garry@huawei.com, linuxarm@openeuler.org, prime.zeng@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, 27 Jan 2021 17:40:48 +0800, Yicong Yang wrote:
> Add check of 4-byte address mode support when parsing SFDP 4bait. Some
> flash will provide a 4bait table and the spi-nor core will convert the
> address mode to 4-byte without checking whether it's actually supported
> or not by the controller. For example, the 16M s25fs128s1 provides the
> 4bait and will be convert to 4-byte address mode, which makes it unusable
> on hisi-sfc-v3xx on hip08 platform.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[2/2] spi: hisi-sfc-v3xx: add address mode check
      commit: 6d2386e36440165da782dbc5c0de40f31665e108

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
