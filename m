Received: from mail-qa0-x22d.google.com ([2607:f8b0:400d:c00::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X2V2M-00006a-1c
 for linux-mtd@lists.infradead.org; Thu, 03 Jul 2014 00:38:06 +0000
Received: by mail-qa0-f45.google.com with SMTP id v10so9506196qac.18
 for <linux-mtd@lists.infradead.org>; Wed, 02 Jul 2014 17:37:44 -0700 (PDT)
Date: Wed, 2 Jul 2014 17:37:40 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Kevin Hao <haokexin@gmail.com>
Subject: Re: [PATCH 0/2] mtd/ftl: fix the double free of buffers
Message-ID: <20140703003740.GS3599@ld-irv-0074>
References: <1402905157-10330-1-git-send-email-haokexin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1402905157-10330-1-git-send-email-haokexin@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Kevin,

On Mon, Jun 16, 2014 at 03:52:35PM +0800, Kevin Hao wrote:
> I got the following panic on my fsl p5020ds board.
> 
>   Unable to handle kernel paging request for data at address 0x7375627379737465
>   Faulting instruction address: 0xc000000000100778
>   Oops: Kernel access of bad area, sig: 11 [#1]
[snip]
>   ---[ end trace b4c9a94804a42d40 ]---
> 
> It seems that the corrupted partition header on my mtd device triggers a bug
> in the ftl. Create a patch to fix this.

Considering the nature of the panic, this sounds like a -stable fix. Can
you elaborate on how you confirmed this is the bug? You didn't paste
sufficient logging/details to show which code paths you are exercising
in ftl.c. One hand, it sounds like scan_header() might have returned
non-zero (which skips build_maps()), and on the other hand, you say the
double-free occurs because both build_maps() and ftl_freepart() are
freeing the same buffers.

I'd just like to fill in my understanding a little better, if I'm going
to send this as a -stable fix. Plus, we might want to add some details
to the patch 2 commit message, instead of just in this cover letter.

Thanks,
Brian
