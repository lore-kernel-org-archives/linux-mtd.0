Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B860FD10DDD
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Dec 2024 09:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sDPGaYH65RVshObLlS7UO3z/F5u8llkjRlgUFXsmMDI=; b=UZz3CHMuhcZwJO
	I+bR8YvOTMItfNBanPyzZRxSa1zmvsjbHTdPkp8YsqQRUylqZuzGD1q6kjoJZLiwRzueve//xU4Q0
	W5LaqwROTVYGVxpPOEC3jcjC6lRwjh4nelAk99rKYhClEZSvwJ5J9Au8sLwQ9CgkAtBMsE+3bCKfG
	vPw1DMJUzAR5YroTNCtokUNjxVAjFFjSm5L5vewIrRoJK/MP/CLC+/MLu92dJEL3KFuMqOuRNzs82
	gI+rk6cJCQSWqk7eAUvP6nwcXux9OgKTJbUa0iesab049vedTPNxV4rCCXg9GiI3dZ1SbSgZEkNbS
	+XXRCjpZ1NIsrJ+8CajQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI2rW-00000005al3-3C0A;
	Mon, 02 Dec 2024 09:37:02 +0000
Received: from mx.swemel.ru ([95.143.211.150])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI2rT-00000005akQ-2BDL
	for linux-mtd@lists.infradead.org;
	Mon, 02 Dec 2024 09:37:01 +0000
From: Denis Arefev <arefev@swemel.ru>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=swemel.ru; s=mail;
	t=1733132212;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=vsUdwmzHEUtFp4dw0uNgWDj5eMaa/8lI8CftTMle4BI=;
	b=glLFVMuaIeiD46Uyv90P/ajVMXJ/VOaRvcswdnYRFuhN0y+EZu27Of8BxNORqwI+3Kb49t
	4DzqNEhsZlr0UJrt25WT6+tj2M9CiYWAzNPvnXVGWCywPDUPpOrZFiS2mPxCKpvWTBP9BG
	hLTueajQ7kTDQsFVEe/0pcMPspNYTh8=
To: Richard Weinberger <richard@nod.at>
Cc: Zhihao Cheng <chengzhihao1@huawei.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org,
	stable@vger.kernel.org
Subject: [PATCH v2] mtd: ubi: Added a check for ubi_num
Date: Mon,  2 Dec 2024 12:36:52 +0300
Message-Id: <20241202093652.5911-1-arefev@swemel.ru>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_013700_059162_E6FDDD9B 
X-CRM114-Status: UNSURE (   9.06  )
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

Added a check for ubi_num for negative numbers
If the variable ubi_num takes negative values then we get:

qemu-system-arm ... -append "ubi.mtd=0,0,0,-22222345" ...
[    0.745065]  ubi_attach_mtd_dev from ubi_init+0x178/0x218
[    0.745230]  ubi_init from do_one_initcall+0x70/0x1ac
[    0.745344]  do_one_initcall from kernel_init_freeable+0x198/0x224
[    0.745474]  kernel_init_freeable from kernel_init+0x18/0x134
[    0.745600]  kernel_init from ret_from_fork+0x14/0x28
[    0.745727] Exception stack(0x90015fb0 to 0x90015ff8)

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: 83ff59a06663 ("UBI: support ubi_num on mtd.ubi command line")
Cc: stable@vger.kernel.org
Signed-off-by: Denis Arefev <arefev@swemel.ru>
---
V1 -> V2: changed the tag Fixes and moved the check to ubi_mtd_param_parse()
 drivers/mtd/ubi/build.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index 30be4ed68fad..ef6a22f372f9 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -1537,7 +1537,7 @@ static int ubi_mtd_param_parse(const char *val, const struct kernel_param *kp)
 	if (token) {
 		int err = kstrtoint(token, 10, &p->ubi_num);
 
-		if (err) {
+		if (err || p->ubi_num < UBI_DEV_NUM_AUTO) {
 			pr_err("UBI error: bad value for ubi_num parameter: %s\n",
 			       token);
 			return -EINVAL;
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
