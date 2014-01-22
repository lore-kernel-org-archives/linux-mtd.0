Received: from ch1ehsobe004.messaging.microsoft.com ([216.32.181.184]
 helo=ch1outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W5slS-0006wm-K8
 for linux-mtd@lists.infradead.org; Wed, 22 Jan 2014 08:02:23 +0000
Date: Wed, 22 Jan 2014 15:24:58 +0800
From: Huang Shijie <b32955@freescale.com>
To: "Gupta, Pekon" <pekon@ti.com>
Subject: Re: [PATCH] mtd: nand_ids: Add device parameters for Toshiba's
 TC58NVG1S3ETAI0 NAND EEPROM
Message-ID: <20140122072455.GA8804@shlinux2.ap.freescale.net>
References: <1389089083-29694-1-git-send-email-sr@denx.de>
 <20140120190441.GJ8919@ld-irv-0074>
 <20980858CB6D3A4BAE95CA194937D5E73EA685A2@DBDE04.ent.ti.com>
 <20140121155432.GA1416@gmail.com>
 <20980858CB6D3A4BAE95CA194937D5E73EA68C53@DBDE04.ent.ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20980858CB6D3A4BAE95CA194937D5E73EA68C53@DBDE04.ent.ti.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Stefan Roese <sr@denx.de>, Huang Shijie <shijie8@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jan 22, 2014 at 05:56:42AM +0000, Gupta, Pekon wrote:
> Hi Shijie,
> 
> >From: Huang Shijie [mailto:shijie8@gmail.com]
> >>On Tue, Jan 21, 2014 at 07:33:04AM +0000, Gupta, Pekon wrote:
> [...]
> >> But sincerely, why is Toshiba doing all this ?
> >> It would hit them only, as their devices will lack support on mainline kernels and u-boots.
> >> (Or their customers would have to carry custom patches all along).
> >> I tried convincing Toshiba to get their parts ONFI compliant, but they were too reluctant.
> >In actullay, Toshiba has began to support the JEDEC standard now.
> >
> >see my patch set.
> >
> Hope you are referring to patch-set given at [1]
> Thanks for pointing this out.. I missed it.
> 
> Yes, but your patch comment also mentions same issue with Toshiba NANDs 
> "	 Tested with Toshiba TH58TEG7DDKTA20(16K + 1280).
> 	(Unfortuately, this ECC info of its JEDEC parameter page is zero,
> 	 i hope toshiba can fix it in future.)"
> 
> So, I think the basic problem remains the same.. 
My Toshiba nand chips are just samples.

Toshiba's FAE had confirmed that the MP(mass product) nand will fix the issue
above. The ECC info will be filled with the correct value in the MP nand.

> However, I let Stefan comment about it more, as his NAND part is different
> from the one you tested.
Not all the Toshiba nand support the JEDEC, please read the datasheet before
testing the patch set.

thanks
Huang Shijie
