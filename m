Received: from va3ehsobe004.messaging.microsoft.com ([216.32.180.14]
 helo=va3outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VwRq7-0004aO-1x
 for linux-mtd@lists.infradead.org; Fri, 27 Dec 2013 07:28:11 +0000
Date: Fri, 27 Dec 2013 14:56:19 +0800
From: Huang Shijie <b32955@freescale.com>
To: <dwmw2@infradead.org>
Subject: Re: [PATCH V2 0/2] mtd: nand: parse the Hynix nand which uses
 <26nm technology
Message-ID: <20131227065617.GA28879@shlinux2.ap.freescale.net>
References: <1387957039-12575-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1387957039-12575-1-git-send-email-b32955@freescale.com>
Cc: computersforpeace@gmail.com, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Dec 25, 2013 at 03:37:17PM +0800, Huang Shijie wrote:
> With this patch set, we can parse out the Hynix nand which uses <26nm
> technology.
> 
> v1 --> v2:
> 	[1] do not parse the ECC info anymore.
> 	[2] split out a function to parse the Hynix MLC nand whose ID length is
> 	    6 bytes.
> 
> Huang Shijie (2):
>   mtd: nand: add a helper to parse the Hynix nand
>   mtd: nand: parse the Hynix nand which uses <26nm technology
> 
Please ignore this patch set. I finally found a H27UCG8T2A. I found this patch set
is wrong. I have already contacted with Hynix's FAE to discuss this issue.

thanks
Huang Shijie	
