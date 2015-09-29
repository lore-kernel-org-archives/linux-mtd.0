Received: from mail-pa0-x229.google.com ([2607:f8b0:400e:c03::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zh1f0-0007av-CA
 for linux-mtd@lists.infradead.org; Tue, 29 Sep 2015 20:38:02 +0000
Received: by pacfv12 with SMTP id fv12so16246560pac.2
 for <linux-mtd@lists.infradead.org>; Tue, 29 Sep 2015 13:37:41 -0700 (PDT)
Date: Tue, 29 Sep 2015 13:37:38 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>,
 Jens Axboe <axboe@kernel.dk>, Alexander Viro <viro@zeniv.linux.org.uk>
Subject: Re: [PATCH] mtd: provide proper 32/64-bit compat_ioctl() support for
 BLKPG
Message-ID: <20150929203738.GN31505@google.com>
References: <1440814356-52070-1-git-send-email-computersforpeace@gmail.com>
 <1442867219-147408-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1442867219-147408-1-git-send-email-computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Sep 21, 2015 at 01:26:59PM -0700, Brian Norris wrote:
> After a bit of poking around wondering why my 32-bit user-space can't
> seem to send a proper ioctl(BLKPG) to an MTD on my 64-bit kernel
> (ARM64), I noticed that struct blkpg_ioctl_arg is actually pretty
> unsuitable for use in the ioctl() ABI, due to its use of raw pointers,
> and its lack of alignment/packing restrictions (32-bit arch'es tend to
> pack the 4 fields into 4 32-bit words, whereas 64-bit arch'es would add
> padding after the third int, and make this 6 32-bit words).
> 
> Anyway, this means BLKPG deserves some special compat_ioctl handling. Do
> the conversion in a small shim for MTD.
> 
> block/compat_ioctl.c already has compat support for the block subsystem,
> but it does so by a re-marshalling data to/from user-space (see
> compat_blkpg_ioctl()). Personally, I think this approach is cleaner.
> 
> Tested only on MTD, with an ARM32 user space on an ARM64 kernel.
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> ---
> You can find the initial bug report / patch here:
> 
>   http://article.gmane.org/gmane.linux.kernel/2028927
>   https://lkml.org/lkml/2015/8/28/594
> 
> Changes since RFC:
>  * create new non-UAPI header, instead of cluttering the UAPI header with
>    compat stuff
>  * remove mention of "same bug in block/", since block/ solves this problem
>    already, just in a slightly different way

Pushed to l2-mtd.git
