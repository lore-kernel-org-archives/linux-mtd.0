Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8313C606A31A
	for <linux-mtd@archiver.kernel.org>; Fri, 23 Oct 2026 08:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lOWKFBAt;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=qUnPm/q8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Subject:Cc:To:From:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=a8fZwg3kPGf9KVyXzMKyMQ8U4UdCMKeKn6u9AtJ/8nE=; b=lOWKFBAtDqVUbFZqmRpfZu9D5O
	vJygveqzo2qxksbWi7/3gznZ6VV7Y24f/S/60wIra53WPYewqWuN8da/1sy4j46t+mZamAW4r2yyo
	wjXTJ//oeRuWmuszEXgUm2LGfcohwlmoM0u3PZNG7frBO7gp/FmPEJjI/e8iD9Fr2JD7x1Isgf3ML
	cvXSMOpdDpaIrZ/Tpy9ASla2ZuKwTI1lD54xGTvToyrlBP8j4hkR0+8zN3J7xfJiKwT/UEJkFnLyS
	rvD7AXzYDcGcHSo8CeJYlrzrvZ0uq86cH4jiRHN+Nc6Q56mAqKvToAAnCAuAv7QjGir5xvQWtUmnP
	WG4CCs1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKARq-0000000FuQD-3JvE;
	Fri, 23 Oct 2026 08:16:22 +0000
Received: from out203-205-221-245.mail.qq.com ([203.205.221.245])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKARn-0000000FuOX-1uzB
	for linux-mtd@lists.infradead.org;
	Fri, 23 Oct 2026 08:16:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1792743370; bh=OJBm0kdro8PQFC/77dWApGE9VNnnb7mDYElFO9G+ddk=;
	h=From:To:Cc:Subject:Date;
	b=qUnPm/q8qUPaV6/qRUL+o+LQDrnnv1sJYe2v5sCY3Nkn7aZdB+wRCbh7N3bKZMqNX
	 rQuWInbhm/kIGZwoC0RMsAmb9UHDyeVtTqqGTjsbuoFuWwAHYFbl2z9eL+RTbLZIze
	 Ns8yJ/kUKygnoFWdwLmu890BTYSv4PCDt15fNDfA=
Received: from shuai-VMware-Virtual-Platform.. ([218.28.192.28])
	by newxmesmtplogicsvrsza63-0.qq.com (NewEsmtp) with SMTP
	id 407AE242; Fri, 23 Oct 2026 16:16:07 +0800
