Received: from mail-pd0-f175.google.com ([209.85.192.175])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VzQg7-0000kh-I4
 for linux-mtd@lists.infradead.org; Sat, 04 Jan 2014 12:50:12 +0000
Received: by mail-pd0-f175.google.com with SMTP id w10so16353907pde.20
 for <linux-mtd@lists.infradead.org>; Sat, 04 Jan 2014 04:49:45 -0800 (PST)
Date: Sat, 4 Jan 2014 20:49:37 +0800
From: Huang Shijie <shijie8@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v3 4/5] mtd: nand: support Micron READ RETRY
Message-ID: <20140104124936.GA4996@gmail.com>
References: <1388795828-24808-1-git-send-email-computersforpeace@gmail.com>
 <1388795828-24808-4-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1388795828-24808-4-git-send-email-computersforpeace@gmail.com>
Cc: Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org,
 Pekon Gupta <pekon@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jan 03, 2014 at 04:37:07PM -0800, Brian Norris wrote:
> 
> Note that I intentionally *haven't* accomodated a DMA-able buffer for the ONFI
> set-features command, so GPMI NAND may have problems with this.

I have fixed it in another patch set:
http://lists.infradead.org/pipermail/linux-mtd/2013-December/051085.html

http://lists.infradead.org/pipermail/linux-mtd/2013-December/051086.html

thanks
Huang Shijie
