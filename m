Received: from smtp1.linux-foundation.org ([140.211.169.13])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KvdyK-0005mL-EJ
	for linux-mtd@lists.infradead.org; Thu, 30 Oct 2008 20:18:27 +0000
Date: Thu, 30 Oct 2008 13:17:34 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Viktor Rosendahl <viktor.rosendahl@nokia.com>
Subject: Re: [PATCH 1/1] Make sure that any oops is flushed to the mtdoops
	console
Message-Id: <20081030131734.c74e614d.akpm@linux-foundation.org>
In-Reply-To: <1224688588-2665-2-git-send-email-viktor.rosendahl@nokia.com>
References: <1224688588-2665-1-git-send-email-viktor.rosendahl@nokia.com>
	<1224688588-2665-2-git-send-email-viktor.rosendahl@nokia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 22 Oct 2008 18:16:28 +0300
Viktor Rosendahl <viktor.rosendahl@nokia.com> wrote:

> This used to work unpatched with older kernels, during the development phase
> of mtdoops. Before commit e3e8a75d2acfc61ebf25524666a0a2c6abb0620c a space was
> printed with console_loglevel set to 15, which probably flushed the oops
> message as a side effect.
> 
> This is another patch from the Nokia N810 kernel.
> 
> Signed-off-by: Viktor Rosendahl <viktor.rosendahl@nokia.com>
> ---
>  lib/bust_spinlocks.c |    2 ++
>  1 files changed, 2 insertions(+), 0 deletions(-)
> 
> diff --git a/lib/bust_spinlocks.c b/lib/bust_spinlocks.c
> index 486da62..9681d54 100644
> --- a/lib/bust_spinlocks.c
> +++ b/lib/bust_spinlocks.c
> @@ -12,6 +12,7 @@
>  #include <linux/tty.h>
>  #include <linux/wait.h>
>  #include <linux/vt_kern.h>
> +#include <linux/console.h>
>  
>  
>  void __attribute__((weak)) bust_spinlocks(int yes)
> @@ -22,6 +23,7 @@ void __attribute__((weak)) bust_spinlocks(int yes)
>  #ifdef CONFIG_VT
>  		unblank_screen();
>  #endif
> +		console_unblank();
>  		if (--oops_in_progress == 0)
>  			wake_up_klogd();
>  	}

That looks logical.  From my reading we can now remove that
unblank_screen(), because the console_unblank() will call
vt_console_driver.unblank() for us?

--- a/lib/bust_spinlocks.c~oops-handling-ensure-that-any-oops-is-flushed-to-the-mtdoops-console-fix
+++ a/lib/bust_spinlocks.c
@@ -11,7 +11,6 @@
 #include <linux/spinlock.h>
 #include <linux/tty.h>
 #include <linux/wait.h>
-#include <linux/vt_kern.h>
 #include <linux/console.h>
 
 
@@ -20,9 +19,6 @@ void __attribute__((weak)) bust_spinlock
 	if (yes) {
 		++oops_in_progress;
 	} else {
-#ifdef CONFIG_VT
-		unblank_screen();
-#endif
 		console_unblank();
 		if (--oops_in_progress == 0)
 			wake_up_klogd();
_
