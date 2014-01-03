Received: from mail-ig0-x22e.google.com ([2607:f8b0:4001:c05::22e])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VzAVV-0006Nt-V9
 for linux-mtd@lists.infradead.org; Fri, 03 Jan 2014 19:34:10 +0000
Received: by mail-ig0-f174.google.com with SMTP id hk11so1865327igb.1
 for <linux-mtd@lists.infradead.org>; Fri, 03 Jan 2014 11:33:49 -0800 (PST)
Date: Fri, 3 Jan 2014 11:33:45 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Jingoo Han <jg1.han@samsung.com>
Subject: Re: [PATCH v2] mtd: plat_nand: Remove unnecessary OOM messages
Message-ID: <20140103193345.GJ5631@ld-irv-0074>
References: <000801cf0829$f3a48300$daed8900$%han@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <000801cf0829$f3a48300$daed8900$%han@samsung.com>
Cc: linux-mtd@lists.infradead.org, 'David Woodhouse' <dwmw2@infradead.org>,
 'Vitaly Wool' <vitalywool@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jan 03, 2014 at 11:17:29AM +0900, Jingoo Han wrote:
> The site-specific OOM messages are unnecessary, because they
> duplicate the MM subsystem generic OOM message.
> 
> Signed-off-by: Jingoo Han <jg1.han@samsung.com>
> ---
> Change since v1
> - Re-based on the newer version of the patch "mtd: plat_nand:
>   Use devm_*() functions".

Pushed to l2-mtd.git. Thanks!

Brian
