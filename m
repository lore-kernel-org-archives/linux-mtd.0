Return-Path: <SRS0=6ot8=AM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 160AFC433DF
	for <linux-mtd@archiver.kernel.org>; Wed,  1 Jul 2020 22:26:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC27F20780
	for <linux-mtd@archiver.kernel.org>; Wed,  1 Jul 2020 22:26:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VE93xlvh";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="QnDFizln"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DC27F20780
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Subject:References:In-Reply-To:To:From:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PowwXwM6gQqmBr30u8pe2iC21l3a2dgQS/RnF3QtH1g=; b=VE93xlvhHewap8p1BdeHcqTBC5
	oLDgMTBtidgNUtnp6/PBMnbE5IFyRMdGQN99KV8lAFyIR/jxdaIZvJZprlSI+dI58gzBgIvoWXlPg
	zFOkR5oXWvsfd4Z6g1URzguwwKEI1o15QQVhwHinYUY/CjXU5vdIoJgJHCEKndZy25ibJCpL7VimO
	D+AiTMiKfS0mh+lvI2Z7FvgID7YR4OVjjhQAqhZxEiPzB33vRVvfXAsDt6rHROQTegXeiMDnOH3KP
	mec6My499WpbZEhVWMiTaS0rjIg+e2zVLlaCGf0bthfWCxdK0DXgRwUJFdpgK3TFKB4e4Np8TV+Ym
	RWmOdasQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jql9P-0003Z7-D4; Wed, 01 Jul 2020 22:24:19 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jql9M-0003YT-7u
 for linux-mtd@lists.infradead.org; Wed, 01 Jul 2020 22:24:17 +0000
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 11AF8207E8;
 Wed,  1 Jul 2020 22:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593642255;
 bh=HguEhSuy+TQJwfPgAmeSVzUPU4XvdrCi4pUBHZc9nX0=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=QnDFizlnL7MCgV5wrTnsU7SP536qZzWl81Skg2dTtNoDE1mD7h8OkeeTLzU+zJIp6
 Ri5j2qRZuyWrNqSwLQASaB+PC7B8in5SjMeG/RzbZjDCQZnZgQ21GezocLLm6GZsQ8
 /DyYPtilrzyb3VVFGimpzp+hCIE2HPamV7xBCMhM=
Date: Wed, 01 Jul 2020 23:24:13 +0100
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh+dt@kernel.org>,
 Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
 devicetree@vger.kernel.org
In-Reply-To: <9969c8a1-e6be-38a9-ced5-ce8c5ff07046@cogentembedded.com>
References: <9969c8a1-e6be-38a9-ced5-ce8c5ff07046@cogentembedded.com>
Subject: Re: [PATCH v5 0/2] Add Renesas RPC-IF support
Message-Id: <159364224814.10988.6815822575560386098.b4-ty@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200701_182416_382095_83583ECB 
X-CRM114-Status: GOOD (  15.02  )
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
Cc: linux-spi@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Chris Brandt <chris.brandt@renesas.com>, linux-mtd@lists.infradead.org,
 Philipp Zabel <p.zabel@pengutronix.de>, Mason Yang <masonccyang@mxic.com.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, 16 Jun 2020 23:00:20 +0300, Sergei Shtylyov wrote:
> Here's a set of 2 patches against Linus' repo. Renesas Reduced Pin Count
> Interface (RPC-IF) allows a SPI flash or HyperFlash connected to the SoC
> to be accessed via the external address space read mode or the manual mode.
> The memory controller driver for RPC-IF registers either SPI or HyperFLash
> subdevice, depending on the contents of the device tree subnode; it also
> provides the abstract "back end" API that can be used by the "front end"
> SPI/MTD drivers to talk to the real hardware...
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/2] dt-bindings: memory: document Renesas RPC-IF bindings
      commit: ab1c362061d92556bd96fd2c0b188f8e4223e3e3
[2/2] memory: add Renesas RPC-IF driver
      commit: ca7d8b980b67f133317525c4273e144116ee1ae5

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
