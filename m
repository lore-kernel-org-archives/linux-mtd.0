Received: from za-gw.sanpeople.com ([196.211.225.226])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1GpfaO-000627-Ek
	for linux-mtd@lists.infradead.org; Thu, 30 Nov 2006 01:39:59 -0500
Subject: Re: jffs2_flash_writev(): Non-contiguous write to 00825300 with
	mtd_dataflash
From: Andrew Victor <andrew@sanpeople.com>
To: David Brownell <david-b@pacbell.net>
In-Reply-To: <200611290921.02293.david-b@pacbell.net>
References: <20061101115252.26000d78@cad-250-152.norway.atmel.com>
	<1164717377.576.29.camel@sauron>
	<20061129142607.7546cbad@dhcp-252-105.norway.atmel.com>
	<200611290921.02293.david-b@pacbell.net>
Content-Type: text/plain
Message-Id: <1164868198.21731.6.camel@fuzzie.sanpeople.com>
Mime-Version: 1.0
Date: 30 Nov 2006 08:29:59 +0200
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Haavard Skinnemoen <hskinnemoen@atmel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

hi,

> > -	device->flags = MTD_CAP_NORFLASH;
> > +	device->flags = MTD_WRITEABLE;
> 
> That "NORFLASH" flag always seemed bogus to me, but it was at the
> time the only way to make the MTD core behave.

Wouldn't it be better to introduce a MTD_CAP_DATAFLASH.
That way if/when more capability flags are added to MTD core, the
dataflash support will be considered and not forgotten about.


Regards,
  Andrew Victor
