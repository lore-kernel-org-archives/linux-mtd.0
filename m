Received: from wf-out-1314.google.com ([209.85.200.173])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KYCgU-0002nS-PU
	for linux-mtd@lists.infradead.org; Wed, 27 Aug 2008 04:31:07 +0000
Received: by wf-out-1314.google.com with SMTP id 28so2340043wfc.24
	for <linux-mtd@lists.infradead.org>;
	Tue, 26 Aug 2008 21:31:04 -0700 (PDT)
Message-ID: <48B4D884.5040204@gmail.com>
Date: Tue, 26 Aug 2008 21:31:00 -0700
From: Zev Weiss <zevweiss@gmail.com>
MIME-Version: 1.0
Subject: Re: [PATCH] [MTD] mtdchar.c: Fix regression in MEMGETREGIONINFO
	ioctl()
References: <48ABCC0B.40607@gmail.com>	<20080822153451.bb79bd1f.akpm@linux-foundation.org>	<48AFC5ED.50005@gmail.com>
	<20080823222707.2fb972b5.akpm@linux-foundation.org>
	<48B13F88.3080306@gmail.com>
In-Reply-To: <48B13F88.3080306@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Rodolfo Giometti <giometti@enneenne.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Woodhouse <dwmw2@infradead.org>,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Zev Weiss wrote:
> Andrew Morton wrote:
>  > On Sat, 23 Aug 2008 01:10:21 -0700 Zev Weiss <zevweiss@gmail.com> wrote:
>  >
>  >> Hmm.  Well, I may be misunderstanding what you're saying (again, I'm 
> very much
>  >> a newbie to kernelspace), but I *think* the "copying four u32's out to
>  >> userspace" thing isn't really a problem with my patch.  It does 
> certainly copy
>  >> those four u32's, but given that `ur' (struct mtd_region_info_user) is
>  >> initialized by copying from userspace, its fourth u32 (the 
> `regionindex'
>  >> member) should be identical when copied back out to userspace, given 
> that it's
>  >> not touched in the memberwise modification of the struct.
>  >
>  > OK, that's fortuitously bug-free in single-threaded userspace but
>  > fantastically-improbably-buggy if userspace is threaded.
>  >
>  > But it's something the kernel shouldn't be doing.
>  >
> 
> Ah, good point -- that hadn't occurred to me at all.  Though it looks 
> pretty
> clumsy/simpleminded to me, I guess something like this would avoid 
> copying and rewriting the fourth u32 ("Well, duh" may be the appropriate 
> response here):
> 
> diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
> index 13cc67a..424f318 100644
> --- a/drivers/mtd/mtdchar.c
> +++ b/drivers/mtd/mtdchar.c
> @@ -410,16 +410,20 @@ static int mtd_ioctl(struct inode *inode, struct 
> file *file,
> 
>         case MEMGETREGIONINFO:
>         {
> -               struct region_info_user ur;
> +               u32 ur_idx;
> +               struct mtd_erase_region_info *kr;
> +               struct region_info_user *ur = (struct region_info_user 
> *) argp;
> 
> -               if (copy_from_user(&ur, argp, sizeof(struct 
> region_info_user)))
> +               if (get_user(ur_idx,&(ur->regionindex)))
>                         return -EFAULT;
> 
> -               if (ur.regionindex >= mtd->numeraseregions)
> -                       return -EINVAL;
> -               if (copy_to_user(argp, 
> &(mtd->eraseregions[ur.regionindex]),
> -                               sizeof(struct mtd_erase_region_info)))
> +               kr = &(mtd->eraseregions[ur_idx]);
> +
> +               if (put_user(kr->offset, &(ur->offset))
> +                   || put_user(kr->erasesize, &(ur->erasesize))
> +                   || put_user(kr->numblocks, &(ur->numblocks)))
>                         return -EFAULT;
> +
>                 break;
>         }
> 
> 
> [Note: this is not even so much as compile-tested, and will remain that way
> until Monday, but I think you get the picture.]
> 

Well, for what little it's probably worth, I've now tested this patch, with no 
resulting surprises (seems to work fine for me).  Though I see now that, much to 
my chagrin, something in my email chain seems to have spacified my code.  If 
there's any need I can resend appropriately.

Zev
