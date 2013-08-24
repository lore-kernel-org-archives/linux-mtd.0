Received: from mail-pd0-x22c.google.com ([2607:f8b0:400e:c02::22c])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VD5sh-0004EH-CU
 for linux-mtd@lists.infradead.org; Sat, 24 Aug 2013 04:55:24 +0000
Received: by mail-pd0-f172.google.com with SMTP id z10so1426871pdj.31
 for <linux-mtd@lists.infradead.org>; Fri, 23 Aug 2013 21:55:02 -0700 (PDT)
Date: Fri, 23 Aug 2013 21:54:58 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Jingoo Han <jg1.han@samsung.com>
Subject: Re: [PATCH] mtd: mtdswap: replace strict_strtoul() with kstrtoul()
Message-ID: <20130824045458.GC19575@brian-ubuntu>
References: <000701ce844c$c63f4820$52bdd860$@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <000701ce844c$c63f4820$52bdd860$@samsung.com>
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 linux-mtd@lists.infradead.org, 'David Woodhouse' <dwmw2@infradead.org>,
 'Artem Bityutskiy' <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jul 19, 2013 at 03:54:11PM +0900, Jingoo Han wrote:
> The usage of strict_strtoul() is not preferred, because
> strict_strtoul() is obsolete. Thus, kstrtoul() should be
> used.
> 
> Signed-off-by: Jingoo Han <jg1.han@samsung.com>

Applied to l2-mtd.git. Thanks!

Brian
