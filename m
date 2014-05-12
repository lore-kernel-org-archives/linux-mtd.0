Received: from mail-pa0-x22a.google.com ([2607:f8b0:400e:c03::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WjvWL-0006bR-Rp
 for linux-mtd@lists.infradead.org; Mon, 12 May 2014 19:04:18 +0000
Received: by mail-pa0-f42.google.com with SMTP id rd3so9289864pab.29
 for <linux-mtd@lists.infradead.org>; Mon, 12 May 2014 12:03:56 -0700 (PDT)
Date: Mon, 12 May 2014 12:03:53 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Jean Delvare <jdelvare@suse.de>
Subject: Re: [PATCH] mtd: Fix Elan SC520 dependencies
Message-ID: <20140512190353.GL28907@ld-irv-0074>
References: <20140314181420.009c1b55@endymion.delvare>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20140314181420.009c1b55@endymion.delvare>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Mar 14, 2014 at 06:14:20PM +0100, Jean Delvare wrote:
> Anyone working with an AMD Elan SC520 development or evaluation board
> would be building a dedicated kernel for it, so we can make the
> sc520cdp and netsc520 maps depend on MELAN. SC520_CPUFREQ already
> depends on MELAN so it makes things more consistent. It also makes
> kernel configuration for every other x86 user easier.
> 
> Signed-off-by: Jean Delvare <jdelvare@suse.de>
> Cc: David Woodhouse <dwmw2@infradead.org>
> Cc: Brian Norris <computersforpeace@gmail.com>
> ---
> I _think_ the code should build everywhere so COMPILE_TEST is OK. If
> not, please let me know and we'll discuss it.

I ran it through a few builds here and everything works OK.

Pushed to l2-mtd.git. Thanks!

Brian
