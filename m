Received: from mail-ie0-x235.google.com ([2607:f8b0:4001:c03::235])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WITuD-0006y1-BC
 for linux-mtd@lists.infradead.org; Wed, 26 Feb 2014 02:07:30 +0000
Received: by mail-ie0-f181.google.com with SMTP id lx4so150531iec.40
 for <linux-mtd@lists.infradead.org>; Tue, 25 Feb 2014 18:07:08 -0800 (PST)
Date: Tue, 25 Feb 2014 18:07:04 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: akpm@linux-foundation.org
Subject: Re: [patch 4/4] jffs2: remove wait queue after schedule()
Message-ID: <20140226020704.GC4194@ld-irv-0074>
References: <20140212204458.0AD5E5A420C@corp2gmr1-2.hot.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20140212204458.0AD5E5A420C@corp2gmr1-2.hot.corp.google.com>
Cc: artem.bityutskiy@linux.intel.com, linux-mtd@lists.infradead.org,
 lizefan@huawei.com, dwmw2@infradead.org, stable@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

+ linux-mtd (this patch was on the ML previously, but akpm re-sent it)

On Wed, Feb 12, 2014 at 12:44:57PM -0800, Andrew Morton wrote:
> From: Li Zefan <lizefan@huawei.com>
> Subject: jffs2: remove wait queue after schedule()
> 
> @wait is a local variable, so if we don't remove it from the wait queue
> list, later wake_up() may end up accessing invalid memory.
> 
> This was spotted by eyes.
> 
> Signed-off-by: Li Zefan <lizefan@huawei.com>
> Cc: David Woodhouse <dwmw2@infradead.org>
> Cc: Brian Norris <computersforpeace@gmail.com>
> Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Andrew Morton <akpm@linux-foundation.org>

Pushed to l2-mtd.git. Thanks!

Brian
