Received: from mail-pa0-x22e.google.com ([2607:f8b0:400e:c03::22e])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V6zMZ-00006R-N3
 for linux-mtd@lists.infradead.org; Wed, 07 Aug 2013 08:45:00 +0000
Received: by mail-pa0-f46.google.com with SMTP id fa1so1913942pad.33
 for <linux-mtd@lists.infradead.org>; Wed, 07 Aug 2013 01:44:38 -0700 (PDT)
Date: Wed, 7 Aug 2013 01:44:34 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Jingoo Han <jg1.han@samsung.com>
Subject: Re: [PATCH 29/35] mtd: devices: use dev_get_platdata()
Message-ID: <20130807084434.GB6438@norris.computersforpeace.net>
References: <005801ce8cfd$44518210$ccf48630$@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <005801ce8cfd$44518210$ccf48630$@samsung.com>
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

On Tue, Jul 30, 2013 at 05:17:44PM +0900, Jingoo Han wrote:
> Use the wrapper function for retrieving the platform data instead of
> accessing dev->platform_data directly.
> 
> Signed-off-by: Jingoo Han <jg1.han@samsung.com>

Applied this and the next three to l2-mtd.git, with a slight amendment
for some atmel_nand.c changes. Thanks!

Brian
