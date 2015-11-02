Received: from mail-pa0-x22f.google.com ([2607:f8b0:400e:c03::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZtNER-000328-Rf
 for linux-mtd@lists.infradead.org; Mon, 02 Nov 2015 22:05:40 +0000
Received: by pasz6 with SMTP id z6so160414010pas.2
 for <linux-mtd@lists.infradead.org>; Mon, 02 Nov 2015 14:05:18 -0800 (PST)
Date: Mon, 2 Nov 2015 14:05:16 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-mtd@lists.infradead.org, cdoban@broadcom.com, rjui@broadcom.com,
 sbranden@broadcom.com
Subject: Re: [3/3] mtd: cfi_cmdset_{0001, 0002}: use common MTD reboot
 boilerplate
Message-ID: <20151102220516.GE7274@google.com>
References: <1417746968-28747-3-git-send-email-computersforpeace@gmail.com>
 <20151102200513.GA26475@roeck-us.net>
 <20151102215818.GD7274@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20151102215818.GD7274@google.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Nov 02, 2015 at 01:58:18PM -0800, Brian Norris wrote:
> Now, it looks like this is one of very few cases that we'd have to worry
> about... right now I've only found physmap_of.c that does the same
> mtdconcat stuff. So maybe if we fixed mtdconcat, we could solve this...

There's also physmap.c and drivers/mtd/maps/sc520cdp.c. But the problem
only lies when these drivers have to concatenate MTDs, so the original
mtd_info's never get registered on their own.

Brian
