Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VQcX5-0001gD-Mu
 for linux-mtd@lists.infradead.org; Mon, 30 Sep 2013 12:25:00 +0000
Date: Mon, 30 Sep 2013 09:24:29 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 00/21] Armada 370/XP NAND support
Message-ID: <20130930122428.GA2417@localhost>
References: <1379606505-2529-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <20130926195615.GK23337@ld-irv-0074.broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20130926195615.GK23337@ld-irv-0074.broadcom.com>
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

Brian,

On Thu, Sep 26, 2013 at 12:56:15PM -0700, Brian Norris wrote:
> + Huang
> 
> Hi Ezequiel,
> 
> I've mostly had a chance to study the cover letter. I'll start digging
> through the patches in a bit, but I have a few initial questions.
> 
> Also, it looks like some of this ECC/OOB layout is rather similar to the
> documentation I've seen from Huang for gpmi-nand. Perhaps he can review
> a bit of your work here.
> 
> On Thu, Sep 19, 2013 at 01:01:24PM -0300, Ezequiel Garcia wrote:
> > * Page layout
> > 
> > The controller has a 2176 bytes FIFO buffer. Therefore, in order to support
> > larger pages, I/O operations on 4 KiB and 8 KiB pages is done with a set of
> > chunked transfers.
> > 
> > For instance, if we choose a 2048 data chunk and BCH ECC we will have
> > to use this layout in the pages:
> > 
> >   ------------------------------------------------------------------------------
> >   | 2048B data | 32B spare | 30B ECC || 2048B data | 32B spare | 30B ECC | ... |
> >   ------------------------------------------------------------------------------
> > 
> > The last remaining area is unusable (i.e. wasted).
> 
> Why is it wasted? With a 2176B buffer, you can fit more than 2048+32+30.
> Are you simplifying things to support only NAND geometries like the
> tradiditional large page 2KB+64? (If so, what happens with 4KB pages
> that need higher level of ECC than can fit in 64 x 2 = 128B?) And in the
> 2KB+64 case, why is the 64-32-30=2B wasted?
> 

Hm... the wasted bytes are due to an 8-byte alignment controller requirement on the
data buffer. However, you're right: in a flash with a page of 4KB+224B (e.g.) you
should be able to access at least some of the remaining OOB area.

Notice OOB handling is still a bit confusing in this driver.

> > To match this, my current (already working!) implementation acts like
> > a layout "impedance matcher" to produce in an internal driver's buffer
> 
> Maybe I'm in the wrong field, but I'm not sure how an impedance matcher
> applies here.
> 
> > this layout:
> > 
> >   ------------------------------------------
> >   |     4096B data     |     64B spare     |
> >   ------------------------------------------
> 
> What is this "internal buffer"? (I'll read through your patches in a bit
> and find out, perhaps?) Just the raw data + spare that you are ready to
> read/write? Are you dropping the ECC from this buffer? Doesn't it need
> to be returned to the callee (when the 'oob_required' flag is true)?
> 

Yes, the driver's internal buffer has the raw data + OOB that has
been read from the controller after a read operation, or that's
ready to be written to the flash before a program operation.

That said, if the command issued was READOOB then the OOB is read fully:
spare and ECC code and the buffer is filled like this:

  ----------------------------------------------------------------------------------------------
  |     4096B data     |  32B spare  |  30B ECC*  | 2x 0xff |  32B spare  |  30B ECC  | 2x 0xff |
  ----------------------------------------------------------------------------------------------

(*) We need to add two bytes (0xff) to align the 30B ECC read.

I was expecting to handle the above layout properly using this nand_ecclayout
structure:

static struct nand_ecclayout ecc_layout_4KB_bch4bit = {
        .eccbytes = 64,
        .eccpos = {
                32,  33,  34,  35,  36,  37,  38,  39,
                40,  41,  42,  43,  44,  45,  46,  47,
                48,  49,  50,  51,  52,  53,  54,  55,
                56,  57,  58,  59,  60,  61,  62,  63,
                96,  97,  98,  99,  100, 101, 102, 103,
                104, 105, 106, 107, 108, 109, 110, 111,
                112, 113, 114, 115, 116, 117, 118, 119,
                120, 121, 122, 123, 124, 125, 126, 127},
        /* Bootrom looks in bytes 0 & 5 for bad blocks */
        .oobfree = { {1, 4}, {6, 26}, { 64, 32} }
};

