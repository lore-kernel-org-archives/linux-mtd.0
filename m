Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zcoeh-0002jy-5A
 for linux-mtd@lists.infradead.org; Fri, 18 Sep 2015 05:56:20 +0000
Message-ID: <55FBA5E5.1040201@cn.fujitsu.com>
Date: Fri, 18 Sep 2015 13:49:25 +0800
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
MIME-Version: 1.0
To: Jan Kara <jack@suse.cz>
CC: <viro@ZenIV.linux.org.uk>, <dedekind1@gmail.com>,
 <richard.weinberger@gmail.com>, <linux-mtd@lists.infradead.org>,
 <linux-fsdevel@vger.kernel.org>
Subject: Re: [PATCH v3 11/39] fs: quota: replace opened calling of ->sync_fs
 with sync_filesystem
References: <1442307754-13233-1-git-send-email-yangds.fnst@cn.fujitsu.com>
 <1442307754-13233-12-git-send-email-yangds.fnst@cn.fujitsu.com>
 <20150916101402.GE13325@quack.suse.cz> <55FA5D8A.9030108@cn.fujitsu.com>
 <20150917110547.GB32280@quack.suse.cz>
In-Reply-To: <20150917110547.GB32280@quack.suse.cz>
Content-Type: multipart/mixed; boundary="------------050809040201020305030500"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--------------050809040201020305030500
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 09/17/2015 07:05 PM, Jan Kara wrote:
> On Thu 17-09-15 14:28:26, Dongsheng Yang wrote:
>> On 09/16/2015 06:14 PM, Jan Kara wrote:
>>> On Tue 15-09-15 17:02:06, Dongsheng Yang wrote:
>>>> There are only two places in whole kernel to call ->sync_fs directly. It
>>>> will sync fs even in read-only mode. It's not a good idea and some filesystem
>>>> would warn out if you are syncing in read-only mode. But sync_filesystem()
>>>> does filter this case out. Let's call sync_filesystem() here instead.
>>>>
>>>> Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
>>>
>>> So I'd prefer ubifs used hidden system inodes for quota files, set
>>> DQUOT_QUOTA_SYS_FILE flag and so this code calling sync_fs() could be
>>> completely avoided.
>>
>> Hmmm, I think it's a good idea to make quota files SYS_FILEs. But how
>> about quota-tools? E.g, if quotacheck do some modification
>> on quota files, we would not read them without a sync_fs().
>>
>> Could you help explain how quota works in this case?
>
> So tools like quota(1) or setquota(1) work using quotactl so they don't
> need access to quota files. When quota files are system files, quotacheck
> functionality belongs into the fsck - so fsck.ubifs is responsible for
> checking consistency of quota files. How e.g. e2fsck does it is that when
> scanning inodes, it computes usage for each user / group, loads limits
> information from old quota files and then just creates new quota files with
> updated information if there's any difference to the old quota files.

About quotacheck, I think just call fsync() in it sounds good to me.
Maybe something like the attachment.

OKEY, but I found repquota is still using read() to access quota files.
Please consider that case: 1.we read quota file and there is a pagecache
for it. 2. Then kernel did some modification on quota files. But
if the files is SYS_FILES marked, dquot_quota_sync() would not drop
the pagecache, then 3. repquota would get an outdated data from pagecache.

I am not sure why ext4 works well in this case. There must be something
I am missing.

Maybe we can introduce a Q_GETBLK for quotactl() to make all
quota tools getting informations from ioctl.
>
> Another advantage of the checking functionality being in fsck is that
> fs-specific fsck can gather usage information much more efficiently (and
> fsck has to do full fs scan anyway) and there's no need to propagate quota
> usage information to userspace using FIQSIZE ioctl() and similar stuff...

So, let me try to summary the my opinions about it.
Pros:
	(1). Security. quota files shouldn't be accessible to usespace.
	(2). Efficiency. No need for quotacheck, just do it in fsck.
	(3). No need FIOQSIZE any more.
Cons:
	(1). Incompatibility:
		If I set DQUOT_QUOTA_SYS_FILE currently, there are at
least two commands would not work: quotacheck and repquota. Actually
that means the whole quota is not usable to user.

So, I think the compatibility is important to me. Then what about
setting quota files as regular files at first. After all tools (quota
tools, quotacheck, repquota, fsck) prepared, setting the
DQUOT_QUOTA_SYS_FILE seems better.

Yang
>
> 								Honza
>


--------------050809040201020305030500
Content-Type: text/x-patch;
	name="0001-quotacheck-sync-files-in-quotacheck.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="0001-quotacheck-sync-files-in-quotacheck.patch"

>From 1cf9d072cdd4d17c620834864f79ec5a0765d2bf Mon Sep 17 00:00:00 2001
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
Date: Fri, 18 Sep 2015 08:40:49 -0400
Subject: [PATCH] quotacheck: sync files in quotacheck.

After a quotacheck, we need to make kernel to see the modification.
Compared with syncing quota files in kernel, we would rather sync
it in quotacheck command.

Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
---
 quotacheck.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/quotacheck.c b/quotacheck.c
index 6f34cff..e4b184d 100644
--- a/quotacheck.c
+++ b/quotacheck.c
@@ -768,6 +768,20 @@ rename_new:
 		close(fd);
 	}
 #endif
+
+	/* Do a syncing for the quota file */
+	if ((fd = open(filename, O_RDWR)) < 0) {
+		errstr(_("Cannot open new quota file %s: %s\n"), filename, strerror(errno));
+		free(filename);
+		return -1;
+	}
+        if (fsync(fd)) {
+		errstr(_("Cannot sync quota file %s: %s\n"), filename, strerror(errno));
+		free(filename);
+                return -1;
+        }
+	close(fd);
+
 	free(filename);
 	return 0;
 }
-- 
1.8.3.1


--------------050809040201020305030500--
