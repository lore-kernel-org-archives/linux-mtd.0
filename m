Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZOyzW-0005Es-Di
 for linux-mtd@lists.infradead.org; Tue, 11 Aug 2015 02:08:39 +0000
Message-ID: <55C957B9.9090408@cn.fujitsu.com>
Date: Tue, 11 Aug 2015 10:02:33 +0800
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
MIME-Version: 1.0
To: <dedekind1@gmail.com>, <richard.weinberger@gmail.com>,
 <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH v4] ubifs: introduce UBIFS_ATIME_SUPPORT to ubifs
References: <1438304996-31502-1-git-send-email-yangds.fnst@cn.fujitsu.com>
 <1439195531.26877.103.camel@gmail.com>
In-Reply-To: <1439195531.26877.103.camel@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 08/10/2015 04:32 PM, Artem Bityutskiy wrote:
> Could you please describe how you tested your patch. Did you run stress
> tests with atime enabled, which ones?

About the functionality testing, I tried xfstests, it passed.

About the stress tests, I tried the fio and xfstests for stress.
Below is my result:
* I added a counter in ubifs_dirty_inode() to see how many times
we dirtied inode in my testing.*
diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index 1f2415f..aac1da2 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -398,6 +398,7 @@ static void ubifs_dirty_inode(struct inode *inode, 
int flags)
         int locked = mutex_is_locked(&ui->ui_mutex);
         struct ubifs_info *c = inode->i_sb->s_fs_info;
         int ret = 0;
+       static unsigned long long count = 0;

         if (!locked)
                 mutex_lock(&ui->ui_mutex);
@@ -412,6 +413,7 @@ static void ubifs_dirty_inode(struct inode *inode, 
int flags)
                 }
                 ui->dirty = 1;
                 dbg_gen("inode %lu",  inode->i_ino);
+               pr_info("count: %llu\n", ++count);
         }

RESULT:
stress test steps: (for ((i=0;i<10;i++)); do ./check -g stress; done)

noatime: 67169
relatime: 68084
strictatime: 68643

Atem, Do you want some other testing for it?

>
> On Fri, 2015-07-31 at 09:09 +0800, Dongsheng Yang wrote:
>> +> 	> 	> sb->s_flags |= MS_ACTIVE;
>> +#ifndef CONFIG_UBIFS_ATIME_SUPPORT
>> +> 	> 	> sb->s_flags |= MS_NOATIME;
>> +#else
>> +> 	> 	> ubifs_warn(c, "************WARNING START****************");
>> +> 	> 	> ubifs_warn(c, "Ubifs is supporting atime now, that would");
>> +> 	> 	> ubifs_warn(c, "probably damage your flash. If you are not");
>> +> 	> 	> ubifs_warn(c, "sure about it, please set UBIFS_ATIME_SUPPORT");
>> +> 	> 	> ubifs_warn(c, "to 'N'.");
>> +> 	> 	> ubifs_warn(c, "************WARNING END******************");
>
> Could we please be a little be less scary.
>
> 1. I think these starting and ending "*****" lines are unnecessary.
> 2. Ah, and use "UBIFS", not "Ubifs" please.
> 3. Let's be shorter, just this should be enough:
>
> ubifs_warn("full atime support is enabled, which may wear out your
> flash faster");

Okey, will update it.
Yang
>
> Artem.
> .
>
