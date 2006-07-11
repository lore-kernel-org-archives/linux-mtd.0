Received: from mail.auerswald.de ([212.185.163.229])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1G0DKg-0007cw-Cd
	for linux-mtd@lists.infradead.org; Tue, 11 Jul 2006 04:11:17 -0400
From: Wolfgang =?iso-8859-1?q?M=FCes?= <wolfgang.mues@auerswald.de>
To: linux-mtd@lists.infradead.org,
 mike@compulab.co.il
Subject: Re: [PATCH] CM-x2xx NAND flash support
Date: Tue, 11 Jul 2006 10:10:50 +0200
References: <44B36563.9050103@compulab.co.il>
In-Reply-To: <44B36563.9050103@compulab.co.il>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200607111010.50355.wolfgang.mues@auerswald.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am Dienstag, 11. Juli 2006 09:48 schrieb Mike Rapoport:
> Thomas Gleixner wrote:
> >On Thu, 2006-07-06 at 14:48 +0200, Mike Rapoport wrote:
> >>This patch provides MTD support for NAND flash devices on CM-x2xx
> >> modules.
> >>+#define DRAIN_WB() \
> >>+       do { \
> >>+               unsigned char dummy; \
> >>+               asm volatile ("mcr p15, 0, r0, c7, c10, 4":::"r0"); \
> >>+               dummy=*((unsigned char*)UNCACHED_ADDR); \
> >>+       } while(0);
> >
> >stray semicolon ----^
> >
> >I bet xscale has this functionality somewhere as a macro / inline already
>
> I found none. Even md() on xscale will not drain write buffer.

dmac_clean_range() from asm/cacheflush.h is what you want.

regards

-- 
Wolfgang Muees                    Vor den Grashoefen 1
Auerswald GmbH & Co. KG       	  D-38162 Cremlingen
Hardware Development              Germany
Tel +49 5306 9219 0               Fax +49 5306 9219 94
