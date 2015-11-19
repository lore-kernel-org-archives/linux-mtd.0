Received: from mail-pa0-x22d.google.com ([2607:f8b0:400e:c03::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZzD1C-0008OL-6T
 for linux-mtd@lists.infradead.org; Thu, 19 Nov 2015 00:24:09 +0000
Received: by pacdm15 with SMTP id dm15so60868607pac.3
 for <linux-mtd@lists.infradead.org>; Wed, 18 Nov 2015 16:23:39 -0800 (PST)
Date: Wed, 18 Nov 2015 16:23:37 -0800 (PST)
From: David Rientjes <rientjes@google.com>
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
cc: akpm@linux-foundation.org, linux-mm@kvack.org,
 Russell King <linux@arm.linux.org.uk>, linux-acpi@vger.kernel.org,
 drbd-user@lists.linbit.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Oleg Drokin <oleg.drokin@intel.com>,
 Andreas Dilger <andreas.dilger@intel.com>, codalist@coda.cs.cmu.edu,
 linux-mtd@lists.infradead.org, Jan Kara <jack@suse.com>,
 linux-fsdevel@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH] tree wide: Use kvfree() than conditional kfree()/vfree()
In-Reply-To: <1447070170-8512-1-git-send-email-penguin-kernel@I-love.SAKURA.ne.jp>
Message-ID: <alpine.DEB.2.10.1511181623240.1381@chino.kir.corp.google.com>
References: <1447070170-8512-1-git-send-email-penguin-kernel@I-love.SAKURA.ne.jp>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 9 Nov 2015, Tetsuo Handa wrote:

> There are many locations that do
> 
>   if (memory_was_allocated_by_vmalloc)
>     vfree(ptr);
>   else
>     kfree(ptr);
> 
> but kvfree() can handle both kmalloc()ed memory and vmalloc()ed memory
> using is_vmalloc_addr(). Unless callers have special reasons, we can
> replace this branch with kvfree(). Please check and reply if you found
> problems.
> 
> Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
> Acked-by: Michal Hocko <mhocko@suse.com>
> Cc: Russell King <linux@arm.linux.org.uk> # arm
> Cc: <linux-acpi@vger.kernel.org> # apei
> Cc: <drbd-user@lists.linbit.com> # drbd
> Cc: <linux-kernel@vger.kernel.org> # mspec
> Cc: <dri-devel@lists.freedesktop.org> # drm
> Cc: Oleg Drokin <oleg.drokin@intel.com> # lustre
> Cc: Andreas Dilger <andreas.dilger@intel.com> # lustre
> Cc: <codalist@coda.cs.cmu.edu> # coda
> Cc: <linux-mtd@lists.infradead.org> # jffs2
> Cc: Jan Kara <jack@suse.com> # udf
> Cc: <linux-fsdevel@vger.kernel.org> # xattr
> Cc: <linux-mm@kvack.org> # ipc + mm
> Cc: <netdev@vger.kernel.org> # ipv4

Acked-by: David Rientjes <rientjes@google.com>
