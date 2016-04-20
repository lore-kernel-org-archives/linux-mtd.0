Received: from mail-wm0-x236.google.com ([2a00:1450:400c:c09::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1asqM3-00033r-2q
 for linux-mtd@lists.infradead.org; Wed, 20 Apr 2016 11:31:35 +0000
Received: by mail-wm0-x236.google.com with SMTP id u206so76223485wme.1
 for <linux-mtd@lists.infradead.org>; Wed, 20 Apr 2016 04:31:14 -0700 (PDT)
Subject: Re: [PATCH] makedev(3): point people at sys/sysmacros.h
To: Mike Frysinger <vapier@gentoo.org>
References: <20160418164908.GR5369@vapier.lan>
 <1461045163-21248-1-git-send-email-vapier@gentoo.org>
Cc: mtk.manpages@gmail.com, linux-mtd@lists.infradead.org,
 libc-alpha@sourceware.org, linux-man@vger.kernel.org
From: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Message-ID: <5717687D.2060300@gmail.com>
Date: Wed, 20 Apr 2016 12:31:09 +0100
MIME-Version: 1.0
In-Reply-To: <1461045163-21248-1-git-send-email-vapier@gentoo.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Hi Mike,

I don't object to the patch, but...

On 04/19/2016 06:52 AM, Mike Frysinger wrote:
> Defining these functions via sys/types.h violates POSIX namespace
> requirements, 

What do the previous lines mean? Violate namespace requirements how?

Cheers,

Michael


> so we want to disentangle it from that header.  Since
> glibc has basically always used this header, update the docs to have
> people include that instead.
>
> Signed-off-by: Mike Frysinger <vapier@gentoo.org>
> ---
>  man3/makedev.3 | 16 ++++------------
>  1 file changed, 4 insertions(+), 12 deletions(-)
> 
> diff --git a/man3/makedev.3 b/man3/makedev.3
> index f91f4b5..3d26d15 100644
> --- a/man3/makedev.3
> +++ b/man3/makedev.3
> @@ -28,23 +28,13 @@
>  makedev, major, minor \- manage a device number
>  .SH SYNOPSIS
>  .nf
> -.B #include <sys/types.h>
> +.B #include <sys/sysmacros.h>
>  
>  .BI "dev_t makedev(unsigned int " maj ", unsigned int " min );
>  
>  .BI "unsigned int major(dev_t " dev );
>  .BI "unsigned int minor(dev_t " dev );
>  .fi
> -.sp
> -.BR makedev (),
> -.BR major (),
> -.BR minor ():
> -.nf
> -    Since glibc 2.19:
> -        _DEFAULT_SOURCE
> -    In glibc up to and including 2.19:
> -        _BSD_SOURCE
> -.fi
>  .SH DESCRIPTION
>  A device ID consists of two parts:
>  a major ID, identifying the class of the device,
> @@ -90,7 +80,9 @@ and
>  .BR minor ()
>  functions are not specified in POSIX.1,
>  but are present on many other systems.
> -.\" The BSDs, HP-UX, Solaris, AIX, Irix
> +.\" The BSDs, HP-UX, Solaris, AIX, Irix.
> +.\" The header location is inconsistent:
> +.\" Could be sys/mkdev.h, sys/sysmacros.h, or sys/types.h.
>  .SH NOTES
>  These interfaces are defined as macros.
>  Since glibc 2.3.3,
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
