Received: from mail-qc0-f175.google.com ([209.85.216.175])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1U0iIo-0006og-2U
 for linux-mtd@lists.infradead.org; Thu, 31 Jan 2013 00:46:54 +0000
Received: by mail-qc0-f175.google.com with SMTP id j3so1025077qcs.20
 for <linux-mtd@lists.infradead.org>; Wed, 30 Jan 2013 16:46:52 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CACKLOr3XoQfTuy4XpORz4QwqPhfEa8mQNzdKdrbJ2UCA-X+MhQ@mail.gmail.com>
References: <CACKLOr3XoQfTuy4XpORz4QwqPhfEa8mQNzdKdrbJ2UCA-X+MhQ@mail.gmail.com>
Date: Wed, 30 Jan 2013 19:46:52 -0500
Message-ID: <CAF_O4JsF365WKFJ7UstS2D_gk69WMQ5ZrXKfQzTMN-zpp8Rqrg@mail.gmail.com>
Subject: Re: cmdline partition parsing behavior has changed: regression?
From: Christopher Cordahi <christophercordahi@nanometrics.ca>
To: javier Martin <javier.martin@vista-silicon.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Javier,

On Wed, Jan 30, 2013 at 6:23 AM, javier Martin
<javier.martin@vista-silicon.com> wrote:
> I've been using the following cmdline string to boot my kernel for
> several releases until 3.6:
>
> "console=ttymxc0,115200 mem=54MB init=/sbin/preinit
> root=/dev/mtdblock2
> mtdparts=physmap-flash.0:384k(U-Boot),2560k(kernel0),27904k(rootfs0),2048k(config0),2560k(kernel1),27904k(rootfs1),2048k(config1),32k(env1),32k(env2);"

The semicolon is meant to be a separator, not a terminator.  See
comment at top of file that predates 2.6.12
The format for the command line is as follows:
mtdparts=<mtddef>[;<mtddef]

> Partition parsing always has worked properly and the "physmap-flash.0"
> NOR flash was properly detected and partitioned.

I suspect you were always getting a warning on boot prior to the first
mtd partition listing
mtd: no mtd-id

> However, in 3.8-rc3 I've found that this string does not work any
> longer.

This technically invalid mtdparts string is now treated as an error
with revised error handling
http://git.kernel.org/?p=linux/kernel/git/torvalds/linux-2.6.git;a=commitdiff;h=9e0606fc4ea27fb275f6987751224c60ee055ef1

> In fact I had to add the following dirty hack to make it work:
>
> diff --git a/drivers/mtd/cmdlinepart.c b/drivers/mtd/cmdlinepart.c
> index c533f27..4ef0e7a 100644
> --- a/drivers/mtd/cmdlinepart.c
> +++ b/drivers/mtd/cmdlinepart.c
> @@ -271,6 +271,10 @@ static int mtdpart_setup_real(char *s)
>                      this_mtd->mtd_id, this_mtd->num_parts));
>
>
> +               /* FIXME: dirty hack */
> +               if (*s == ';')
> +                       return 0;
> +
>                 /* EOS - we're done */
>                 if (*s == 0)
>                         break;

I believe this "dirty hack" will break any implementations (including
mine) with more than one MTD part definition where the semicolon is
required as a separator.  A less intrusive and forgiving "hack" is to
add an identical "EOS - we're done" test and break immediately before
the error is returned where "mtd: no mtd-id" is output.

--
Chris
