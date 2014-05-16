Received: from mail-pb0-x22e.google.com ([2607:f8b0:400e:c01::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WlBME-00032M-JC
 for linux-mtd@lists.infradead.org; Fri, 16 May 2014 06:11:10 +0000
Received: by mail-pb0-f46.google.com with SMTP id rq2so2126510pbb.5
 for <linux-mtd@lists.infradead.org>; Thu, 15 May 2014 23:10:41 -0700 (PDT)
Date: Thu, 15 May 2014 23:10:37 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Michal Simek <monstr@monstr.eu>
Subject: Re: JFFS2 locking issue on 3.14 + patches
Message-ID: <20140516061037.GC2413@norris-Latitude-E6410>
References: <535E7A58.8090102@monstr.eu> <20140428165108.GU32070@ld-irv-0074>
 <535F94BF.60004@monstr.eu>
 <20140429170530.GA9418@norris-Latitude-E6410>
 <53608D6C.3020008@monstr.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <53608D6C.3020008@monstr.eu>
Cc: Kamlakant Patel <kamlakant.patel@broadcom.com>,
 Artem Bityutskiy <dedekind1@gmail.com>, Wang Guoli <andy.wangguoli@huawei.com>,
 Li Zefan <lizefan@huawei.com>, linux-mtd@lists.infradead.org,
 Ajesh Kunhipurayil Vijayan <ajesh@broadcom.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Apr 30, 2014 at 07:43:08AM +0200, Michal Simek wrote:
> On 04/29/2014 07:05 PM, Brian Norris wrote:
> > On Tue, Apr 29, 2014 at 02:02:07PM +0200, Michal Simek wrote:
> >> commit a445f784ae5558a3da680aa6b39ed53c95a551c1
> >> Author: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
> >> Date:   Thu Aug 23 10:10:07 2012 +0300
> >>
> >>     JFFS2: fix unmount regression
> >>
> >>     This patch fixes regression introduced by
> >>     "8bdc81c jffs2: get rid of jffs2_sync_super". We submit a delayed work in order
> >>     to make sure the write-buffer is synchronized at some point. But we do not
> >>     flush it when we unmount, which causes an oops when we unmount the file-system
> >>     and then the delayed work is executed.
> >>
> >>     This patch fixes the issue by adding a "cancel_delayed_work_sync()" infocation
> >>     in the '->sync_fs()' handler. This will make sure the delayed work is canceled
> >>     on sync, unmount and re-mount. And because VFS always callse 'sync_fs()' before
> >>     unmounting or remounting, this fixes the issue.
> >>
> >>     Reported-by: Ludovic Desroches <ludovic.desroches@atmel.com>
> >>     Cc: stable@vger.kernel.org [3.5+]
> >>     Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
> >>     Tested-by: Ludovic Desroches <ludovic.desroches@atmel.com>
> >>     Signed-off-by: David Woodhouse <David.Woodhouse@intel.com>
> > 
> > Bisection turned you up here?
> 
> I have looked at it more and JFFS2_FS_WRITEBUFFER is broken from this commit.

Write buffer support may or may not be necessary. What type of flash are
you using?

> When you disable it is working till this commit on Microblaze.
> 
> commit ac093f8d5e76be1f2654acfd7a59d339ba037654
> Author:     Michael S. Tsirkin <mst@redhat.com>
> 
>     microblaze: uaccess s/might_sleep/might_fault/

Hmm, that's only a debugging change. It only has an effect if you have
CONFIG_PROVE_LOCKING or CONFIG_DEBUG_ATOMIC_SLEEP enabled. So that's not
the issue.

> And surprisingly the same change is causing problem on ARM.
> 
> commit ad72907acd2943304c292ae36960bb66e6dc23c9
> Author:     Will Deacon <will.deacon@arm.com>
> 
>     ARM: 7528/1: uaccess: annotate [__]{get,put}_user functions with might_fault()

*Not* surprisingly; it's the same thing, where we're enabling a
debugging feature. Assuming the might_fault() code is accurate, it
simply means we can now discover a bug that already exists, right?

> I have revert these 2 patches and disable JFFS2_FS_WRITEBUFFER
> on the top of that 5 patches and everything seems to work.
> 
> Then I have tried to disable debug locking features which I have ON
> and I have ended up that disabling CONFIG_PROVE_LOCKING
> and CRC problem is back again.

OK, so I don't think you've bisected properly. The might_fault() patches
seem unlikely to be a real source of the problem. If anything, they may
be helping to uncover it. But I do not know. I don't have very good
information to go off of here.

> > Honestly, I'm not too familiar with JFFS2. Maybe Artem can comment,
> > since he authored this commit.
> 
> Is someone doing any testing on JFFS2 at all?
> From this debugging it looks like that JFFS2 have some serious issues
> for quite a long time.

I do not know who is doing JFFS2 testing these days. Most people have
moved to UBIFS, which gets better support. JFFS2 is mostly in
maintenance mode, with little active work.

Brian
