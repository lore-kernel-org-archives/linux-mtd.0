Return-Path: <SRS0=HfhP=G3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF217C433E9
	for <linux-mtd@archiver.kernel.org>; Sun, 24 Jan 2021 23:22:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 612B4229C6
	for <linux-mtd@archiver.kernel.org>; Sun, 24 Jan 2021 23:22:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 612B4229C6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/Pjcgnmtr80kP/XUXh48QJSuHNIquk8mPfBMiO5FEeA=; b=xzn72Y1GHOqk8pIoJQsdLRqjX
	Fj3o3mB2X4R4S1NyiGhvEU5/YBaeTUPmUcRV8obVkmsYqI3PGdey7JpC0TzAWbXziYto4IEVDb4n/
	tNX5uvaIhcqp3x/6m75ZCs9fLhzccyHUyTl0HSMZIvU2AVYHLJJNzA9T//STdFPL3JqO1CNk+EpVH
	j49OiRVe5+ODMg8QlcR+E45glZXONkVtE8NPOFGCqnBBYY3rhHhpCrgitjsgoWHrc5I0bz8HVWdOq
	tINl5aS0DpMHKeGPufFqMSFbYqddgNX8WP0iAAX9AJ+xkKMGlVKtCpmzTToRMcZAlklDWixjx95+Z
	nSvMj2PSQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l3ohC-000789-Ax; Sun, 24 Jan 2021 23:21:26 +0000
Received: from lilium.sigma-star.at ([109.75.188.150])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l3ogt-00074F-7h
 for linux-mtd@lists.infradead.org; Sun, 24 Jan 2021 23:21:10 +0000
Received: from localhost (localhost [127.0.0.1])
 by lilium.sigma-star.at (Postfix) with ESMTP id 8668B1812A4B6;
 Mon, 25 Jan 2021 00:21:02 +0100 (CET)
