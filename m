Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Pwegu-0003jH-QK
	for linux-mtd@lists.infradead.org; Mon, 07 Mar 2011 17:57:57 +0000
Received: by wyf23 with SMTP id 23so4666928wyf.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 07 Mar 2011 09:57:54 -0800 (PST)
Subject: RE: [PATCH] NAND: DaVinci: Removed header file that is not required
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "Paulraj, Sandeep" <s-paulraj@ti.com>
In-Reply-To: <0554BEF07D437848AF01B9C9B5F0BC5DC266C260@dlee01.ent.ti.com>
References: <1299019251-19518-1-git-send-email-s-paulraj@ti.com>
	<1299488468.2746.7.camel@localhost>
	<0554BEF07D437848AF01B9C9B5F0BC5DC266C260@dlee01.ent.ti.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 07 Mar 2011 19:57:52 +0200
Message-ID: <1299520672.27552.1.camel@koala>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: "davinci-linux-open-source@linux.davincidsp.com"
	<davinci-linux-open-source@linux.davincidsp.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2011-03-07 at 08:57 -0600, Paulraj, Sandeep wrote:
> > 
> > On Tue, 2011-03-01 at 17:40 -0500, s-paulraj@ti.com wrote:
> > > From: Sandeep Paulraj <s-paulraj@ti.com>
> > >
> > > The DaVinci NAND driver was including the mach-types.h header
> > > file.
> > > This prevented the DaVinci NAND driver from getting used
> > > in a DSP only device. The linux port on c6x devices can make
> > > use of the same driver and does not define a corresponding
> > > header file; so removing it.
> > >
> > > Signed-off-by: Sandeep Paulraj <s-paulraj@ti.com>
> > 
> > Hi,
> > 
> > you explain why this include is bad for DSP. Buy you do not explain
> why
> > this include is there and why removing it is harmless for Linux.
> > 
> 
> Hi,
> 
> This header file was required in the driver because earlier there was
> code dependent on a machine_* check. This piece of code has now been
> factored out and is in /arch/arm/mach-davinci/aemif.c.
> 
> Thus removing it is harmless.
> 
> Please do let me know if you need an updated patch.

Yes, please, patch description should contain this important
information.

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
