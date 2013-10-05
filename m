Received: from mail-oa0-x22d.google.com ([2607:f8b0:4003:c02::22d])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VSFOu-000265-7Y
 for linux-mtd@lists.infradead.org; Sat, 05 Oct 2013 00:07:18 +0000
Received: by mail-oa0-f45.google.com with SMTP id o17so4742460oag.32
 for <linux-mtd@lists.infradead.org>; Fri, 04 Oct 2013 17:06:54 -0700 (PDT)
Date: Fri, 4 Oct 2013 17:06:49 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: Re: [PATCH 00/21] Armada 370/XP NAND support
Message-ID: <20131005000649.GZ23337@ld-irv-0074.broadcom.com>
References: <1379606505-2529-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <20130926195615.GK23337@ld-irv-0074.broadcom.com>
 <20130930122428.GA2417@localhost>
 <20131003000253.GX23337@ld-irv-0074.broadcom.com>
 <20131004194203.GB20476@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20131004194203.GB20476@localhost>
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

On Fri, Oct 04, 2013 at 04:42:04PM -0300, Ezequiel Garcia wrote:
> On Wed, Oct 02, 2013 at 05:02:53PM -0700, Brian Norris wrote:
> > On Mon, Sep 30, 2013 at 09:24:29AM -0300, Ezequiel Garcia wrote:
> > > Notice that this means you can control the ECC strength: since the ECC
> > > is always 30B, and it's calculated on the transfered chunk you can
> > > configure the controller to transfer the page in 1024B chunks and get a
> > > 30B ECC for each of this chunk, thus doubling the ECC strength.
> > 
> > This is a little odd. Your ECC HW is not parameterized by ECC strength,
> > but instead by ECC sector size? I think I have some comments for patch
> > 5, relevant to this topic.
> > 
> 
> Indeed. When ECC engine in the controller is set to do BCH, it always
> store a 30-byte ECC code. This 30-byte code is calculated on the
> transfered chunk, and since the chunk size is configurable we can
> effectively configure the ECC strength.
> 
> The specification says

Is there a public URL for the specification?

> the ECC BCH engine can correct up to 16-bits, which means:

Is this your interpretation, or are you quoting the spec?

> if the chunk is 2048 bytes you get BCH-4, and if the chunk
> is set to be 1024 bytes, you get BCH-8.

That doesn't really make sense to me. If you can't post a public URL,
can you paste the relevant text for this?

Most NAND specifies a required correctability of something like "correct
1 bit error per 512 bytes" or "correct 4 bits per 512 bytes". These are
not the same as "correct 1 bit per 2048 bytes" and "correct 4 bits per
2048 bytes", respectively, for obvious reasons.

So your "BCH-4" over a "2048 byte chunk" could be interpreted in
multiple ways. I'll list a few.

(1) BCH-4 usually means 4 bit correction over a 512 byte region, to
    match most SLC that might specify 4-bit correction. Applied to your
    hardware, it could possibly be that the 2048 byte region is actually
    4 smaller regions which are corrected separately, each with 4 bit
    correction. The ECC metadata just happens to be stored in 30 bytes
    of OOB (each 512-byte "sub-step" uses 7.5 bytes of spare area??)

    Another way to look at this: perhaps your ECC "chunk size" (the
    contiguous region over which your ECC is applied and transferred
    atomically) is different than the "correction region" (the region
    over which a certain number of bits may be corrected).

(2) Your BCH-4 over 2048 bytes really means what it says; it can only
    correct 4-bit in the 2048-byte area. This is sufficient for NAND
    that specify 1-bit correction per 512-bytes but not for those that
    specify 4-bit correction over 512-bytes.

Because an interpretation like (2) doesn't really match the NAND parts
you seem to be targeting, I'm inclined to think (1) is what the hardware
is doing. I also suspect (2) is wrong because the BCH algorithm (under
typical parameters) requires on the order of 6 to 8 bytes for storage,
regardless of the region it is correcting over. So "BCH-4" over 2048
bytes would only require 6 to 8 bytes of storage, not 30.

Barring more lucid documentation, you might want to verify this with
some tests. If you can support raw (no ECC) programming, this is a case
where you could induce bit errors and see how many can be corrected in
various patterns. But that's only necessary if your documentation sucks
too badly or is not public.

Regarding patch 5 (might as well mention it here), you are only checking
the ecc_strength_ds field for 4. You are not checking ecc_step_ds, which
likely will be 512 or 1024. Both parameters are relevant to determining
what ECC types are strong enough. But it's confusing enough right now to
even determine what your hardware means when you say "BCH-4", so we
might not be ready to handle this yet...

Brian
