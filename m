Received: from mail-pb0-x230.google.com ([2607:f8b0:400e:c01::230])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WLSwh-0006Kv-6P
 for linux-mtd@lists.infradead.org; Thu, 06 Mar 2014 07:42:23 +0000
Received: by mail-pb0-f48.google.com with SMTP id md12so2251145pbc.7
 for <linux-mtd@lists.infradead.org>; Wed, 05 Mar 2014 23:41:59 -0800 (PST)
Date: Wed, 5 Mar 2014 23:41:54 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Wang Nan <wangnan0@huawei.com>
Subject: Re: [patch 1/4] jffs2: unlock f->sem on error in jffs2_new_inode()
Message-ID: <20140306074154.GV13420@norris-Latitude-E6410>
References: <20140212204454.8FA415A40F6@corp2gmr1-2.hot.corp.google.com>
 <20140226020331.GB4194@ld-irv-0074> <530E8C91.4060703@huawei.com>
 <20140227065540.GC13420@norris-Latitude-E6410>
 <530EF850.4030202@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <530EF850.4030202@huawei.com>
Cc: artem.bityutskiy@linux.intel.com, stable@vger.kernel.org,
 linux-mtd@lists.infradead.org, andy.wangguoli@huawei.com,
 genghui 00204690 <hui.geng@huawei.com>, akpm@linux-foundation.org,
 dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Feb 27, 2014 at 04:33:20PM +0800, Wang Nan wrote:
> On 2014/2/27 14:55, Brian Norris wrote:
> > On Thu, Feb 27, 2014 at 08:53:37AM +0800, Wang Nan wrote:
> >> On 2014/2/26 10:03, Brian Norris wrote:
> >>> On Wed, Feb 12, 2014 at 12:44:54PM -0800, Andrew Morton wrote:
> >>>> From: Wang Guoli <andy.wangguoli@huawei.com>
> >>>> Subject: jffs2: unlock f->sem on error in jffs2_new_inode()
> >>>>
> >>>> If jffs2_new_inode() succeeds, it returns with f->sem held, and the caller
> >>>> is responsible for releasing the lock.  If it fails, it still returns with
> >>>> the lock held, but the caller won't release the lock, which will lead to
> >>>> deadlock.
> >>>
> >>> Have you actually seen a deadlock for this? AFAICT, the error cases for
> >>> jffs2_new_inode() all occur before anyone else actually has a reference
> >>> to the inode, so I don't expect that we should see the deadlock.
> >>>
> >>
> >> We found this bug by reading code. There's no deadlock have been actually seen.
> > 
> > Hmm, then I think maybe we should drop the stable tag. I'm not sure it's
> > a practical issue, and it also has unrelated indentation changes. That
> > means it breaks two of the rules in
> > Documentation/stable_kernel_rules.txt. I'm dropping the stable tag
> > unless someone shouts.
> 
> Thank you for your review, but it is still an obvious bug, isn't it?

Maybe. I'm not really an expert in file systems, but it looks like you
won't ever hit a deadlock, because no one will ever get a reference to
this inode in the error path, and therefore no one will ever try to
re-lock the lock. So while it looks like an inconsistent error path, it
may be benign, and therefore this patch is not really a necessary
bugfix.

Again, I'm not really sure, and I'm not willing to stake a "stable"
patch on code reading by two non-experts with no test case. As I see it,
Documentation/stable_kernel_rules.txt is written for a reason.

> We will work for test case, and will let you know if we successfully
> trigger deadlock.

Yes, please do let me know if you can identify one in practice. Or if
you can convince me how the inode may leak out to cause a deadlock on
the error paths in question.

Brian
