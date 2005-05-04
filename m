Received: from gateway-1237.mvista.com ([12.44.186.158] helo=av.mvista.com)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DTSqu-0005cN-6r
	for linux-mtd@lists.infradead.org; Wed, 04 May 2005 19:00:24 -0400
Message-ID: <42795404.3010601@mvista.com>
Date: Wed, 04 May 2005 16:00:20 -0700
From: Todd Poynor <tpoynor@mvista.com>
MIME-Version: 1.0
To: Sascha Hauer <s.hauer@pengutronix.de>
References: <20050502090308.GA16890@metis.pengutronix.de>
In-Reply-To: <20050502090308.GA16890@metis.pengutronix.de>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: enable_vpp / disable_vpp
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Sascha Hauer wrote:
> Hi all,
> 
> I'm using cfi_cmdset_0001.c (intel strata) on a custom pxa board. Our
> mapping driver implements enable_vpp and disable_vpp. We often receive
> "Chip reports voltage low on erase" errors. The driver seems to disable
> vpp during erase operations. If I short-ciruit the disable_vpp function
> everything works fine. A comment gives a hint on how to do this correct:
> 
> /* We should really make set_vpp() count, rather than doing this */
> 
> Is this feature planned for the future? 

One stab at this was
http://lists.infradead.org/pipermail/linux-mtd/2005-January/011517.html

comments or alternate suggestions would be welcome.  You can also modify 
your map driver to do this instead.

-- 
Todd
