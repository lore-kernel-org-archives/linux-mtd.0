Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bz8gC-0007xn-Cv
 for linux-mtd@lists.infradead.org; Tue, 25 Oct 2016 20:50:41 +0000
Subject: Re: Regression caused by commit c83ed4c9dbb3 "ubifs: Abort readdir on
 error"
To: Peter Rosin <peda@axentia.se>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <ce65141e-87d2-344e-82d2-a1c4ed0bdbf1@lysator.liu.se>
 <e4cbe883-003e-5522-400a-da79a98a0ec4@nod.at>
From: Richard Weinberger <richard@nod.at>
Message-ID: <2e3cf9f7-d747-7129-455f-a1105f5474de@nod.at>
Date: Tue, 25 Oct 2016 22:50:17 +0200
MIME-Version: 1.0
In-Reply-To: <e4cbe883-003e-5522-400a-da79a98a0ec4@nod.at>
Content-Type: multipart/mixed; boundary="------------77EE6A07C78DDB9CB9BD3DA2"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.
--------------77EE6A07C78DDB9CB9BD3DA2
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Peter,

On 25.10.2016 22:09, Richard Weinberger wrote:
>> /bin/mkdir -p /mnt/ovl/ovl
>> /bin/mkdir -p /mnt/ovl/work
>> # with c83ed4c9dbb3, the following mount fails with
>> # mount: mounting overlay on /mnt/merge failed: No such file or directory
>> /bin/mount -t overlay -o lowerdir=/,upperdir=/mnt/ovl/ovl,workdir=/mnt/ovl/work overlay /mnt/merge
> 
> Uhhhh! Thanks for catching this.
> I think I know what is going on, the fix exposes now internal UBIFS return codes to VFS.
> Let me prepare a fix.

Does the attached patch cure the issue?

Thanks,
//richard

--------------77EE6A07C78DDB9CB9BD3DA2
Content-Type: text/x-patch;
 name="ubifs_readdir_fix_fix.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="ubifs_readdir_fix_fix.diff"

diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
index bd4a5e8ce441..ca16c5d7bab1 100644
--- a/fs/ubifs/dir.c
+++ b/fs/ubifs/dir.c
@@ -543,6 +543,14 @@ static int ubifs_readdir(struct file *file, struct dir_context *ctx)
 
 	if (err != -ENOENT)
 		ubifs_err(c, "cannot find next direntry, error %d", err);
+	else
+		/*
+		 * -ENOENT is a non-fatal error in this context, the TNC uses
+		 * it to indicate that the cursor moved past the current directory
+		 * and readdir() has to stop.
+		 */
+		err = 0;
+
 
 	/* 2 is a special value indicating that there are no more direntries */
 	ctx->pos = 2;

--------------77EE6A07C78DDB9CB9BD3DA2--
