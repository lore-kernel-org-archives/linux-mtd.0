Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDA0C607A7D7
	for <linux-mtd@archiver.kernel.org>; Wed,  4 Nov 2026 19:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yaHSursP;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=U7M/F17Y
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=37lPONTeMOsZblh760EhvywxwyFrXcpyzXDwP4dCNEM=; b=yaHSursPpLsMG1G5R9WJ1kze7y
	475n2lMvBDjnbdesoLnn30KB5NyeR+qGIjal6igSLsRdRhFpGmSTroM+c9HdM4p6LIxAwFaXY9PiV
	answY8TA9o7//Bx8K8E7fQ8iXSC+UWaFLTeYA53OGkef7gs1XHPbMzucwPzIPbL0zmmUOTeMyMJJm
	H2EFgPkBGJgM0Nf9BNmUYyHcuG5yHvxDf9HBmkIv3veB5QwqaO2yA0Ing4CvsiCEt5kLMBSkq1y7y
	NoqxGKlO7ridjcVwEe8+eKsJHXQn9sPXLt+Djtpaqgw8sXqO6VMC8CfHI7vIFLTneU2Ihp+C553NQ
	F6XXIvOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOgaC-00000006aP4-1xsh;
	Wed, 04 Nov 2026 19:23:40 +0000
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOgaA-00000006aNd-2CKf
	for linux-mtd@lists.infradead.org;
	Wed, 04 Nov 2026 19:23:39 +0000
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-8b10d24345dso10586517b3.3
        for <linux-mtd@lists.infradead.org>; Wed, 04 Nov 2026 11:23:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793820215; x=1794425015; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ps/8Xb65LPBbRmoABYT21NMRtekHEb1kQ0QpJBODTrA=;
        b=U7M/F17Yf2Kjcf2bdALmTHZ6dqIj4C+xAR7FodDBzqsBWpRA8mDqdSutJ2mp+1Vl7N
         Gn/e6fcR6fmJeiNKjXenvQEv4pW6WP5DmjA8pion20LhDZpC+t//6+xdEzLoJiaz7mXA
         CJCzT8O3WpRycA8mD9Cn3oT39qSbaxacer7SdtXUgLEfW03xL9limti8e+9j0VV4wRfz
         Gt+l0E7h12eHWZldm5lvSVKUvkh3h8UkdSQ2dtkB3CBB2euK1HIm0tEPSDJfj/mZ4AxJ
         5H+8sQ4nquTaXlmn3rtJVsNPowaWQ90HNh8V5BGEuMWzsxj21bBXBeFEZfzdAokANNX1
         0RUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793820215; x=1794425015;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ps/8Xb65LPBbRmoABYT21NMRtekHEb1kQ0QpJBODTrA=;
        b=MrlDKT9WWKUa530x8uNf5VYwxLA7Simmh4x+UwV6gZjva5BoOwJS+Ke5JgkU42q2w+
         1A8u44/N4E0y1yPVemRUOcVewzZlftZ95aW4p+bSPcy9779De5yvNiDLP+c1C1TOAtgA
         uC2lx2XNEsnUf0hGq9XjTsDf7MZM9xZbC/354OZKXAn3ZDovY8X2Q09dUAyZ4vqHMc93
         2Zi0QplCduW/I8SGlySZHqz0Tp5YWOqAmngf5izuLHH9GN1/ENwxLZkXdZ7Yypmz4eCM
         9lDy1i2z6hP8YbnjzDr9C4NgjVBg1ia+4R486WP7MxD8QGTsGFS14HT/NpJfqXI91cTo
         ByVA==
X-Gm-Message-State: APuU4Z+8Io/P9TtF2J/YO2+2t8i65mW78MR6mi0CCEzF89q4RGyO7RJa
	ZjkhwdDSV/mwon9x092uxHknQpwtBZ1uesUs3EAzdO2zT3Ijs5+qGL2IavrvEHzFJ28=
X-Gm-Gg: AYBFou0gCTJkTB3XV4Iv9+LgcsJNXXHGW0WdWIerA674YUdwSGtynZpqtzYOLEdjxiG
	rbxS/tVlCBrlv54yvdwwIcdn8gT6T0EwibiBYcwks6ZcoDWWGRIrnKH9G2Cw91wjGlpfqZ+1y7/
	TeFaF+DSMxn+NhlbO4i/IROd2fUsF8IvFC1kSBCBEWkvfN7qGdTKHjmnltuJpkNlOnC3E/Gof7r
	DXcCazXctjN3VlDPTp8kjxkAx4reLJpZYF4KDk0HzkizR0IcXKmkacAIXEaQ8kJ8JVwJ1rgUmh/
	TW/qkp9SayAGhgoROfXJ6m130E86oHCleQbZjK42JMtwmesEEQc3CKHtq/Uk4Au/3EVAGlBDLDY
	YQaOlZ3OvTlYMHeO7FYy77ELEDynVrTMQ+tHsSaSxzZwdYByvAOyhYodUH5IKFPFZzY1K1wLGhp
	i+3m+XE7uxOl2qUF9FCjyzza5GDr1+tGcSaPHiFLvCJJYXZums+1EMrBeoHFpbAVbbDsIud2Q7a
	RGdakteEP/+Gg78qS6qJkBKMtmTJTCVJQHYfhyBDkmIPv7zbFiw0NAeMAbkbpT6n6+p+EQyPjSv
	o4nXm34/1if+XNTub80TIYcedQepoaLUE9JUKRHCpA==
