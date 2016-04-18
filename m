Received: from mail-pa0-x234.google.com ([2607:f8b0:400e:c03::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1asCDF-0008Aj-I6
 for linux-mtd@lists.infradead.org; Mon, 18 Apr 2016 16:39:50 +0000
Received: by mail-pa0-x234.google.com with SMTP id r5so24245096pag.1
 for <linux-mtd@lists.infradead.org>; Mon, 18 Apr 2016 09:39:29 -0700 (PDT)
Date: Mon, 18 Apr 2016 09:39:26 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Mike Frysinger <vapier@gentoo.org>
Cc: linux-mtd@lists.infradead.org, Michael Kerrisk <mtk.manpages@gmail.com>,
 linux-man@vger.kernel.org, libc-alpha@sourceware.org
Subject: Re: [PATCH mtd-utils] include sys/sysmacros.h for major/minor/makedev
Message-ID: <20160418163926.GB52272@google.com>
References: <1460860245-14895-1-git-send-email-vapier@gentoo.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1460860245-14895-1-git-send-email-vapier@gentoo.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

+ man-page and glibc folks

On Sat, Apr 16, 2016 at 10:30:45PM -0400, Mike Frysinger wrote:
> These functions have always been defined in sys/sysmacros.h under
> Linux C libraries.  For some, including sys/types.h implicitly
> includes that as well, but glibc wants to deprecate that, and some
> others already have.  Include the header explicitly for the funcs.
> 
> Signed-off-by: Mike Frysinger <vapier@gentoo.org>

Patch looks fine to me, thanks. Pushed to mtd-utils.git.

But I don't see this change documented anywhere. (Helpfully, I do see
the change from your other patch -- _BSD_SOURCE -> _DEFAULT_SOURCE --
documented though!) Should the man-pages project be updated? I see the
latest makedev(5) still recommends #include <sys/types.h>.

Brian

> ---
>  include/common.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/include/common.h b/include/common.h
> index fb0ca83..8cb3142 100644
> --- a/include/common.h
> +++ b/include/common.h
> @@ -28,6 +28,7 @@
>  #include <errno.h>
>  #include <features.h>
>  #include <inttypes.h>
> +#include <sys/sysmacros.h>
>  #include "version.h"
>  
>  #ifndef PROGRAM_NAME
> -- 
> 2.7.4
> 
