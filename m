Received: from mail-pa0-x235.google.com ([2607:f8b0:400e:c03::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1auwLF-0003Sj-I6
 for linux-mtd@lists.infradead.org; Tue, 26 Apr 2016 06:19:26 +0000
Received: by mail-pa0-x235.google.com with SMTP id bt5so2587119pac.3
 for <linux-mtd@lists.infradead.org>; Mon, 25 Apr 2016 23:19:05 -0700 (PDT)
Date: Tue, 26 Apr 2016 00:18:52 -0600
From: Brian Norris <computersforpeace@gmail.com>
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: linux-kernel@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>,
 Greg Ungerer <gerg@snapgear.com>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] drivers/mtd: make maps/uclinux.c driver more explicitly
 non-modular
Message-ID: <20160426061852.GC25981@localhost>
References: <1459095234-20386-1-git-send-email-paul.gortmaker@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1459095234-20386-1-git-send-email-paul.gortmaker@windriver.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Mar 27, 2016 at 12:13:54PM -0400, Paul Gortmaker wrote:
> The Kconfig for this support is currently declared with:
> 
> config MTD_UCLINUX
>         bool "Generic uClinux RAM/ROM filesystem support"
> 
> ...meaning that it currently is not being built as a module by anyone.
> Lets remove as much of the modular evidence that we can, so that when
> reading the driver there is less doubt it is builtin-only.
> 
> Since module_init translates to device_initcall in the non-modular
> case, the init ordering remains unchanged with this commit.
> 
> We also replace module.h with moduleparam.h since the file does use
> a module_param,  and leaving it as such is currently the easiest way
> to remain compatible with existing boot arg use cases.
> 
> We also delete the MODULE_LICENSE tag etc. since all that information
> was (or is now) contained at the top of the file in the comments.
> 
> Cc: David Woodhouse <dwmw2@infradead.org>
> Cc: Brian Norris <computersforpeace@gmail.com>
> Cc: Greg Ungerer <gerg@snapgear.com>
> Cc: linux-mtd@lists.infradead.org
> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>

Applied to l2-mtd.git