X-QQ-mid: xmsmtpt1792743367t24639m9l
Message-ID: <tencent_90082E9C18DB04917B9F74368BBAFC695306@qq.com>
X-QQ-XMAILINFO: M1rD3f8svNznrOjiZ53lu7yt9BFmB+lFO5xkRRJHXifRU9rhP18oTP8RL7gHc8
	 /lGAbQ10QIPd7UsMOmMwGJ5qCKTcllNec1PPzVwN9Mj5zThzWqnfKc+/3I74f6jhhiMtmBnBhc0Y
	 +/+iap4FXURogXI/P64OecQnm40FtIWnfdpgHITraJw89gtaUQWdEM62vJL4QghYnXbFXt4JvU8o
	 iSOYhQckXjXUTzH+zvtVVtYFQnK4Eg6AuJS8ZnC0baf1i9rIEK7uyqiEQCaUzU3iZo9AuTt4sd+a
	 MVFP2ZtI5opaeMMBCKZ57Dl/BrmfenNHT9V7FVon2mxySxiVMv/H1aws0Aw36ZAJu3D8lcLlYrtm
	 hM5JvbledUIwTsMlJAQ7wyJOcovI/UrOuCgCmSZyrtStwBZouLmp/SgkkMs+45ZRYBxxuawMMTb7
	 g6YGEjrBg7eHgBpAd4fYiv2DqnldPYkVOlAZ0z2RU3+hIa8RlDGeoTlqc4L2mfqkgPPByH4wBtjN
	 bSZYaX4zQxXhCgqiWNbKnM/e5T3pCUNWO+TR+CYjfMkEpzQjtFU/nSUuMnBMmG4fkgXdiIf1NVKZ
	 E1/wAnMzfLz+hJAhb8VqkdoGh+BzdP5hxNjhn+SJOA60fKPpBHxvKeQdrLpccJxLKpZYtz34lq1b
	 E0SrYwIg0lqDDJPAJNF1yb1KQHso8aqjA/wYQFwnsFdKZs8uLZ5Oq/1LYUzKWeqIwiW783OjLJgU
	 hpt3mDbi2g/9rxRk4En6grf+AGGHSZRqPthyvnlfX5YwVox4pl+efaOc9u3pPDt7TOS00/knIZqt
	 7Uq4q1Rp5Hqwi+cF5nEhKBKy4rz6CGlgfZ7HGch3k5q7Lgk1i2W1wq2yUwyQPja7zuecq6APH8rb
	 J2ILuIs55rnTGoMSArWVD8/UX1bkNxFFoYqsM7X7NJtu+iOzfqNd1K5eo4U0XmDbFQHOAlEEWeJj
	 nxUinSIFEeJXYlunAonyez2daAjsx2zDfUHm4TJP+OnlY+IPneeeeCwdwwtC0BsLraU8A57uZ2qQ
	 fMTVKm2R/T5Af1UC5m/G7osllcNnCx+Hlj1ws7Trb2B/ulRTdX6WekF2ErMAUCeCR+c5afEG+7G3
	 1KBGxh
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
From: Shuai Liu <847807867@qq.com>
To: linux-mtd@lists.infradead.org
Cc: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	linux-kernel@vger.kernel.org,
	kevinshq@163.com
Subject: [PATCH] mtd: rawnand: samsung: fix pages_per_eraseblock calculation
Date: Fri, 23 Oct 2026 16:16:07 +0800
X-OQ-MSGID: <20261023081607.3836052-1-847807867@qq.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_011619_809333_AD02971B 
X-CRM114-Status: GOOD (  10.31  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In samsung_nand_decode_id(), the division by memorg->pagesize binds
tighter than the left shift due to C operator precedence, so the
expression is evaluated as:

    (128 * 1024) << (shift / pagesize)

The shift amount is at most 7 while pagesize is at least 2048, so the
integer division always yields 0 and pages_per_eraseblock ends up
being 131072 regardless of the actual chip geometry.

nanddev_init() later computes mtd->erasesize as
pagesize * pages_per_eraseblock, overwriting the correct value set in
this function with an astronomic value (e.g. 0x20000000, 512 MiB, for
a chip with 4096-byte pages).  MTD then rejects partitions not
starting on such an eraseblock boundary and forces them read-only,
breaking the rootfs on affected boards.

Add parentheses around the shift expression so that the eraseblock
size is computed before being divided by the page size.

Reported-by: kevinshq <kevinshq@163.com>
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=222140
Fixes: 629a442cad5f ("mtd: rawnand: Fill memorg during detection")
Signed-off-by: Shuai Liu <847807867@qq.com>
---
 drivers/mtd/nand/raw/nand_samsung.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_samsung.c b/drivers/mtd/nand/raw/nand_samsung.c
index 0be6b7563..765c0a7d8 100644
--- a/drivers/mtd/nand/raw/nand_samsung.c
+++ b/drivers/mtd/nand/raw/nand_samsung.c
@@ -63,9 +63,9 @@ static void samsung_nand_decode_id(struct nand_chip *chip)
 
 		/* Get blocksize */
 		extid >>= 2;
-		memorg->pages_per_eraseblock = (128 * 1024) <<
-					       (((extid >> 1) & 0x04) |
-						(extid & 0x03)) /
+		memorg->pages_per_eraseblock = ((128 * 1024) <<
+						(((extid >> 1) & 0x04) |
+						 (extid & 0x03))) /
 					       memorg->pagesize;
 		mtd->erasesize = (128 * 1024) <<
 				 (((extid >> 1) & 0x04) | (extid & 0x03));
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
