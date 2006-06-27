Subject: Re: [RFC] arm : ALIGNMENT_TRAP and MTD
From: David Woodhouse <dwmw2@infradead.org>
To: "Hyok S. Choi" <hyok.choi@samsung.com>
In-Reply-To: <200606231635.40655.hyok.choi@samsung.com>
References: <200606231635.40655.hyok.choi@samsung.com>
Content-Type: text/plain
Date: Tue, 27 Jun 2006 14:25:16 +0100
Message-Id: <1151414717.17609.124.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, davem@davemloft.net,
	alan@lxorguk.ukuu.org.uk
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2006-06-23 at 16:35 +0900, Hyok S. Choi wrote:
> Dear MTD folks,
> 
> In ARM arch, we're merging my uClinux/ARM tree into mainline.
> While merging a certain CPU support codes, we found a bit doubt on the
> conditional including of MTD configuration file in arch/arm/Kconfig.
> The CPU core has no H/W based alignment mechanism, thus can not handle unaligned access.
> However as many uClinux archs do, many of the platforms had supported MTD drivers.
> 
> Currently, _only_ ARM arch includes MTD configuration file conditionally as follows:
> 
> if ALIGNMENT_TRAP
> source "drivers/mtd/Kconfig"
> endif

Historically, ARM was the only architecture which attempted to run Linux
without unaligned accesses "just working" -- either natively in the CPU
or through fixups. This situation was considered 'broken'. 

The problem manifests itself in the NOR chip drivers, but only if the
bus width is greater than 1 byte, and if a user of the MTD device writes
from a buffer which is not aligned in memory to that bus width.

JFFS2 does this, when garbage-collecting dirent nodes. Since the name
field is just an array of characters, it's stored in memory in the
'struct jffs2_full_dirent' without alignment constraints -- and it's
always an odd address because it comes after the single char used for
the 'type' field.

I did once add a couple of 'get_unaligned()' calls to the places in the
NOR flash chip drivers which matter, but Alan objected -- because
get_unaligned() should be reserved for the case where the datum is
_expected_ to be unaligned, not where it simply _might_ be unaligned.

These days, we support a number of architectures which just _cannot_ fix
up alignment errors. On FR-V without an MMU, for example, the alignment
trap is an imprecise exception. The networking code now works correctly
in that situation too, I believe -- I think the correct fix would be for
me to put back the get_unaligned() in a few places which I originally
added them, but then removed them again when Alan objected. 

However, the objection that get_unaligned() should be used only when the
datum is _expected_ to be unaligned is still a valid one. It'll lead to
suboptimal code on architectures where the CPU doesn't natively handle
misaligned loads, when the misaligned case is _not_ the common case.

I think what we should actually do, if we're going to accept that Linux
runs without alignment fixups, is introduce a new get_maybe_unaligned()
call which should be used if there is a low, but non-zero, probability
of the address being unaligned. It would still take the
dereference-and-fault path on most architectures, but those
architectures which _really_ cannot deal with an alignment trap can emit
the slow-path instead.

Actually, I think I'd rather see just a second argument to
get_unaligned() which gives an estimate of the probability that the
address is unaligned. Each architecture can make its own decision about
where the threshold should be between just dereferencing the pointer and
maybe taking a trap, and emitting the slow code to load it manually. It
depends on the relative costs of each, on any given architecture.

-- 
dwmw2
