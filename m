Received: from ti-out-0910.google.com ([209.85.142.191])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JhzMe-0000uy-Fj
	for linux-mtd@lists.infradead.org; Sat, 05 Apr 2008 03:46:48 +0000
Received: by ti-out-0910.google.com with SMTP id a20so226298tia.2
	for <linux-mtd@lists.infradead.org>;
	Fri, 04 Apr 2008 20:46:45 -0700 (PDT)
Message-ID: <8dd980de0804042046n361671e5x7a6966a70b467db5@mail.gmail.com>
Date: Sat, 5 Apr 2008 11:46:30 +0800
From: "Kevin Hao" <haokexin@gmail.com>
To: "Alexey Korolev" <akorolev@infradead.org>
Subject: Re: [PATCH] Fix of broken state in CFI driver caused by FL_SHUTDOWN
In-Reply-To: <Pine.LNX.4.64.0804041310550.10410@pentafluge.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <Pine.LNX.4.64.0804040949090.2042@pentafluge.infradead.org>
	<20080404093359.GA4338@logfs.org>
	<Pine.LNX.4.64.0804041310550.10410@pentafluge.infradead.org>
Cc: nico@cam.org, =?ISO-8859-1?Q?J=F6rn_Engel?= <joern@logfs.org>,
	dwmw2@infradead.org, akpm@linux-foundation.org,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Oh, my fault. Thanks for correction.

Thanks,
Kevin

On 4/4/08, Alexey Korolev <akorolev@infradead.org> wrote:
> Hi
>
>
>  CFI driver in 2.6.24 kernel is broken. Not so intensive read/write operations cause incomplete writes which lead to kernel panics in JFFS2.
>  We investigated the issue - it is caused by bug in FL_SHUTDOWN parsing code. Sometimes chip returns -EIO as if it is in FL_SHUTDOWN state when it should wait in FL_PONT (error in order of conditions).
>
> The following patch fixes the bug in state parsing code of CFI.
> Also I've added comments to notify developers if they want to add new case in future.
> Please include it.
>
> Signed-off-by: Alexey Korolev <akorolev@infradead.org>
> Reviewed-By: Joern Engel <joern@logfs.org>
>
> diff -aurpp a/drivers/mtd/chips/cfi_cmdset_0001.c b/drivers/mtd/chips/cfi_cmdset_0001.c
> --- a/drivers/mtd/chips/cfi_cmdset_0001.c       2008-02-11 08:51:11.000000000 +0300
> +++ b/drivers/mtd/chips/cfi_cmdset_0001.c       2008-04-04 15:50:47.000000000 +0400
> @@ -669,7 +669,7 @@ static int chip_ready (struct map_info *
>                        /* Someone else might have been playing with it. */
>                        return -EAGAIN;
>                }
> -
> +               /* Fall through */
>        case FL_READY:
>        case FL_CFI_QUERY:
>        case FL_JEDEC_QUERY:
> @@ -729,14 +729,14 @@ static int chip_ready (struct map_info *
>                chip->state = FL_READY;
>                return 0;
>
> +       case FL_SHUTDOWN:
> +               /* The machine is rebooting now,so no one can get chip anymore */
> +               return -EIO;
>        case FL_POINT:
>                /* Only if there's no operation suspended... */
>                if (mode == FL_READY && chip->oldstate == FL_READY)
>                        return 0;
> -
> -       case FL_SHUTDOWN:
> -               /* The machine is rebooting now,so no one can get chip anymore */
> -               return -EIO;
> +               /* Fall through */
>        default:
>        sleep:
>                set_current_state(TASK_UNINTERRUPTIBLE);
> -------------
> Thanks,
> Alexey
>
>
