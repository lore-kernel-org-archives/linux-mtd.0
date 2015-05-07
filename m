Received: from mail-pd0-x232.google.com ([2607:f8b0:400e:c02::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YqV7C-0003sZ-VH
 for linux-mtd@lists.infradead.org; Thu, 07 May 2015 23:22:03 +0000
Received: by pdbnk13 with SMTP id nk13so54148218pdb.0
 for <linux-mtd@lists.infradead.org>; Thu, 07 May 2015 16:21:41 -0700 (PDT)
Date: Thu, 7 May 2015 16:21:36 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] jffs2: fix unbalanced locking
Message-ID: <20150507232136.GU32500@ld-irv-0074>
References: <1393381660-26150-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1393381660-26150-1-git-send-email-computersforpeace@gmail.com>
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, Li Zefan <lizefan@huawei.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Feb 25, 2014 at 06:27:40PM -0800, Brian Norris wrote:
> Li Zefan reported an unbalanced locking issue, found by his
> internal debugging feature on runtime. The particular case he was
> looking at doesn't lead to a deadlock, as the structure that this lock
> is embedded in is freed on error. But we should straighten out the error
> handling.
> 
> Because several callers of jffs2_do_read_inode_internal() /
> jffs2_do_read_inode() already handle the locking/unlocking and inode
> clearing at their own level, let's just push any unlocks/clearing down
> to the caller. This consistency is much easier to verify.
> 
> Reported-by: Li Zefan <lizefan@huawei.com>
> Cc: David Woodhouse <dwmw2@infradead.org>
> Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> ---
> Not CC'd to -stable this time, since the bug seems non-critical, and it has
> only limited testing (I did a few quick sanity tests, and Li tested an earlier
> revision)

Pushed to l2-mtd.git.
