Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WX785-0002ud-8c
 for linux-mtd@lists.infradead.org; Mon, 07 Apr 2014 10:50:17 +0000
Message-ID: <1396867423.17040.13.camel@sauron.fi.intel.com>
Subject: Re: UBIFS: make space fixup work in the remount case
From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 07 Apr 2014 13:43:43 +0300
In-Reply-To: <20140401130848.GF18506@mwanda>
References: <20130415095924.GA26544@elgon.mountain>
 <1366020693.2768.41.camel@sauron.fi.intel.com>
 <20130415101936.GM6692@mwanda>
 <1366022346.2768.60.camel@sauron.fi.intel.com>
 <20140401130848.GF18506@mwanda>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Reply-To: artem.bityutskiy@linux.intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2014-04-01 at 16:39 +0300, Dan Carpenter wrote:
> On Mon, Apr 15, 2013 at 01:39:06PM +0300, Artem Bityutskiy wrote:
> > On Mon, 2013-04-15 at 13:19 +0300, Dan Carpenter wrote:
> > > On Mon, Apr 15, 2013 at 01:11:33PM +0300, Artem Bityutskiy wrote:
> > > > On Mon, 2013-04-15 at 12:59 +0300, Dan Carpenter wrote:
> > > > >   1571          if (c->space_fixup) {
> > > > >   1572                  err = ubifs_fixup_free_space(c);
> > > > >   1573                  if (err)
> > > > >   1574                          return err;
> > > > >                                 ^^^^^^^^^^
> > > > > Shouldn't this be a "goto out?".  We're holding the c->umount_mutex.
> > > > 
> > > > Hi Dan, I fixed this up and answered the reporter:
> > > > https://patchwork.kernel.org/patch/2284681/
> > > > 
> > > > It is now 'goto out'. Thanks!
> > > 
> > > Huh...  That wasn't who I expected to report it.  :P  It's good to
> > > know that these kind of bugs don't last very long.
> > 
> > The story actually was that I noticed this myself after running Aiaiai
> > and fixed it up "in-place", and then several people reported, and I
> > answered to one of them.
> 
> Hi Artem,
> 
> This showed up in my smatch output again today.  Whatever happened with
> this.  I reported it last Jun and last Nov as well apparently.

Hmm, I was sure I fixed this, but it is still there.

OK, created and pushed a fix to the master branch. It won't hit
linux-next so far, I'll propagate it there once 3.15-rc1 or -rc2 is out.
Thanks!


From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Date: Mon, 7 Apr 2014 13:39:06 +0300
Subject: [PATCH] UBIFS: fix remount error path

Dan's "smatch" checker found out that there was a bug in the error path of the
'ubifs_remount_rw()' function. Instead of jumping to the "out" label which
cleans-things up, we just returned.

This patch fixes the problem.

Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 fs/ubifs/super.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index 5ded849..7e71ac9 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -1556,7 +1556,7 @@ static int ubifs_remount_rw(struct ubifs_info *c)
        if (c->space_fixup) {
                err = ubifs_fixup_free_space(c);
                if (err)
-                       return err;
+                       goto out;
        }
 
        err = check_free_space(c);
-- 
1.8.5.3

-- 
Best Regards,
Artem Bityutskiy
