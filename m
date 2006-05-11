Received: from www346.sakura.ne.jp ([202.181.99.66])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1FeKPh-0003xs-5y
	for linux-mtd@lists.infradead.org; Thu, 11 May 2006 19:17:55 -0400
Message-ID: <4463C5B8.1070708@kaigai.gr.jp>
Date: Fri, 12 May 2006 08:16:08 +0900
From: KaiGai Kohei <kaigai@kaigai.gr.jp>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
References: <445C476A.2090506@ak.jp.nec.com>	<20060507171601.GA7990@wohnheim.fh-wedel.de>	<445EA6D4.5000909@ak.jp.nec.com>	<1147092567.2766.146.camel@pmac.infradead.org>
	<4460BEEE.2070704@ak.jp.nec.com>
In-Reply-To: <4460BEEE.2070704@ak.jp.nec.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: jmorris@redhat.com, sds@tycho.nsa.gov, russell@coker.com.au,
	KaiGai Kohei <kaigai@ak.jp.nec.com>, lorenzo@gnu.org,
	David Woodhouse <dwmw2@infradead.org>,
	=?UTF-8?B?SsO2cm4gRW5nZWw=?= <joern@wohnheim.fh-wedel.de>
Subject: Re: [PATCH] XATTR support on JFFS2 (version. 5)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I'll push two patches into jffs2-xattr-2.6.git tree.
The one of them is obvious. It fixes a typo in comments.

I want any comments for another one before commiting into tree.

There is a possibility that jffs2_setup_xattr_datum() returns
-EEXIST, if a xattr_datum which has same xid and newer version
number is already registered.

The pre-patched implementation ignores this error code and
doesn't care. Theredore, total process of FS-mounting failed.
This patch fixes this problem, When we found such a obsolete
node, it will be dealt as a DIRTY_SPACE() and FS-mounting
will be continued.

It works correctly, and I belive this solution is right.

Thanks,

The broken-out patches are available at here:
http://www.kaigai.gr.jp/index.php?FrontPage#vd16984
01. jffs2-xattr-v5.2-01-fix-duplicate-xdatum.patch
02. jffs2-xattr-v5.2-02-fix_obvious_typo.patch

diff --git a/fs/jffs2/summary.c b/fs/jffs2/summary.c
index 5cde227..d7884e3 100644
--- a/fs/jffs2/summary.c
+++ b/fs/jffs2/summary.c
@@ -508,8 +508,14 @@ static int jffs2_sum_process_sum_data(st
                                 xd = jffs2_setup_xattr_datum(c, je32_to_cpu(spx->xid),
                                                                 je32_to_cpu(spx->version));
                                 if (IS_ERR(xd)) {
-                                       JFFS2_NOTICE("allocation of xattr_datum failed\n");
                                         jffs2_free_raw_node_ref(raw);
+                                       if (PTR_ERR(xd) == -EEXIST) {
+                                               /* a newer version of xd exists */
+                                               DIRTY_SPACE(je32_to_cpu(spx->totlen));
+                                               sp += JFFS2_SUMMARY_XATTR_SIZE;
+                                               break;
+                                       }
+                                       JFFS2_NOTICE("allocation of xattr_datum failed\n");
                                         kfree(summary);
                                         return PTR_ERR(xd);
                                 }

KaiGai Kohei wrote:
> Hi,
> 
> Some fixes and updates on the todo list are already
> pushed to git://git.infradead.org/jffs2-xattr-2.6.git .
> 
> The broken-out patches are available at here:
> http://www.kaigai.gr.jp/index.php?FrontPage#vd169842
> 
> 01. jffs2-xattr-v5.1-01-remove_typedef_kernel.patch
> 02. jffs2-xattr-v5.1-02-remove_typedef_utils.patch
> 03. jffs2-xattr-v5.1-03-append_README.Locking.patch
> 04. jffs2-xattr-v5.1-04-remove_ilist_from_ic.patch
> 05. jffs2-xattr-v5.1-05-update_xattr_gc.patch
> 06. jffs2-xattr-v5.1-06-add_list.h.patch
> 07. jffs2-xattr-v5.1-07-unify_file_header.patch
> 08. jffs2-xattr-v5.1-08-remove_senseless_comment.patch
> 09. jffs2-xattr-v5.1-09-remove__KERNEL__.patch
> 10. jffs2-xattr-v5.1-10-remove_pointer_cast.patch
> 
> I hope to merge the second patch 
> (jffs2-xattr-v5.1-02-remove_typedef_utils.patch),
> because this patch is for mtd-utils.git, not jffs2-xattr-2.6.git.
> 
> P.S.
> Thanks David for your introduction about git on infradead.org.
> 
> David Woodhouse wrote:
> 
>> On Mon, 2006-05-08 at 11:03 +0900, KaiGai Kohei wrote:
>>
>>> [Current TODO list]
>>> * Fix the declaration of jffs2_acl_header and so on by using 'struct'
>>>   instead of 'typedef' in kernel space.
>>> - Fix the declaration of jffs2_acl_header and so on by using 'struct'
>>>   instead of 'typedef' in user space header.
>>> * Add documentation about xattr_sem into README.Locking.
>>> * Call jffs2_garbage_collect_xattr_datum/ref() from gc.c directly
>>>   instead of jffs2_garbage_collect_xattr()
>>> - Use unidirection list beween inode_chache and xattr_ref, instead of
>>>   list_head.
>>> - Add '#include <linux/list.h>' into xattr.h.
>>> - Unify each file header part with any jffs2 files.
>>> - Remove a senseless comment. ("/* forward refence */")
>>> - Remove unneccesary pointer casts.
>>> - Remove unneccesary '#ifdef __KERNEL__' on acl.h
>>>
>>> *: It has already prepared, but I've not publicated yet.
>>> -: It has not prepated yet. I should work from now. 
>>
>>
>>
>> That's an excellent summary; thanks. It does serve to show that we've
>> mostly picked on cosmetic details so far though :)
>>
>> If you have patches committed into a git tree, you should be able to
>> just 'git-push ssh://git.infradead.org/home/git/jffs2-xattr-2.6.git' to
>> make it available.
-- 
KaiGai Kohei <kaigai@kaigai.gr.jp>
