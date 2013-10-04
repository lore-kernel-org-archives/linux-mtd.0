Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VSBGR-0005l8-Aq
 for linux-mtd@lists.infradead.org; Fri, 04 Oct 2013 19:42:16 +0000
Date: Fri, 4 Oct 2013 16:42:04 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 00/21] Armada 370/XP NAND support
Message-ID: <20131004194203.GB20476@localhost>
References: <1379606505-2529-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <20130926195615.GK23337@ld-irv-0074.broadcom.com>
 <20130930122428.GA2417@localhost>
 <20131003000253.GX23337@ld-irv-0074.broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20131003000253.GX23337@ld-irv-0074.broadcom.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Lior Amsalem <alior@marvell.com>, Jason Cooper <jason@lakedaemon.net>,
 Tawfik Bayouk <tawfik@marvell.com>, Artem Bityutskiy <dedekind1@gmail.com>,
 Daniel Mack <zonque@gmail.com>, Huang Shijie <b32955@freescale.com>,
 linux-mtd@lists.infradead.org,
 Gregory Clement <gregory.clement@free-electrons.com>, Willy Tarreau <w@1wt.eu>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Oct 02, 2013 at 05:02:53PM -0700, Brian Norris wrote:
> On Mon, Sep 30, 2013 at 09:24:29AM -0300, Ezequiel Garcia wrote:
> > On Thu, Sep 26, 2013 at 12:56:15PM -0700, Brian Norris wrote:
> > > On Thu, Sep 19, 2013 at 01:01:24PM -0300, Ezequiel Garcia wrote:
> > > > * Page layout
> > > > 
> > > > The controller has a 2176 bytes FIFO buffer. Therefore, in order to support
> > > > larger pages, I/O operations on 4 KiB and 8 KiB pages is done with a set of
> > > > chunked transfers.
> > > > 
> > > > For instance, if we choose a 2048 data chunk and BCH ECC we will have
> > > > to use this layout in the pages:
> > > > 
> > > >   ------------------------------------------------------------------------------
> > > >   | 2048B data | 32B spare | 30B ECC || 2048B data | 32B spare | 30B ECC | ... |
> > > >   ------------------------------------------------------------------------------
> > > > 
> > > > The last remaining area is unusable (i.e. wasted).
> > > 
> > > Why is it wasted? With a 2176B buffer, you can fit more than 2048+32+30.
> > > Are you simplifying things to support only NAND geometries like the
> > > tradiditional large page 2KB+64? (If so, what happens with 4KB pages
> > > that need higher level of ECC than can fit in 64 x 2 = 128B?) And in the
> > > 2KB+64 case, why is the 64-32-30=2B wasted?
> > > 
> > 
> > Hm... the wasted bytes are due to an 8-byte alignment controller requirement on the
> > data buffer. However, you're right: in a flash with a page of 4KB+224B (e.g.) you
> > should be able to access at least some of the remaining OOB area.
> 
> Alignment requirement for the start of the buffer, length of the buffer,
> or both?
> 

The specification requires the length of a transaction (amount of data in the
data buffer) to be aligned to 8 bytes.

