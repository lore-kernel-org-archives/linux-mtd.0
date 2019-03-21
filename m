Return-Path: <SRS0=+wMu=RY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FDCFC43381
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Mar 2019 11:53:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3EC1B218FD
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Mar 2019 11:53:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Y/dS/Le9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3EC1B218FD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Yt4WXG0fBxtOdwM6WA5KY4dTx1qZBTvJXZ3d5NvJyi4=; b=Y/dS/Le9qJgAUc
	tsf4PzDBPBuWB0ez0K2/vhifhlxg6nbHVqX6SPqTHE5HDsX5B2q3xBhrd9X/QjuoofwoVYEGKsaO9
	VY4C6ryaxnzVt0MnnNV1IekhEL/6lvE0azE2cIObqiteKKK1BwLZjTkGQ4xNKMG+v0ns0aEiygl1v
	XxZkX0lpR0feZGxiLGP3JF6pxnQn9a9drGtOmvjcDp9neRl3Qm7rr/QIYk920QTBgVE7607a7W3Gl
	ktTnMlwLWV/1DGlHdlgKY0wqloAt1qMc9+8LM5ui57YrCX3qYAXCjNOqrNyP730g6Ilitd+F6vqlE
	PKrrVZ6O3C9nSfCTjvRQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h6wG3-0000Qb-M5; Thu, 21 Mar 2019 11:53:15 +0000
Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h6wFm-00006c-8o
 for linux-mtd@lists.infradead.org; Thu, 21 Mar 2019 11:53:14 +0000
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id CF626308FF14;
 Thu, 21 Mar 2019 11:52:57 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-121-98.rdu2.redhat.com
 [10.10.121.98])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B7F205D9C4;
 Thu, 21 Mar 2019 11:52:54 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
