Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34074C6FD1C
	for <linux-mtd@archiver.kernel.org>; Tue, 14 Mar 2023 12:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gn6l4AhJcsCH9UMlYUyTJx+gcGCuw7t2hjwjBuvEgns=; b=ChU98W1UolQ1n7
	O9l1QZLknhdYYWiJaeyTY6shCHqMW5RNlMiyB7zBizfRkrqEMQSqZfK44WJymwMZC7w2RR1v7HGJo
	Ysy/XUlDdpMojL70Qbx0l1u9bOa5wdm1GU38Cnrfjm4gfPXynenx2tRyn3K0urn6qjgwLexcN3XBr
	rnqpr5c85KDowBU7eA6XK5Wzc7gnmFE63AiMeC+FSmhMelEz3NpruxD3GNTchPjb7BKY6C9yDTC/g
	BJjU39kBTUbZWEQVa5ltPWDAAgE24ReqboV3fC7aOFRWNyVtLew7ZZ2IJSvPAiFY6gt6rG5eZStwU
	OyTjUmDnJiGdf7CqmZCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pc40w-00AA0D-1R;
	Tue, 14 Mar 2023 12:44:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pc40u-00A9yN-2O
	for linux-mtd@bombadil.infradead.org;
	Tue, 14 Mar 2023 12:44:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=1l/OCXfXb7USSL83srJj7DWcBu6T/Jf3+O/gmXa7YN8=; b=JtAI4+FmSIVI+oGuHj4D1GkgKK
	CTx/5ofNTQscuF/m0QdyIQgmCSp7/yHhO83QNi5QV4SpGYTTsPWS18kpEliV1MMb9SsN1UxM175Mj
	vFkgYcvvycJvhNe8V/HldC2IavCOfpbWdZsKF/kt53WNg7Ou2LBH2KJAttAEYJz5NeU7JgSjs/xFW
	P/QN9rlS7ypxPDKLUMioNJmFmDJpttarCO2W53S/And+V+66xgeLUzyYW88RFmS85omQhbbF0fwwm
	IT4MJdUoispoKMXnLIgvhazSBgWM+j6PD4Rf24U4W1TFdwOpp8tuN6yBYFsBqIjkjlfbKu4zEYvlJ
	grYT1+sA==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pc40q-001mef-18
	for linux-mtd@lists.infradead.org;
	Tue, 14 Mar 2023 12:44:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D49BD6177C;
	Tue, 14 Mar 2023 12:44:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBB2FC433A1;
	Tue, 14 Mar 2023 12:44:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678797856;
	bh=v6nTogP6iEQ2uww4dLnsRnckbyhaQOz1zvK0D9le53s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mcNWXe/nYqhMwCh3J7y3h28I/MzjYcR59TOJX8aKHAi2aALbOcUU68oW/l28KUTKa
	 PcgcvA7bucmhWrWbtflcXDduCvkcuCkToS7uKlOC44MVgYrQFG3tirwOM8IMLQyqkx
	 vHS6gpzGl/OpnykDaJqO6oRdoYPTRDonX4aLH2EDfHAu3LANTKb9NaWBn0NsTfzAzN
	 AsaEpvwZXKPz9ykc5p8K/Mk6AMLqsCVaOWTeqIZX5mVBt25AwEmJl/OwNkSQj7M6dN
	 NcJJaar4iU6L3PW1zv+r4pn7srIa00XIdLNUJnEzegGiX4Q3JdeRYhBtJen6AcQGwW
	 lunTK5YnUxk8A==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Yifei Liu <yifeliu@cs.stonybrook.edu>,
	Erez Zadok <ezk@cs.stonybrook.edu>,
	Manish Adkar <madkar@cs.stonybrook.edu>,
	Richard Weinberger <richard@nod.at>,
	Sasha Levin <sashal@kernel.org>,
	dwmw2@infradead.org,
	linux-mtd@lists.infradead.org
Subject: [PATCH AUTOSEL 5.4 2/7] jffs2: correct logic when creating a hole in jffs2_write_begin
Date: Tue, 14 Mar 2023 08:44:07 -0400
Message-Id: <20230314124412.471364-2-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230314124412.471364-1-sashal@kernel.org>
References: <20230314124412.471364-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230314_124420_795963_1E3FC868 
X-CRM114-Status: GOOD (  19.39  )
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

From: Yifei Liu <yifeliu@cs.stonybrook.edu>

[ Upstream commit 23892d383bee15b64f5463bd7195615734bb2415 ]

Bug description and fix:

1. Write data to a file, say all 1s from offset 0 to 16.

2. Truncate the file to a smaller size, say 8 bytes.

3. Write new bytes (say 2s) from an offset past the original size of the
file, say at offset 20, for 4 bytes.  This is supposed to create a "hole"
in the file, meaning that the bytes from offset 8 (where it was truncated
above) up to the new write at offset 20, should all be 0s (zeros).

