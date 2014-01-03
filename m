Received: from mail-ig0-x229.google.com ([2607:f8b0:4001:c05::229])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VzAA4-0005tD-El
 for linux-mtd@lists.infradead.org; Fri, 03 Jan 2014 19:12:00 +0000
Received: by mail-ig0-f169.google.com with SMTP id hk11so1869973igb.0
 for <linux-mtd@lists.infradead.org>; Fri, 03 Jan 2014 11:11:28 -0800 (PST)
Date: Fri, 3 Jan 2014 11:11:25 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Jingoo Han <jg1.han@samsung.com>
Subject: Re: [PATCH V4 1/2] mtd: ixp4xx: Use devm_*() functions
Message-ID: <20140103191125.GI5631@ld-irv-0074>
References: <000601cf0829$9d53a620$d7faf260$%han@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <000601cf0829$9d53a620$d7faf260$%han@samsung.com>
Cc: linux-mtd@lists.infradead.org, 'David Woodhouse' <dwmw2@infradead.org>,
 'Marc Kleine-Budde' <mkl@blackshift.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jan 03, 2014 at 11:15:04AM +0900, Jingoo Han wrote:
> Use devm_*() functions to make cleanup paths simpler.
> 
> Signed-off-by: Jingoo Han <jg1.han@samsung.com>
> ---
> Change since v3
> - Include err.h in order to prevent possible build errors.

Both compile-tested fine for me now. Pushed to l2-mtd.git. Thanks!

Brian
