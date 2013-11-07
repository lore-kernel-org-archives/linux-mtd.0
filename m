Received: from mail-ie0-x232.google.com ([2607:f8b0:4001:c03::232])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VeULY-0007Ti-05
 for linux-mtd@lists.infradead.org; Thu, 07 Nov 2013 18:30:24 +0000
Received: by mail-ie0-f178.google.com with SMTP id x13so1455429ief.23
 for <linux-mtd@lists.infradead.org>; Thu, 07 Nov 2013 10:30:00 -0800 (PST)
Date: Thu, 7 Nov 2013 10:29:55 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Sourav Poddar <sourav.poddar@ti.com>
Subject: Re: [PATCHv3 0/2] m25p80: QUAD read support + cleanup.
Message-ID: <20131107182955.GV20061@ld-irv-0074.broadcom.com>
References: <1383748535-20462-1-git-send-email-sourav.poddar@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1383748535-20462-1-git-send-email-sourav.poddar@ti.com>
Cc: marex@denx.de, Huang Shijie <b32955@freescale.com>,
 linux-mtd@lists.infradead.org, balbi@ti.com, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

+ Huang

On Wed, Nov 06, 2013 at 08:05:33PM +0530, Sourav Poddar wrote:
> Patch series does the following:
> 1. Cleanup the m25p80 driver to convert bool check for
>    read into an enum. This will help adding more read 
>    commands into the driver easily.
> 
> 2. Add quad read support for spansion and macronix flash devices.

Do we have any testing results? I know that some QSPI controllers still
need some more work to be able to support this, but has someone tested
this current patch set with a "true" SPI controller on mainline?

Brian
