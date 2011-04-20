Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QCZ9X-0000wG-Ik
	for linux-mtd@lists.infradead.org; Wed, 20 Apr 2011 15:17:17 +0000
Received: by eyh6 with SMTP id 6so281913eyh.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 20 Apr 2011 08:17:13 -0700 (PDT)
Subject: Re: I meet a problem
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Caizhiyong <caizhiyong@huawei.com>
In-Reply-To: <C3050A4DBA34F345975765E43127F10F02CDC9@SZXEML506-MBS.china.huawei.com>
References: <C3050A4DBA34F345975765E43127F10F02CDC9@SZXEML506-MBS.china.huawei.com>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 20 Apr 2011 18:14:21 +0300
Message-ID: <1303312461.2700.48.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: "tony.taoyong@hisilicon" <tony.taoyong@hisilicon.huawei.com>,
	Renxincun <renxincun@huawei.com>,
	"Jiangzhonglin\(Jiangzhonglin\)" <jiangzhonglin@huawei.com>,
	Quyaxin <quyaxin@huawei.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2011-04-02 at 02:20 +0000, Caizhiyong wrote:
> hi, Artem
>     I found a problem when I test ubifs on unclean reboot,my test
> method is that:read,write,and delete ubifs files many times , when I'm
> writing or deleting the files ,I 
> 
> reboot the system, sometimes the rootfs is broken,but if I reset the
> power of board,the rootfs is ok. 

Hi,

I've finally figured out the issue and have fixed it in the ubifs tree
and will send it upstream soon and to -stable. Here is the patch for
you, and thanks for reporting this:


From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Subject: [PATCH] UBIFS: fix false space checking failure

This patch fixes UBIFS mount failure when the debugging support is enabled,
we are recovering from a power cut, we were first mounter R/O and we are
re-mounting R/W. In this case we should not assume that the amount of free
space before we have re-mounted R/W and after are equivalent, because
when we have mounted R/O the file-system is in a non-committed state so
the amount of free space is slightly smaller, due to the fact that we cannot
predict the amount of free space precisely before we commit.

This patch fixes the issue by skipping the debugging check in case of
recovery. This issue was reported by Caizhiyong <caizhiyong@huawei.com>
here: http://thread.gmane.org/gmane.linux.drivers.mtd/34350/focus=34387

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Reported-by: Caizhiyong <caizhiyong@huawei.com>
Cc: stable@kernel.org [2.6.30+]
---
 fs/ubifs/super.c |   19 +++++++++++++++----
 1 files changed, 15 insertions(+), 4 deletions(-)

diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index 66c12cd..339bdfc 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -1672,14 +1672,25 @@ static int ubifs_remount_rw(struct ubifs_info *c)
 	if (err)
 		goto out;
 
+	dbg_gen("re-mounted read-write");
+	c->remounting_rw = 0;
+
 	if (c->need_recovery) {
 		c->need_recovery = 0;
 		ubifs_msg("deferred recovery completed");
+	} else {
+		/*
+		 * Do not run the debugging space check if the were doing
+		 * recovery, because when we saved the information we had the
+		 * file-system in a state where the TNC and lprops has been
+		 * modified in memory, but all the I/O operations (including a
+		 * commit) were deferred. So the file-system was in
+		 * "non-committed" state. Now the file-system is in committed
+		 * state, and of course the amount of free space will change
+		 * because, for example, the old index size was imprecise.
+		 */
+		err = dbg_check_space_info(c);
 	}
-
-	dbg_gen("re-mounted read-write");
-	c->remounting_rw = 0;
-	err = dbg_check_space_info(c);
 	mutex_unlock(&c->umount_mutex);
 	return err;
 
-- 
1.7.2.3





-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
