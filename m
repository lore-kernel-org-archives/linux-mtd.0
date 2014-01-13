Received: from ch1ehsobe003.messaging.microsoft.com ([216.32.181.183]
 helo=ch1outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W2cco-0007VS-Im
 for linux-mtd@lists.infradead.org; Mon, 13 Jan 2014 08:11:58 +0000
Date: Mon, 13 Jan 2014 15:36:32 +0800
From: Huang Shijie <b32955@freescale.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v3 3/5] mtd: nand: add generic READ RETRY support
Message-ID: <20140113073630.GC26113@shlinux2.ap.freescale.net>
References: <1388795828-24808-1-git-send-email-computersforpeace@gmail.com>
 <1388795828-24808-3-git-send-email-computersforpeace@gmail.com>
 <20140107061733.GD8109@shlinux2.ap.freescale.net>
 <20140113080400.GK1992@norris-Latitude-E6410>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20140113080400.GK1992@norris-Latitude-E6410>
Cc: linux-mtd@lists.infradead.org, Pekon Gupta <pekon@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Jan 13, 2014 at 12:04:00AM -0800, Brian Norris wrote:
> 
> It's not actually performing any "read" or a "retry"; the function is
> just configuring the device for a retry. So I don't think read_retry is
> correct. For my name, I was abbreviating "set read retry mode". How do
> you like "setup_read_retry" or "set_read_retry_mode"?
I prefer to the setup_read_retry :)

thanks
Huang Shijie