Received: from lilium.sigma-star.at ([127.0.0.1])
 by localhost (lilium.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id qVqT6mphhTMm; Mon, 25 Jan 2021 00:21:02 +0100 (CET)
Received: from lilium.sigma-star.at ([127.0.0.1])
 by localhost (lilium.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id OVbrgLCKol4h; Mon, 25 Jan 2021 00:21:01 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: miklos@szeredi.hu
Subject: [PATCH 5/8] mtd: Allow passing a custom cmdline to cmdline line parser
Date: Mon, 25 Jan 2021 00:20:04 +0100
Message-Id: <20210124232007.21639-6-richard@nod.at>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210124232007.21639-1-richard@nod.at>
References: <20210124232007.21639-1-richard@nod.at>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210124_182107_582307_63A26810 
X-CRM114-Status: GOOD (  23.86  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: vigneshr@ti.com, fuse-devel@lists.sourceforge.net,
 Richard Weinberger <richard@nod.at>, miquel.raynal@bootlin.com,
 linux-kernel@vger.kernel.org, boris.brezillon@collabora.com,
 linux-mtd@lists.infradead.org, rminnich@google.com, sven@narfation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The cmdline parser uses usually the mtdparts string from the kernel cmdline.
For special purpose MTDs like MUSE it is useful to pass a custom
mtdparts string to the parser. This allows the MTD simulator in
userspace directly passing a mtdparts string and the new MTD
partitioned.

To achieve this, struct mtd_part_parser_data now has a mtdparts pointer
where a custom mtdparts string can be provided, it overrules the kernel
cmdline.
Since the cmdline parser stays for ever in the kernel, the memory lifecycle
had to be changed a little such that custom mtdparts string don't result
in memory leaks.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/parsers/cmdlinepart.c | 73 ++++++++++++++++++++++++-------
 include/linux/mtd/partitions.h    |  2 +
 2 files changed, 58 insertions(+), 17 deletions(-)

diff --git a/drivers/mtd/parsers/cmdlinepart.c b/drivers/mtd/parsers/cmdlinepart.c
index 0ddff1a4b51f..f0fe87267380 100644
--- a/drivers/mtd/parsers/cmdlinepart.c
+++ b/drivers/mtd/parsers/cmdlinepart.c
@@ -64,7 +64,7 @@ struct cmdline_mtd_partition {
 };
 
 /* mtdpart_setup() parses into here */
-static struct cmdline_mtd_partition *partitions;
+static struct cmdline_mtd_partition *cmdline_partitions;
 
 /* the command line passed to mtdpart_setup() */
 static char *mtdparts;
@@ -138,9 +138,6 @@ static struct mtd_partition * newpart(char *s,
 		name_len = 13; /* Partition_000 */
 	}
 
-	/* record name length for memory allocation later */
-	extra_mem_size += name_len + 1;
-
 	/* test for options */
 	if (strncmp(s, "ro", 2) == 0) {
 		mask_flags |= MTD_WRITEABLE;
@@ -192,12 +189,17 @@ static struct mtd_partition * newpart(char *s,
 	parts[this_part].offset = offset;
 	parts[this_part].mask_flags = mask_flags;
 	parts[this_part].add_flags = add_flags;
+
+	/*
+	 * Will get free()'ed in ->cleanup()
+	 */
 	if (name)
-		strlcpy(extra_mem, name, name_len + 1);
+		parts[this_part].name = kmemdup_nul(name, name_len, GFP_KERNEL);
 	else
-		sprintf(extra_mem, "Partition_%03d", this_part);
-	parts[this_part].name = extra_mem;
-	extra_mem += name_len + 1;
+		parts[this_part].name = kasprintf(GFP_KERNEL, "Partition_%03d", this_part);
+
+	if (!parts[this_part].name)
+		return ERR_PTR(-ENOMEM);
 
 	dbg(("partition %d: name <%s>, offset %llx, size %llx, mask flags %x\n",
 	     this_part, parts[this_part].name, parts[this_part].offset,
@@ -217,7 +219,7 @@ static struct mtd_partition * newpart(char *s,
 /*
  * Parse the command line.
  */
-static int mtdpart_setup_real(char *s)
+static int mtdpart_setup_real(char *s, struct cmdline_mtd_partition **partitions)
 {
 	cmdline_parsed = 1;
 
@@ -301,8 +303,8 @@ static int mtdpart_setup_real(char *s)
 		strlcpy(this_mtd->mtd_id, mtd_id, mtd_id_len + 1);
 
 		/* link into chain */
-		this_mtd->next = partitions;
-		partitions = this_mtd;
+		this_mtd->next = *partitions;
+		*partitions = this_mtd;
 
 		dbg(("mtdid=<%s> num_parts=<%d>\n",
 		     this_mtd->mtd_id, this_mtd->num_parts));
@@ -335,13 +337,23 @@ static int parse_cmdline_partitions(struct mtd_info *master,
 				    struct mtd_part_parser_data *data)
 {
 	unsigned long long offset;
-	int i, err;
+	int i, err, num_parts;
 	struct cmdline_mtd_partition *part;
 	const char *mtd_id = master->name;
+	struct cmdline_mtd_partition *parsed_parts = cmdline_partitions;
+	bool free_parts = false;
+
+	if (data && data->mtdparts) {
+		parsed_parts = NULL;
 
-	/* parse command line */
-	if (!cmdline_parsed) {
-		err = mtdpart_setup_real(cmdline);
+		err = mtdpart_setup_real(data->mtdparts, &parsed_parts);
+		if (err)
+			return err;
+
+		free_parts = true;
+	} else if (!cmdline_parsed) {
+		/* parse command line */
+		err = mtdpart_setup_real(cmdline, &cmdline_partitions);
 		if (err)
 			return err;
 	}
@@ -350,7 +362,7 @@ static int parse_cmdline_partitions(struct mtd_info *master,
 	 * Search for the partition definition matching master->name.
 	 * If master->name is not set, stop at first partition definition.
 	 */
-	for (part = partitions; part; part = part->next) {
+	for (part = parsed_parts; part; part = part->next) {
 		if ((!mtd_id) || (!strcmp(part->mtd_id, mtd_id)))
 			break;
 	}
@@ -384,12 +396,38 @@ static int parse_cmdline_partitions(struct mtd_info *master,
 		}
 	}
 
+	/*
+	 * Will get free()'ed in ->cleanup()
+	 */
 	*pparts = kmemdup(part->parts, sizeof(*part->parts) * part->num_parts,
 			  GFP_KERNEL);
 	if (!*pparts)
 		return -ENOMEM;
 
-	return part->num_parts;
+	num_parts = part->num_parts;
+
+	if (free_parts == true) {
+		part = parsed_parts;
+		while (part) {
+			struct cmdline_mtd_partition *next = part->next;
+
+			kfree(part->parts);
+			part = next;
+		}
+	}
+
+	return num_parts;
+}
+
+static void cmdline_partitions_cleanup(const struct mtd_partition *pparts,
+				       int nr_parts)
+{
+	int i;
+
+	for (i = 0; i < nr_parts; i++)
+		kfree(pparts[i].name);
+
+	kfree(pparts);
 }
 
 
@@ -410,6 +448,7 @@ __setup("mtdparts=", mtdpart_setup);
 
 static struct mtd_part_parser cmdline_parser = {
 	.parse_fn = parse_cmdline_partitions,
+	.cleanup = cmdline_partitions_cleanup,
 	.name = "cmdlinepart",
 };
 
diff --git a/include/linux/mtd/partitions.h b/include/linux/mtd/partitions.h
index b74a539ec581..6c8b3399143d 100644
--- a/include/linux/mtd/partitions.h
+++ b/include/linux/mtd/partitions.h
@@ -65,9 +65,11 @@ struct device_node;
 /**
  * struct mtd_part_parser_data - used to pass data to MTD partition parsers.
  * @origin: for RedBoot, start address of MTD device
+ * @mtdparts: for cmdline parser, use this string instead of mtdparts= from cmdline
  */
 struct mtd_part_parser_data {
 	unsigned long origin;
+	char *mtdparts;
 };
 
 
-- 
2.26.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
