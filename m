Received: from mail-pa0-x22b.google.com ([2607:f8b0:400e:c03::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zm39t-0000vy-Uz
 for linux-mtd@lists.infradead.org; Tue, 13 Oct 2015 17:14:42 +0000
Received: by pacex6 with SMTP id ex6so26717112pac.3
 for <linux-mtd@lists.infradead.org>; Tue, 13 Oct 2015 10:14:21 -0700 (PDT)
Date: Tue, 13 Oct 2015 10:14:18 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Frans Klaver <fransklaver@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2 00/60] Fix mtd parent device not showing up in sysfs
Message-ID: <20151013171418.GV107187@google.com>
References: <1433968754-10651-1-git-send-email-fransklaver@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1433968754-10651-1-git-send-email-fransklaver@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Frans,

On Wed, Jun 10, 2015 at 10:38:14PM +0200, Frans Klaver wrote:
> Here's the second iteration of a series stemming from a previous discussion
> about mtd devices not showing up in sysfs properly[1]. While the original
> series 27 patches, this one should cover all drivers that suffer from this
> issue, and shamelessly hits 60. Again, if it's preferred that the patches are
> grouped differently, like by mtd subdir, I'd be happy to resend. Until then,
> we'll make do with this.
> 
> This series teaches add_mtd_device() to set name and owner based on the set
> parent device, if dev.parent is filled in, and name resp. owner isn't already
> filled in. All drivers that I could find that don't set the parent are touched
> to set the parent device, and remove the name and owner assignment in cases
> where I'm sure the resulting name will not change. Only the latter is done in
> cases where I would find the driver explicitly filling in the owner.
> 
> Thanks for having a go at your favorite MTD,
> Frans
> 
> v1..v2
>   - Overall: make it more clear that it's about a parent device symlink gone
>     missing (thanks, Brian)
>   - Fix compile error in 30: "fsmc_nand: show parent device in sysfs"
>   - Fix possible null-pointer dereference in 02: "mtd: core: set some
>     defaults..."
> 
> [1] https://lkml.org/lkml/2014/5/26/586

Thanks for the patches. I've tested a few drivers and compile tested as
much as I can, and everything looks good. Patches 5 and 59 (m25p80.c and
fsl-quadspi.c) didn't apply cleanly yet, as those drivers have had some
concurrent changes, so I didn't take them yet. If it's trivial to fix
up, I'll apply themself. Stay tuned.

Regards,
Brian
