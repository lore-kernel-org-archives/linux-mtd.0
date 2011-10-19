Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1RGblo-0001q9-H2
	for linux-mtd@lists.infradead.org; Wed, 19 Oct 2011 19:25:45 +0000
Received: by wwj40 with SMTP id 40so2033780wwj.18
	for <linux-mtd@lists.infradead.org>;
	Wed, 19 Oct 2011 12:25:41 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <4E9562B9.3000907@st.com>
References: <mailman.2004.1310142982.20023.linux-mtd@lists.infradead.org>
	<4E9562B9.3000907@st.com>
Date: Wed, 19 Oct 2011 12:25:41 -0700
Message-ID: <CAN8TOE9Sy1X=SO4eKpW0o8J9EOLpF9w7aJubZYFwswWGbZkSAA@mail.gmail.com>
Subject: Re: [PATCH 1/8] mtd: nand: remove NAND_BBT_SCANBYTE1AND6 option
From: Brian Norris <computersforpeace@gmail.com>
To: Angus CLARK <angus.clark@st.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: ivan.djelic@parrot.com, linux-mtd@lists.infradead.org,
	matthieu.castet@parrot.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Oct 12, 2011 at 2:49 AM, Angus CLARK <angus.clark@st.com> wrote:
> Sorry to bring this up again, but I just thought you might be interested
> in the following clarification I received from Micron (who now own the
> ST/Numonyx NAND portfolio):

Nice to have a real manufacturer response.

> So, I believe this confirms your original interpretation of the
> ST/Numonyx datasheets and that the NAND_BBT_SCANBYTE1AND6 is valid.

I love being right :) But I feel this is really a matter of theory,
not practice.

> The
> question still remains what to do with this information, in view of the
> potential clash with existing ECC layouts (including the default S/W ECC
> layout). =A0A couple of options you proposed previously:

Just a memory recall: are the clashes only on 2KB page, 64B OOB
devices with "SCANBYTE1AND6" and certain ECC layouts? It's not an
issue with any small page (512B+16B) NAND with
NAND_SMALL_BADBLOCK_POS, is it? I suppose small page NAND uses smaller
ECC?

> 1) Retain the NAND_BBT_SCANBYTE1AND6 flag, and add some code to mask out
> the flag if necessary based on the ECC layout (possibly in
> nand_scan_tail()?).
>
> 2) Revert the flag, as done in this patch, and accept the very small
> possibility of missing some factory-marked bad-blocks.
>
> My preference would be 1), since it is technically correct, and would
> allow drivers to make use of the information if possible, while avoiding
> regressions associated with ECC layout clashes.

I thought (and still believe) that (1) is technically correct, but as
Micron states, it's not necessary. Option (2) is easier, and in my
experience, bad blocks are actually successfully written with all
zeros (whole block, not just the special OOB indicator). So really,
this is a matter of how much code should be added for an exception
that (arguably) provides no benefit.

> I appreciate the patch for 2) has already made it to l2-mtd2.6 so it may
> be too late anyway...

It's not too late, but even if we want to re-implement my patch, I
wouldn't recommend doing it exactly the same way. I think it was a
little ugly and could cause two consecutive writes to the same page,
which is sometimes a problem for newer flash (but may not be a problem
on the old flash to which this option would actually apply).

So I'm fine with leaving the code as it stands in l2-mtd-2.6. If
there's a consensus formed around reverting my revert, then I can
probably help, but I'm unlikely to take the initiative myself.

Brian
