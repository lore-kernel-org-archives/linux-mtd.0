Received: from eu1sys200aog103.obsmtp.com ([207.126.144.115])
	by canuck.infradead.org with smtps (Exim 4.76 #1 (Red Hat Linux))
	id 1RDvRg-00056i-NK
	for linux-mtd@lists.infradead.org; Wed, 12 Oct 2011 09:49:53 +0000
Message-ID: <4E9562B9.3000907@st.com>
Date: Wed, 12 Oct 2011 10:49:45 +0100
From: Angus CLARK <angus.clark@st.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Re: [PATCH 1/8] mtd: nand: remove NAND_BBT_SCANBYTE1AND6 option
References: <mailman.2004.1310142982.20023.linux-mtd@lists.infradead.org>
In-Reply-To: <mailman.2004.1310142982.20023.linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: ivan.djelic@parrot.com, Brian Norris <computersforpeace@gmail.com>,
	matthieu.castet@parrot.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Brian,

On Tue, 31 May 2011 16:31:20 -0700, Brian Norris
<computersforpeace@gmail.com> wrote:
> This patch reverts most of:
>     commit 58373ff0afff4cc8ac40608872995f4d87eb72ec
>     mtd: nand: more BB Detection refactoring and dynamic scan options
> 
> According to the discussion at:
>     http://lists.infradead.org/pipermail/linux-mtd/2011-May/035696.html
> the NAND_BBT_SCANBYTE1AND6 flag, although technically valid, can break
> some existing ECC layouts that use the 6th byte in the OOB for ECC data.
> Furthermore, we apparently do not need to scan both bytes 1 and 6 in
> the OOB region of the devices under consideration; instead, we only need
> to scan one or the other.
> 
> Thus, the NAND_BBT_SCANBYTE1AND6 flag is at best unnecessary and at
> worst a regression.
> 

Sorry to bring this up again, but I just thought you might be interested
in the following clarification I received from Micron (who now own the
ST/Numonyx NAND portfolio):

---
"In the factory, we mark bad blocks by programming (in the spare area of
the first page of the block) SPARE[0] = 00h and SPARE[5] = 00h.  On x16
devices we program SPARE[0] = 0000h.

Due to the fact that the block is bad, it may be impossible to program
some of the bits.  The most reliable test for a bad block is therefore:

x8 device: (SPARE[0] != FFh) OR (SPARE[5] != FFh)
x16 device: (SPARE[0] != FFFFh)

Having said that, it is very unlikely that all 8 bits of a location will
be stuck at '1', so if you just want to test SPARE[0] OR SPARE[5], that
should be reliable enough for most applications."
---

So, I believe this confirms your original interpretation of the
ST/Numonyx datasheets and that the NAND_BBT_SCANBYTE1AND6 is valid.  The
question still remains what to do with this information, in view of the
potential clash with existing ECC layouts (including the default S/W ECC
layout).  A couple of options you proposed previously:

1) Retain the NAND_BBT_SCANBYTE1AND6 flag, and add some code to mask out
the flag if necessary based on the ECC layout (possibly in
nand_scan_tail()?).

2) Revert the flag, as done in this patch, and accept the very small
possibility of missing some factory-marked bad-blocks.

My preference would be 1), since it is technically correct, and would
allow drivers to make use of the information if possible, while avoiding
regressions associated with ECC layout clashes.

I appreciate the patch for 2) has already made it to l2-mtd2.6 so it may
be too late anyway...

Cheers,

Angus
