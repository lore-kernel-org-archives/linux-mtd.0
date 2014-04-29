Received: from mail-qa0-x22a.google.com ([2607:f8b0:400d:c00::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WfBTp-0006ZF-6r
 for linux-mtd@lists.infradead.org; Tue, 29 Apr 2014 17:06:05 +0000
Received: by mail-qa0-f42.google.com with SMTP id m5so491095qaj.29
 for <linux-mtd@lists.infradead.org>; Tue, 29 Apr 2014 10:05:42 -0700 (PDT)
Date: Tue, 29 Apr 2014 10:05:30 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Michal Simek <monstr@monstr.eu>
Subject: Re: JFFS2 locking issue on 3.14 + patches
Message-ID: <20140429170530.GA9418@norris-Latitude-E6410>
References: <535E7A58.8090102@monstr.eu> <20140428165108.GU32070@ld-irv-0074>
 <535F94BF.60004@monstr.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <535F94BF.60004@monstr.eu>
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

+ Artem

On Tue, Apr 29, 2014 at 02:02:07PM +0200, Michal Simek wrote:
> On 04/28/2014 06:51 PM, Brian Norris wrote:
> > On Mon, Apr 28, 2014 at 05:57:12PM +0200, Michal Simek wrote:
> >> we are having this problem with JFFS2 rootfs. It is v3.14 kernel
> >> with these 5 patches which cherry-picked from 3.15.
> >>
> >> 41bf1a2 jffs2: Fix crash due to truncation of csize
> >> 3367da5 jffs2: Fix segmentation fault found in stress test
> >> 01887a3 jffs2: unlock f->sem on error in jffs2_new_inode()
> >> 13b546d jffs2: avoid soft-lockup in jffs2_reserve_space_gc()
> >> 3ead957 jffs2: remove from wait queue after schedule()
> > 
> > Have you bisected these? And possibly test the patches in isolation
> > (there are only 5)?
[...]
> Bisecting these five patches don't solve anything.

BTW, for your bisecting, did you have a clean version of your
filesystem? After a bug creates CRC / data errors, it's possible
that--no matter what kernel you boot--you will retain those errors on
your flash media.

> Locking issue was introduced 3.6-rc3 by this commit.
> I will check CONFIG_JFFS2_FS_WRITEBUFFER option.

Sorry, I think I misread your first report; your problem is probably not
with any of these 5 patches, but with some other yet-unsolved issue.

> commit a445f784ae5558a3da680aa6b39ed53c95a551c1
> Author: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
> Date:   Thu Aug 23 10:10:07 2012 +0300
> 
>     JFFS2: fix unmount regression
> 
>     This patch fixes regression introduced by
>     "8bdc81c jffs2: get rid of jffs2_sync_super". We submit a delayed work in order
>     to make sure the write-buffer is synchronized at some point. But we do not
>     flush it when we unmount, which causes an oops when we unmount the file-system
>     and then the delayed work is executed.
> 
>     This patch fixes the issue by adding a "cancel_delayed_work_sync()" infocation
>     in the '->sync_fs()' handler. This will make sure the delayed work is canceled
>     on sync, unmount and re-mount. And because VFS always callse 'sync_fs()' before
>     unmounting or remounting, this fixes the issue.
> 
>     Reported-by: Ludovic Desroches <ludovic.desroches@atmel.com>
>     Cc: stable@vger.kernel.org [3.5+]
>     Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
>     Tested-by: Ludovic Desroches <ludovic.desroches@atmel.com>
>     Signed-off-by: David Woodhouse <David.Woodhouse@intel.com>

Bisection turned you up here?

Honestly, I'm not too familiar with JFFS2. Maybe Artem can comment,
since he authored this commit.

Brian
