Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UAzpD-0004W8-Nq
 for linux-mtd@lists.infradead.org; Thu, 28 Feb 2013 09:30:52 +0000
Date: Thu, 28 Feb 2013 10:30:47 +0100
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH] mtd/nand: don't use {read,write}_buf for 8-bit transfers
Message-ID: <20130228093047.GE22886@pengutronix.de>
References: <1361977852-18233-1-git-send-email-u.kleine-koenig@pengutronix.de>
 <512EC54F.3090400@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <512EC54F.3090400@freescale.com>
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 linux-mtd@lists.infradead.org, David Woodhouse <David.Woodhouse@intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

On Thu, Feb 28, 2013 at 10:47:43AM +0800, Huang Shijie wrote:
> 于 2013年02月27日 23:10, Uwe Kleine-König 写道:
> >According to the Open NAND Flash Interface Specification (ONFI) Revision
> >3.1 "Parameters are always transferred on the lower 8-bits of the data
> >bus." for the Get Features and Set Features commands.
> >
> yes. the set/get features should works in 8-bit.
> 
> I have never met a 16-bit onfi nand yet. :)
> 
> >So using read_buf and write_buf is wrong for 16-bit wide nand chips as
> >they use I/O[15:0]. The Get Features command is easily fixed using 4
> >times the read_byte callback. For Set Features error out as there is no
> yes. for get features, it's easy to fix it.
> >write_byte callback.
> Most of the time, the nand controller will overwrite the write_buf hook...
> I also think we need a write_byte callback.
Is this an Ack for my patch?

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
