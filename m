Received: from userp1040.oracle.com ([156.151.31.81])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1URgVb-0006N6-O6
 for linux-mtd@lists.infradead.org; Mon, 15 Apr 2013 10:19:36 +0000
Date: Mon, 15 Apr 2013 13:19:36 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Subject: Re: UBIFS: make space fixup work in the remount case
Message-ID: <20130415101936.GM6692@mwanda>
References: <20130415095924.GA26544@elgon.mountain>
 <1366020693.2768.41.camel@sauron.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1366020693.2768.41.camel@sauron.fi.intel.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Apr 15, 2013 at 01:11:33PM +0300, Artem Bityutskiy wrote:
> On Mon, 2013-04-15 at 12:59 +0300, Dan Carpenter wrote:
> >   1571          if (c->space_fixup) {
> >   1572                  err = ubifs_fixup_free_space(c);
> >   1573                  if (err)
> >   1574                          return err;
> >                                 ^^^^^^^^^^
> > Shouldn't this be a "goto out?".  We're holding the c->umount_mutex.
> 
> Hi Dan, I fixed this up and answered the reporter:
> https://patchwork.kernel.org/patch/2284681/
> 
> It is now 'goto out'. Thanks!

Huh...  That wasn't who I expected to report it.  :P  It's good to
know that these kind of bugs don't last very long.

regards,
dan carpenter
