Received: from mail-pd0-x234.google.com ([2607:f8b0:400e:c02::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y13oQ-00067U-Oz
 for linux-mtd@lists.infradead.org; Wed, 17 Dec 2014 01:54:04 +0000
Received: by mail-pd0-f180.google.com with SMTP id w10so15163656pde.39
 for <linux-mtd@lists.infradead.org>; Tue, 16 Dec 2014 17:53:41 -0800 (PST)
Date: Tue, 16 Dec 2014 17:53:38 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Liu Song <liu.song11@zte.com.cn>
Subject: Re: [PATCH]jffs2:bugfix for should not appeared directory hard link
Message-ID: <20141217015338.GR9759@ld-irv-0074>
References: <OFA26F19B7.DF3A70A5-ON48257D7B.00265361-48257D7B.0033C198@zte.com.cn>
 <20141105114500.GM22361@norris-Latitude-E6410>
 <OFC7724A44.98471338-ON48257D8E.00241A97-48257D8E.00250734@zte.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <OFC7724A44.98471338-ON48257D8E.00241A97-48257D8E.00250734@zte.com.cn>
Cc: cui.yunfeng@zte.com.cn, Artem Bityutskiy <dedekind1@gmail.com>,
 linux-mtd@lists.infradead.org, jiang.xuexin@zte.com.cn, wang.bo116@zte.com.cn,
 dwmw2@infradead.org, deng.chao1@zte.com.cn
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

+ Artem

On Wed, Nov 12, 2014 at 02:45:09PM +0800, Liu Song wrote:
> Brian Norris <computersforpeace@gmail.com> wrote on 2014-11-05 19:45:00:
> 
> > From: Brian Norris <computersforpeace@gmail.com>
> > To: liu.song11@zte.com.cn,
> > Cc: jiang.xuexin@zte.com.cn, linux-mtd@lists.infradead.org, cui.yunfeng@zte.com.cn, wang.bo116@zte.com.cn, dwmw2@infradead.org, deng.chao1@zte.com.cn
> > Date: 2014-11-05 19:45
> > Subject: Re: [PATCH]jffs2:bugfix for should not appeared directory hard link
> >
[...]
> > This only describes the problem, but it doesn't describe the fix at all.
> > Please provide a proper commit description.
> >
> > Also, your patch is very big and line-wrapped, so it's very hard to
> > figure out what it's doing, and it won't apply to my git tree. Please
> > check your mailer settings.
> >
> > All this is addressed in Documentation/SubmittingPatches, which I
> > suggest you read.
> 
> Thanks a lot for your attention and suggestions. Follow the guide, patch had checked by checkpatch.pl,
> but there also had warnings about line over 80 characters, I had no idea to fix that except remove the
> code indentations, but i'm afraid that would make codes hard to read. However, if there are any
> suggestions to fix this I would try.

Sometimes you can break a line in the middle, where necessary. The C
language allows line-breaks in statements.

But many times, high levels of indentation mean you should probably
restructure your code. Documentation/CodingStyle talks about this.

> Patch has really long print notice in summary.c, we remove them
> from this patch.
> 
> The following is the description about this patch.

OK, then format it as such. Try applying it with git-am, and you'll see
that it does not turn out well. See Documentation/email-clients.txt for
help on git.

> The patch is focus on jffs2 with summary. We check deletion dirent's crc in "jffs2_sum_process_sum_data"
> so could make its ref flag REF_NORMAL. After this process, all crc correct deletion dirents' ref flag
> are REF_NORMAL then could separate from other nodes(REF_UNCHECKED).We use this flag to protect unlinked
> deletion dirent directly turned to obsoleted in "jffs2_build_remove_unlinked_inode", because deletion dirents
> maybe still useful if it's obsoleted dirent remain in flash. These unlinked deletion dirents will be checked
> whether still useful in gc time.
> 
> These unlinked deletion dirents in "jffs2_garbage_collect_pass" will skip to check, because its
> "jffs2_inode_cache"'s pino_nlink is zero. Then in "jffs2_garbage_collect_pass", unlinked deletion dirents' "ic->state"
> is INO_STATE_UNCHECKED, but we had checked the crc during scan. So we give its a new state which is INO_STATE_DELETION.
> If gc find current node's "ic->state" is INO_STATE_DELETION will know it's an unlinked deletion dirent, then will check
> whether its still useful in "jffs2_garbage_collect_unlinked_dirent" which is similar to "jffs2_garbage_collect_deletion_dirent"
> but use different parameters. If the unlinked deletion dirent is still useful, we copy it, else, we could safely mark it obsoleted.
> 
> In "jffs2_do_unlink", there also has the same problem, it will obsolete the unlinked directory's child dirents
> which include deletion dirent, so we should also protect the deletion dirent.
> 
> The main purpose of this patch is to prevent unlinked deletion direct directly turn to obsolete and handle it
> during gc time. We had do many tests on this patch and it worked properly, the directory hard link couldn't occured.
> We had also test the deletion dirents' crc in scan time whether cost a lot,the result is check 81809 deletion dirents' crc
> could within one second, so it will not extend the mounting time.
> 
> Thanks
> Best Regards
> Liu Song
> -------------------------------------------------------------------------------------------------------------------------------------------------------------
> 
> diff --git a/build.c b/build.c
> index a3750f9..ad7b8a6 100644
> --- a/build.c
> +++ b/build.c

This means you're not patching at the top-level directory. It should say

  a/fs/jffs2/build.c

(Same throughout this diff.)

Again, please test with git-am, and you'll see that this does not apply
well.

(snip rest of patch)

Honestly, you haven't done anything to make this patch more logically
easy to follow, and I'm not a JFFS2 developer. So there's really not any
way that I'm going to be able to handle this. And JFFS2 is past its
prime, with no one actually interested in supporting it.

Now, given this, there is a large burden on you to make it easy for
someone to accept your patch. It's not obvious you've done your homework
here, as the patch still doesn't apply right, and it is very hard to
read.

Technically, MAINTAINERS still lists David as the sole maintainer of
JFFS2. If he's not willing to review this patch, then perhaps JFFS2
should be marked orphan / obsolete:

diff --git a/MAINTAINERS b/MAINTAINERS
index a20df9bf8ab0..223889b30a51 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5198,10 +5198,9 @@ S:	Maintained
 F:	drivers/net/ethernet/jme.*
 
 JOURNALLING FLASH FILE SYSTEM V2 (JFFS2)
-M:	David Woodhouse <dwmw2@infradead.org>
 L:	linux-mtd@lists.infradead.org
 W:	http://www.linux-mtd.infradead.org/doc/jffs2.html
-S:	Maintained
+S:	Orphan / Obsolete
 F:	fs/jffs2/
 F:	include/uapi/linux/jffs2.h
 
