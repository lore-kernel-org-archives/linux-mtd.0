Received: from mail-ig0-x22a.google.com ([2607:f8b0:4001:c05::22a])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WDIPl-0006ph-6E
 for linux-mtd@lists.infradead.org; Tue, 11 Feb 2014 18:50:37 +0000
Received: by mail-ig0-f170.google.com with SMTP id m12so9272iga.1
 for <linux-mtd@lists.infradead.org>; Tue, 11 Feb 2014 10:50:16 -0800 (PST)
Date: Tue, 11 Feb 2014 10:50:13 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Jingoo Han <jg1.han@samsung.com>
Subject: Re: [PATCH 0/8] mtd: Remove unnecessary OOM messages
Message-ID: <20140211185013.GH18440@ld-irv-0074>
References: <000201cf2301$b168d250$143a76f0$%han@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <000201cf2301$b168d250$143a76f0$%han@samsung.com>
Cc: linux-mtd@lists.infradead.org, 'David Woodhouse' <dwmw2@infradead.org>,
 Linux Kernel <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Feb 06, 2014 at 03:07:19PM +0900, Jingoo Han wrote:
> The site-specific OOM messages are unnecessary, because they
> duplicate the MM subsystem generic OOM message. For example,
> k.alloc and v.alloc failures use dump_stack().
> 
> Jingoo Han (8):
>       mtd: devices: elm: Remove unnecessary OOM messages
>       mtd: spear_smi: Remove unnecessary OOM messages
>       mtd: pmc551: Remove unnecessary OOM messages
>       mtd: plat-ram: Remove unnecessary OOM messages
>       mtd: lpddr: Remove unnecessary OOM messages
>       mtd: onenand: Remove unnecessary OOM messages
>       mtd: cfi: Remove unnecessary OOM messages
>       mtd: gen_probe: Remove unnecessary OOM messages

Pushed all 8 to l2-mtd.git. Thanks.

Have you ever considered using a tool like coccinelle to do this sort of
work? You send so many of these boilerplate patch series, I would think
it would help everyone to just get them out of the way with scripted
assistance. And you could then more easily catch new introductions if
they slip through the review process.

Brian