> > Notice OOB handling is still a bit confusing in this driver.
> 
> Yes.
> 
> > > > To match this, my current (already working!) implementation acts like
> > > > a layout "impedance matcher" to produce in an internal driver's buffer
> > > 
> > > Maybe I'm in the wrong field, but I'm not sure how an impedance matcher
> > > applies here.
> > > 
> > > > this layout:
> > > > 
> > > >   ------------------------------------------
> > > >   |     4096B data     |     64B spare     |
> > > >   ------------------------------------------
> > > 
> > > What is this "internal buffer"? (I'll read through your patches in a bit
> > > and find out, perhaps?) Just the raw data + spare that you are ready to
> > > read/write? Are you dropping the ECC from this buffer? Doesn't it need
> > > to be returned to the callee (when the 'oob_required' flag is true)?
> > > 
> > 
> > Yes, the driver's internal buffer has the raw data + OOB that has
> > been read from the controller after a read operation, or that's
> > ready to be written to the flash before a program operation.
> > 
> > That said, if the command issued was READOOB then the OOB is read fully:
> > spare and ECC code and the buffer is filled like this:
> > 
> >   ----------------------------------------------------------------------------------------------
> >   |     4096B data     |  32B spare  |  30B ECC*  | 2x 0xff |  32B spare  |  30B ECC  | 2x 0xff |
> >   ----------------------------------------------------------------------------------------------
> > 
> > (*) We need to add two bytes (0xff) to align the 30B ECC read.
> > 
> > I was expecting to handle the above layout properly using this nand_ecclayout
> > structure:
> > 
> > static struct nand_ecclayout ecc_layout_4KB_bch4bit = {
> >         .eccbytes = 64,
> >         .eccpos = {
> >                 32,  33,  34,  35,  36,  37,  38,  39,
> >                 40,  41,  42,  43,  44,  45,  46,  47,
> >                 48,  49,  50,  51,  52,  53,  54,  55,
> >                 56,  57,  58,  59,  60,  61,  62,  63,
> >                 96,  97,  98,  99,  100, 101, 102, 103,
> >                 104, 105, 106, 107, 108, 109, 110, 111,
> >                 112, 113, 114, 115, 116, 117, 118, 119,
> >                 120, 121, 122, 123, 124, 125, 126, 127},
> >         /* Bootrom looks in bytes 0 & 5 for bad blocks */
> >         .oobfree = { {1, 4}, {6, 26}, { 64, 32} }
> > };
> > 
> > However, I must be doing something wrong since currently the mtd_oobtest fails
> > at some point and I need to investigate the issue further.
> > 
> > > > In order to achieve reading (for instance), we issue several READ0 commands
> > > > (with some additional controller-specific magic) and read two chunks of 2080B
> > > > (2048 data + 64 spare) each.
> > > 
> > > The math is a little inconsistent here and elsewhere. Do you mean two
> > > chunks of 2080B (2048 data + 32 spare)?
> > > 
> > 
> > Yes. It should be: 2048B data + 32B spare.
> > 
> > > > The driver accomodates this data to expose the NAND base a contiguous 4160B buffer
> > > > (4096 data + 64 spare).
> > > 
> > > This math matches up right, if it's double the 2KB+32 instead of double
> > > 2KB+64.
> > > 
> > 
> > Yup.
> > 
> > > > * ECC
> > > > 
> > > > The controller has built-in hardware ECC capabilities. In addition it is completely
> > > > configurable, and we can choose between Hamming and BCH ECC. If we choose BCH ECC
> > > > then the ECC code will be calculated for each transfered chunk and expected to be
> > > > located (when reading/programming) at specific locations.
> > > 
> > > At "specific locations", but always within the 30B region that you've
> > > been mapping out?
> > > 
> > 
> > By 'specific location' I mean after the 32B spare area.
> > 
> > > > So, repeating the above scheme, a 2048B data chunk will be followed by 32B spare,
> > > > and then the ECC controller will read/write the ECC code (30B in this case):
> > > > 
> > > >   ------------------------------------
> > > >   | 2048B data | 32B spare | 30B ECC |
> > > >   ------------------------------------
> > > 
> > > Is ECC always 30B? Or is this just the maximum size, so you always
> > > reserve 30B?
> > > 
> > 
> > In the BCH case, yes: it's always 30B.
> 
> So by "BCH" you actually are referring to BCH-4? Are there any other BCH
> modes supported? Or do you expect any future revisions to expand on the
> BCH options available?
> 

Mmm.. ECC BCH is always 30 bytes long, but this doesn't mean it's BCH-4.
See below.

> > AFAIK, the ECC works like this. When programming a page, you can
> > actually instruct the controller to transfer an arbitrary amount of bytes.
> > 
> > (Details: you do this by adding NDCB0_LEN_OVRD to the command buffer 0,
> > and setting the i/o length at buffer 3).
> > 
> > The ECC code will be written after the transfered bytes. So, when
> > programming a page we configure the length to be 2048B + 32B and get
> > the ECC after it.
> > 
> > Equally, we can read an arbitrary length. and the ECC code is expected
> > to be in the area immediate the read area.
> > 
> > Notice that this means you can control the ECC strength: since the ECC
> > is always 30B, and it's calculated on the transfered chunk you can
> > configure the controller to transfer the page in 1024B chunks and get a
> > 30B ECC for each of this chunk, thus doubling the ECC strength.
> 
> This is a little odd. Your ECC HW is not parameterized by ECC strength,
> but instead by ECC sector size? I think I have some comments for patch
> 5, relevant to this topic.
> 

Indeed. When ECC engine in the controller is set to do BCH, it always
store a 30-byte ECC code. This 30-byte code is calculated on the
transfered chunk, and since the chunk size is configurable we can
effectively configure the ECC strength.

The specification says the ECC BCH engine can correct up to 16-bits,
which means: if the chunk is 2048 bytes you get BCH-4, and if the chunk
is set to be 1024 bytes, you get BCH-8.

Only the former has been implemented in this v1.

Is this clearer now? Don't hesitate in asking more questions as it helps
me fill my own understanding gaps :-)
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
