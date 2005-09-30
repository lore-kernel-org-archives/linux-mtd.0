Received: from caramon.arm.linux.org.uk ([212.18.232.186])
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1ELPXP-00067D-CP
	for linux-mtd@lists.infradead.org; Fri, 30 Sep 2005 14:23:38 -0400
Date: Fri, 30 Sep 2005 19:18:01 +0100
From: Russell King <rmk+lkml@arm.linux.org.uk>
To: Vitaly Wool <vwool@ru.mvista.com>
Message-ID: <20050930181801.GA31152@flint.arm.linux.org.uk>
References: <20050930121741.GA5506@elf.ucw.cz> <433D482A.1000708@ru.mvista.com>
	<1128089827.3111.2.camel@windu.rchland.ibm.com>
	<433D8010.1090701@ru.mvista.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <433D8010.1090701@ru.mvista.com>
Sender: Russell King <rmk@arm.linux.org.uk>
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
	kernel list <linux-kernel@vger.kernel.org>, Pavel Machek <pavel@ucw.cz>
Subject: Re: [patch] switch mtd to new driver model & cleanups
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Sep 30, 2005 at 10:12:32PM +0400, Vitaly Wool wrote:
> As far as I've heard, there's gonna be a megre quite soon... :)
> Anyway, I guess it'd be better if Pavel ntroduced the new patch against 
> the latest linux-mtd code.

I don't think it's required.  The SA1100 map driver handles the PM
already, as I'm sure the PXA map driver will also.

All it takes is for the other map drivers to be converted and hey
presto, the MTD subsystem has power management support done the
right way.

-- 
Russell King
 Linux kernel    2.6 ARM Linux   - http://www.arm.linux.org.uk/
 maintainer of:  2.6 Serial core
