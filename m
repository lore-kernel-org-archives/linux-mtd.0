Received: from dhcp695.linuxsymposium.org ([209.151.10.193]
	helo=lapdancer.baythorne.internal)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19fqQF-0001ab-GK
	for <linux-mtd@lists.infradead.org>; Fri, 25 Jul 2003 01:26:59 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: Matthew Dharm <mdharm@momenco.com>
In-Reply-To: <NEBBLJGMNKKEEMNLHGAIEEKPDCAA.mdharm@momenco.com>
References: <NEBBLJGMNKKEEMNLHGAIEEKPDCAA.mdharm@momenco.com>
Message-Id: <1059092763.28255.4.camel@lapdancer.baythorne.internal>
Mime-Version: 1.0
Date: Thu, 24 Jul 2003 20:26:06 -0400
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: manningc2@actrix.gen.nz
cc: linux-mtd@lists.infradead.org
cc: Holly Gates <hgates@eink.com>
Subject: RE: Smartmedia block mapping
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2003-07-24 at 18:57, Matthew Dharm wrote:
> But the current code just makes the media look like traditional
> block-media via the usb-storage driver.  You would need to do some
> significant hacking to expose the low-level interface.

I suspect it's worth doing. There are plenty of 'raw' SmartMedia
adapters out there, which want plugging into the MTD core as normal NAND
devices -- and we only want one implementation of SMTL.

-- 
dwmw2
