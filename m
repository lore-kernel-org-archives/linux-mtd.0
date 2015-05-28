Received: from mail-pd0-x22b.google.com ([2607:f8b0:400e:c02::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Yy7Oj-0000An-IW
 for linux-mtd@lists.infradead.org; Thu, 28 May 2015 23:39:39 +0000
Received: by pdfh10 with SMTP id h10so52338639pdf.3
 for <linux-mtd@lists.infradead.org>; Thu, 28 May 2015 16:39:16 -0700 (PDT)
Date: Thu, 28 May 2015 16:39:13 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: =?iso-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Subject: Re: [PATCH 3/3] lib/libfec.c: fix build against musl
Message-ID: <20150528233913.GD17945@ld-irv-0074>
References: <1429827173-1739-1-git-send-email-joerg.krause@embedded.rocks>
 <1429827173-1739-3-git-send-email-joerg.krause@embedded.rocks>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1429827173-1739-3-git-send-email-joerg.krause@embedded.rocks>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Apr 24, 2015 at 12:12:53AM +0200, Jörg Krause wrote:
> Add missing #include <sys/types.h> for u_long.

I pushed a different patch from another contributor that kills off the
u_long usage, so I think this should no longer be necessary. Let me know
if you still see issues.

Thanks,
Brian

> Signed-off-by: Jörg Krause <joerg.krause@embedded.rocks>
> ---
>  lib/libfec.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/lib/libfec.c b/lib/libfec.c
> index ff5a127..c5e7749 100644
> --- a/lib/libfec.c
> +++ b/lib/libfec.c
> @@ -45,6 +45,7 @@
>  #include <stdio.h>
>  #include <stdlib.h>
>  #include <string.h>
> +#include <sys/types.h>
>  
>  /*
>   * stuff used for testing purposes only
