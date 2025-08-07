Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8770EC87FCF
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Aug 2025 07:21:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=y5QPyaPImJ41DjMj/+PITZybjj2D8RxEuqCPBXQSZ8M=; b=DaI/+VjYHtq+b/
	rXDrPQ0YDJoy2UzrtL1llX/PdZJylM1VGzNdxNQCPqqNtEAbvecH5wxjnFWzqd8IlGZPqJ3MDonQp
	eteB/s5lPaNYj81JGw2lWHr2+3ByJD9cl6htZNoxfXCkNlyu3qId8AieRaFaIfWQxgBqM97k6Z383
	4x0AKCfMl9V/ZVOtJUkTlXL4omo5wGfBoabd3bPErjGGBLozijjejvXPh4YZ3ZzGBgJJiTuBE5LkS
	YmBa9Guo/BaCRD+FdxqnThGH4YRF2LI5c/GkSd853HDcmlu3xYg8BCJfEfv5znmz3jCanF2gAnbXd
	jN9RcC+movRpfaTdLwuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujuwc-0000000HRxx-45T8;
	Thu, 07 Aug 2025 07:21:46 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujuvk-0000000HRpb-17Q1
	for linux-mtd@lists.infradead.org;
	Thu, 07 Aug 2025 07:20:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 96465A558DE;
	Thu,  7 Aug 2025 07:20:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 009ECC4CEEB;
	Thu,  7 Aug 2025 07:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754551251;
	bh=dxJGE+mEq+3AgUMzvKMTimiXNGP1oHgsGV9MNV/DwJ0=;
	h=From:To:Cc:Subject:Date:From;
	b=BKGmN0p6MMXGOxCLX3XcXUShkZnLdIqI0ySdOp0gNrTrAPU3vYU1cEB2GY56Dal0t
	 0GNayzcyqU/0zDh93YZkiSKy6b4uiX/F5/T8VueVSkjlDhOwc1zuD0o9++h615TruI
	 3dbgRD74Dmu0zdAM07IreOBP+DAXntnJ54JYijv1OzsiaL4EqTYuknnRo34+CAip2f
	 GYO5DGAPYN54Akd6iua85zS0PN1kuoiwKf6qN6ToETXX7x2/1quroovME6Fs+VSkRw
	 Nv3Kqh+dPx1Itzg79aC0QStCkgO2Ue8D2PWyo9RzaLM57b8mhl8CpeIlCbvuNDyBpB
	 eqE54Z5R5vClQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Nathan Chancellor <nathan@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	David Woodhouse <dwmw2@infradead.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] mtd: dc21285: fix bytewise memcpy()
Date: Thu,  7 Aug 2025 09:20:34 +0200
Message-Id: <20250807072044.4146480-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250807_002052_370780_FCF25D1A 
X-CRM114-Status: GOOD (  11.60  )
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

The commit that split up the 8/16/32-bit operations in 2004 seems to have
broken the 8-bit case, as clang-21 now points out:

drivers/mtd/maps/dc21285.c:129:97: error: parameter 'len' set but not used [-Werror,-Wunused-but-set-parameter]
  129 | static void dc21285_copy_to_8(struct map_info *map, unsigned long to, const void *from, ssize_t len)

Put back the loop that was in linux-2.6.8 and earlier for this case.

Fixes: 67d4878e4e61 ("NOR flash drivers update")
Cc: David Woodhouse <dwmw2@infradead.org>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/mtd/maps/dc21285.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/maps/dc21285.c b/drivers/mtd/maps/dc21285.c
index 70a3db3ab856..1d70bf62e91f 100644
--- a/drivers/mtd/maps/dc21285.c
+++ b/drivers/mtd/maps/dc21285.c
@@ -128,12 +128,14 @@ static void dc21285_copy_to_16(struct map_info *map, unsigned long to, const voi
 
 static void dc21285_copy_to_8(struct map_info *map, unsigned long to, const void *from, ssize_t len)
 {
-	map_word d;
-	d.x[0] = *((uint8_t*)from);
-	dc21285_write8(map, d, to);
-	from++;
-	to++;
-	len--;
+	while (len > 0) {
+		map_word d;
+		d.x[0] = *((uint8_t*)from);
+		dc21285_write8(map, d, to);
+		from++;
+		to++;
+		len--;
+	}
 }
 
 static struct map_info dc21285_map = {
-- 
2.39.5


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
