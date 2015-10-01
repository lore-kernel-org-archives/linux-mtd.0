Received: from mail-pa0-x22e.google.com ([2607:f8b0:400e:c03::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZhhM0-0007Kp-UU
 for linux-mtd@lists.infradead.org; Thu, 01 Oct 2015 17:09:13 +0000
Received: by pablk4 with SMTP id lk4so79341207pab.3
 for <linux-mtd@lists.infradead.org>; Thu, 01 Oct 2015 10:08:52 -0700 (PDT)
Date: Thu, 1 Oct 2015 10:08:49 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Kirill Smirnov <kirill.k.smirnov@gmail.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd-utils: serve_image: use proper POSIX_C_SOURCE value
Message-ID: <20151001170849.GA12631@google.com>
References: <560C8A27.6060202@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <560C8A27.6060202@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Oct 01, 2015 at 04:19:35AM +0300, Kirill Smirnov wrote:
> struct addrinfo and friends conform to POSIX.1-2001, not earlier.
> This patch fixes linking against latest glibc 2.22
> 
> Now email formatting and the generated patch should be OK.

Normally we don't include lines like this ^^ in the commit message.

> Signed-off-by: Kirill Smirnov <kirill.k.smirnov@gmail.com>
> ---

But you can include comments like that (that don't belong in the commit
message) here, below the '---'.

Also, the extra attachment is not too much of a problem, but try to
avoid it in the future.

Anyway, patch looks reasonable to me. Applied to mtd-utils.git. Thanks!

Brian

> serve_image.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/serve_image.c b/serve_image.c
> index d3794ec..cbcf3b7 100644
> --- a/serve_image.c
> +++ b/serve_image.c
> @@ -1,5 +1,5 @@
> #define PROGRAM_NAME "serve_image"
> -#define _POSIX_C_SOURCE 199309
> +#define _POSIX_C_SOURCE 200112L
> 
> #include <time.h>
> #include <errno.h>
> -- 
> 2.5.1