X-Received: by 2002:a05:690c:698b:b0:8b3:1739:31f0 with SMTP id 00721157ae682-8b317394158mr12241547b3.10.1793820210547;
        Wed, 04 Nov 2026 11:23:30 -0800 (PST)
Received: from Abelha2618.autotrac.corp ([149.78.105.186])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b3098c313esm25250307b3.15.2026.11.04.11.23.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 11:23:30 -0800 (PST)
From: Wagner Popov dos Santos <wpopov@gmail.com>
To: linux-mtd@lists.infradead.org,
	dwmw2@infradead.org,
	wuyiqing@cmss.chinamobile.com,
	richard@nod.at
Cc: wpopov@gmail.com
Subject: [PATCH] fs: jffs2: cache dirent name CRC in the raw node ref
Date: Wed,  4 Nov 2026 16:23:24 -0300
Message-ID: <20261104192324.1351450-1-wpopov@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_112338_625897_8E60C2F3 
X-CRM114-Status: GOOD (  24.91  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

jffs2_garbage_collect_deletion_dirent() has to find every obsolete
dirent that carries the same name as the deletion dirent being
collected. To do so it walks the whole raw node list of the parent
inode and, for each obsolete node whose total length matches, reads
the node header back from flash just to compare the name CRC. On NAND
based systems this turns the deletion of a single direntry into a long
sequence of small flash reads, and the cost grows with the number of
obsolete nodes still attached to the directory.

Add the optional CONFIG_JFFS2_FS_CACHE_RAW_NAME_CRC, which stores the
dirent name CRC directly in struct jffs2_raw_node_ref. The field is
populated in every path that creates a reference to a dirent node:
jffs2_write_dirent() for newly written names, jffs2_scan_dirent_node()
and jffs2_sum_process_sum_data() during mount, read_direntry() when an
inode is read back, and jffs2_wbuf_recover(), which just carries the
value over to the relocated reference because the node contents do not
change.

The feature costs four extra bytes per raw node reference, so it is
disabled by default and only worth enabling where the memory is less
scarce than the flash bandwidth.

Signed-off-by: Wagner Popov dos Santos <wpopov@gmail.com>
---

On a working partition subject to ongoing writes, new files are created,
existing file contents are modified, and files are deleted. These
operations leave obsolete directory entries that the GC may need to
examine while reclaiming erase blocks. On NAND, this check is performed
by jffs2_garbage_collect_deletion_dirent(), which examines obsolete
dirents to determine whether a deletion dirent can be discarded or is
still needed to delete a matching dirent elsewhere on flash. Caching
the name CRC avoids many small NAND reads during this inspection. The
without this optimization, the function could take several minutes to
return in some cases, causing the corresponding userspace request to
remain blocked for several minutes. The time reduction applies
specifically to this dirent-inspection step, not necessarily to the
total time for all GC activity or partition cleanup. In tests on an
ARM AM3352 platform with NAND flash connected through the GPMC bus, this
step took as little as 2% of its original time in some cases. The
actual improvement depends on the workload and partition state.

diff --git a/fs/jffs2/Kconfig b/fs/jffs2/Kconfig
index 560187d61562..332d005d1731 100644
--- a/fs/jffs2/Kconfig
+++ b/fs/jffs2/Kconfig
@@ -63,6 +63,26 @@ config JFFS2_SUMMARY
 
 	  If unsure, say 'N'.
 
+config JFFS2_FS_CACHE_RAW_NAME_CRC
+	bool "JFFS2 faster GC on cluttered partition"
+	depends on JFFS2_FS
+	default n
+	help
+	  This feature caches a small amount of additional information for
+	  each directory entry, allowing the JFFS2 garbage collector (GC)
+	  to reclaim erase blocks more efficiently and free Flash space for
+	  pending read and write operations.
+
+	  On heavily fragmented or cluttered partitions, this can reduce the
+	  time required for the GC to complete an erase-block reclamation
+	  cycle by a significant margin. The actual benefit depends on the
+	  workload and on how frequently such GC operations occur, so any
+	  improvement may only be noticeable during periods of intensive
+	  Flash activity.
+
+	  This optimization improves GC performance at the cost of a small
+	  amount of additional RAM. If RAM is severely constrained, say 'N'.
+
 config JFFS2_FS_XATTR
 	bool "JFFS2 XATTR support"
 	depends on JFFS2_FS
diff --git a/fs/jffs2/gc.c b/fs/jffs2/gc.c
index 1b833bbffcf5..f4244a46f31a 100644
--- a/fs/jffs2/gc.c
+++ b/fs/jffs2/gc.c
@@ -741,7 +741,19 @@ static int jffs2_garbage_collect_pristine(struct jffs2_sb_info *c,
 			ret = -EIO;
 		goto out_node;
 	}
+#ifdef CONFIG_JFFS2_FS_CACHE_RAW_NAME_CRC
+	{
+		struct jffs2_raw_node_ref *new_ref;
+
+		new_ref = jffs2_add_physical_node_ref(c, phys_ofs | REF_PRISTINE, rawlen, ic);
+		/* The node was copied verbatim, so the name CRC is still valid */
+		if (!IS_ERR(new_ref) &&
+		    je16_to_cpu(node->u.nodetype) == JFFS2_NODETYPE_DIRENT)
+			new_ref->name_crc = je32_to_cpu(node->d.name_crc);
+	}
+#else
 	jffs2_add_physical_node_ref(c, phys_ofs | REF_PRISTINE, rawlen, ic);
+#endif
 
 	jffs2_mark_node_obsolete(c, raw);
 	jffs2_dbg(1, "WHEEE! GC REF_PRISTINE node at 0x%08x succeeded\n",
@@ -929,6 +941,13 @@ static int jffs2_garbage_collect_deletion_dirent(struct jffs2_sb_info *c, struct
 			if (!(ref_obsolete(raw)))
 				continue;
 
+#ifdef CONFIG_JFFS2_FS_CACHE_RAW_NAME_CRC
+			/* raw->name_crc above zero and differ? It's another file. */
+			if (raw->name_crc && (raw->name_crc != name_crc)) {
+				continue;
+			}
+#endif
+
 			/* Any dirent with the same name is going to have the same length... */
 			if (ref_totlen(c, NULL, raw) != rawlen)
 				continue;
@@ -960,6 +979,14 @@ static int jffs2_garbage_collect_deletion_dirent(struct jffs2_sb_info *c, struct
 			if (je16_to_cpu(rd->nodetype) != JFFS2_NODETYPE_DIRENT)
 				continue;
 
+#ifdef CONFIG_JFFS2_FS_CACHE_RAW_NAME_CRC
+			if(!raw->name_crc && je32_to_cpu(rd->name_crc)) {
+				raw->name_crc = je32_to_cpu(rd->name_crc);
+				JFFS2_WARNING("Unspected empty name_crc at %08x\n",
+					ref_offset(raw));
+			}
+#endif
+
 			/* If the name CRC doesn't match, skip */
 			if (je32_to_cpu(rd->name_crc) != name_crc)
 				continue;
diff --git a/fs/jffs2/malloc.c b/fs/jffs2/malloc.c
index 411de8b361b2..6b2f28891ad5 100644
--- a/fs/jffs2/malloc.c
+++ b/fs/jffs2/malloc.c
@@ -175,9 +175,17 @@ static struct jffs2_raw_node_ref *jffs2_alloc_refblock(void)
 		for (i=0; i < REFS_PER_BLOCK; i++) {
 			ret[i].flash_offset = REF_EMPTY_NODE;
 			ret[i].next_in_ino = NULL;
+#ifdef CONFIG_JFFS2_FS_CACHE_RAW_NAME_CRC
+			/* Always init name_crc with zero to allow pre-verification
+			 * if the field is being updated in all the proper places. */
+			ret[i].name_crc = 0x00000000;
+#endif
 		}
 		ret[i].flash_offset = REF_LINK_NODE;
 		ret[i].next_in_ino = NULL;
+#ifdef CONFIG_JFFS2_FS_CACHE_RAW_NAME_CRC
+		ret[i].name_crc = 0x00000000;
+#endif
 	}
 	return ret;
 }
diff --git a/fs/jffs2/nodelist.h b/fs/jffs2/nodelist.h
index 2e98fa277dab..e21c3d40c7c0 100644
--- a/fs/jffs2/nodelist.h
+++ b/fs/jffs2/nodelist.h
@@ -86,6 +86,11 @@ struct jffs2_raw_node_ref
 		xattr_ref or xattr_datum instead. The common part of those structures
 		has NULL in the first word. See jffs2_raw_ref_to_ic() below */
 	uint32_t flash_offset;
+#ifdef CONFIG_JFFS2_FS_CACHE_RAW_NAME_CRC
+	uint32_t name_crc;   /* Used in GC to pre-validation of direntry to avoid flash reading during the
+				process to check if nodes are the same, excepted by the node version number.
+				Zero means 'unknown', in which case the flash still has to be read. */
+#endif
 #undef TEST_TOTLEN
 #ifdef TEST_TOTLEN
 	uint32_t __totlen; /* This may die; use ref_totlen(c, jeb, ) below */
diff --git a/fs/jffs2/readinode.c b/fs/jffs2/readinode.c
index 1caabff9dc91..7615bf5be65a 100644
--- a/fs/jffs2/readinode.c
+++ b/fs/jffs2/readinode.c
@@ -690,6 +690,11 @@ static inline int read_direntry(struct jffs2_sb_info *c, struct jffs2_raw_node_r
 #endif
 	}
 
+#ifdef CONFIG_JFFS2_FS_CACHE_RAW_NAME_CRC
+	/* Populate the cache for every dirent, not only partial-name reads */
+	ref->name_crc = je32_to_cpu(rd->name_crc);
+#endif
+
 	fd->nhash = full_name_hash(NULL, fd->name, rd->nsize);
 	fd->next = NULL;
 	fd->name[rd->nsize] = '\0';
diff --git a/fs/jffs2/scan.c b/fs/jffs2/scan.c
index 06e494797724..c063cefd19c3 100644
--- a/fs/jffs2/scan.c
+++ b/fs/jffs2/scan.c
@@ -1104,6 +1104,9 @@ static int jffs2_scan_dirent_node(struct jffs2_sb_info *c, struct jffs2_eraseblo
 
 	fd->raw = jffs2_link_node_ref(c, jeb, ofs | dirent_node_state(rd),
 				      PAD(je32_to_cpu(rd->totlen)), ic);
+#ifdef CONFIG_JFFS2_FS_CACHE_RAW_NAME_CRC
+	fd->raw->name_crc = je32_to_cpu(rd->name_crc);
+#endif
 
 	fd->next = NULL;
 	fd->version = je32_to_cpu(rd->version);
diff --git a/fs/jffs2/summary.c b/fs/jffs2/summary.c
index 4521a7723f30..bf4563a08033 100644
--- a/fs/jffs2/summary.c
+++ b/fs/jffs2/summary.c
@@ -472,6 +472,10 @@ static int jffs2_sum_process_sum_data(struct jffs2_sb_info *c, struct jffs2_eras
 
 				fd->raw = sum_link_node_ref(c, jeb,  je32_to_cpu(spd->offset) | REF_UNCHECKED,
 							    PAD(je32_to_cpu(spd->totlen)), ic);
+#ifdef CONFIG_JFFS2_FS_CACHE_RAW_NAME_CRC
+				/* Must match the on-flash name_crc, which covers nsize bytes */
+				fd->raw->name_crc = crc32(0, spd->name, spd->nsize);
+#endif
 
 				fd->next = NULL;
 				fd->version = je32_to_cpu(spd->version);
diff --git a/fs/jffs2/wbuf.c b/fs/jffs2/wbuf.c
index 3b7803c75d58..4d6e2671eaf0 100644
--- a/fs/jffs2/wbuf.c
+++ b/fs/jffs2/wbuf.c
@@ -526,6 +526,11 @@ static void jffs2_wbuf_recover(struct jffs2_sb_info *c)
 
 		new_ref = jffs2_link_node_ref(c, new_jeb, ofs | ref_flags(raw), rawlen, ic);
 
+#ifdef CONFIG_JFFS2_FS_CACHE_RAW_NAME_CRC
+		/* The node contents didn't change, so keep the cached name CRC */
+		new_ref->name_crc = raw->name_crc;
+#endif
+
 		if (adjust_ref) {
 			BUG_ON(*adjust_ref != raw);
 			*adjust_ref = new_ref;
diff --git a/fs/jffs2/write.c b/fs/jffs2/write.c
index cda9a361368e..91f30fb31ea6 100644
--- a/fs/jffs2/write.c
+++ b/fs/jffs2/write.c
@@ -326,6 +326,9 @@ struct jffs2_full_dirent *jffs2_write_dirent(struct jffs2_sb_info *c, struct jff
 		jffs2_free_full_dirent(fd);
 		return ERR_CAST(hold_err);
 	}
+#ifdef CONFIG_JFFS2_FS_CACHE_RAW_NAME_CRC
+	fd->raw->name_crc = crc32(0, name, namelen);
+#endif
 
 	if (retried) {
 		jffs2_dbg_acct_sanity_check(c,NULL);
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
