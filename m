Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A0A3CDB46E
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Oct 2023 00:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Subject:To:From:Message-ID:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=+c8iXCaIQLkjxPfHbvwsVEKSrSm330YX1ViTPQtbod8=; b=2uT
	9BhHJVStYOMuKBEXi9uJloEOQYXbMOd2ZCC2ze8IwakbEH/j5jijvkTNwc3Krj4tqi81bmLKz1FVy
	RXqWWRkedRlqtm2dpdHnczyR6eSK6G34oLjeWCwOWGqeopGHuU1kg9MIyrjkJt03zbt/qACVZTYLh
	jGwTUzUwl6xO1e2KpV/wBupxSXezRipA4Re3k1oSz+a2n17qiSoJq5DN5lag4GKvlEkH626bcxyDc
	yalb8syvNNVW3Yvj3zm0nIOqA/sS2GV8pBowS70jnborfQphg4C6YuXsF/GeUn9Qm/ykk8eqIBOfO
	ValFv2qG7VG/uuMp9tspphlvAQJEnRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqjm6-00H4Tn-1t;
	Thu, 12 Oct 2023 00:42:02 +0000
Received: from mout.gmx.com ([74.208.4.201])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqjm4-00H4T9-0S
	for linux-mtd@lists.infradead.org;
	Thu, 12 Oct 2023 00:42:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mail.com; s=s1089575;
 t=1697071308; x=1697676108; i=dregan@mail.com;
 bh=OqAnmxyNSKJ51mevJhdVzbzqzVKMRZSo0NZE0EOiMAI=;
 h=X-UI-Sender-Class:From:To:Subject:Date;
 b=WZ0pzmw2dJ1TBqYS0gufJfdk91olTxflxEQBqtAOqVRjC7CZbhRbgKpjyA+zg50AbGO5VIdwAyc
 vHSHcBoAxaKyBuVR6Eo1+apYBDOkn8HDq7cjj4d7tUOZJBq85KPWuSe49qqXc1RO+ppHO4Wy3n/Wb
 RIWoKzQISOF/KVzROdQS2PsbHxG9m3Fo1nzoLL2fqitOqWNlmRWTeDqoJdGLqFYZ+bAZN7CtC5/U8
 IwWvH9Vy506anG0C5THwbwg/S8VtZPqeIJMHJ/9Z164mcvcE5DSPZ5c3lWgDo8VJ+UVy/uw01uciG
 Cnnoj4whHK5kjwtUXxztuZ+SKqIWfT5b4BCg==
X-UI-Sender-Class: f2cb72be-343f-493d-8ec3-b1efb8d6185a
Received: from [184.189.122.102] ([184.189.122.102]) by web-mail.mail.com
 (3c-app-mailcom-lxa05.server.lan [10.76.45.6]) (via HTTP); Thu, 12 Oct 2023
 02:41:48 +0200
MIME-Version: 1.0
Message-ID: <trinity-d3f78d82-f01e-4c98-9afa-18c5f7ddfd1c-1697071308619@3c-app-mailcom-lxa05>
From: dregan@mail.com
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 bcm-kernel-feedback-list@broadcom.com, linux-mtd@lists.infradead.org,
 f.fainelli@gmail.com, rafal@milecki.pl, joel.peshkin@broadcom.com,
 computersforpeace@gmail.com, dan.beygelman@broadcom.com,
 william.zhang@broadcom.com, frieder.schrempf@kontron.de,
 linux-kernel@vger.kernel.org, vigneshr@ti.com, richard@nod.at,
 bbrezillon@kernel.org, kdasu.kdev@gmail.com, dregan@mail.com, JaimeLiao
 <jaimeliao.tw@gmail.com>, Arseniy Krasnov <AVKrasnov@sberdevices.ru>, Adam
 Borowski <kilobyte@angband.pl>
Subject: [PATCH v2 3/4] mtd: rawnand: brcmnand: pass host struct to
 bcmnand_ctrl_poll_status
Date: Thu, 12 Oct 2023 02:41:48 +0200
Importance: normal
Sensitivity: Normal
X-Priority: 3
X-Provags-ID: V03:K1:gg8Q4mswOBP0p2c8dpOs6bO8wcj0TsMctmY9kNnoCOob+xTLEzONii5p0Nm2Vo+0mzy0s
 Vhivqd6PLuRoEzNM493qUfegjN/lJPXkjIjDZLwgIH5sP5DltnfvE2TKgf3zMOr92s9iQq4Mifbf
 KU3rqCKNQ83Y94bfZ1fQidC7w45LESKLKdSLrpmNJO8qcm490x/ov6wIk47DdjfLpqYLP+ScjxfU
 K/rDW8v+8m3EmwlfS6V3CS5J6bJXyoANdyum8ClVPkEm7JBt25laYHB9Xiul0iSI0YPJvubRs1pu
 Zk=