However, I must be doing something wrong since currently the mtd_oobtest fails
at some point and I need to investigate the issue further.

> > In order to achieve reading (for instance), we issue several READ0 commands
> > (with some additional controller-specific magic) and read two chunks of 2080B
> > (2048 data + 64 spare) each.
> 
> The math is a little inconsistent here and elsewhere. Do you mean two
> chunks of 2080B (2048 data + 32 spare)?
> 

Yes. It should be: 2048B data + 32B spare.

> > The driver accomodates this data to expose the NAND base a contiguous 4160B buffer
> > (4096 data + 64 spare).
> 
> This math matches up right, if it's double the 2KB+32 instead of double
> 2KB+64.
> 

Yup.

> > * ECC
> > 
> > The controller has built-in hardware ECC capabilities. In addition it is completely
> > configurable, and we can choose between Hamming and BCH ECC. If we choose BCH ECC
> > then the ECC code will be calculated for each transfered chunk and expected to be
> > located (when reading/programming) at specific locations.
> 
> At "specific locations", but always within the 30B region that you've
> been mapping out?
> 

By 'specific location' I mean after the 32B spare area.

> > So, repeating the above scheme, a 2048B data chunk will be followed by 32B spare,
> > and then the ECC controller will read/write the ECC code (30B in this case):
> > 
> >   ------------------------------------
> >   | 2048B data | 32B spare | 30B ECC |
> >   ------------------------------------
> 
> Is ECC always 30B? Or is this just the maximum size, so you always
> reserve 30B?
> 

In the BCH case, yes: it's always 30B.

AFAIK, the ECC works like this. When programming a page, you can
actually instruct the controller to transfer an arbitrary amount of bytes.

(Details: you do this by adding NDCB0_LEN_OVRD to the command buffer 0,
and setting the i/o length at buffer 3).

The ECC code will be written after the transfered bytes. So, when
programming a page we configure the length to be 2048B + 32B and get
the ECC after it.

Equally, we can read an arbitrary length. and the ECC code is expected
to be in the area immediate the read area.

Notice that this means you can control the ECC strength: since the ECC
is always 30B, and it's calculated on the transfered chunk you can
configure the controller to transfer the page in 1024B chunks and get a
30B ECC for each of this chunk, thus doubling the ECC strength.

This should be added to the driver, and I expect it to be fairly easy
with the infrastructure already in place.

> > * OOB
> > 
> > Because of the above scheme, and because the "spare" OOB is really located in
> > the middle of a page, spare OOB cannot be read or write independently of the
> > data area. In other words, in order to read the OOB (aka READOOB), the entire
> > page (aka READ0) has to be read.
> > 
> > In the same sense, in order to write to the spare OOB (aka SEQIN,
> > column = 4096 + PAGEPROG) the driver has to read the entire page first to the
> > driver's buffer. Then it should fill the OOB, and finally program the entire page,
> > data and oob included.
> > 
> > Notice, that while this is possible, I haven't included OOB only write support
> > (i.e. OOB write without data write) in this first patchset. I'm not sure why
> > would we need it, so I'd like to know others opinion on this matter.
> 
> Depends on what you mean by "OOB only write support". You need to
> support marking bad block markers, at least, which are "OOB only"
> writes.
> 

Indeed. And that's achieved by programming an entire page with all
0xff's in the data area and only the OOB area with meaningful (non-0xff)
metadata.

Although not included in this v1, I have some patches here that support this.
I've done some testing, marking blocks as bad from within the kernel and then
re-constructing the bad block table and that appears to work OK.

So, this will be in v2. It's a very minor delta from this v1, nothing intrusive.

> > Of course, writing to the OOB is supported, as long as this write is done
> > *with* data. Following the examples above, writing an entire 4096 + OOB page
> > is supported.
> > 
> > * Clocking and timings
> > 
> > This first patchset adds a dummy nand-clock to the device tree just to allow
> > the driver to get it. Timings configuration is overriden for now using the
> > 'keep-config' DT parameter. The next round will likely include proper clock
> > support plus timings configuration.
> 
> Be sure to include devicetree@vger.kernel.org and one or more of the
> maintainers for your proper DT bindings patches.
> 

Sure. For now, I'm mostly concerned about the driver implementation and
that's why I haven't Cced the DT folks.

Thanks for your feedback and don't hesitate to ask more questions,
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
