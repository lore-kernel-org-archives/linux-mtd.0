Received: from imladris.demon.co.uk ([193.237.130.41])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19UXc8-0005CU-P3
	for <linux-mtd@lists.infradead.org>; Mon, 23 Jun 2003 21:08:33 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: Marc Kleine-Budde <kleine-budde@gmx.de>
In-Reply-To: <20030623160245.GA25579@timberwolf.dyndns.org>
References: <20030623160245.GA25579@timberwolf.dyndns.org>
Message-Id: <1056398934.19043.19.camel@imladris.demon.co.uk>
Mime-Version: 1.0
Date: Mon, 23 Jun 2003 21:08:54 +0100
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: DNP mounting issue
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2003-06-23 at 17:02, Marc Kleine-Budde wrote:
> Hi!
> 
> I'm using linux-2.4.21 together with mtd from 'Mon Jun 23 17:45:34 CEST 2003'
> The hardware is SSV's DNP-486 (=2 MB flash).
> 
> When booting the jffs2 filesystem on the mtd cannot be mounted,
> surprisingly it works with an unpatched linux-2.4.21 out of the box.
> 
> I've attached the bootingmessages from both kernels....
> 

Comment out the setting of mtd->read_ecc and mtd->write_ecc for the new
concatenated device in mtdconcat.c.

-- 
dwmw2
