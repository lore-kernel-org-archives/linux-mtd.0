Received: from mail-pa0-x230.google.com ([2607:f8b0:400e:c03::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WjzSP-0006rQ-L5
 for linux-mtd@lists.infradead.org; Mon, 12 May 2014 23:16:30 +0000
Received: by mail-pa0-f48.google.com with SMTP id rd3so9426022pab.7
 for <linux-mtd@lists.infradead.org>; Mon, 12 May 2014 16:16:08 -0700 (PDT)
Date: Mon, 12 May 2014 16:16:04 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] mtd: Fix warning in access_ok() parameter passing
Message-ID: <20140512231604.GT28907@ld-irv-0074>
References: <1398969654-5672-1-git-send-email-geert@linux-m68k.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1398969654-5672-1-git-send-email-geert@linux-m68k.org>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, May 01, 2014 at 08:40:54PM +0200, Geert Uytterhoeven wrote:
> On m68k, where access_ok() doesn't cast the address parameter:
> 
> drivers/mtd/mtdchar.c: In function 'mtdchar_write_ioctl':
> drivers/mtd/mtdchar.c:575:4: warning: passing argument 2 of 'access_ok' makes pointer from integer without a cast [enabled by default]
> arch/m68k/include/asm/uaccess_mm.h:17:90: note: expected 'const void *' but argument is of type '__u64'
> drivers/mtd/mtdchar.c:576:4: warning: passing argument 2 of 'access_ok' makes pointer from integer without a cast [enabled by default]
> arch/m68k/include/asm/uaccess_mm.h:17:90: note: expected 'const void *' but argument is of type '__u64'
> 
> The address parameter of access_ok() is really a userspace pointer.
> On most architectures, access_ok() is a macro that casts the address
> parameter, hiding issues in its users.
> 
> Move around and use the existing usr_data and usr_oob temporary variables
> to kill the warnings. Add a few "consts", and make more use of the
> temporaries while we're at it.
> 
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>

Pushed to l2-mtd.git. Thanks!

Brian
