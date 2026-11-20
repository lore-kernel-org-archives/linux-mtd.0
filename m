Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D034606A32C
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Nov 2026 16:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CM4w8Wky;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CvjvJIMp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=7/icmlhPgmtJgYFKCGDJy6ADhE/m8pCTdpf8YGwiPiE=; b=CM4w8Wky7PrCpJ7Qv1HWESACCK
	YHXJ13HdKYiaiVW1OiNS29JvMMKAon8BFi/e0LT51XC+sMckKUu9W69UDC/f2T2+NgibTM8Br4zn7
	rzYctp4oV3mqf5vf6E1fMPTOBlzQDX/gLyenTpUdyDMceXQXTLONGWyRNIMjk8ApngrL765QOUoQE
	i3xuWNRpZNEI0dOW2tsydcGrRgM1I1qaQVaEC0c7SmLMCXrZImzsWBy90TOu9QXeqcgtPsyHVnubw
	QzAAYZrHAT1kUH/9Tf0p7PmAORBgq3mvTjwshFBYv/IJjw1WC7pCLxQVpK79fd7uTjoc9j5Ps0Ww5
	Eo03nmyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUR48-0000000FVNU-1tpz;
	Fri, 20 Nov 2026 16:02:20 +0000
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUR40-0000000FVLD-2euq
	for linux-mtd@lists.infradead.org;
	Fri, 20 Nov 2026 16:02:19 +0000
Received: by mail-ot1-x32c.google.com with SMTP id 46e09a7af769-84a248254f4so674513a34.0
        for <linux-mtd@lists.infradead.org>; Fri, 20 Nov 2026 08:02:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795190532; x=1795795332; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=dApsL/dlRKoFxvBs2GETZ/NYEsxe4Hnp92CF1CLUeuU=;
        b=CvjvJIMpRctsayDdhABjfY5dQ6aFHBYC6RwbLC4ZYIwkQshI8IdwKGfJ4gWZxvGL2T
         XMGIeCrybOi6CBBB+G3kZgoXmHpiqov+DVv5i+9hlzgdcpx/foyBGxSUNHrUOmdulQ2x
         pEucNCuSeGEKSAhsYINtnI63Ot/C4Kk9ahAKRY+LBKyGjx9j7GBhlZs6XZC8XHkLmYSY
         67dpUNY6xcex5+q2bnP4xa7abYLcMqZLJZFH71E47MReCBbqN7dbrlbMN2gYbYN/XmMt
         5kFhVuc/DIpVXcN38DvC9LOqmfD625a6HQAL2CD6s+5HCsnWEFmfqonsOYhY2W8nn77/
         IGGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795190532; x=1795795332;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=dApsL/dlRKoFxvBs2GETZ/NYEsxe4Hnp92CF1CLUeuU=;
        b=GzWwvun6KCDUhrIFIVVXOpegXwjvykFIZnFHlOh9SFmj/d3l8FRZ0yW5fqpqbmb1pB
         ej0LN0JlPQVWQCc+o3tqKNLROTSeqgYXvs5hth1TRY1xt8PrmsCmuz8ts9M3n8ldgaK8
         d6IMqytuwPyGQJ5oi5WXOXv7vd665+U50zjc7k+AxTX8t4lHfpZoom8+ZknNxCFaHu+/
         JZJlAAlIly87Yrfkp2+Xp0++NztGnus1rnwp+w+Fzvs1hOKfd+z01xj0rLxKIhrisbyt
         /48ofdbpULxwfD2JQdeQVqqzBhaELMD3o4bczjrLCX+2dLO2fEAZUjdhgoSr21isbcy2
         Hzug==
X-Gm-Message-State: APuU4Z8pBwgu5W7GUl8Z9bAWslKud12CWaN959UzWpWQ66EbJgPx6MFC
	u4zJVTJO/cUwgbt/CmVrjluFQZdO4AgC/s4O9Xou1CsnUv7IbGTkOUJE
X-Gm-Gg: AZFdTZfPegXUR6uebD4SEEvtKWr9XO/tujq5UT//qu3YN4ArPE6w1Ri7gjMe4RS7UQN
	NRODyWkBAXBlLBzKck0uAuwMfvga59dZoOTAh98goTVw8jvZYvGbAh1SUSNYcpJ0JQepnFg4NXd
	q1RctXFC4bgGjO+8+CCithcq41h+Vy4ekCfO5V4+7x9ldF96HCXzrtRxelxUCbjwRCh04TahDsH
	Qzyc+lwQEgbqDeMXpQDQw+FIaGTUURLiw73SjLJ6VBsQQWwpGgF+A71OY9HZrJ7ZJ9XmZdU7BvZ
	7pp87pZfFQjWGTr5CGY2ZWwwA19zKM6wSmf2jGmFJD3y4sYmH0EYmQvuHbtSAUXHNUjLCifBrkN
	ikPx//bbRiYIPvsfXeRpLiOccACkYY1jhhRyT6TcUN1UAbc2q/SWA2tbOs/w2KC/4bKmG9YNvY9
	PTIUAGC8QH/a43LqGlhCqQLLa4mM6hL3H/jtEqr5c6BysEr5Kj9OOQXBn0RcxyK9dP6Y5/6YK8P
	Q65/Zx3ymM4t2XK4V4z6q16OUtbV+OrTZLxbo1W/ex9sdTkFFXIF+NINDomCRag+5J55SmS7YzX
	DFkeBwY5zLzQ3AxBehzm1sqrvF6M5aBq9olYZ7Lx6uVwb5GnbbvhvFTajNzxm6qbTZOweSGaqVz
	+gMHrYjfNvQnoHbfJE8jVImIeruv/VHOqNsyknn/+NZsJ5wGe0m04T5B79/rI8LVAH0CM5NfRpP
	kxx0fYQCjmiemy6U4EHl23vPE7oNvDpzJRFUlaOQ+9j//70l/ttB1uDwDuS4RqQaZy9onwE8pd
