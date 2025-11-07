Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D008BCCF9F8
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Nov 2025 16:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tuYUVK2Ydo69rvF4MQYpsUB5bOvldHoQ82z4z7vwSes=; b=1CxopW1tom2L6A
	aSOVr9KocbgePZdiuall/u/eo3N3yL/M+I6KvNazEv7IeQwxmUOYnvaSNrNp0SUhfTHbzRsc6yH6u
	SoXTJGhWL3z2ziv98uo5LJjGvhY7RK4hcOxw9sC5MX8bXxviXp2DX/Wv9PCNaA9FQMmM6KuQGmerw
	2DYzGzGTJ6kYhx6L3S0osBikcpNsBDffx2ariGLlUV1I3Ts5f3CanryrnbG6M9P0RoK6ueebDc4k+
	tPf8AieGfRaPSsBgYIZOhbe5wuCh3JcShXu+ZRtJVtOASZoWHaNvhcvizeC05u8IZuaj3TMlHQ4PH
	TjyqtF5j7SIokTdycIag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHPEU-000000005LD-2XRx;
	Fri, 07 Nov 2025 16:22:38 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHPET-000000005Ky-2Cck
	for linux-mtd@lists.infradead.org;
	Fri, 07 Nov 2025 16:22:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 747EF61918;
	Fri,  7 Nov 2025 16:22:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6561C4CEF5;
	Fri,  7 Nov 2025 16:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762532556;
	bh=mN4YUzu8lM3c3oVyGIeWOoW3AKov+Tq1pJETgzitr7U=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=GZuT0C31+QDQpp0rorfqPSiUK3Bx4b91ve41PHeDgnivD25omRRwmyd6aPRja4ZbQ
	 /to9fB8phW7MZ4f3A4InHqBCpwBRCQcEqcftAtJHHuMVD1x+48vTPCOsbuVL6TPIKC
	 5h9Nff8reoEXB0FvomgWz9I9SkReJS+NerutF7xo3cQza+0xJ6uuGdh7QiV6h+A+sH
	 pkppptHDUAQ87a9aAsW5koS3PVSKvk0l6YbyY94pO/rRG6EpKftLfjwO4n+q6t/BsT
	 xHOCRmmAh3uFCG1XUSr5OYdWKNZchCMBQXLyLDiSMXiqr8nA+G3veo4sKA+cFX9bK4
	 T2hLnqEYtfhVg==
From: Pratyush Yadav <pratyush@kernel.org>
To: Takahiro Kuwano <tkuw584924@gmail.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,  Pratyush Yadav
 <pratyush@kernel.org>,  Michael Walle <mwalle@kernel.org>,  Miquel Raynal
 <miquel.raynal@bootlin.com>,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>,  Marek Vasut
 <marek.vasut+renesas@mailbox.org>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  Takahiro Kuwano
 <Takahiro.Kuwano@infineon.com>
Subject: Re: [PATCH v2 0/3] mtd: spi-nor: spansion: Add SMPT fixup for S25FS-S
In-Reply-To: <20251105-s25fs-s-smpt-fixup-v2-0-c0fbd0f05ce7@infineon.com>
	(Takahiro Kuwano's message of "Wed, 05 Nov 2025 16:47:57 +0900")
References: <20251105-s25fs-s-smpt-fixup-v2-0-c0fbd0f05ce7@infineon.com>
Date: Fri, 07 Nov 2025 17:22:33 +0100
Message-ID: <mafs04ir5bynq.fsf@kernel.org>
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

Hi Takahiro,

On Wed, Nov 05 2025, Takahiro Kuwano wrote:

> Suggest new series as the result of discussion in the thread:
> https://patchwork.ozlabs.org/project/linux-mtd/patch/20240914220859.128540-1-marek.vasut+renesas@mailbox.org/
>
> Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>

Checkpatch complains on all 3 patches:

WARNING: From:/Signed-off-by: email address mismatch: 'From: Takahiro Kuwano <tkuw584924@gmail.com>' != 'Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>'

Take a look at why your git-send-email didn't add the extra "From:" in the patch?

For this patch series, is it okay if I change the author name to
Takahiro Kuwano <Takahiro.Kuwano@infineon.com> on all patches?

[...]

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
