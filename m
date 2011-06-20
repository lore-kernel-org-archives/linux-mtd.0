Received: from mail-pv0-f177.google.com ([74.125.83.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QYYdW-0000xI-PE
	for linux-mtd@lists.infradead.org; Mon, 20 Jun 2011 07:11:07 +0000
Received: by pvh11 with SMTP id 11so2760968pvh.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 20 Jun 2011 00:11:02 -0700 (PDT)
Date: Mon, 20 Jun 2011 10:10:24 +0300
From: Dan Carpenter <error27@gmail.com>
To: Al Viro <viro@zeniv.linux.org.uk>
Subject: [patch] ubifs: dereferencing an ERR_PTR in ubifs_mount()
Message-ID: <20110620071024.GF14591@shale.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: Adrian Hunter <adrian.hunter@nokia.com>, linux-mtd@lists.infradead.org,
	dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

d251ed271d5 "ubifs: fix sget races" left out the goto from this
error path so the static checkers complain that we're dereferencing
"sb" when it's an ERR_PTR.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index 8c892c2..529be05 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -2146,6 +2146,7 @@ static struct dentry *ubifs_mount(struct file_system_type *fs_type, int flags,
 	if (IS_ERR(sb)) {
 		err = PTR_ERR(sb);
 		kfree(c);
+		goto out_close;
 	}
 
 	if (sb->s_root) {
