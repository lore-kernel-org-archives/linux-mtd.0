Received: from mail-pd0-x22a.google.com ([2607:f8b0:400e:c02::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WeomD-0007Ba-O1
 for linux-mtd@lists.infradead.org; Mon, 28 Apr 2014 16:51:34 +0000
Received: by mail-pd0-f170.google.com with SMTP id x10so2525597pdj.15
 for <linux-mtd@lists.infradead.org>; Mon, 28 Apr 2014 09:51:12 -0700 (PDT)
Date: Mon, 28 Apr 2014 09:51:08 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Michal Simek <monstr@monstr.eu>
Subject: Re: JFFS2 locking issue on 3.14 + patches
Message-ID: <20140428165108.GU32070@ld-irv-0074>
References: <535E7A58.8090102@monstr.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <535E7A58.8090102@monstr.eu>
Cc: Ajesh Kunhipurayil Vijayan <ajesh@broadcom.com>,
 Li Zefan <lizefan@huawei.com>, linux-mtd@lists.infradead.org,
 Kamlakant Patel <kamlakant.patel@broadcom.com>,
 Wang Guoli <andy.wangguoli@huawei.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Apr 28, 2014 at 05:57:12PM +0200, Michal Simek wrote:
> we are having this problem with JFFS2 rootfs. It is v3.14 kernel
> with these 5 patches which cherry-picked from 3.15.
> 
> 41bf1a2 jffs2: Fix crash due to truncation of csize
> 3367da5 jffs2: Fix segmentation fault found in stress test
> 01887a3 jffs2: unlock f->sem on error in jffs2_new_inode()
> 13b546d jffs2: avoid soft-lockup in jffs2_reserve_space_gc()
> 3ead957 jffs2: remove from wait queue after schedule()

Have you bisected these? And possibly test the patches in isolation
(there are only 5)?

Brian
