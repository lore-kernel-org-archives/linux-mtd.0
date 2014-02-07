Received: from va3ehsobe005.messaging.microsoft.com ([216.32.180.31]
 helo=va3outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WBeyu-00055p-Ek
 for linux-mtd@lists.infradead.org; Fri, 07 Feb 2014 06:32:09 +0000
Date: Fri, 7 Feb 2014 13:51:14 +0800
From: Huang Shijie <b32955@freescale.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 4/5 fix] mtd: nand: parse out the JEDEC compliant nand
Message-ID: <20140207055112.GA15754@shlinux2.ap.freescale.net>
References: <1388121286-32620-5-git-send-email-b32955@freescale.com>
 <1388137870-11421-1-git-send-email-b32955@freescale.com>
 <20140131182317.GB10094@norris-Latitude-E6410>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20140131182317.GB10094@norris-Latitude-E6410>
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jan 31, 2014 at 10:23:17AM -0800, Brian Norris wrote:
 
> > +	chip->cmdfunc(mtd, NAND_CMD_PARAM, 0x40, -1);
> > +	for (i = 0; i < 3; i++) {
> > +		chip->read_buf(mtd, (uint8_t *)p, sizeof(*p));
> 
> Rather than using read_buf(), can you run read_byte() in a loop? That
> will solve our problems with x16 bus devices, I think.
thanks.

I will use the read_byte() in the next version.

thanks
Huang Shijie
