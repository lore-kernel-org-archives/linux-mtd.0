Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zti9q-00041a-PN
 for linux-mtd@lists.infradead.org; Tue, 03 Nov 2015 20:26:19 +0000
Date: Tue, 3 Nov 2015 21:25:46 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: Renaud Barbier <renaud.barbier@ge.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>
Subject: Re: nand_flash_detect_onfi error
Message-ID: <20151103212546.0184eaf6@bbrezillon>
In-Reply-To: <CAAEAJfAjs0k26QumQdDzHeMGAM2s=xJw4E8N+yhs5GMCFkK=Aw@mail.gmail.com>
References: <5638E074.5070800@ge.com>
 <CAAEAJfAjs0k26QumQdDzHeMGAM2s=xJw4E8N+yhs5GMCFkK=Aw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Ezequiel, Renaud,

On Tue, 3 Nov 2015 13:56:16 -0300
Ezequiel Garcia <ezequiel@vanguardiasur.com.ar> wrote:

> On 3 November 2015 at 13:27, Renaud Barbier <renaud.barbier@ge.com> wrote:
> > In the file drivers/mtd/nand/nand_base.c, in function
> > nand_flash_detect_onfi  reading the ONFI data can be run up to 3 times
> > when there is a CRC error detected in the onfi data:

Do you mean parameter pages (including redundant ones) should be read
several times in case of failures or are you talking about redundant
parameter pages (there should be at least 2 of them and there can be
more)?
I didn't find any mention to the former statement, so if this is really
what you meant could you point the section where it's described?

If you're talking about the latter, then the current implementation is
correct, because redundant pages are contiguous to the first parameter
page.


> >
> > The function call chip->cmdfunc(mtd, NAND_CMD_PARAM, 0, -1); is located
> > outside the first for loop:
> >
> > chip->cmdfunc(mtd, NAND_CMD_PARAM, 0, -1);
> > for (i = 0; i < 3; i++) {
> >         for (j = 0; j < sizeof(*p); j++)
> >                 ((uint8_t *)p)[j] = chip->read_byte(mtd);
> >         if (onfi_crc16(ONFI_CRC_BASE, (uint8_t *)p, 254) ==
> >                         le16_to_cpu(p->crc)) {
> >                 break;
> >         }
> > }
> >
> > This results in a read beyond buffer error if the data have to be read
> > more than once.

I don't think so (but I might be wrong). As explained, the redundant
parameter pages are concatenated to the main one, so it's perfectly
valid to read all of them with a single NAND_CMD_PARAM sequence.

BTW, I wonder why ->read_byte() is used instead of ->read_buf() here.

> >
> > This error can also be found in U-boot and barebox.
> >
> 
> Hi Renaud,
> 
> NAND_CMD_PARAM is supposed to read one parameter page,
> plus the two redundant parameter pages as well. That's why the NAND core
> code reading sizeof(parameter page) x 3 bytes safely.
> 
> If you take a look at the ONFI 3.0 spec you'll see the parameter page
> is specified to be 767 bytes long, i.e. three redundant parameter pages
> can be read.
> 
> If you are seeing this kind of bug with a NAND controller, then you need
> to extend your CMD_PARAM read to fetch all the copies of the parameter page.
> 

Hm, sorry but I don't like this idea. ->cmdfunc() is not supposed to
retrieve any data before ->read_xxx() is called. I know some
controllers retrieve data ahead of time and then provide the previously
stored data when ->read_buf() is called, but that's not a good practice
to assume it will work this way on all controllers (actually I keep
thinking the sane implementations are those waiting for the
->read_buf() call before starting retrieving the data from the NAND
chip).

Best Regards,

Boris

-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
