Received: from ppp16.spiderweb.com.au ([202.76.149.16] helo=lapdancer.baythorne.internal)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16Y7RT-0007R6-00
	for <linux-mtd@lists.infradead.org>; Tue, 05 Feb 2002 15:23:34 +0000
Date: Wed, 6 Feb 2002 01:30:42 +1000 (EST)
From: David Woodhouse <dwmw2@infradead.org>
To: =?ISO-8859-1?Q?Veli-Pekka_Yl=F6nen?= <velpeyl@utu.fi>
cc: linux-mtd@lists.infradead.org
Subject: Re: NAND flash and JFFS(2)
In-Reply-To: <Pine.SOL.4.30.0202051629570.28565-100000@alya.utu.fi>
Message-ID: <Pine.LNX.4.44.0202060108320.5284-100000@lapdancer.baythorne.internal>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

On Tue, 5 Feb 2002, Veli-Pekka Yl=F6nen wrote:

> I read TODO file in JFFS2 sources and found this:
>=20
> - NAND flash support:
>     - Fix locking in jffs2_garbage_collect_deletion_dirent().
>     - Move CLEANMARKER into the 'spare' area.
>     - Write batching - build up a NAND-page worth of data and write out a=
ll in
> =09one go, using the hardware ECC or block-based software ECC. This gives=
 us
> =09some interesting problems, but it's not that bad:
> =09- When we go to erase a block from which we've been garbage-collecting=
,
> =09  we have to make sure that the nodes in it _really_ are obsolete, and
> =09  the new node which finally obsoletes the block we want to erase isn'=
t
> =09  still waiting in the write-buffer. We can do this by sticking such
> =09  blocks not on the erase_pending_list, but on a new erase_pending_wbu=
f
> =09  list, and then moving them to the erase_pending_list when the buffer=
 is
> =09  flushed.
> =09- fsync() becomes a non-NOP.
> =09- Deal with write errors. Data don't get lost - we just have to write
> =09  the affected node(s) out again somewhere else.
>=20
> Is somebody already working on this?

Vaguely.=20

I've had a go at some of these - I got terminally bored on the plane to
linux.conf.au so 've just checked in code to the experimental
jffs2-nand-branch in CVS which does the CLEANMARKER bit, although we
probably want to check where we should put the cleanmarker in NAND flash
to avoid all the hardware ECC arrangments. I know this one is OK with the
DiskOnChip but don't remember offhand where SmartMedia puts its ECC data.

I've done some of the write batching too - we have code to set up a write
buffer, flush it when it's full, etc., do the erase_pending_wbuf_list
thing, etc.

It doesn't yet deal nicely with write errors, although we know how, and I
haven't implemented fsync(). Neither have I tested that any of it does
anything more than actually compile - it's just there as more verbose
outline of what I think needs doing than what I put in the TODO list.

The whole thing wants a locking audit too. It's not just the=20
gc_deletion_dirent code, although that is known broken and a little hard=20
to fix - we need to drop the lock for reading the block in question, but=20
then when we lock again we have to start again from the beginning of the=20
list - and how do we know where we got to, given that the block we just=20
looked at, the block before it and the block after it could all have gone=
=20
from the list?

Perhaps we want to make the erase_completion_lock into a semaphore. I'm=20
sure we could persuade the MTD maintainer to retrospectively declare that=
=20
all erase callbacks must happen in process context. In fact, the freeing=20
of the node refs in erased blocks already happens from process context -=20
we could possibly just invent a new semaphore which protects us from that.

> I read also in the archive that JFFS should support NAND. Is this true?
>
> I have made the raw NAND interface work but JFFS and JFFS2 doesn't
> do the batching and tries to write multiple times to same
> page.

JFFS ought to be OK on chips that can take ten write cycles per 512-byte=20
page, because it uses writev to ensure that nodes are written in one go,=20
and no node will be less than 52 bytes.=20

On NAND flash chips which can do fewer than ten writes per page, JFFS=20
probably won't work either.

--=20
dwmw2
