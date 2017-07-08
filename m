Received: from mail-pf0-x243.google.com ([2607:f8b0:400e:c00::243])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dTeXy-00046V-Ru
 for linux-mtd@lists.infradead.org; Sat, 08 Jul 2017 01:28:36 +0000
Received: by mail-pf0-x243.google.com with SMTP id q85so6533939pfq.2
 for <linux-mtd@lists.infradead.org>; Fri, 07 Jul 2017 18:28:14 -0700 (PDT)
Date: Fri, 7 Jul 2017 18:28:11 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Cyril Bur <cyrilbur@gmail.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-mtd@lists.infradead.org,
 stewart@linux.vnet.ibm.com, dwmw2@infradead.org
Subject: Re: [PATCH 5/5] mtd: powernv_flash: Use
 opal_async_wait_response_interruptible()
Message-ID: <20170708012811.GF55942@google.com>
References: <20170629065413.19845-1-cyrilbur@gmail.com>
 <20170629065413.19845-6-cyrilbur@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170629065413.19845-6-cyrilbur@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Jun 29, 2017 at 04:54:13PM +1000, Cyril Bur wrote:
> The OPAL calls performed in this driver shouldn't be using
> opal_async_wait_response() as this performs a wait_event() which, on
> long running OPAL calls could result in hung task warnings. wait_event()
> also prevents timely signal delivery which is also undesirable.
> 
> This patch also attempts to quieten down the use of dev_err() when
> errors haven't actually occurred and also to return better information up
> the stack rather than always -EIO.
> 
> Signed-off-by: Cyril Bur <cyrilbur@gmail.com>
> ---
>  drivers/mtd/devices/powernv_flash.c | 18 +++++++++++-------
>  1 file changed, 11 insertions(+), 7 deletions(-)

Seems OK:

Acked-by: Brian Norris <computersforpeace@gmail.com>
