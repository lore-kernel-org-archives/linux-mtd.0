Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15H37t-0000QL-00
	for <linux-mtd@lists.infradead.org>; Mon, 02 Jul 2001 13:48:29 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3B406B63.4E28CA8A@cotw.com> 
References: <3B406B63.4E28CA8A@cotw.com>  <200107012207.PAA01921@adam.yggdrasil.com> 
To: sjhill@cotw.com
Cc: "Adam J. Richter" <adam@yggdrasil.com>, linux-kernel@vger.kernel.org,
    linux-mtd@lists.infradead.org
Subject: Re: linux-2.4.6-pre8/drivers/mtd/nand/spia.c: undefined symbols 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 02 Jul 2001 13:53:45 +0100
Message-ID: <27019.994078425@redhat.com>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

sjhill@cotw.com said:
>  'spia.c' is the device dependent part. You should write your own
> version of 'spia.c' and "simply" fill in the addresses for the IO
> address and control register address depending on your specific
> hardware. The above symbols are only defined for my specific hardware.

Where are those four variables defined? In platform-dependent code for your 
board? If so, we should probably make the config option dependent on that 
platform. 

That'll make ESR whinge at me if support for your platform isn't (yet) in 
Linus' tree - but I don't care too much about that.

--
dwmw2