Subject: [RFC PATCH 5/6] mtd: Kill off mount_mtd()
From: David Howells <dhowells@redhat.com>
To: viro@zeniv.linux.org.uk
Date: Thu, 21 Mar 2019 11:52:46 +0000
Message-ID: <155316916675.30162.8137446086024326636.stgit@warthog.procyon.org.uk>
In-Reply-To: <155316911807.30162.12050856576466287021.stgit@warthog.procyon.org.uk>
References: <155316911807.30162.12050856576466287021.stgit@warthog.procyon.org.uk>
User-Agent: StGit/unknown-version
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.49]); Thu, 21 Mar 2019 11:52:58 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190321_045258_463567_33FD99A5 
X-CRM114-Status: GOOD (  26.02  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 dhowells@redhat.com, Marek Vasut <marek.vasut@gmail.com>,
 linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Kill off mount_mtd() as it has now been replaced and nothing now uses it.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: David Woodhouse <dwmw2@infradead.org>
cc: Brian Norris <computersforpeace@gmail.com>
cc: Boris Brezillon <bbrezillon@kernel.org>
cc: Marek Vasut <marek.vasut@gmail.com>
cc: Richard Weinberger <richard@nod.at>
cc: linux-mtd@lists.infradead.org
---

 drivers/mtd/mtdsuper.c    |  189 ---------------------------------------------
 include/linux/mtd/super.h |    3 -
 2 files changed, 192 deletions(-)

diff --git a/drivers/mtd/mtdsuper.c b/drivers/mtd/mtdsuper.c
index cf223c4aa862..b5db8baab3d3 100644
--- a/drivers/mtd/mtdsuper.c
+++ b/drivers/mtd/mtdsuper.c
@@ -210,195 +210,6 @@ int vfs_get_mtd_super(struct fs_context *fc,
 }
 EXPORT_SYMBOL_GPL(vfs_get_mtd_super);
 
-/*
- * compare superblocks to see if they're equivalent
- * - they are if the underlying MTD device is the same
- */
-static int get_sb_mtd_compare(struct super_block *sb, void *_mtd)
-{
-	struct mtd_info *mtd = _mtd;
-
-	if (sb->s_mtd == mtd) {
-		pr_debug("MTDSB: Match on device %d (\"%s\")\n",
-		      mtd->index, mtd->name);
-		return 1;
-	}
-
-	pr_debug("MTDSB: No match, device %d (\"%s\"), device %d (\"%s\")\n",
-	      sb->s_mtd->index, sb->s_mtd->name, mtd->index, mtd->name);
-	return 0;
-}
-
-/*
- * mark the superblock by the MTD device it is using
- * - set the device number to be the correct MTD block device for pesuperstence
- *   of NFS exports
- */
-static int get_sb_mtd_set(struct super_block *sb, void *_mtd)
-{
-	struct mtd_info *mtd = _mtd;
-
-	sb->s_mtd = mtd;
-	sb->s_dev = MKDEV(MTD_BLOCK_MAJOR, mtd->index);
-	sb->s_bdi = bdi_get(mtd_bdi);
-
-	return 0;
-}
-
-/*
- * get a superblock on an MTD-backed filesystem
- */
-static struct dentry *mount_mtd_aux(struct file_system_type *fs_type, int flags,
-			  const char *dev_name, void *data,
-			  struct mtd_info *mtd,
-			  int (*fill_super)(struct super_block *, void *, int))
-{
-	struct super_block *sb;
-	int ret;
-
-	sb = sget(fs_type, get_sb_mtd_compare, get_sb_mtd_set, flags, mtd);
-	if (IS_ERR(sb))
-		goto out_error;
-
-	if (sb->s_root)
-		goto already_mounted;
-
-	/* fresh new superblock */
-	pr_debug("MTDSB: New superblock for device %d (\"%s\")\n",
-	      mtd->index, mtd->name);
-
-	ret = fill_super(sb, data, flags & SB_SILENT ? 1 : 0);
-	if (ret < 0) {
-		deactivate_locked_super(sb);
-		return ERR_PTR(ret);
-	}
-
-	/* go */
-	sb->s_flags |= SB_ACTIVE;
-	return dget(sb->s_root);
-
-	/* new mountpoint for an already mounted superblock */
-already_mounted:
-	pr_debug("MTDSB: Device %d (\"%s\") is already mounted\n",
-	      mtd->index, mtd->name);
-	put_mtd_device(mtd);
-	return dget(sb->s_root);
-
-out_error:
-	put_mtd_device(mtd);
-	return ERR_CAST(sb);
-}
-
-/*
- * get a superblock on an MTD-backed filesystem by MTD device number
- */
-static struct dentry *mount_mtd_nr(struct file_system_type *fs_type, int flags,
-			 const char *dev_name, void *data, int mtdnr,
-			 int (*fill_super)(struct super_block *, void *, int))
-{
-	struct mtd_info *mtd;
-
-	mtd = get_mtd_device(NULL, mtdnr);
-	if (IS_ERR(mtd)) {
-		pr_debug("MTDSB: Device #%u doesn't appear to exist\n", mtdnr);
-		return ERR_CAST(mtd);
-	}
-
-	return mount_mtd_aux(fs_type, flags, dev_name, data, mtd, fill_super);
-}
-
-/*
- * set up an MTD-based superblock
- */
-struct dentry *mount_mtd(struct file_system_type *fs_type, int flags,
-	       const char *dev_name, void *data,
-	       int (*fill_super)(struct super_block *, void *, int))
-{
-#ifdef CONFIG_BLOCK
-	struct block_device *bdev;
-	int ret, major;
-#endif
-	int mtdnr;
-
-	if (!dev_name)
-		return ERR_PTR(-EINVAL);
-
-	pr_debug("MTDSB: dev_name \"%s\"\n", dev_name);
-
-	/* the preferred way of mounting in future; especially when
-	 * CONFIG_BLOCK=n - we specify the underlying MTD device by number or
-	 * by name, so that we don't require block device support to be present
-	 * in the kernel. */
-	if (dev_name[0] == 'm' && dev_name[1] == 't' && dev_name[2] == 'd') {
-		if (dev_name[3] == ':') {
-			struct mtd_info *mtd;
-
-			/* mount by MTD device name */
-			pr_debug("MTDSB: mtd:%%s, name \"%s\"\n",
-			      dev_name + 4);
-
-			mtd = get_mtd_device_nm(dev_name + 4);
-			if (!IS_ERR(mtd))
-				return mount_mtd_aux(
-					fs_type, flags,
-					dev_name, data, mtd,
-					fill_super);
-
-			printk(KERN_NOTICE "MTD:"
-			       " MTD device with name \"%s\" not found.\n",
-			       dev_name + 4);
-
-		} else if (isdigit(dev_name[3])) {
-			/* mount by MTD device number name */
-			char *endptr;
-
-			mtdnr = simple_strtoul(dev_name + 3, &endptr, 0);
-			if (!*endptr) {
-				/* It was a valid number */
-				pr_debug("MTDSB: mtd%%d, mtdnr %d\n",
-				      mtdnr);
-				return mount_mtd_nr(fs_type, flags,
-						     dev_name, data,
-						     mtdnr, fill_super);
-			}
-		}
-	}
-
-#ifdef CONFIG_BLOCK
-	/* try the old way - the hack where we allowed users to mount
-	 * /dev/mtdblock$(n) but didn't actually _use_ the blockdev
-	 */
-	bdev = lookup_bdev(dev_name);
-	if (IS_ERR(bdev)) {
-		ret = PTR_ERR(bdev);
-		pr_debug("MTDSB: lookup_bdev() returned %d\n", ret);
-		return ERR_PTR(ret);
-	}
-	pr_debug("MTDSB: lookup_bdev() returned 0\n");
-
-	ret = -EINVAL;
-
-	major = MAJOR(bdev->bd_dev);
-	mtdnr = MINOR(bdev->bd_dev);
-	bdput(bdev);
-
-	if (major != MTD_BLOCK_MAJOR)
-		goto not_an_MTD_device;
-
-	return mount_mtd_nr(fs_type, flags, dev_name, data, mtdnr, fill_super);
-
-not_an_MTD_device:
-#endif /* CONFIG_BLOCK */
-
-	if (!(flags & SB_SILENT))
-		printk(KERN_NOTICE
-		       "MTD: Attempt to mount non-MTD device \"%s\"\n",
-		       dev_name);
-	return ERR_PTR(-EINVAL);
-}
-
-EXPORT_SYMBOL_GPL(mount_mtd);
-
 /*
  * destroy an MTD-based superblock
  */
diff --git a/include/linux/mtd/super.h b/include/linux/mtd/super.h
index 7ebd69e5c640..c8bfaf0b8fe7 100644
--- a/include/linux/mtd/super.h
+++ b/include/linux/mtd/super.h
@@ -21,9 +21,6 @@
 extern int vfs_get_mtd_super(struct fs_context *fc,
 			     int (*fill_super)(struct super_block *sb,
 					       struct fs_context *fc));
-extern struct dentry *mount_mtd(struct file_system_type *fs_type, int flags,
-		      const char *dev_name, void *data,
-		      int (*fill_super)(struct super_block *, void *, int));
 extern void kill_mtd_super(struct super_block *sb);
 
 


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
