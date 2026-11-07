Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0D4E606A333
	for <linux-mtd@archiver.kernel.org>; Sat,  7 Nov 2026 09:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GM0l1ogw;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=naver.com header.i=@naver.com header.a=rsa-sha256 header.s=s20171208 header.b=hI00iQLS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=J4HdclgiE9gfhfbKb9V8oqMQt0+bZKJwF4QoRaU9/2Y=; b=GM0l1ogwVovtVy9XESXg4xylRf
	6Hg5YTmf/EIs+ECvovbQOu+yWUQ2wtfVVg8cUVMXvxuBR7TaU13vWwd9ExxM3Z9LcZM9AKfaS/QNG
	SJz1RGR0wXMipaug0iAMOs8bw5Kh65wCmZ8rlaLTv2IkspnhTjzI1WEfhhDcJ7lBNrYlST9rGGzJt
	UNu/M4a0khJta/uR7NdriT8ujqt45lr9NR/VEAkA9mMrQKuPRvK+kvpPSxemUieg3pB7p6DTUkeLa
	LPWmP8RdeJUdfaUq8XgXg6Vj6GmkSG7thNHjDPkrDNgk/W0300R/j62GAhcqD1JesykfItHIz+S36
	qr+F21pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPcq9-0000000EQjk-0XGA;
	Sat, 07 Nov 2026 09:36:01 +0000
Received: from cvsmtppost26.nm.naver.com ([114.111.35.112])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPcq6-0000000EQiz-0h5p
	for linux-mtd@lists.infradead.org;
	Sat, 07 Nov 2026 09:35:59 +0000
Received: from nv1s-hmac-real-26 ([10.180.31.91])
  by cvsmtppost26.nm.naver.com with ESMTP id Oi4sds-oQkKnxwqAPo5i6w
  for <linux-mtd@lists.infradead.org>;
  Sat, 07 Nov 2026 09:35:53 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=naver.com; s=s20171208;
	t=1794044153; bh=OrWjURs//sX/XPa08q6qNWmq97/DWOfU98L36NX1yFo=;
	h=From:To:Subject:Date:Message-ID:From:Subject:Feedback-ID:
	 X-Works-Security;
	b=hI00iQLSsg4k4DHDh5AU9KCxZK7oNkT6Co37pzsFICFkKdihnFLdgUpNe1z/Yi3xV
	 Yeggs0w9XlQQPMEvs6oXVI/FC9mfDldOpGD0Dloj4LAr+bN1oDkN/ZQCKzFQUzZs6h
	 OGo0UBZcFuc361If0r4fcmhLjIy0ovR5kiyZAMLcHes/gh++okprq6tKqdyz836E4n
	 9FeycKOkuxCvcTtYkvRAIXnvZB0RnnAS8kiIM8cd+zSWiDB+ICjmKonlHXlYeAlUbr
	 exJVds3EhOYXk5HMS+DJvz0wcpLl3GsqPhKuiWk4U0k1LTwKIVwOI/cSncsRtjXdby
	 lDKJPWexuqsKw==
X-Session-ID: Y3wjdQtHSoWhTTk6-3N9nA
X-Works-Send-Opt: OPFwpzGdjHmdKHFOMr39Ko3YKHmdjAudFqM9KqMqFxIYkEljxBmwjAg=
X-Works-Smtp-Source: rZYwKAtlFqJZ+HmZFxbw+6E=
Received: from localhost.localdomain ([115.136.205.4])
  by cvnsmtp012.nm.naver.com with ESMTP id Y3wjdQtHSoWhTTk6-3N9nA
  for <multiple recipients>
  (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
  Sat, 07 Nov 2026 09:35:52 -0000
From: Sung Byeongchan <tjdqudcks0424@naver.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: rfd_ftl: quiesce requests before freeing mappings
Date: Sat,  7 Nov 2026 18:35:46 +0900
Message-ID: <20261107093546.619214-1-tjdqudcks0424@naver.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261107_013558_622513_F1B66EA7 
X-CRM114-Status: GOOD (  11.30  )
X-Spam-Score: -2.5 (--)
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


rfd_ftl_remove_dev() frees the sector map, header cache and block array
before del_mtd_blktrans_dev() stops new requests and drains the blk-mq
queue. A block read admitted before that late barrier can consequently use
the freed sector map in rfd_ftl_readsect().

The issue reproduced as the same rfd_ftl_readsect() Oops in three of three
fresh KASAN boots using the production MTD BLKPG add/delete and RFD block
read paths. Normal, close-before-delete and wrong-partition controls were
clean in nine of nine boots.

Save the three allocation pointers while the enclosing partition is live,
quiesce and drain through the blktrans core, then free only the saved
pointers. This also avoids dereferencing the partition after core teardown
may release its final reference.

The fixed kernel completed 32 natural delete/read cycles in each of three
fresh boots without Oops or KASAN. All fixed controls and following-valid
operations also passed.

The demonstrated impact is a local or delegated kernel invalid read and
crash with administrative setup and deletion. Information disclosure,
controlled write, RCE and LPE were not demonstrated.

Fixes: d056f8cd2fc2 ("mtd: rfd_ftl: fix use-after-free")
Link: https://lore.kernel.org/r/20210807214538.14484-5-sean@mess.org
Assisted-by: OpenAI Codex

Signed-off-by: Sung Byeongchan <tjdqudcks0424@naver.com>
---
 drivers/mtd/rfd_ftl.c |    9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)
diff --git a/drivers/mtd/rfd_ftl.c b/drivers/mtd/rfd_ftl.c
index 9f7efdab6e908..0f7b3fb27ece8 100644
--- a/drivers/mtd/rfd_ftl.c
+++ b/drivers/mtd/rfd_ftl.c
@@ -792,6 +792,9 @@ static void rfd_ftl_add_mtd(struct mtd_blktrans_ops *tr, struct mtd_info *mtd)
 static void rfd_ftl_remove_dev(struct mtd_blktrans_dev *dev)
 {
 	struct partition *part = container_of(dev, struct partition, mbd);
+	u_long *sector_map = part->sector_map;
+	u16 *header_cache = part->header_cache;
+	struct block *blocks = part->blocks;
 	int i;
 
 	for (i=0; i<part->total_blocks; i++) {
@@ -799,10 +802,10 @@ static void rfd_ftl_remove_dev(struct mtd_blktrans_dev *dev)
 			part->mbd.mtd->name, i, part->blocks[i].erases);
 	}
 
-	vfree(part->sector_map);
-	kfree(part->header_cache);
-	kfree(part->blocks);
 	del_mtd_blktrans_dev(&part->mbd);
+	vfree(sector_map);
+	kfree(header_cache);
+	kfree(blocks);
 }
 
 static struct mtd_blktrans_ops rfd_ftl_tr = {

base-commit: d48723711bae9b8cdc56719c448ba42fef28cbee
-- 
2.43.0

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
