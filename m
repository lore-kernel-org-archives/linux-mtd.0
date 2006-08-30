Received: from www.osadl.org ([213.239.205.134] helo=mail.tglx.de)
	by pentafluge.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GIYVz-0007IB-D4
	for linux-mtd@lists.infradead.org; Wed, 30 Aug 2006 23:26:32 +0100
Subject: Re: A question about reading newly erased page with NAND_ECC_SOFT.
From: Thomas Gleixner <tglx@linutronix.de>
To: Han Chang <posaune@hotmail.com>
In-Reply-To: <BAY110-F2473A78E4AFBB929E89D10BC450@phx.gbl>
References: <BAY110-F2473A78E4AFBB929E89D10BC450@phx.gbl>
Content-Type: text/plain
Date: Thu, 31 Aug 2006 00:29:38 +0200
Message-Id: <1156976978.29250.233.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2006-08-25 at 15:11 -0700, Han Chang wrote:
> Hi All,
> 
> For a newly erased page, the content of both user data and oob are 0xff. If 
> NAND_ECC_SOFT is enabled, the ecc code in the oob, which is 0xff, is not 
> right ecc code. Then if the file system tries to read a newly erased page, 
> it will be problem. Does anyone know how to get around this?

It is correct. The software based ECC value of all 0xFF is 0xFF

	tglx
