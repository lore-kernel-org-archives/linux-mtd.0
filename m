Received: from mail-oa0-x233.google.com ([2607:f8b0:4003:c02::233])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VTEwb-0004C3-7v
 for linux-mtd@lists.infradead.org; Mon, 07 Oct 2013 17:50:09 +0000
Received: by mail-oa0-f51.google.com with SMTP id h16so6446563oag.24
 for <linux-mtd@lists.infradead.org>; Mon, 07 Oct 2013 10:49:47 -0700 (PDT)
Date: Mon, 7 Oct 2013 10:49:43 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Alexander Sverdlin <alexander.sverdlin@nsn.com>
Subject: Re: [PATCH] mtd: phram: Make phram 64-bit compatible
Message-ID: <20131007174943.GB23337@ld-irv-0074.broadcom.com>
References: <524C4CF5.7060601@nsn.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <524C4CF5.7060601@nsn.com>
Cc: Joern Engel <joern@lazybastard.org>, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>,
 Linux Kernel <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

+ LKML

On Wed, Oct 02, 2013 at 06:42:29PM +0200, Alexander Sverdlin wrote:
> mtd: phram: Make phram 64-bit compatible
> 
> phram was 32-bit limited by design. Machines are growing up, but phram
> module is still useful. Update it. The patch is bigger than minimum,
> because simple_strtoul() is obsolete.
> 
> Tested on MIPS64 and compile-tested for PPC (32 bit).
> 
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@nsn.com>

Pushed to l2-mtd.git. Thanks!

Can this driver use the library memparse() function instead of
open-coding it?

[To answer myself:] I noticed this in drivers/mtd/devices/phram.c, which
prevents us from using memparse():

  /* By dwmw2 editorial decree, "ki", "Mi" or "Gi" are to be used. */

Are we (MTD) holding a revolutionary position against the standard
kernel libraries, which recognize [KkMmGg] prefixes, but not [kMG]i
prefixes? Should we extend memparse() to accept either form? Or would
doing so simply pollute the library and not really satisfy anyone?

[After more research:] It looks like this topic may be the subject of
some long-past flame wars. If I am digging up past demons, then I'd
prefer to let sleeping Balrogs lie.

Brian