UI-OutboundReport: notjunk:1;M01:P0:0oqmhVejaUk=;BE4RGLcilFNz5EAVug4p8qbBIlA
 yj8h7UuAHJ1Bqrv3/MMcmlbEnN9JeqJYfJyMtPoUMDVABYlDG8cMqySu4SF5IUX6mfcK1Aa+q
 w/AEeblpkiALVXeSnuZ9KFqoGmacfoJ3kmHIi9uAY6QtBYMYfnMo1IKgViOAiAhHRXQxcBwsd
 N79cg05iynh2ho0xzA+p2xX5q4LpnJmKiQ8m7ZLPjNoyLKTNrZR41Ntp0RV9bzmVTwpPcoNrG
 7HevwcgO6Gla/PaKzk9ys30Sp6bz/hyyMtWWBV4SGB6R0w9noeIhDKpUCBAqtoUJZYm6zZHQN
 re93h2ZIo9Aywt7hE7aANVgq6CHr/PZ3ghgZbektq+lCxthuYBI8DU6RHKNrvOVjdSU6B49jD
 M3Dq3/HdKrizP5xumWkacqVBnF2YQJ6z/eP9zgijR1Tm3JWg5MZ8nFZzXKTwvDXOwaYNxqC5Q
 iBU89vipM1bg56PLnE4Xn6FlKIXqpbrpXvpSwXwnwx0pXNaSjpp/Pu3TmgOFmEWEzDfBjPi4R
 JfjeMl+EMjLGrv4PnLBfvG3BrAgXJZVajbrEd5jcnsyyU+vPJYTrS4DX6H7Z3c5S9JKK7QQyz
 PtDlLRIIbGnJjx6gewQIUilQMZDbRAnjseETLVsUOjEI8zamvCBRRGBYCIceG5Fdf2ehuSNjd
 q1lsEiiOGT5C0pWw6HxxWbU7tjEYhWOn1Cn9IWc2mKPZVHY+YjgHtWJW+dcj7LStTSDX+fhtB
 HzXFdVuIHHoK+KcPiWO5uHLgX1qLebj9Rs1Ci4TSUpHvSkQ0RJShA75YVNw8Lvl99zvNjumwg
 7zSQnw7tgcux/oLg1GiX4dAA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231011_174200_252810_3B125071 
X-CRM114-Status: UNSURE (   9.87  )
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

pass host struct to bcmnand_ctrl_poll_status instead of ctrl struct,
since real time status requires host, and ctrl is a member of host.

Signed-off-by: David Regan <dregan@mail.com>

---

Changes in v2: added this patch in series
---
 drivers/mtd/nand/raw/brcmnand/brcmnand.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
index 440bef477930..8d429eb3b72a 100644
--- a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
@@ -1061,10 +1061,11 @@ enum {
 	CS_SELECT_AUTO_DEVICE_ID_CFG		= BIT(30),
 };

-static int bcmnand_ctrl_poll_status(struct brcmnand_controller *ctrl,
+static int bcmnand_ctrl_poll_status(struct brcmnand_host *host,
 				    u32 mask, u32 expected_val,
 				    unsigned long timeout_ms)
 {
+	struct brcmnand_controller *ctrl = host->ctrl;
 	unsigned long limit;
 	u32 val;

@@ -1379,7 +1380,7 @@ static void brcmnand_wp(struct mtd_info *mtd, int wp)
 		 * make sure ctrl/flash ready before and after
 		 * changing state of #WP pin
 		 */
-		ret = bcmnand_ctrl_poll_status(ctrl, NAND_CTRL_RDY |
+		ret = bcmnand_ctrl_poll_status(host, NAND_CTRL_RDY |
 					       NAND_STATUS_READY,
 					       NAND_CTRL_RDY |
 					       NAND_STATUS_READY, 0);
@@ -1389,7 +1390,7 @@ static void brcmnand_wp(struct mtd_info *mtd, int wp)
 		brcmnand_set_wp(ctrl, wp);
 		nand_status_op(chip, NULL);
 		/* NAND_STATUS_WP 0x00 = protected, 0x80 = not protected */
-		ret = bcmnand_ctrl_poll_status(ctrl,
+		ret = bcmnand_ctrl_poll_status(host,
 					       NAND_CTRL_RDY |
 					       NAND_STATUS_READY |
 					       NAND_STATUS_WP,
@@ -1629,13 +1630,13 @@ static void brcmnand_send_cmd(struct brcmnand_host *host, int cmd)
 	 */
 	if (oops_in_progress) {
 		if (ctrl->cmd_pending &&
-			bcmnand_ctrl_poll_status(ctrl, NAND_CTRL_RDY, NAND_CTRL_RDY, 0))
+			bcmnand_ctrl_poll_status(host, NAND_CTRL_RDY, NAND_CTRL_RDY, 0))
 			return;
 	} else
 		BUG_ON(ctrl->cmd_pending != 0);
 	ctrl->cmd_pending = cmd;

-	ret = bcmnand_ctrl_poll_status(ctrl, NAND_CTRL_RDY, NAND_CTRL_RDY, 0);
+	ret = bcmnand_ctrl_poll_status(host, NAND_CTRL_RDY, NAND_CTRL_RDY, 0);
 	WARN_ON(ret);

 	mb(); /* flush previous writes */
@@ -1664,7 +1665,7 @@ static bool brcmstb_nand_wait_for_completion(struct nand_chip *chip)
 	if (mtd->oops_panic_write || ctrl->irq < 0) {
 		/* switch to interrupt polling and PIO mode */
 		disable_ctrl_irqs(ctrl);
-		sts = bcmnand_ctrl_poll_status(ctrl, NAND_CTRL_RDY,
+		sts = bcmnand_ctrl_poll_status(host, NAND_CTRL_RDY,
 					       NAND_CTRL_RDY, 0);
 		err = sts < 0;
 	} else {
--
2.37.3



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
