Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C18AC433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Apr 2022 17:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+JOa3WlP7ujPy5w4C8p61HwZ7AyCUN/w1sHSK9Lz3aw=; b=Bfcbgs3DXobjtW
	y1jzI9ChHYOgGZOsx+rfwgDPvHQ3+v38nEjJY4wUZ1VtfmUMoF440jPyqdH5JiFbt1wQFa6MStcdC
	GA/uBPNMKuGhbelDjdJL6n3/ydUdqr5G4ihG/wJ48gEbGBmhrQRSgzfd9xbBIk2PbKV+5HNPrJROC
	rqmlOR5mjBJUb5Ay9BVRrjjr9JXKUcJFz743/d7DZvXc5WfTxHhe83YXjtJS7Fu8Xl4/XtPniW4De
	IgES+55DNqS6PX91VJ78Cl6k6c0y4cCxE4ZXD01oPwlQnoITRyAlVUgO68ohlJcH9tnJwbDrMHGBy
	neNWaC3K3aRTBZbRl5nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngrgj-005KIl-4p; Tue, 19 Apr 2022 17:30:53 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngqy4-004yuo-LA; Tue, 19 Apr 2022 16:44:50 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DC19861879;
 Tue, 19 Apr 2022 16:44:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6062FC385A5;
 Tue, 19 Apr 2022 16:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650386683;
 bh=XdueS6o3x8Genbrjo7SphR5bJ8o+YLBkmS/22/Y/tzI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YXQtUJB7B4bM52daStJxTBrA8/zErvRHpHn2okco8xXiPRjGGTcMxZ34F9ihe2zZF
 1BoMvocNKdvX/A7Mn4lmcao9QbvEfofhr0515a2QLJ4e/1ti5g/eDZCmDNi5sdZR/I
 9XNG+Otrayi6yRijGpRrnLzixoTgFiEZlFFL/2ise5K7ONOzh9kv641LscK+chNQJ7
 Q9EFuzcxnFtDUtDisGrueMKhbPDgR4AstoPr4QwJ7WiTnp9E3XeIFc84uL5FnW7uoT
 5DjaGzrz2kHiXzQHJSz/k+R25fFOoMSH+WeElYMHF7zCHXx8w3wvu8Yx03jMnZvboF
 gxYGbk6+OLuAg==
From: Arnd Bergmann <arnd@kernel.org>
To: robert.jarzmik@free.fr,
	linux-arm-kernel@lists.infradead.org
Cc: Arnd Bergmann <arnd@arndb.de>, Daniel Mack <daniel@zonque.org>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Philipp Zabel <philipp.zabel@gmail.com>, Lubomir Rintel <lkundrak@v3.sk>,
 Paul Parsons <lost.distance@yahoo.com>, Tomas Cech <sleep_walker@suse.com>,
 Sergey Lapin <slapin@ossfans.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Dominik Brodowski <linux@dominikbrodowski.net>,
 Helge Deller <deller@gmx.de>, Mark Brown <broonie@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-ide@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-input@vger.kernel.org, patches@opensource.cirrus.com,
 linux-leds@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-rtc@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, alsa-devel@alsa-project.org
Subject: [PATCH 45/48] ARM: PXA: fix multi-cpu build of xsc3
Date: Tue, 19 Apr 2022 18:38:07 +0200
Message-Id: <20220419163810.2118169-46-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20220419163810.2118169-1-arnd@kernel.org>
References: <20220419163810.2118169-1-arnd@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220419_094444_874835_D4B625A0 
X-CRM114-Status: GOOD (  15.64  )
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

From: Arnd Bergmann <arnd@arndb.de>

On a kernel that includes both ARMv4 and XScale support,
the copypage function fails to build with invalid
instructions.

Since these are only called on an actual XScale processor,
annotate the assembly with the correct .arch directive.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mm/copypage-xsc3.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/mm/copypage-xsc3.c b/arch/arm/mm/copypage-xsc3.c
index 6f0909dda2f9..c86e79677ff9 100644
--- a/arch/arm/mm/copypage-xsc3.c
+++ b/arch/arm/mm/copypage-xsc3.c
@@ -29,6 +29,7 @@ static void xsc3_mc_copy_user_page(void *kto, const void *kfrom)
 	int tmp;
 
 	asm volatile ("\
+.arch xscale					\n\
 	pld	[%1, #0]			\n\
 	pld	[%1, #32]			\n\
 1:	pld	[%1, #64]			\n\
@@ -80,6 +81,7 @@ void xsc3_mc_clear_user_highpage(struct page *page, unsigned long vaddr)
 {
 	void *ptr, *kaddr = kmap_atomic(page);
 	asm volatile ("\
+.arch xscale					\n\
 	mov	r1, %2				\n\
 	mov	r2, #0				\n\
 	mov	r3, #0				\n\
-- 
2.29.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
