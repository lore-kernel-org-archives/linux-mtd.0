Received: from hex.linuxgrrls.org
	([212.18.228.73] helo=mail.linuxgrrls.org ident=postfix)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19ad6G-0001RM-Af
	for <linux-mtd@lists.infradead.org>; Thu, 10 Jul 2003 16:12:48 +0100
Date: Thu, 10 Jul 2003 16:12:57 +0100 (BST)
From: jasmine@regolith.co.uk
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1057846853.21073.378.camel@passion.cambridge.redhat.com>
Message-ID: <Pine.LNX.4.53.0307101611170.844@hex.linuxgrrls.org>
References: <E19ZLo5-0000XC-Kw@pentafluge.infradead.org>
	<Pine.LNX.4.53.0307101358200.32710@hex.linuxgrrls.org>
	<1057846853.21073.378.camel@passion.cambridge.redhat.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
cc: Charles Manning <manningc2@actrix.gen.nz>
cc: linux-mtd@lists.infradead.org
Subject: Re: nand flash driver
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



On Thu, 10 Jul 2003, David Woodhouse wrote:

> Hmmm. When sending multiple bytes of address, isn't ALE supposed to
> remain high for the entire duration, without going low again between
> cycles? How do you achieve this if it's on the address bus?

By waiting to see if the next write is to the same address-  it's not hard 
to do that sort of thing in an FPGA or SoC.  Since the only line involved 
is the ALE to the NAND, there's no downside in hanging on a little longer
before dropping it.

-J.
