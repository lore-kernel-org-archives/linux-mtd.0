Received: from mga02.intel.com ([134.134.136.20])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZvtFn-000277-FE
 for linux-mtd@lists.infradead.org; Mon, 09 Nov 2015 20:41:28 +0000
From: "Dilger, Andreas" <andreas.dilger@intel.com>
To: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "linux-mm@kvack.org"
 <linux-mm@kvack.org>
CC: Russell King <linux@arm.linux.org.uk>, "linux-acpi@vger.kernel.org"
 <linux-acpi@vger.kernel.org>, "drbd-user@lists.linbit.com"
 <drbd-user@lists.linbit.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "Drokin, Oleg" <oleg.drokin@intel.com>,
 "codalist@coda.cs.cmu.edu" <codalist@coda.cs.cmu.edu>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Jan Kara
 <jack@suse.com>, "linux-fsdevel@vger.kernel.org"
 <linux-fsdevel@vger.kernel.org>, "netdev@vger.kernel.org"
 <netdev@vger.kernel.org>
Subject: Re: [PATCH] tree wide: Use kvfree() than conditional kfree()/vfree()
Date: Mon, 9 Nov 2015 20:41:04 +0000
Message-ID: <D26652E2.1197DE%andreas.dilger@intel.com>
References: <1447070170-8512-1-git-send-email-penguin-kernel@I-love.SAKURA.ne.jp>
In-Reply-To: <1447070170-8512-1-git-send-email-penguin-kernel@I-love.SAKURA.ne.jp>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <994BD6192472F340B6785C8E6A9E1FA4@intel.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 2015/11/09, 04:56, "Tetsuo Handa" <penguin-kernel@I-love.SAKURA.ne.jp>
wrote:

>There are many locations that do
>
>  if (memory_was_allocated_by_vmalloc)
>    vfree(ptr);
>  else
>    kfree(ptr);
>
>but kvfree() can handle both kmalloc()ed memory and vmalloc()ed memory
>using is_vmalloc_addr(). Unless callers have special reasons, we can
>replace this branch with kvfree(). Please check and reply if you found
>problems.
>
>Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
>Acked-by: Michal Hocko <mhocko@suse.com>

For Lustre part:
Reviewed-by: Andreas Dilger <andreas.dilger@intel.com>

Cheers, Andreas
--=20
Andreas Dilger

Lustre Principal Engineer
Intel High Performance Data Division
