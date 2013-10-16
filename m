Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VWOIv-0003mZ-Mh
 for linux-mtd@lists.infradead.org; Wed, 16 Oct 2013 10:26:14 +0000
Date: Wed, 16 Oct 2013 07:25:58 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 2/2] mtd: nand: pxa3xx: Allocate data buffer on detected
 flash size
Message-ID: <20131016102557.GA2518@localhost>
References: <1380911438-24240-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1380911438-24240-3-git-send-email-ezequiel.garcia@free-electrons.com>
 <20131015194159.GV23337@ld-irv-0074.broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20131015194159.GV23337@ld-irv-0074.broadcom.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Lior Amsalem <alior@marvell.com>, Tawfik Bayouk <tawfik@marvell.com>,
 Daniel Mack <zonque@gmail.com>, linux-mtd@lists.infradead.org,
 Gregory Clement <gregory.clement@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Oct 15, 2013 at 12:41:59PM -0700, Brian Norris wrote:
> On Fri, Oct 04, 2013 at 03:30:38PM -0300, Ezequiel Garcia wrote:
> > This commit replaces the currently hardcoded buffer size, by a
> > dynamic detection scheme. First a small 256 bytes buffer is allocated
> > so the device can be detected (using READID and friends commands).
> > 
> > After detection, this buffer is released and a new buffer is allocated
> > to acommodate the page size plus out-of-band size.
> > 
> > Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
> > ---
> >  drivers/mtd/nand/pxa3xx_nand.c | 45 ++++++++++++++++++++++++++++--------------
> >  1 file changed, 30 insertions(+), 15 deletions(-)
> > 
> > diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
> > index a47c67f..bfb2b9f 100644
> > --- a/drivers/mtd/nand/pxa3xx_nand.c
> > +++ b/drivers/mtd/nand/pxa3xx_nand.c
> > @@ -39,6 +39,13 @@
> >  #define NAND_STOP_DELAY		(2 * HZ/50)
> >  #define PAGE_CHUNK_SIZE		(2048)
> >  
> > +/*
> > + * Define a buffer size for the initial command that detects the flash device:
> > + * STATUS, READID and PARAM. The largest of these is the PARAM command,
> > + * needing 256 bytes.
> > + */
> > +#define INIT_BUFFER_SIZE	256
> > +
> 
> Actually, PARAM tries to get 768 bytes in nand_base.c to retrieve the
> redundant copies, but your current driver implementation seems to ignore
> the 2nd and 3rd parameter pages by returning 0xFF.
> 
> So this is not a criticism of the current patch, but you may want to
> consider improving your NAND_CMD_PARAM support (also, you don't support
> NAND_CMD_RNDOUT, which is now used for extended parameter page support).
> 

Ah, good input. I'll research a bit more and try to cook a patch, it doesn't
sound like a lot of work, and it would be nice to have better command support.

Thanks,
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
