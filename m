Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF37AC88E6A
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Sep 2026 04:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id
	:Date:Subject:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jfhSOaHTLAaYZlhytB82xpKxqQU//b3K0CV4LAnpW0s=; b=KU5PfeMwrWzw/W
	5nKr5gTZnWm1Vg9yDNA5aFUQrceZy2gxk2s2LLw3Daw49caAgy2Dcz+vxv8DLz4ghUH41HS4/3glk
	uV89qPT/H+L+872FfafzZ9i0dtWRe4ESTfQhfB+Zyrb/K1Rt3K6cGE0sYlajcxZHQl5Uzxc/hK+Ks
	gZIcutJ1sWJmQEWTWysMyPDSEsrtndcZsoWRzs6CqvX47KUhS+v6iNvpsiSFlqllKuaZXi1hPoi3r
	7MvP95WEF0RAxlZ5rerjSxBIhbqxYj7/QOi0957W7ksOtkkqKrtVNGh4AoVQzOSmPwqXrDpDs/BA1
	W9wxX6FL0xDBVgZIbHnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5yeb-00000002LD5-1h88;
	Mon, 14 Sep 2026 04:50:53 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5yeX-00000002LCZ-3vdP
	for linux-mtd@lists.infradead.org;
	Mon, 14 Sep 2026 04:50:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A83CC43D09;
	Mon, 14 Sep 2026 04:50:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 74677C2BCF5;
	Mon, 14 Sep 2026 04:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789361447;
	bh=TMaKqT3wETJ/Kskr95mwiLzIopTwehVGMkfPEoOkcbI=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=sEqUFxUF511dTxu1P8l2KuPrBk/p2v7erDXLCPd0BK50RRdzRw+7yvDh49229qR0b
	 sjS4jJ+Yo3kgZK8FT4DETxClYyTfHlA9paliw7V0CVkVQuuDxL8QyZaCvvo6Y4Qhc3
	 +UPoOrmKrPY/KflddCxDNnEEis8lw9McGatk8xRjddgnjilmYK8kq0g+/I+TXSlS1M
	 hbLun4y8HaJoq0EUnzNf/mJFe/qi9e8HLJbozCaRHKRjKGPwgzE18gt+JItTtG7s8b
	 MWtaI/Bs6wtwl6I5RDajczIgEc6wBiCPDbxTon9fkK8IPCD+ZTXPJsyrJaylMjjYMv
	 MgPhPz3mOiAnw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 610D8C88E67;
	Mon, 14 Sep 2026 04:50:47 +0000 (UTC)
From: Takahiro Kuwano via B4 Relay <devnull+takahiro.kuwano.infineon.com@kernel.org>
Subject: [PATCH 0/2] mtd: spi-nor: spansion: Cleanup S25FS256S
Date: Mon, 14 Sep 2026 13:50:35 +0900
Message-Id: <20260914-s25fs256s-fixup-v1-0-e94019455c1e@infineon.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIABt9p2oC/yWMyw5AMBBFf0VmrYk2lPoVsfCYMhZIB5GIfzdY3
 MXJzTkXMAZChjK6IOBBTMssoOMIurGZB1TUC4NJjE2c1opN5mWWladzX1Xv8iYr0lZ760CsNaA
 cX7Gqf+a9nbDb3gzc9wOC8PqWcwAAAA==
X-Change-ID: 20260911-s25fs256s-fixup-d97a584b1f69
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Alexander Sverdlin <alex@sverdlin.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789361446; l=642;
 i=takahiro.kuwano@infineon.com; s=20250227; h=from:subject:message-id;
 bh=TMaKqT3wETJ/Kskr95mwiLzIopTwehVGMkfPEoOkcbI=;
 b=lnjrw4rRAXxTvWObos4WOftuLLGns+FPN0r0oNgviWqSVvkeAamdhX5h8yTGBAG69UfrtqT7K
 GNY4ZWuAS6ACCVH+jddxxNRdfala2L/j2JEO6K0MUSU5FCtV/hymeEJ
X-Developer-Key: i=takahiro.kuwano@infineon.com; a=ed25519;
 pk=aS8V9WLuMUkl0vmgD0xJU19ZajdJmuyFBnBfVj0dfDs=
X-Endpoint-Received: by B4 Relay for takahiro.kuwano@infineon.com/20250227
 with auth_id=566
X-Original-From: Takahiro Kuwano <takahiro.kuwano@infineon.com>
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
Reply-To: takahiro.kuwano@infineon.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This series cleans up the S25FS256S entries in the Spansion ID table.
Remove the invalid s25fs256s0 entry and assign the existing S25FS-S
fixups to s25fs256s1.

Signed-off-by: Takahiro Kuwano <takahiro.kuwano@infineon.com>
---
Takahiro Kuwano (2):
      mtd: spi-nor: spansion: Remove s25fs256s0
      mtd: spi-nor: spansion: Assign .fixups to s25fs256s1

 drivers/mtd/spi-nor/spansion.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)
---
base-commit: eb652d33da1b99c58a1465028b1336af5a3367c5
change-id: 20260911-s25fs256s-fixup-d97a584b1f69

Best regards,
--  
Takahiro Kuwano <takahiro.kuwano@infineon.com>



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
