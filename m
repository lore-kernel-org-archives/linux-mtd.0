Subject: [PATCH 1/4] Factor out nfsd_do_readdir() into its own function
From: David Woodhouse <dwmw2@infradead.org>
To: "J. Bruce Fields" <bfields@fieldses.org>
In-Reply-To: <1218311710.26926.125.camel@pmac.infradead.org>
References: <1217607571.3454.417.camel@pmac.infradead.org>
	<76bd70e30808011047u3cd0a56cg3b2d62e01afed014@mail.gmail.com>
	<20080802182644.GE30454@fieldses.org>
	<18581.40178.976747.769343@notabene.brown>
	<76bd70e30808031015l36db41bexf319e85ba7acc4e9@mail.gmail.com>
	<18582.21855.2092.903688@notabene.brown>
	<76bd70e30808032319u65e35dbdj9cc5be07e1aef829@mail.gmail.com>
	<20080805085157.GG21635@disturbed>
	<18584.56584.98868.881298@notabene.brown>
	<20080806000805.GJ21635@disturbed>
	<20080806195635.GA31126@fieldses.org>
	<1218053443.5111.148.camel@pmac.infradead.org>
	<1218300478.26926.114.camel@pmac.infradead.org>
	<1218311710.26926.125.camel@pmac.infradead.org>
Content-Type: text/plain
Date: Sat, 09 Aug 2008 21:01:54 +0100
Message-Id: <1218312114.5063.5.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-nfs@vger.kernel.org, chucklever@gmail.com, Neil Brown <neilb@suse.de>,
	Christoph Hellwig <hch@infradead.org>,
	linux-mtd@lists.infradead.org, viro@zeniv.linux.org.uk,
	linux-fsdevel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: David Woodhouse <David.Woodhouse@intel.com>
---
 fs/nfsd/vfs.c |   40 ++++++++++++++++++++++++----------------
 1 files changed, 24 insertions(+), 16 deletions(-)

diff --git a/fs/nfsd/vfs.c b/fs/nfsd/vfs.c
index 18060be..3e22634 100644
--- a/fs/nfsd/vfs.c
+++ b/fs/nfsd/vfs.c
@@ -1814,6 +1814,29 @@ out:
 	return err;
 }
 
+static int nfsd_do_readdir(struct file *file, filldir_t func,
+			   struct readdir_cd *cdp, loff_t *offsetp)
+{
+	int host_err;
+
+	/*
+	 * Read the directory entries. This silly loop is necessary because
+	 * readdir() is not guaranteed to fill up the entire buffer, but
+	 * may choose to do less.
+	 */
+	do {
+		cdp->err = nfserr_eof; /* will be cleared on successful read */
+		host_err = vfs_readdir(file, func, cdp);
+	} while (host_err >=0 && cdp->err == nfs_ok);
+
+	*offsetp = vfs_llseek(file, 0, 1);
+
+	if (host_err)
+		return nfserrno(host_err);
+	else
+		return cdp->err;
+}
+
 /*
  * Read entries from a directory.
  * The  NFSv3/4 verifier we ignore for now.
@@ -1823,7 +1846,6 @@ nfsd_readdir(struct svc_rqst *rqstp, struct svc_fh *fhp, loff_t *offsetp,
 	     struct readdir_cd *cdp, filldir_t func)
 {
 	__be32		err;
-	int 		host_err;
 	struct file	*file;
 	loff_t		offset = *offsetp;
 
@@ -1837,21 +1859,7 @@ nfsd_readdir(struct svc_rqst *rqstp, struct svc_fh *fhp, loff_t *offsetp,
 		goto out_close;
 	}
 
-	/*
-	 * Read the directory entries. This silly loop is necessary because
-	 * readdir() is not guaranteed to fill up the entire buffer, but
-	 * may choose to do less.
-	 */
-
-	do {
-		cdp->err = nfserr_eof; /* will be cleared on successful read */
-		host_err = vfs_readdir(file, func, cdp);
-	} while (host_err >=0 && cdp->err == nfs_ok);
-	if (host_err)
-		err = nfserrno(host_err);
-	else
-		err = cdp->err;
-	*offsetp = vfs_llseek(file, 0, 1);
+	err = nfsd_do_readdir(file, func, cdp, offsetp);
 
 	if (err == nfserr_eof || err == nfserr_toosmall)
 		err = nfs_ok; /* can still be found in ->err */
-- 
1.5.5.1



-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
