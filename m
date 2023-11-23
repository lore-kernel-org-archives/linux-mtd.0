Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B300C624B4
	for <linux-mtd@archiver.kernel.org>; Thu, 23 Nov 2023 11:05:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D4nIcfw43dZyPcnOfkogSP0eB1BQpQGY3ensqFu0ltE=; b=Qa7mSHWtJha7jl
	yNLHklL6UM/04U/iyiw1LeP7W7Bt3aQrRjTSEK/yvpNezTMJHAWOQLCJDvfPokZmiQymtH0GJAnhr
	j9YWIpw4H9h08w/HHTejVCjAB5TN2ASZOQr4DVw8gk5GhuEv/q94uT/SmnVLBvRvA39+HrftWssyi
	NZPYtIj7pyjxWC9/6qGxSoNcJO7lT83UydQB6AxDsPGImMI092uo2zEqUB3qHBkJX4lU/m75MDB9S
	/w+z1IjQfPW/ZRkWp2gyFy8cLbUBTK/01+3LAeeTD04lU8AwZFlQT9t1CWiaA9c2yBV23gg8D4nQ+
	N5y0/hesKN4rNcv44O+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r67Wf-004SjH-0J;
	Thu, 23 Nov 2023 11:05:41 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r67Wb-004ShW-26
	for linux-mtd@lists.infradead.org;
	Thu, 23 Nov 2023 11:05:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id A4582CE2754;
	Thu, 23 Nov 2023 11:05:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB220C433D9;
	Thu, 23 Nov 2023 11:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700737534;
	bh=lp+rEggxgbuHN1BPGYgpeRufkP5k9akySuiKFW/Pyuo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bp72z2ZYfxFgUAViqgqthrZ1n/G7s220umdBTqhNPpOWDzVmZqOG7Ddmr+XT6+7z4
	 Gz3HgSoUmx1tvsdGJhVZ+4xWIUm+F07UIf+HzuZqTiusqThvyILWdgfo39uCwPppu6
	 cUD0tMyRtrmcZKYLJO2vHQuI9MrS5R7/3S5RjH6Yu8ZdxOM4qzrBppe22kufQzaDSB
	 DSth/LrC/07UaI/iVo3dd5j+Aijmgiybw27x91endbEgxLHU0BLdaY/xbdwSLZT03U
	 iqWMnnQ8i8djzeYPImFi2FXWlSgPezJJCuKZyzuiVSpo6mqr0s8jCqEcVQGeMdNjTm
	 6FOgf1zP9yQTw==
From: Arnd Bergmann <arnd@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	"David S. Miller" <davem@davemloft.net>,
	David Woodhouse <dwmw2@infradead.org>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Matt Turner <mattst88@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Peter Zijlstra <peterz@infradead.org>,
	Rich Felker <dalias@libc.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Richard Weinberger <richard@nod.at>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	linux-arch@vger.kernel.org,
	linux-alpha@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-sh@vger.kernel.org,
	linux-usb@vger.kernel.org,
	sparclinux@vger.kernel.org,
	x86@kernel.org,
	Zhihao Cheng <chengzhihao1@huawei.com>
Subject: [PATCH v3 2/6] jffs2: mark __jffs2_dbg_superblock_counts() static
Date: Thu, 23 Nov 2023 12:05:02 +0100
Message-Id: <20231123110506.707903-3-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231123110506.707903-1-arnd@kernel.org>
References: <20231123110506.707903-1-arnd@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231123_030537_918651_5381E3A9 
X-CRM114-Status: GOOD (  13.23  )
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

This function is only called locally and does not need to be
global. Since there is no external prototype, gcc warns about
the non-static definition:

fs/jffs2/debug.c:160:6: error: no previous prototype for '__jffs2_dbg_superblock_counts' [-Werror=missing-prototypes]

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Reviewed-by: Zhihao Cheng <chengzhihao1@huawei.com>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 fs/jffs2/debug.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/jffs2/debug.c b/fs/jffs2/debug.c
index 9d26b1b9fc01..0925caab23c4 100644
--- a/fs/jffs2/debug.c
+++ b/fs/jffs2/debug.c
@@ -157,7 +157,7 @@ __jffs2_dbg_prewrite_paranoia_check(struct jffs2_sb_info *c,
 	kfree(buf);
 }
 
-void __jffs2_dbg_superblock_counts(struct jffs2_sb_info *c)
+static void __jffs2_dbg_superblock_counts(struct jffs2_sb_info *c)
 {
 	struct jffs2_eraseblock *jeb;
 	uint32_t free = 0, dirty = 0, used = 0, wasted = 0,
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
