Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1URgmz-0006eE-8s
 for linux-mtd@lists.infradead.org; Mon, 15 Apr 2013 10:37:33 +0000
Message-ID: <1366022346.2768.60.camel@sauron.fi.intel.com>
Subject: Re: UBIFS: make space fixup work in the remount case
From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 15 Apr 2013 13:39:06 +0300
In-Reply-To: <20130415101936.GM6692@mwanda>
References: <20130415095924.GA26544@elgon.mountain>
 <1366020693.2768.41.camel@sauron.fi.intel.com>
 <20130415101936.GM6692@mwanda>
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

On Mon, 2013-04-15 at 13:19 +0300, Dan Carpenter wrote:
> On Mon, Apr 15, 2013 at 01:11:33PM +0300, Artem Bityutskiy wrote:
> > On Mon, 2013-04-15 at 12:59 +0300, Dan Carpenter wrote:
> > >   1571          if (c->space_fixup) {
> > >   1572                  err = ubifs_fixup_free_space(c);
> > >   1573                  if (err)
> > >   1574                          return err;
> > >                                 ^^^^^^^^^^
> > > Shouldn't this be a "goto out?".  We're holding the c->umount_mutex.
> > 
> > Hi Dan, I fixed this up and answered the reporter:
> > https://patchwork.kernel.org/patch/2284681/
> > 
> > It is now 'goto out'. Thanks!
> 
> Huh...  That wasn't who I expected to report it.  :P  It's good to
> know that these kind of bugs don't last very long.

The story actually was that I noticed this myself after running Aiaiai
and fixed it up "in-place", and then several people reported, and I
answered to one of them.

-- 
Best Regards,
Artem Bityutskiy
