Received: from mga03.intel.com ([134.134.136.65])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z8Ne1-0007ZZ-0G
 for linux-mtd@lists.infradead.org; Fri, 26 Jun 2015 07:01:50 +0000
Message-ID: <1435302083.9627.36.camel@sauron.fi.intel.com>
Subject: Re: [PATCH RESEND] ubifs: Introduce a mount option of force_atime.
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
Date: Fri, 26 Jun 2015 10:01:23 +0300
In-Reply-To: <558CA82B.7050306@cn.fujitsu.com>
References: <1433831809.28854.17.camel@sauron.fi.intel.com>
 <55769D97.3010602@nod.at> <5577AC03.9060909@cn.fujitsu.com>
 <1433928078.14092.1.camel@sauron.fi.intel.com>
 <55780D1C.6080907@cn.fujitsu.com>
 <1433931934.14092.11.camel@sauron.fi.intel.com>
 <557812A4.8020409@cn.fujitsu.com>
 <1433934324.14092.15.camel@sauron.fi.intel.com>
 <55892D18.3020203@cn.fujitsu.com>
 <1435056240.7659.69.camel@sauron.fi.intel.com>
 <20150624003335.GG22807@dastard> <558BD010.6020207@cn.fujitsu.com>
 <1435226918.9627.14.camel@sauron.fi.intel.com>
 <558BD3B0.8080209@cn.fujitsu.com>
 <1435231689.9627.17.camel@sauron.fi.intel.com>
 <558CA82B.7050306@cn.fujitsu.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-fsdevel@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 Dave Chinner <david@fromorbit.com>, adrian.hunter@intel.com,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2015-06-26 at 09:17 +0800, Dongsheng Yang wrote:
> On 06/25/2015 07:28 PM, Artem Bityutskiy wrote:
> > On Thu, 2015-06-25 at 18:10 +0800, Dongsheng Yang wrote:
> >>   > -o - default behavior (no atime)
> >>   > -o relatime - relative atime support
> >>
> >> We would find both of them are MS_RELATIME set. But we
> >> want to do different thing in these cases. So I introduced
> >> the force_atime. Then:
> >
> > Oh, do you know where exactly the default MS_RELATIME gets set?
> 
> Ha, yes, it was set in do_mount() in vfs. I mentioned this in a mail
> days ago, but let me try to explain it more clearly here.

OK, right, I see it:


commit 0a1c01c9477602ee8b44548a9405b2c1d587b5a2
Author: Matthew Garrett <mjg@redhat.com>
Date:   Thu Mar 26 17:53:14 2009 +0000

    Make relatime default
    
    Change the default behaviour of the kernel to use relatime for all
    filesystems. This can be overridden with the "strictatime" mount
    option.
    
    Signed-off-by: Matthew Garrett <mjg@redhat.com>
    Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>

diff --git a/fs/namespace.c b/fs/namespace.c
index d0659ec..f0e7530 100644
--- a/fs/namespace.c
+++ b/fs/namespace.c
@@ -1920,6 +1920,9 @@ long do_mount(char *dev_name, char *dir_name, char *type_page,
        if (data_page)
                ((char *)data_page)[PAGE_SIZE - 1] = 0;
 
+       /* Default to relatime */
+       mnt_flags |= MNT_RELATIME;
+
        /* Separate the per-mountpoint flags */
        if (flags & MS_NOSUID)
                mnt_flags |= MNT_NOSUID;
@@ -1931,8 +1934,6 @@ long do_mount(char *dev_name, char *dir_name, char *type_page,
                mnt_flags |= MNT_NOATIME;
        if (flags & MS_NODIRATIME)
                mnt_flags |= MNT_NODIRATIME;
-       if (flags & MS_RELATIME)
-               mnt_flags |= MNT_RELATIME;
        if (flags & MS_STRICTATIME)
                mnt_flags &= ~(MNT_RELATIME | MNT_NOATIME);
        if (flags & MS_RDONLY)


This means that if a file-system (e.g., UBIFS or JFFS2) never supported
atime, it is harder to add atime support without breaking the old
behavior.

What if we push the two "set NOATIME flag" lines of code down to
individual file-systems, instead of having it at the VFS level?

... snip ...

> (d), But when I heard an idea about UBIFS_ATIME_SUPPORT from you.
> I get an idea 3.
> ======================idea 3 in ubifs=========================
> UBIFS_ATIME_SUPPORT is n, same with what ubifs did:
> -o - no atime
> -o atime - no atime
> -o noatime - no atime
> -o relatime - no atime
> -o strictatime - no atime
> -o lazyatime - no atime
> 
> UBIFS_ATIME_SUPPORT is y, same with what generic is doing:
> -o - default behavior (relatime currently)
> -o atime - atime support
> -o noatime - no atime support
> -o relatime - relative atime support
> -o strictatime - strict atime support
> -o lazyatime - lazy atime support

Yes, this is an option, I am just trying to explore other possibilities.
