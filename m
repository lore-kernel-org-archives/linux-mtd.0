Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZrAIz-0004L0-4B
 for linux-mtd@lists.infradead.org; Tue, 27 Oct 2015 19:53:14 +0000
Subject: Re: UBIFS corruption after power cut - possibly unstable bits issue?
To: Tim Harvey <tharvey@gateworks.com>
References: <CAJ+vNU3eu4qBxaZpDRY=Fidv=9iGmA5pq8b4yUfyBayLTos5oQ@mail.gmail.com>
 <562E8697.50207@nod.at>
 <CAJ+vNU1J+MvyWgY1FPv4G7TxQLDtPJWdWw=DP5+1h2HcTi-SxQ@mail.gmail.com>
 <562E9E0B.5030204@nod.at>
 <CAJ+vNU1GV1GxYfLgHh2ZerAGjRxi=azXHLg_dNO=BaUrkkDU1w@mail.gmail.com>
Cc: Artem Bityutskiy <dedekind1@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>, linux-mtd@lists.infradead.org
From: Richard Weinberger <richard@nod.at>
Message-ID: <562FD60E.9020807@nod.at>
Date: Tue, 27 Oct 2015 20:52:46 +0100
MIME-Version: 1.0
In-Reply-To: <CAJ+vNU1GV1GxYfLgHh2ZerAGjRxi=azXHLg_dNO=BaUrkkDU1w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Tim,

Am 27.10.2015 um 20:01 schrieb Tim Harvey:
> I'm not understanding what is making you say that the issue I
> encountered is 'not' the unstable bits issue described at
> http://www.linux-mtd.infradead.org/doc/ubifs.html#L_unstable_bits? My
> understanding is that the 'unstable bit' issue refers to bits which
> are truly unstable and can read either way each and every read due to
> not getting properly erased/written.

You are right. I was sorting out the unstable bits issue a bit too
early. I'm sorry.
Let's double check. Can you enable UBI verbose logging while testing?
Such that we can see which blocks were written/erased while the power cut
happened?

> If I understand what you are saying you are thinking that my issue is
> instead the result of a never-used PEB that had bit-flips from the
> manufacturer in which case the bits would read the same every time?
> How can we know this PEB was never before used and isn't one that was
> being erased/written during a power cut?

I've seen bit flips on cheap SLC NANDs which came out of a sudden.
According to the FAE I was talking to this is legit for NAND
as long the flipping bits are fixable by the ECC engine.

> In my test scenario where the rootfs is mounted from the kernel
> read-only, but later mounted read-write by userspace (yet not being
> specifically written to by userspace) then power-cut should 'any' NAND
> writes would be occurring at all? And if not as I suspect, then how
> could a subsequent boot end up using a PEB that may have been never
> previously used and have bit-flips from the manufacturer?

UBIFS's has a wandering journal. During the remount it moved maybe.
But for a more expressive analysis I'd need a nanddump to find out which
blocks are in which role.
Can you share the nanddump?

> Should we be doing an erase block on every NAND block during our board
> manufacturing process to avoid this?

Sorry, I don't understand this sentence.
Do you mean a full erasure of the whole NAND?
If so, it would not help as the bit flips can come later.
(Without writing/erasing the block)
The root cause is that your NFC cannot correct bit flips on empty pages.

> It sounds like this 'unexpected bit-flips on erased pages from the
> mfg' issue is a ticking time-bomb for people using ubi/ubifs NAND.
> Shouldn't the http://www.linux-mtd.infradead.org/doc/ubifs.html page
> be updated to refer to this known issue as well as the unstable bit
> issue?

As I said the root cause is that some NFCs cannot correct bit flips on empty
pages.
Instead of putting warnings to ubifs.html I'd love to see a solution on the
said drivers or MTD core.

> I can add some debugging to find out - what specifically would be
> helpful to add?

A hexdump of the buffer would be a good start.

> Thanks for the help!

Thanks for sharing your issues. This is the only way
to address them.
That said, as far on no board I had access to I was able to reproduce the unstable bits
issue. It was always something else.

Thanks,
//richard
