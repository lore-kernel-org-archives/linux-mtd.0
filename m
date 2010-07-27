Received: from mail-iw0-f177.google.com ([209.85.214.177])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Odr3U-0006ES-Eo
	for linux-mtd@lists.infradead.org; Tue, 27 Jul 2010 20:47:17 +0000
Received: by iwn40 with SMTP id 40so4642890iwn.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 27 Jul 2010 13:47:15 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1280243535.3021.29.camel@localhost.localdomain>
References: <AANLkTi=nYBryUf8SyNFAcx_PPqTfdmY=x835Q-RhLmAn@mail.gmail.com>
	<1280121714.14917.40.camel@localhost>
	<AANLkTinJbZXx+YY7dxhmuEJ4XgN4Fj77=fFo_2WYL1fJ@mail.gmail.com>
	<1280243535.3021.29.camel@localhost.localdomain>
Date: Tue, 27 Jul 2010 16:47:13 -0400
Message-ID: <AANLkTimY5d6_koSrmg7Ser0O1SveWCBpYs76tEqd3GaX@mail.gmail.com>
Subject: Re: ubi_eba_init_scan: cannot reserve enough PEBs
From: "Matthew L. Creech" <mlcreech@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jul 27, 2010 at 11:12 AM, Artem Bityutskiy <dedekind1@gmail.com> wr=
ote:
>
> OK, you are right, UBI should not bug you so early, there are still
> plenty of reserved PEBs left. What do you think about the following
> algorithm:
>
> 1. If this is a new image, preserve current behavior and warn.
> 2. If we see that this is a system which has already been used, we warn
> only when the reserve is really about to end, say, 5% of the reserve is
> left.
>

Sounds fine to me.  And the warning as-is isn't necessarily
inaccurate; were it not for the errors later on, I probably would've
assumed (correctly) that it's simply due to the fact that some NAND
blocks which were initially good have since gone bad, causing my
reserve pool of eraseblocks to drop.

Then again, that should probably be expected on any long-running NAND
device, so it might make sense to only show the warning on a new
image.  :)

>> Could this account for the warning and/or the UBIFS error below? =A0Or
>> would these kinds of problems manifest in a different way entirely?
>
> Well, theoretically they can. But if users did not re-flash your
> devices, then obviously not.
>

>
> I'm sure your ring buffer contains more information. This is one of the
> reasons I gave you the above link - it explains that not all messages go
> to console and how to get all meassages. Try to use dmesg. In UBIFS code
> I see that 'ubifs_read_node()' calls 'dbg_dump_node()' which should dump
> the node.
>

Sorry, I missed the bit about "ignore_loglevel" on serial consoles.  A
more complete log is available here (it's around 5MB):

http://mcreech.com/work/ubi-error.txt

>
> May be if I have a NAND dump of your broken device I can look at it, but
> do not promise anything, and I'm also on holiday :-)
>

Sure, I'll try to set up a NFS root so that I can boot without flash.
I realize it might not help much in diagnosing this problem
after-the-fact, though.

>
> What is your kernel? If it is old, make sure you have fixes from the
> back-port trees.
>

Vanilla 2.6.31, plus patches for UnionFS and YAFFS (unused) support
and a few board-specific items.  One of the devices was running
development firmware, so it was using 2.6.34 at the time at which
problems were first seen.  So I'm assuming that kernel version
probably doesn't make much difference, unless there are significant
changes sitting in the UBI git tree that don't get pushed upstream as
part of the kernel release cycle.

>
> This really does not look like a NAND/MTD driver issue. More look like
> either an UBIFS bug of some kind of corruption which corrupted an EC or
> VID header, then UBI decided to erase this PEB, and then UBIFS reads all
> 0xFFs from there.
>
> The second theory should BTW be fixed. Indeed, when UBI finds a PEB with
> corrupted headers, it adds this PEB to the 'corr' list, and then just
> erases. But this is wrong! It should erase them only if there are all
> 0xFFs in the rest of the block.
>

Makes sense.  Unfortunately it's difficult to reproduce the problem
(I've certainly tried), so this change probably wouldn't help me in
the short-term.  However, it would definitely help if/when I encounter
the issue again on another device, and will certainly help anybody
else who sees similar issues in the future.

Thanks again for your help Artem (especially while on vacation).  :)

--=20
Matthew L. Creech
