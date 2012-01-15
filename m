Received: from mail-ee0-f49.google.com ([74.125.83.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RmPdD-00025z-SA
 for linux-mtd@lists.infradead.org; Sun, 15 Jan 2012 12:56:20 +0000
Received: by eekb15 with SMTP id b15so61790eek.36
 for <linux-mtd@lists.infradead.org>; Sun, 15 Jan 2012 04:56:16 -0800 (PST)
Subject: Re: [PATCH] fs/ubifs: fix dbg_{jnlk, tnck, mntk} not defined in
 debug.h if debug is disabled
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Dominique Martinet <asmadeus@codewreck.org>
Date: Sun, 15 Jan 2012 14:56:14 +0200
In-Reply-To: <1326583683-17066-1-git-send-email-asmadeus@codewreck.org>
References: <1326583683-17066-1-git-send-email-asmadeus@codewreck.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1326632175.2201.7.camel@koala>
Mime-Version: 1.0
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2012-01-15 at 00:28 +0100, Dominique Martinet wrote:
> ---
>  fs/ubifs/debug.h |    3 +++
>  1 files changed, 3 insertions(+), 0 deletions(-)

Hi, thanks. I've changes the subject and commit message to make
it clear that this is a build fix. I've also changed the patch
a bit to preserve alignment. And pushed to ubifs-2.6.git.

I'll send a pull request to Linus with this fix soon.

Notice, you did not put Signed-off-by - which is fine with me but
generally people add it.

Artem.


commit e234b5f2079414b3d772286e3ee00e7bbf6da833
Author: Dominique Martinet <asmadeus@codewreck.org>
Date:   Sun Jan 15 00:28:03 2012 +0100

    UBIFS: fix non-debug configuration build
    
    Fix a brown paperbag bug introduced by me in the previous commit. I was
    in hurry and forgot about the non-debug case completely.
    
    Artem: amend the commit message and tweak the patch to preserve alignment.
           This made the patch a bit less readable, though.
    
    Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@linux.intel.com>

diff --git a/fs/ubifs/debug.h b/fs/ubifs/debug.h
index 307ab1d..ad1a6fe 100644
--- a/fs/ubifs/debug.h
+++ b/fs/ubifs/debug.h
@@ -347,20 +347,23 @@ void dbg_debugfs_exit_fs(struct ubifs_info *c);
 #define dbg_dump_stack()
 #define ubifs_assert_cmt_locked(c)
 
-#define dbg_msg(fmt, ...)   ubifs_dbg_msg(fmt, ##__VA_ARGS__)
-#define dbg_gen(fmt, ...)   ubifs_dbg_msg(fmt, ##__VA_ARGS__)
-#define dbg_jnl(fmt, ...)   ubifs_dbg_msg(fmt, ##__VA_ARGS__)
-#define dbg_tnc(fmt, ...)   ubifs_dbg_msg(fmt, ##__VA_ARGS__)
-#define dbg_lp(fmt, ...)    ubifs_dbg_msg(fmt, ##__VA_ARGS__)
-#define dbg_find(fmt, ...)  ubifs_dbg_msg(fmt, ##__VA_ARGS__)
-#define dbg_mnt(fmt, ...)   ubifs_dbg_msg(fmt, ##__VA_ARGS__)
-#define dbg_io(fmt, ...)    ubifs_dbg_msg(fmt, ##__VA_ARGS__)
-#define dbg_cmt(fmt, ...)   ubifs_dbg_msg(fmt, ##__VA_ARGS__)
-#define dbg_budg(fmt, ...)  ubifs_dbg_msg(fmt, ##__VA_ARGS__)
-#define dbg_log(fmt, ...)   ubifs_dbg_msg(fmt, ##__VA_ARGS__)
-#define dbg_gc(fmt, ...)    ubifs_dbg_msg(fmt, ##__VA_ARGS__)
-#define dbg_scan(fmt, ...)  ubifs_dbg_msg(fmt, ##__VA_ARGS__)
-#define dbg_rcvry(fmt, ...) ubifs_dbg_msg(fmt, ##__VA_ARGS__)
+#define dbg_msg(fmt, ...)       ubifs_dbg_msg(fmt, ##__VA_ARGS__)
+#define dbg_gen(fmt, ...)       ubifs_dbg_msg(fmt, ##__VA_ARGS__)
+#define dbg_jnl(fmt, ...)       ubifs_dbg_msg(fmt, ##__VA_ARGS__)
+#define dbg_jnlk(key, fmt, ...) ubifs_dbg_msg(fmt, ##__VA_ARGS__)
+#define dbg_tnc(fmt, ...)       ubifs_dbg_msg(fmt, ##__VA_ARGS__)
+#define dbg_tnck(key, fmt, ...) ubifs_dbg_msg(fmt, ##__VA_ARGS__)
+#define dbg_lp(fmt, ...)        ubifs_dbg_msg(fmt, ##__VA_ARGS__)
+#define dbg_find(fmt, ...)      ubifs_dbg_msg(fmt, ##__VA_ARGS__)
+#define dbg_mnt(fmt, ...)       ubifs_dbg_msg(fmt, ##__VA_ARGS__)
+#define dbg_mntk(key, fmt, ...) ubifs_dbg_msg(fmt, ##__VA_ARGS__)
+#define dbg_io(fmt, ...)        ubifs_dbg_msg(fmt, ##__VA_ARGS__)
+#define dbg_cmt(fmt, ...)       ubifs_dbg_msg(fmt, ##__VA_ARGS__)
+#define dbg_budg(fmt, ...)      ubifs_dbg_msg(fmt, ##__VA_ARGS__)
+#define dbg_log(fmt, ...)       ubifs_dbg_msg(fmt, ##__VA_ARGS__)
+#define dbg_gc(fmt, ...)        ubifs_dbg_msg(fmt, ##__VA_ARGS__)
+#define dbg_scan(fmt, ...)      ubifs_dbg_msg(fmt, ##__VA_ARGS__)
+#define dbg_rcvry(fmt, ...)     ubifs_dbg_msg(fmt, ##__VA_ARGS__)
 
 static inline int ubifs_debugging_init(struct ubifs_info *c)      { return 0; }
 static inline void ubifs_debugging_exit(struct ubifs_info *c)     { return; }
