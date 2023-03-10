Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67562C6FD19
	for <linux-mtd@archiver.kernel.org>; Fri, 10 Mar 2023 08:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CWVHN998VyQgcoRk3FKm+cicSMEJ3GtiCFpi7H0VODM=; b=TcrCaY89yU1H37
	TeBawVJhD7I7oTWou/LRMNW2gkayU6GKHz5/U6G6jYtRU2WdZ30OFKpLD/iqTnZNNhjRqxHej2ptS
	7HrUWn4Xn5ngkPYqXIkEZDymtX0Z2bKsMw7c06z9mUrLlu0EIsbXmnPFmVSvnkYg/fSUiziH9NU8C
	5TxaluZEc6nEkOZbs9ibJQhzeBA5NNhsNoJoQQybRzh92YBlmGJhF5P0LTwt9WKCO7dlwVAOXo1UO
	04UY0KcR4txw5IQZqXkd1j8frnOA02IpVlZZUDO34kY8FxbAOE6LcDtqZNcsjvLNhXcqZp0Tc2l/d
	RH1bFmd5eto1yI/P3u1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paYWo-00DmuG-9Z; Fri, 10 Mar 2023 08:55:06 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paYWj-00DmsY-3L
	for linux-mtd@lists.infradead.org; Fri, 10 Mar 2023 08:55:03 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id B9C6A240004;
	Fri, 10 Mar 2023 08:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1678438496;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=aIe/Bg395V0+f3olISgbct+jWoJFRCODY3GUG/C+Blo=;
	b=Gu8yjAaiGy7xglXLmMfWgt5Kq+fW0D67tTsJFY5gUnXyg3cedY5dHoh+Yu0uN44iGcIN2r
	C7AjBA3ifkDu7dv8eRi2OR7O242mu73xhKf5vqroXrrgXoMsTn8QB4SAJB1enQMqn77CV7
	3zMVl5yuBIJ3oIlSOo+2AxtVzStkVUswf40xU3CiK6YVhzbZGQNrNUGIZ99epK95M4WPC1
	qAN+DtED6K2ku8tOHU9tUFrgV5mVGjnDPIVERaYEQ23KgBQGdNr4qr+vE529QDE2ooW3ED
	62IRAfVHBZBShXERp6rltYSh83Oe/M9+sbHBFHse7WOrsAtBdUL9NnilJ8sRjg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>
Cc: Julien Su <juliensu@mxic.com.tw>,
	Jaime Liao <jaimeliao@mxic.com.tw>,
	Jaime Liao <jaimeliao.tw@gmail.com>,
	Alvin Zhou <alvinzhou@mxic.com.tw>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Zhihao Cheng <chengzhihao1@huawei.com>
Subject: [PATCH] mtd: rawnand: nandsim: Artificially prevent sequential page reads
Date: Fri, 10 Mar 2023 09:54:52 +0100
Message-Id: <20230310085452.1368716-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230310_005501_617725_C3717B09 
X-CRM114-Status: GOOD (  21.68  )
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

The continuous read support added recently makes nandsim
unhappy. Indeed, all the supported commands should be re-encoded into
internal commands, so of course there is currently no support for the
commands and patterns needed for continuous reads to work.

I tried to add support for them but nandsim (which is more a tool to
develop/debug upper layers rather than the raw NAND core) suffers from a
big limitation: it's internal parser needs to know what exact operation
is happening when the address cycles are performed. The research is then
sequential from the start up to the address cycles, but does not check
what's coming next even though the information is available. This is a
limitation which is related to the old API used by the core which kind
of forced the controllers to guess what operation was being performed
rather early. Today the core uses a more transparent API called
->exec_op() which no longer requires controller drivers to do any more
guessing, but despite being updated to ->exec_op(), nandsim is still a
bit constrained on this regard and thus cannot handle sequential page
reads because the start sequence beginning is identical to a regular
page read.

If the internal algorithm is updated some day, it should be possible to
make it support sequential page reads by adding something like:

       /* Large page devices continuous read page start */
       {OPT_LARGEPAGE, {STATE_CMD_READ0, STATE_ADDR_PAGE, STATE_CMD_READSTART,
                        STATE_CMD_READCACHESEQ | ACTION_CPY, STATE_DATAOUT,
                        STATE_READY}},
       /* Large page devices continuous read page continue */
       {OPT_LARGEPAGE, {STATE_CMD_READCACHESEQ | ACTION_CPY_NEXT, STATE_DATAOUT,
                        STATE_READY}},
       /* Large page devices continuous read page end */
       {OPT_LARGEPAGE, {STATE_CMD_READCACHEEND | ACTION_CPY_NEXT, STATE_DATAOUT,
                        STATE_READY}},

For now, we just return -EOPNOTSUPP when the core asks controller
drivers if they support the feature in order to prevent any further use
of these opcodes.

Note: This is a hack, ->exec_op() is not supposed to check against the
COMMAND opcodes unless _really_ needed.

Fixes: 003fe4b9545b ("mtd: rawnand: Support for sequential cache reads")
Reported-by: Zhihao Cheng <chengzhihao1@huawei.com>
Link: https://lore.kernel.org/linux-mtd/fd34fe55-7f4a-030d-8653-9bb9cf08410d@huawei.com/
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/nandsim.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/nandsim.c b/drivers/mtd/nand/raw/nandsim.c
index c21abf748948..179b28459b4b 100644
--- a/drivers/mtd/nand/raw/nandsim.c
+++ b/drivers/mtd/nand/raw/nandsim.c
@@ -2160,8 +2160,23 @@ static int ns_exec_op(struct nand_chip *chip, const struct nand_operation *op,
 	const struct nand_op_instr *instr = NULL;
 	struct nandsim *ns = nand_get_controller_data(chip);
 
-	if (check_only)
+	if (check_only) {
+		/* The current implementation of nandsim needs to know the
+		 * ongoing operation when performing the address cycles. This
+		 * means it cannot make the difference between a regular read
+		 * and a continuous read. Hence, this hack to manually refuse
+		 * supporting sequential cached operations.
+		 */
+		for (op_id = 0; op_id < op->ninstrs; op_id++) {
+			instr = &op->instrs[op_id];
+			if (instr->type == NAND_OP_CMD_INSTR &&
+			    (instr->ctx.cmd.opcode == NAND_CMD_READCACHEEND ||
+			     instr->ctx.cmd.opcode == NAND_CMD_READCACHESEQ))
+				return -EOPNOTSUPP;
+		}
+
 		return 0;
+	}
 
 	ns->lines.ce = 1;
 
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