X-Received: by 2002:a05:6808:3193:b0:4cb:f21c:a794 with SMTP id 5614622812f47-57a0ac257d3mr3853052b6e.28.1795190531576;
        Fri, 20 Nov 2026 08:02:11 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a34252251sm2522283b6e.6.2026.11.20.08.02.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 08:02:10 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 09:02:06 -0700
Subject: [PATCH v2] mtd: serialize dynamic partition registration with
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261120-submit-mtd-partition-publication-v1-v2-1-8098cde01961@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5WO3Q6CMAyFX8Xs2iqbiOKV72G42EaBGv6yDaIhv
 LsdPIFJm/S0PV+7CI+O0IvHYREOZ/I09CzU8SBso/sagUrWQiUqkzK5g59MRwG6UMKoXaDABhg
 n05LVWz1LSDOVG8zT8oaZYNLosKLPduVV7Joxb7QhouOG0R7BON3bJraYfo65u3jekA+D+25vz
 jJy/vuIQ4I1VaUSIy9Xic+609Se7NCJYl3XH5KuSIgIAQAA
X-Change-ID: 20261108-submit-mtd-partition-publication-v1-4629be94d7e6
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.17-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_080212_876784_6F923CA0 
X-CRM114-Status: GOOD (  18.30  )
X-Spam-Score: -1.8 (-)
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

If a flash driver is unbound while userspace adds a partition, removal
can find the new partition before it is registered or release it before
its sysfs attributes are added. If removal finishes first, the ioctl can
even register a new partition on a master that has been unregistered.

Hold partitions_lock from the start of partition allocation until the
device and its attributes are registered. Mark the master as being
unregistered under the same lock so a later ioctl fails before allocation
can read bad-block markers. Clear the flag when registering the master.

Fixes: 5daa7b21496a ("mtd: prepare partition add and del functions for ioctl requests")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes in v2:
- Use mutex guards to keep publication and teardown lock scopes explicit.
- Link to v1: https://patch.msgid.link/20261108-submit-mtd-partition-publication-v1-v1-1-cbff20b1351e@gmail.com
---
 drivers/mtd/mtdcore.c   | 4 ++++
 drivers/mtd/mtdpart.c   | 9 ++++-----
 include/linux/mtd/mtd.h | 2 ++
 3 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index b170c3144ca8..5ee1eb29fc1a 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -918,6 +918,7 @@ static void mtd_set_dev_defaults(struct mtd_info *mtd)
 	INIT_LIST_HEAD(&mtd->partitions);
 	mutex_init(&mtd->master.partitions_lock);
 	mutex_init(&mtd->master.chrdev_lock);
+	mtd->master.unregistering = false;
 }
 
 static ssize_t mtd_otp_size(struct mtd_info *mtd, bool is_user)
@@ -1206,6 +1207,9 @@ int mtd_device_unregister(struct mtd_info *master)
 {
 	int err;
 
+	scoped_guard(mutex, &master->master.partitions_lock)
+		master->master.unregistering = true;
+
 	if (master->_reboot) {
 		unregister_reboot_notifier(&master->reboot_notifier);
 		memset(&master->reboot_notifier, 0, sizeof(master->reboot_notifier));
diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index ddded0dbe77e..b20fa4309084 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -278,13 +278,15 @@ int mtd_add_partition(struct mtd_info *parent, const char *name,
 	part.size = length;
 	part.offset = offset;
 
+	guard(mutex)(&master->master.partitions_lock);
+	if (master->master.unregistering)
+		return -ENODEV;
+
 	child = allocate_partition(parent, &part, -1, offset);
 	if (IS_ERR(child))
 		return PTR_ERR(child);
 
-	mutex_lock(&master->master.partitions_lock);
 	list_add_tail(&child->part.node, &parent->partitions);
-	mutex_unlock(&master->master.partitions_lock);
 
 	ret = add_mtd_device(child);
 	if (ret)
@@ -295,10 +297,7 @@ int mtd_add_partition(struct mtd_info *parent, const char *name,
 	return 0;
 
 err_remove_part:
-	mutex_lock(&master->master.partitions_lock);
 	list_del(&child->part.node);
-	mutex_unlock(&master->master.partitions_lock);
-
 	free_partition(child);
 
 	return ret;
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index 8d10d9d2e830..cd7b4671c456 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -224,6 +224,7 @@ struct mtd_part {
  *		     not only the master partition list, but also all
  *		     sub-partitions.
  * @suspended: set to 1 when the device is suspended, 0 otherwise
+ * @unregistering: removal has started; protected by partitions_lock
  *
  * This struct is embedded in mtd_info and contains master-specific
  * properties/fields. The master is the root MTD device from the MTD partition
@@ -233,6 +234,7 @@ struct mtd_master {
 	struct mutex partitions_lock;
 	struct mutex chrdev_lock;
 	unsigned int suspended : 1;
+	bool unregistering;
 };
 
 struct mtd_info {

---
base-commit: 14b6830335eb6d70dec7a235094d66c22d38eb07
base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/fixes
change-id: 20261108-submit-mtd-partition-publication-v1-4629be94d7e6

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
