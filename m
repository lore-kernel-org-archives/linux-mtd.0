Received: from smtp113.sbc.mail.mud.yahoo.com ([68.142.198.212])
	by canuck.infradead.org with smtp (Exim 4.63 #1 (Red Hat Linux))
	id 1GpT7O-0003Cr-Vt
	for linux-mtd@lists.infradead.org; Wed, 29 Nov 2006 12:21:16 -0500
From: David Brownell <david-b@pacbell.net>
To: Haavard Skinnemoen <hskinnemoen@atmel.com>
Subject: Re: jffs2_flash_writev(): Non-contiguous write to 00825300 with
	mtd_dataflash
Date: Wed, 29 Nov 2006 09:21:01 -0800
References: <20061101115252.26000d78@cad-250-152.norway.atmel.com>
	<1164717377.576.29.camel@sauron>
	<20061129142607.7546cbad@dhcp-252-105.norway.atmel.com>
In-Reply-To: <20061129142607.7546cbad@dhcp-252-105.norway.atmel.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200611290921.02293.david-b@pacbell.net>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday 29 November 2006 5:26 am, Haavard Skinnemoen wrote:

> -	device->flags = MTD_CAP_NORFLASH;
> +	device->flags = MTD_WRITEABLE;

That "NORFLASH" flag always seemed bogus to me, but it was at the
time the only way to make the MTD core behave.
