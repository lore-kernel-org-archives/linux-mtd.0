Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cRQtM-0006uv-CE
 for linux-mtd@lists.infradead.org; Wed, 11 Jan 2017 21:57:14 +0000
Date: Wed, 11 Jan 2017 22:56:40 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-mtd@lists.infradead.org, Brian Norris
 <computersforpeace@gmail.com>, Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 David Woodhouse <dwmw2@infradead.org>, Denys Vlasenko
 <dvlasenk@redhat.com>, Marek Vasut <marek.vasut@gmail.com>, Richard
 Weinberger <richard@nod.at>, LKML <linux-kernel@vger.kernel.org>,
 kernel-janitors@vger.kernel.org
Subject: Re: [PATCH 00/18] MTD-CFI: Fine-tuning for several function
 implementations
Message-ID: <20170111225640.14e5d962@bbrezillon>
In-Reply-To: <71189baa-8780-b80a-0b4d-9dae74763ba3@users.sourceforge.net>
References: <71189baa-8780-b80a-0b4d-9dae74763ba3@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Markus,

On Wed, 11 Jan 2017 21:34:13 +0100
SF Markus Elfring <elfring@users.sourceforge.net> wrote:

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Wed, 11 Jan 2017 21:21:12 +0100
> 
> Several update suggestions were taken into account
> from static source code analysis.
> 
> Markus Elfring (18):
>   Use kmalloc_array() in cfi_intelext_partition_fixup()
>   Improve another size determination in cfi_intelext_partition_fixup()
>   cfi_cmdset_0001: Add some spaces for better code readability
>   cfi_cmdset_0001: Delete an unnecessary variable initialisation in do_write_oneword()
>   cfi_cmdset_0001: Use common error handling code in do_write_oneword()
>   Use kcalloc() in cfi_intelext_setup()
>   One function call and an unnecessary check less in cfi_intelext_setup()
>   Rename a jump label in cfi_intelext_setup()
>   Use kmalloc_array() in cfi_amdstd_setup()
>   One function call less in cfi_amdstd_setup() after error detection
>   Rename a jump label in cfi_amdstd_setup()
>   cfi_cmdset_0002: Add some spaces for better code readability
>   cfi_cmdset_0002: Delete an unnecessary variable initialisation in do_write_oneword()
>   cfi_cmdset_0002: Use common error handling code in do_write_oneword()
>   Use kcalloc() in cfi_ppb_unlock()
>   Use kmalloc_array() in cfi_staa_setup()
>   Use common error handling code in cfi_staa_setup()
>   cfi_cmdset_0020: Add some spaces for better code readability

You know what, I almost considered reviewing this series, but I had a
look at the commit titles (and the sort of things you're
'fixing/improving') and decided to google your name instead.

It seems that you've already sent quite a lot of so-called
'cleanup/improvement' patches, and most of the time you don't understand
what you're doing.
Maybe it's time for you to stop using static analysis tools and start
spending time on real stuff.

Note that I'm usually not against cleanup/coding-style patches, but it
really seems that you're only interested in getting as much patches as
you can in mainline, no matter what they do.

Sorry, that's a NACK on my side. Let's see of other MTD maintainers are
willing to take the time to review your patches. And BTW, when you
submit something, you could at least have a look at previous commits
touching the same files/directories and try to match the subsystem
prefix ("mtd: cfi_cmdset: ", "mtd: cfi: " or "mtd: chips: cfi: ").

Regards,

Boris

> 
>  drivers/mtd/chips/cfi_cmdset_0001.c | 165 +++++++++++++++++++-----------------
>  drivers/mtd/chips/cfi_cmdset_0002.c | 110 +++++++++++++-----------
>  drivers/mtd/chips/cfi_cmdset_0020.c | 127 ++++++++++++++-------------
>  3 files changed, 214 insertions(+), 188 deletions(-)
> 
