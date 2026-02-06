Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44AD5EE2091
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Feb 2026 11:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FpKll2RgjETPqPoYuXQHF/gITPP4sYRp4mpKYYOhZkM=; b=dGLOjvEI8LMTSz
	ratFdujLqM64jQIrMQG0YoArU1eQoQfid4hrVl1gYRSLBYTmpV31cZhdpMjpPGyUadyhoMqZ7CFAA
	5XRGiMNz5SZ88EsRNMB8yawWNsl+Vetg0FC4sOVkcdpnjhieF/Qa+2QR2OklpD0glOZyxZy0j3Q8K
	nt2i3M+ru9mC6zGAeCvwKqYHXXZV18PTGLltVZHSRMC0BoE51e2oOzaoq99K0CoXp0p15ePuGh0nE
	wU1IBwaJDv+zOA8KEvYAXh5vS2SlN8K4ECy05Yxw4WfFxfFTPdWjtFC+c342FvVyWSiysDSx8Qew5
	WAdu9hopfzH/xyz7mwTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voKMr-0000000BGFj-39g0;
	Fri, 06 Feb 2026 11:51:21 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voKMo-0000000BGFO-1YKy
	for linux-mtd@lists.infradead.org;
	Fri, 06 Feb 2026 11:51:20 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2a871c8b171so14971635ad.3
        for <linux-mtd@lists.infradead.org>; Fri, 06 Feb 2026 03:51:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770378677; x=1770983477; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=33anR6skOU7C6MY+v0MoVum+PUKxnrSQThfEb3hFZtA=;
        b=K3VmbTaBk8mX74KHxIs9nxTKPQUMVRawUZpSUEylzAk+BcKzE+x/tnLY5aU3DEunyR
         m0ZTWwJQONM1/AUmQ6TrpQnvupD1dF0fy6O8DYtgscD5RErP6eivMUOPUgysI2TjRJ0w
         W4oZ8wLZepaRo2D+9AxCySfY8Sia5QPTC0f3I0KZJpFxsmeT1u3D0cP+6e13zdEWbcCO
         DQWUmZazv/71IBveuudiOLvGnx3Duc06rZXDqmhKTW9AGC1UEuL/4kULhIMwnvhR2017
         mr3dKfrEM1+da1TTrHHO+U12FajDe6tsP0LUKVOxPy0BPmKtAFO17zoiD7f5sMTPWAAn
         hdaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770378677; x=1770983477;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=33anR6skOU7C6MY+v0MoVum+PUKxnrSQThfEb3hFZtA=;
        b=noeWZOE8sW/fFi1qKv37Q9VQwAxLEjMGX4mTDL5A8XpV0+tVToMsuOzDSL/1Qb1MZF
         woRRIqw5wMndqw1NJrD+KU9O6WFH5xGP0NeZJCBo5POC4Z9GhOdoE3Ck1p7lBswbqEId
         zAACvOSNVhOf9KSwsyJapqP6x++gmYLGDiI0STMTYJKnA1jfduHYLCe4E73g0V2t1ahR
         oIwtQBvIKKvCd6lbJ8iv5tk/tNkxlfyKHUsmnIyJhBu+XoHBYuO9Y7JQqBtaLYQg7E++
         Kg8UVe3Gdxgjuw1W5tIf5VWpOtV4OCBIEtOqZ5UyNcrYB9nzDpk0cJkpkkrJvqJUSSYN
         hMJA==
X-Gm-Message-State: AOJu0YywsuKkSC/Az7jEvsEu3ZPrPd/nYqStPvS3LQ/hbELwDk2F7zAA
	YKMKh3lOqipvzsPzhvn3ZcESlP79hne4wtfNN1vnzmZ4KVGsewoUmd0J
