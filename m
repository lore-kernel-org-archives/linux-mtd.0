Received: from aserp1040.oracle.com ([141.146.126.69])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WUyuw-0001Yf-Ek
 for linux-mtd@lists.infradead.org; Tue, 01 Apr 2014 13:39:54 +0000
Date: Tue, 1 Apr 2014 16:39:19 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Subject: Re: UBIFS: make space fixup work in the remount case
Message-ID: <20140401130848.GF18506@mwanda>
References: <20130415095924.GA26544@elgon.mountain>
 <1366020693.2768.41.camel@sauron.fi.intel.com>
 <20130415101936.GM6692@mwanda>
 <1366022346.2768.60.camel@sauron.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1366022346.2768.60.camel@sauron.fi.intel.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Apr 15, 2013 at 01:39:06PM +0300, Artem Bityutskiy wrote:
> On Mon, 2013-04-15 at 13:19 +0300, Dan Carpenter wrote:
> > On Mon, Apr 15, 2013 at 01:11:33PM +0300, Artem Bityutskiy wrote:
> > > On Mon, 2013-04-15 at 12:59 +0300, Dan Carpenter wrote:
> > > >   1571          if (c->space_fixup) {
> > > >   1572                  err = ubifs_fixup_free_space(c);
> > > >   1573                  if (err)
> > > >   1574                          return err;
> > > >                                 ^^^^^^^^^^
> > > > Shouldn't this be a "goto out?".  We're holding the c->umount_mutex.
> > > 
> > > Hi Dan, I fixed this up and answered the reporter:
> > > https://patchwork.kernel.org/patch/2284681/
> > > 
> > > It is now 'goto out'. Thanks!
> > 
> > Huh...  That wasn't who I expected to report it.  :P  It's good to
> > know that these kind of bugs don't last very long.
> 
> The story actually was that I noticed this myself after running Aiaiai
> and fixed it up "in-place", and then several people reported, and I
> answered to one of them.

Hi Artem,

This showed up in my smatch output again today.  Whatever happened with
this.  I reported it last Jun and last Nov as well apparently.

regards,
dan carpenter
