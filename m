Received: from mail-ob0-x22e.google.com ([2607:f8b0:4003:c01::22e])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VPHmR-0001xi-Dq
 for linux-mtd@lists.infradead.org; Thu, 26 Sep 2013 20:03:20 +0000
Received: by mail-ob0-f174.google.com with SMTP id uz6so2455922obc.19
 for <linux-mtd@lists.infradead.org>; Thu, 26 Sep 2013 13:02:57 -0700 (PDT)
Date: Thu, 26 Sep 2013 12:56:15 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: Re: [PATCH 00/21] Armada 370/XP NAND support
Message-ID: <20130926195615.GK23337@ld-irv-0074.broadcom.com>
References: <1379606505-2529-1-git-send-email-ezequiel.garcia@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1379606505-2529-1-git-send-email-ezequiel.garcia@free-electrons.com>
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

+ Huang

Hi Ezequiel,

I've mostly had a chance to study the cover letter. I'll start digging
through the patches in a bit, but I have a few initial questions.

Also, it looks like some of this ECC/OOB layout is rather similar to the
documentation I've seen from Huang for gpmi-nand. Perhaps he can review
a bit of your work here.

On Thu, Sep 19, 2013 at 01:01:24PM -0300, Ezequiel Garcia wrote:
> * Page layout
> 
> The controller has a 2176 bytes FIFO buffer. Therefore, in order to support
> larger pages, I/O operations on 4 KiB and 8 KiB pages is done with a set of
> chunked transfers.
> 
> For instance, if we choose a 2048 data chunk and BCH ECC we will have
> to use this layout in the pages:
> 
>   ------------------------------------------------------------------------------
>   | 2048B data | 32B spare | 30B ECC || 2048B data | 32B spare | 30B ECC | ... |
>   ------------------------------------------------------------------------------
> 
> The last remaining area is unusable (i.e. wasted).

Why is it wasted? With a 2176B buffer, you can fit more than 2048+32+30.
Are you simplifying things to support only NAND geometries like the
tradiditional large page 2KB+64? (If so, what happens with 4KB pages
that need higher level of ECC than can fit in 64 x 2 = 128B?) And in the
2KB+64 case, why is the 64-32-30=2B wasted?

> To match this, my current (already working!) implementation acts like
> a layout "impedance matcher" to produce in an internal driver's buffer

Maybe I'm in the wrong field, but I'm not sure how an impedance matcher
applies here.

> this layout:
> 
>   ------------------------------------------
>   |     4096B data     |     64B spare     |
>   ------------------------------------------

What is this "internal buffer"? (I'll read through your patches in a bit
and find out, perhaps?) Just the raw data + spare that you are ready to
read/write? Are you dropping the ECC from this buffer? Doesn't it need
to be returned to the callee (when the 'oob_required' flag is true)?

> In order to achieve reading (for instance), we issue several READ0 commands
> (with some additional controller-specific magic) and read two chunks of 2080B
> (2048 data + 64 spare) each.

The math is a little inconsistent here and elsewhere. Do you mean two
chunks of 2080B (2048 data + 32 spare)?

> The driver accomodates this data to expose the NAND base a contiguous 4160B buffer
> (4096 data + 64 spare).

This math matches up right, if it's double the 2KB+32 instead of double
2KB+64.

> * ECC
> 
> The controller has built-in hardware ECC capabilities. In addition it is completely
> configurable, and we can choose between Hamming and BCH ECC. If we choose BCH ECC
> then the ECC code will be calculated for each transfered chunk and expected to be
> located (when reading/programming) at specific locations.

At "specific locations", but always within the 30B region that you've
been mapping out?

> So, repeating the above scheme, a 2048B data chunk will be followed by 32B spare,
> and then the ECC controller will read/write the ECC code (30B in this case):
> 
>   ------------------------------------
>   | 2048B data | 32B spare | 30B ECC |
>   ------------------------------------

Is ECC always 30B? Or is this just the maximum size, so you always
reserve 30B?

> * OOB
> 
> Because of the above scheme, and because the "spare" OOB is really located in
> the middle of a page, spare OOB cannot be read or write independently of the
> data area. In other words, in order to read the OOB (aka READOOB), the entire
> page (aka READ0) has to be read.
> 
> In the same sense, in order to write to the spare OOB (aka SEQIN,
> column = 4096 + PAGEPROG) the driver has to read the entire page first to the
> driver's buffer. Then it should fill the OOB, and finally program the entire page,
> data and oob included.
> 
> Notice, that while this is possible, I haven't included OOB only write support
> (i.e. OOB write without data write) in this first patchset. I'm not sure why
> would we need it, so I'd like to know others opinion on this matter.

Depends on what you mean by "OOB only write support". You need to
support marking bad block markers, at least, which are "OOB only"
writes.

> Of course, writing to the OOB is supported, as long as this write is done
> *with* data. Following the examples above, writing an entire 4096 + OOB page
> is supported.
> 
> * Clocking and timings
> 
> This first patchset adds a dummy nand-clock to the device tree just to allow
> the driver to get it. Timings configuration is overriden for now using the
> 'keep-config' DT parameter. The next round will likely include proper clock
> support plus timings configuration.

Be sure to include devicetree@vger.kernel.org and one or more of the
maintainers for your proper DT bindings patches.

Brian