X-Gm-Gg: AZuq6aJcNZAPAU1IoKEv0lfOtZV0qJIjTXdZoHFg3wQUzI/ZIDYdRJUdZXyC1iFv4Xb
	doVNUKpY3Uk05suWJwnwFYk6zl9xZyHr1XK5qJWawJiik2PyPgbEISLWZjxfbsW5Te2/i3jHVZR
	q6O+F7XaXvkqWYOtg7jBXeUt21LHGG2ZfiS1BFO5984mXemVtVym8zxWdX4nYLUaRtGiJznzqIl
	T6B+M2FWvyrboYdf0Qkm/ifHeSMYMMwmsasbMAz6ckr9Hd9ljYvBcJp80UpjxkWXmdwAF5eIQ8h
	Ou4Q/W2RWxG8FlbY8Z1Q5w/P1pOyjGw2Ar+g6t1RJAAA4YY0GAIbKck0DZkgBXEUNF9ZrHL2N6X
	0k4a+YRUuU+m6K/hX50XGQYaYCHqpC+YnJhaTrZuXBbf6ClrIBEcuYqcFRB5TpoVUAGXJYgDuHy
	lJZb0TDPCxoA0sZQ8hdLK7
X-Received: by 2002:a17:902:cf42:b0:295:5da6:6011 with SMTP id d9443c01a7336-2a95160c728mr25582595ad.11.1770378676928;
        Fri, 06 Feb 2026 03:51:16 -0800 (PST)
Received: from archlinux ([45.119.31.85])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6dcb542c36sm2114729a12.16.2026.02.06.03.51.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 03:51:16 -0800 (PST)
From: Adarsh Das <adarshdas950@gmail.com>
To: dwmw2@infradead.org,
	richard@nod.at
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Adarsh Das <adarshdas950@gmail.com>
Subject: [PATCH] jffs2: use fs_umode_to_dtype() for dirent type
Date: Fri,  6 Feb 2026 17:21:00 +0530
Message-ID: <20260206115100.84852-1-adarshdas950@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260206_035118_410958_D68375AE 
X-CRM114-Status: UNSURE (   9.52  )
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

Use fs_umode_to_dtype() instead of direct bit shifting when
setting directory entry type.

Signed-off-by: Adarsh Das <adarshdas950@gmail.com>
---
 fs/jffs2/dir.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/fs/jffs2/dir.c b/fs/jffs2/dir.c
index dd91f725ded6..185cf76a061e 100644
--- a/fs/jffs2/dir.c
+++ b/fs/jffs2/dir.c
@@ -261,8 +261,7 @@ static int jffs2_link (struct dentry *old_dentry, struct inode *dir_i, struct de
 	if (d_is_dir(old_dentry))
 		return -EPERM;
 
-	/* XXX: This is ugly */
-	type = (d_inode(old_dentry)->i_mode & S_IFMT) >> 12;
+	type = fs_umode_to_dtype(d_inode(old_dentry)->i_mode);
 	if (!type) type = DT_REG;
 
 	now = JFFS2_NOW();
@@ -730,10 +729,7 @@ static int jffs2_mknod (struct mnt_idmap *idmap, struct inode *dir_i,
 	rd->ino = cpu_to_je32(inode->i_ino);
 	rd->mctime = cpu_to_je32(JFFS2_NOW());
 	rd->nsize = namelen;
-
-	/* XXX: This is ugly. */
-	rd->type = (mode & S_IFMT) >> 12;
-
+	rd->type = fs_umode_to_dtype(mode);
 	rd->node_crc = cpu_to_je32(crc32(0, rd, sizeof(*rd)-8));
 	rd->name_crc = cpu_to_je32(crc32(0, dentry->d_name.name, namelen));
 
@@ -811,8 +807,7 @@ static int jffs2_rename (struct mnt_idmap *idmap,
 
 	/* Make a hard link */
 
-	/* XXX: This is ugly */
-	type = (d_inode(old_dentry)->i_mode & S_IFMT) >> 12;
+	type = fs_umode_to_dtype(d_inode(old_dentry)->i_mode);
 	if (!type) type = DT_REG;
 
 	now = JFFS2_NOW();
-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
