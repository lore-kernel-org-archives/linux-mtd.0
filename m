Return-Path: <SRS0=jvb0=DN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 754CAC41604
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Oct 2020 15:23:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0574C206D4
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Oct 2020 15:23:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UBoVzrYi";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="RLS3rz5B"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0574C206D4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Subject:References:
	In-Reply-To:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=FBJfVr9g7Hp2W9Yffkm2qinrp8DD7iM424VjfhuYv/g=; b=UBoVzrYi4QmaWoHeREoAw2pS3
	bYkohh6VJlPs8hIRYW4OCmdaGyWpkcaIXYYGHx4c6tp9JvUdOHlm8/d7HRpWVYaLpyWIfnVe3NYHP
	IShafr7BzmcPjdJIlW8Tf1MhFfrNKpf7tPvcX9mkyR6XGc7Gj0EYGvIeY+eR/FAsULX9ZxER09W70
	5QOKw2huY/lViPfnh81NUWj4kAKSsq0oNp0cSGu/ytAsFxeiMeG3T6FnHHAv+UhxPbGI5AoQwlUa/
	SKhTQkeKGpFm3CVQvmPsx+51xUNvOa+2ekhya5IqehpgCNTHpzxSbPmG4/cJQH098dX9KJVYGG1UC
	Lj/Q8/o+Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kPonG-0006MY-JK; Tue, 06 Oct 2020 15:22:22 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPonA-0006Ko-K2; Tue, 06 Oct 2020 15:22:17 +0000
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7B39B206DD;
 Tue,  6 Oct 2020 15:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601997735;
 bh=gGFFKOYWD32Z85Ha3gjhDPcj1DnSsoFGs28UJqXpmQ0=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=RLS3rz5B2f71cZWm2lEXIpUpc6lKf9iNNkpgGnCG1jHrncUcd1dgp8zfTBWJVSr8q
 CwAsab3KqgIvsZgyrbwTVL8AxRt5oph/S6A4IddXsuPUfJ3LqFd+cWaMdIHrz0pkcj
 IDHQhu3lOVfACpNAGXNJqSds+dXXg+Vg7+8qWXqU=
Date: Tue, 06 Oct 2020 16:21:12 +0100
From: Mark Brown <broonie@kernel.org>
To: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 Ikjoon Jang <ikjn@chromium.org>, linux-spi@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>
In-Reply-To: <20200929073755.3741416-1-ikjn@chromium.org>
References: <20200929073755.3741416-1-ikjn@chromium.org>
Subject: Re: [PATCH v4 0/4] spi: spi-mtk-nor: Add mt8192 support.
Message-Id: <160199767221.51670.15465712925313409583.b4-ty@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201006_112216_716645_7E8551E8 
X-CRM114-Status: GOOD (  15.55  )
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, 29 Sep 2020 15:37:51 +0800, Ikjoon Jang wrote:
> This patchset adds 36bit dma address and power management
> supports for mt8192-nor. Additionally, use dma_alloc_coherent()
> instead of kmalloc() for internal bounce buffer for platforms
> of only supporting 32bit addresses.
> 
> Changes in v4:
> - Drop two patches from a list which already addressed by
>   an another series and not directly related with mt8192 support
> - Fix 0-day ci 'shift-count-overflow' warning
> - Fix missing 'high_dma' initialization for 36bit address
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/4] dt-bindings: spi: add mt8192-nor compatible string
      commit: 9935b612a5dba99cf8dc0f9fe7592a2a35c005fb
[2/4] spi: spi-mtk-nor: use dma_alloc_coherent() for bounce buffer
      commit: a1daaa991ed1f13b86f6d9df174f21c4e23d33ba
[3/4] spi: spi-mtk-nor: support 36bit dma addressing
      commit: e836d4cf615f89c6695408e5dcacdefa5cf50167
[4/4] spi: spi-mtk-nor: Add power management support
      commit: 3bfd9103c7af07915a84a6849e718622936233c1

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
