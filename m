Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VWaX0-0003S1-7G
 for linux-mtd@lists.infradead.org; Wed, 16 Oct 2013 23:29:35 +0000
Date: Wed, 16 Oct 2013 20:29:16 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 00/21] Armada 370/XP NAND support
Message-ID: <20131016232916.GA5362@localhost>
References: <1379606505-2529-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <20130926195615.GK23337@ld-irv-0074.broadcom.com>
 <20130930122428.GA2417@localhost>
 <20131003000253.GX23337@ld-irv-0074.broadcom.com>
 <20131004194203.GB20476@localhost>
 <20131005000649.GZ23337@ld-irv-0074.broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20131005000649.GZ23337@ld-irv-0074.broadcom.com>
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

Let's continue the discussion about this controller and its ECC engine.

Sorry for the delayed reply. Also please bare with me as I'm not an MTD,
NAND or ECC expert; so feel free to correct any mis-understandings on
my side.

On Fri, Oct 04, 2013 at 05:06:49PM -0700, Brian Norris wrote:
> On Fri, Oct 04, 2013 at 04:42:04PM -0300, Ezequiel Garcia wrote:
> > On Wed, Oct 02, 2013 at 05:02:53PM -0700, Brian Norris wrote:
> > > On Mon, Sep 30, 2013 at 09:24:29AM -0300, Ezequiel Garcia wrote:
> > > > Notice that this means you can control the ECC strength: since the ECC
> > > > is always 30B, and it's calculated on the transfered chunk you can
> > > > configure the controller to transfer the page in 1024B chunks and get a
> > > > 30B ECC for each of this chunk, thus doubling the ECC strength.
> > > 
> > > This is a little odd. Your ECC HW is not parameterized by ECC strength,
> > > but instead by ECC sector size? I think I have some comments for patch
> > > 5, relevant to this topic.
> > > 
> > 
> > Indeed. When ECC engine in the controller is set to do BCH, it always
> > store a 30-byte ECC code. This 30-byte code is calculated on the
> > transfered chunk, and since the chunk size is configurable we can
> > effectively configure the ECC strength.
> > 
> > The specification says
> 
> Is there a public URL for the specification?
> 

Not yet, but we're working very hard to get the spec to be published.

> > the ECC BCH engine can correct up to 16-bits, which means:
> 
> Is this your interpretation, or are you quoting the spec?
> 

I'm quoting the spec.

> > if the chunk is 2048 bytes you get BCH-4, and if the chunk
> > is set to be 1024 bytes, you get BCH-8.
> 
> That doesn't really make sense to me. If you can't post a public URL,
> can you paste the relevant text for this?
> 

I guess the above is not clear: I didn't mean BCH-4 or BCH-8 over any region.
Instead, I meant that: the spec says the ECC BCH engine can correct up to 16 bits
'per region', where 'region' is the amount of data the controller is
configured to transfer (which is arbitrary).

So, if you set the controller to transfer 2048B you can correct up to 16
bits on this 2048B region, or 4 bits per 512B, hence BCH-4.

If you set the controller to transfer 1024B you can correct up to 16
bits on this 1024B region, or 8 bits per 512B, hence BCH-8.

> Most NAND specifies a required correctability of something like "correct
> 1 bit error per 512 bytes" or "correct 4 bits per 512 bytes". These are
> not the same as "correct 1 bit per 2048 bytes" and "correct 4 bits per
> 2048 bytes", respectively, for obvious reasons.
> 
> So your "BCH-4" over a "2048 byte chunk" could be interpreted in
> multiple ways. I'll list a few.
> 
> (1) BCH-4 usually means 4 bit correction over a 512 byte region, to
>     match most SLC that might specify 4-bit correction. Applied to your
>     hardware, it could possibly be that the 2048 byte region is actually
>     4 smaller regions which are corrected separately, each with 4 bit
>     correction. The ECC metadata just happens to be stored in 30 bytes
>     of OOB (each 512-byte "sub-step" uses 7.5 bytes of spare area??)
> 
>     Another way to look at this: perhaps your ECC "chunk size" (the
>     contiguous region over which your ECC is applied and transferred
>     atomically) is different than the "correction region" (the region
>     over which a certain number of bits may be corrected).
> 

Yes, the above (1) matches this hardware, expect for one point. The
specifications says that "the BCH engine corrects up to 16 errors
over the entire page". So there aren't any "smaller" regions, and the
hardware operates on the entire page.

However, the BCH does not operate on the "page" but rather on the
transfered region (which is configurable). So, as I explained above,
you can actually correct 16 bits per 2048B or 16 bits per 1024B depending
on the way you configure the controller.

Is this clearer now?

> 
> Barring more lucid documentation, you might want to verify this with
> some tests. If you can support raw (no ECC) programming, this is a case
> where you could induce bit errors and see how many can be corrected in
> various patterns. But that's only necessary if your documentation sucks
> too badly or is not public.
> 

Hm.. I'll see if I can do this. It sounds like an interesting test.

> Regarding patch 5 (might as well mention it here), you are only checking
> the ecc_strength_ds field for 4. You are not checking ecc_step_ds, which
> likely will be 512 or 1024. Both parameters are relevant to determining
> what ECC types are strong enough.

Yup, those checks are really crappy in this v1, I have a v2 ready to be
submitted that takes care of this in a much cleaner (and safer way).

> But it's confusing enough right now to
> even determine what your hardware means when you say "BCH-4", so we
> might not be ready to handle this yet...
> 

Regarding this: I'd really like to understand better this 'step' concept
and it applicability on this controller. So any clarification is welcome :)

As far as I can see: currently the hardware does ECC corrections in a
completely transparent fashion and merely 'reports' the no. of corrected
bits through some IRQ plus some registers.
Therefore, it implements the ecc.{read,write}_page() functions.

So, why should I tell the NAND core any of the ECC details?

I see other drivers need to implement some of the functions in the
nand_ecc_ctrl struct, such as: hwctl(), calculate() or correct().
However, I can't see how any of that applies on this controller.
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
