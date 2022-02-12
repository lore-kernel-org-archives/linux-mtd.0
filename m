Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A825BC433F5
	for <linux-mtd@archiver.kernel.org>; Sat, 12 Feb 2022 00:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nSeOP95+hRZTGQxp+XfsQxIEjvKBOnELkrLPF60uekk=; b=GV7dCXNs01pevb
	Z4Ll/yMa8ldX4TZiandaDGl2ioddn7tWNXOscOD1rqB4ahq9/RoC/5Y9pZQ9yFP7vSp2wkoJLB84t
	NjqSR8TLjJ2BoWZetr/rJDT1wbfwrYsMcdX12IUsD5iHXKvQ+2vwP1owXY/Izf0Ne3N9IqAgxKP+W
	XOpueaIUnxFVamP24f1ifzE8mjKx5BpEcQqmSWk0gOaPEvb+2XazTI9nYm6+ZenXVhGLglroTzhdu
	kRWCp8/2A8xKppAfCkdSP4rUUM0FxKIgP13DJVDwPCRP7rAxSWn7Sm4s6a0BzzVgA5m7+Mx2y1VqO
	AJJOVV8xeUpdHvSRHkHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nIg98-0099Sn-RP; Sat, 12 Feb 2022 00:20:14 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nIg95-0099S4-QC
 for linux-mtd@lists.infradead.org; Sat, 12 Feb 2022 00:20:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C064661CA5;
 Sat, 12 Feb 2022 00:20:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2E48FC340EB;
 Sat, 12 Feb 2022 00:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644625210;
 bh=0zIZnmg6cx0oOGvsLFwIZcbJ3GzQws/5gbITP1ynZxE=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=tqAQVvhvpFhnlB/uIOph5mZq3c5vOEOHwkETa7oGTI6aouf7MhFfm95BvE3TwEcYK
 rsl2FGF7Sayyn0kfvfFT5fbb4L4UxUkI+f6Fn8Xd64nH3ld/qz8ucxOTbCYvBEdjie
 HkPK3VTza3Im7akOiPU74OZkW6PiX4MXdsfPUq8F0FRilCFmOlHYV8hQ7elzHzRcaN
 IdnXI9pPm8thVlM5st8fzcCe3l1OjE2Tt/XG64mHhjYWfKcWkEOLUuH6MdPDnfCuud
 tm13iz21ysklrmpqFeHXWwc2C7n1Ws1gnQSjrNjjAFRzAp2wN8/jGxH04rx8iggaAG
 kxUXGY6LwrVMQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 13B25E5D09D; Sat, 12 Feb 2022 00:20:10 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH 0/9] use GFP_KERNEL
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <164462521007.28025.17507178732984421339.git-patchwork-notify@kernel.org>
Date: Sat, 12 Feb 2022 00:20:10 +0000
References: <20220210204223.104181-1-Julia.Lawall@inria.fr>
In-Reply-To: <20220210204223.104181-1-Julia.Lawall@inria.fr>
To: Julia Lawall <julia.lawall@inria.fr>
Cc: linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org,
 MPT-FusionLinux.pdl@broadcom.com, linux-crypto@vger.kernel.org,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, alsa-devel@alsa-project.org, s.shtylyov@omp.ru,
 linux-ide@vger.kernel.org, linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220211_162011_916611_C2FA3791 
X-CRM114-Status: UNSURE (   8.94  )
X-CRM114-Notice: Please train this message.
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

Hello:

This patch was applied to netdev/net-next.git (master)
by Jakub Kicinski <kuba@kernel.org>:

On Thu, 10 Feb 2022 21:42:14 +0100 you wrote:
> Platform_driver and pci_driver probe functions aren't called with
> locks held and thus don't need GFP_ATOMIC. Use GFP_KERNEL instead.
> 
> All changes have been compile-tested.
> 
> ---
> 
> [...]

Here is the summary with links:
  - [1/9] net: moxa: use GFP_KERNEL
    https://git.kernel.org/netdev/net-next/c/c9ac080b25d9

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
