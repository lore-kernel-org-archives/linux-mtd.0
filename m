Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VJORd-0005rO-Sx
 for linux-mtd@lists.infradead.org; Tue, 10 Sep 2013 13:57:30 +0000
Date: Tue, 10 Sep 2013 10:57:30 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Daniel Mack <zonque@gmail.com>
Subject: Re: [RFC/PATCH v2] mtd: nand: pxa3xx: Remove redundant device probing
Message-ID: <20130910135729.GA32715@localhost>
References: <1378811821-14766-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1378811821-14766-2-git-send-email-ezequiel.garcia@free-electrons.com>
 <522F22C9.1050305@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <522F22C9.1050305@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Lior Amsalem <alior@marvell.com>, Tawfik Bayouk <tawfik@marvell.com>,
 haojian.zhuang@gmail.com, b32955@freescale.com, linux-mtd@lists.infradead.org,
 Gregory Clement <gregory.clement@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>, Willy Tarreau <w@1wt.eu>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Sep 10, 2013 at 03:46:49PM +0200, Daniel Mack wrote:
> On 10.09.2013 13:17, Ezequiel Garcia wrote:
> > There's no need to go through this internal probe/auto-detect
> > procedure, since the nand core code will take care of that.
> > This commit removes the configuration and detection functions,
> > together with the built-in flash device table.
> > 
> > Besides being unneeded, it's also wrong to take care of such details
> > wich rightfully belong to the NAND base code. Removing this wrong
> > code, prevents the proliferation of the same mistake in future drivers.
> > 
> > This commit has the effect of forcing the "keep_config" option.
> 
> I get the following build warning with this patch:
> 
>   drivers/mtd/nand/pxa3xx_nand.c:221:13: warning:
> ‘pxa3xx_nand_set_timing’ defined but not used [-Wunused-function]
> 

Yes, that's fine. I'm keeping that until we decide what to do with
timings.

> Apart from that, this seems to work fine on my board,

Great! Which board is that?

> but I suspect that
> it would break systems where the NAND controller is not initialized from
> the bootloader, right?
> 

Right. However, since we can easily add support to configure every controller
parameter (right?) this shouldn't be a problem.

What do you think of this change, Daniel?

IMO, the code is ugly, useless and deprecated enough to consider its removal.
It forces to keep a (duplicated) list of known flash devices and it considers
only 512 and 2048 page sizes, just to name a few limitations.

But I'd love to hear a second opinion.
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
