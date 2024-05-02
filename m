Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F08C5C4345F
	for <linux-mtd@archiver.kernel.org>; Thu,  2 May 2024 13:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5dhxTio8TRs+ucEDQiHnfMbVf7p7pOoJFBhgm0/n6JA=; b=Tbylegcg1Q7Dl8
	+umLk834cY60OsY2uubFFXrXmF+ePaGzM2Zz+1meFKQYbccElbIhaQC+cqgwAv28QNohl+UDqmaRY
	JEqrxXHWWMRPXUHyW1rfhktz+H3GZL3zbh36rhwEPkywQtqFw568wQJagBpE0NTYMfxKhOBAOGb8o
	gPOnnqMu7TC31HJqNSPuky/bTxNMi5LkjLjjc4flNolB0RCnWY25MEu2CYmCEKin9yJVP+b1i7NBQ
	hQNxn+2Iy256zskrmhQIpTL56lH9tNRw4hBz7zMB9dw/x1Jpocjm8raKzaE11s38QZqexQuT8pB7V
	DOpAUSQI4iO02XTkTaGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2WdE-0000000CoQJ-354B;
	Thu, 02 May 2024 13:37:52 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2WdB-0000000CoPf-2xl2
	for linux-mtd@lists.infradead.org;
	Thu, 02 May 2024 13:37:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id A9D1FCE16B9;
	Thu,  2 May 2024 13:37:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAC36C113CC;
	Thu,  2 May 2024 13:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714657064;
	bh=nh2+ErEn5BV9CCDpmHCdC7PoL/jrpIKhcGgkbHonNUk=;
	h=From:To:Cc:Subject:Date:From;
	b=iygI6NSplcQIbWqxlkX2yEnHiCJI3leb3NAqPlHHiDLBUNuBvMV57KmZXdzdOhgkF
	 4FmE1+UJGEiJUMxQ/iQasheVsbrVqm7XVheagkjymgLLgNznP5LWKIG1sjEuCsF48B
	 pzaDF6Rte8MLGoneombolnvGU+xbXdYDlUidbDU+rsMAHak7zZsrXVS/apOHVf6LFP
	 f/vDMsh49dIBvWaAX9Ud47nM44ZMHLrQ1CcoThp8iiRDG5JITInNLoSpW2GJ1y+P98
	 xOo6u717I3R8q9YAbGueiPghM5sfZq0I48DMq9urBbJtJERPe9AvS80juwspzIalDC
	 uYRvkZE8wtpLg==
From: Pratyush Yadav <pratyush@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at> 
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org
Subject: [GIT PULL] mtd: spi-nor: changes for v6.10
Date: Thu, 02 May 2024 15:37:42 +0200
Message-ID: <mafs0msp89vx5.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240502_063749_944752_F462EDC7 
X-CRM114-Status: UNSURE (   7.47  )
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

Hi,

Here are the SPI NOR changes for v6.10.

Regards,
Pratyush Yadav

The following changes since commit 4cece764965020c22cff7665b18a012006359095:

  Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git spi-nor/for-6.10

for you to fetch changes up to c84b3925c7d6c649f5add009084ff409139f894d:

  mtd: spi-nor: replace unnecessary div64_u64() with div_u64() (2024-04-29 17:36:48 +0200)

----------------------------------------------------------------
SPI NOR now uses div_u64() instead of div64_u64() in places where the
divisor is 32 bits. Many 32 bit architectures can optimize this variant
better than a full 64 bit divide.

----------------------------------------------------------------
Michael Walle (1):
      mtd: spi-nor: replace unnecessary div64_u64() with div_u64()

 drivers/mtd/spi-nor/core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
