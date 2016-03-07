Received: from mail-pf0-x22c.google.com ([2607:f8b0:400e:c00::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ad2UX-0004m5-T3
 for linux-mtd@lists.infradead.org; Mon, 07 Mar 2016 21:15:02 +0000
Received: by mail-pf0-x22c.google.com with SMTP id 129so42082637pfw.1
 for <linux-mtd@lists.infradead.org>; Mon, 07 Mar 2016 13:14:41 -0800 (PST)
Date: Mon, 7 Mar 2016 13:14:38 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: Simon Arlott <simon@fire.lp0.eu>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: bcm63xxpart: give width specifier an 'int', not
 'size_t'
Message-ID: <20160307211438.GA55664@google.com>
References: <1455308764-47289-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1455308764-47289-1-git-send-email-computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Feb 12, 2016 at 12:26:04PM -0800, Brian Norris wrote:
> Fixes this warning:
> 
> >> drivers/mtd/bcm63xxpart.c:175:4: note: in expansion of macro 'pr_err'
>        pr_err("invalid rootfs address: %*ph\n",
>        ^
> >> include/linux/kern_levels.h:4:18: warning: field width specifier '*' expects argument of type 'int', but argument 2 has type 'long unsigned int' [-Wformat=]
> 
> Reported-by: kbuild test robot <fengguang.wu@intel.com>
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>

Applied