4. Flush all caches using "echo 3 > /proc/sys/vm/drop_caches" (or unmount
and remount) the f/s.

5. Check the content of the file.  It is wrong.  The 1s that used to be
between bytes 9 and 16, before the truncation, have REAPPEARED (they should
be 0s).

We wrote a script and helper C program to reproduce the bug
(reproduce_jffs2_write_begin_issue.sh, write_file.c, and Makefile).  We can
make them available to anyone.

The above example is shown when writing a small file within the same first
page.  But the bug happens for larger files, as long as steps 1, 2, and 3
above all happen within the same page.

The problem was traced to the jffs2_write_begin code, where it goes into an
'if' statement intended to handle writes past the current EOF (i.e., writes
that may create a hole).  The code computes a 'pageofs' that is the floor
of the write position (pos), aligned to the page size boundary.  In other
words, 'pageofs' will never be larger than 'pos'.  The code then sets the
internal jffs2_raw_inode->isize to the size of max(current inode size,
pageofs) but that is wrong: the new file size should be the 'pos', which is
larger than both the current inode size and pageofs.

Similarly, the code incorrectly sets the internal jffs2_raw_inode->dsize to
the difference between the pageofs minus current inode size; instead it
should be the current pos minus the current inode size.  Finally,
inode->i_size was also set incorrectly.

The patch below fixes this bug.  The bug was discovered using a new tool
for finding f/s bugs using model checking, called MCFS (Model Checking File
Systems).

Signed-off-by: Yifei Liu <yifeliu@cs.stonybrook.edu>
Signed-off-by: Erez Zadok <ezk@cs.stonybrook.edu>
Signed-off-by: Manish Adkar <madkar@cs.stonybrook.edu>
Signed-off-by: Richard Weinberger <richard@nod.at>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/jffs2/file.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/fs/jffs2/file.c b/fs/jffs2/file.c
index 34880a4c21732..94bd4bbd37875 100644
--- a/fs/jffs2/file.c
+++ b/fs/jffs2/file.c
@@ -137,19 +137,18 @@ static int jffs2_write_begin(struct file *filp, struct address_space *mapping,
 	struct jffs2_inode_info *f = JFFS2_INODE_INFO(inode);
 	struct jffs2_sb_info *c = JFFS2_SB_INFO(inode->i_sb);
 	pgoff_t index = pos >> PAGE_SHIFT;
-	uint32_t pageofs = index << PAGE_SHIFT;
 	int ret = 0;
 
 	jffs2_dbg(1, "%s()\n", __func__);
 
-	if (pageofs > inode->i_size) {
-		/* Make new hole frag from old EOF to new page */
+	if (pos > inode->i_size) {
+		/* Make new hole frag from old EOF to new position */
 		struct jffs2_raw_inode ri;
 		struct jffs2_full_dnode *fn;
 		uint32_t alloc_len;
 
-		jffs2_dbg(1, "Writing new hole frag 0x%x-0x%x between current EOF and new page\n",
-			  (unsigned int)inode->i_size, pageofs);
+		jffs2_dbg(1, "Writing new hole frag 0x%x-0x%x between current EOF and new position\n",
+			  (unsigned int)inode->i_size, (uint32_t)pos);
 
 		ret = jffs2_reserve_space(c, sizeof(ri), &alloc_len,
 					  ALLOC_NORMAL, JFFS2_SUMMARY_INODE_SIZE);
@@ -169,10 +168,10 @@ static int jffs2_write_begin(struct file *filp, struct address_space *mapping,
 		ri.mode = cpu_to_jemode(inode->i_mode);
 		ri.uid = cpu_to_je16(i_uid_read(inode));
 		ri.gid = cpu_to_je16(i_gid_read(inode));
-		ri.isize = cpu_to_je32(max((uint32_t)inode->i_size, pageofs));
+		ri.isize = cpu_to_je32((uint32_t)pos);
 		ri.atime = ri.ctime = ri.mtime = cpu_to_je32(JFFS2_NOW());
 		ri.offset = cpu_to_je32(inode->i_size);
-		ri.dsize = cpu_to_je32(pageofs - inode->i_size);
+		ri.dsize = cpu_to_je32((uint32_t)pos - inode->i_size);
 		ri.csize = cpu_to_je32(0);
 		ri.compr = JFFS2_COMPR_ZERO;
 		ri.node_crc = cpu_to_je32(crc32(0, &ri, sizeof(ri)-8));
@@ -202,7 +201,7 @@ static int jffs2_write_begin(struct file *filp, struct address_space *mapping,
 			goto out_err;
 		}
 		jffs2_complete_reservation(c);
-		inode->i_size = pageofs;
+		inode->i_size = pos;
 		mutex_unlock(&f->sem);
 	}
 
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
