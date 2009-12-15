Received: from eu1sys200aog104.obsmtp.com ([207.126.144.117])
	by bombadil.infradead.org with smtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NKbje-0002qQ-Kr
	for linux-mtd@lists.infradead.org; Tue, 15 Dec 2009 18:03:05 +0000
Received: from zeta.dmz-eu.st.com (ns2.st.com [164.129.230.9])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6C0CD12D
	for <linux-mtd@lists.infradead.org>;
	Tue, 15 Dec 2009 18:02:50 +0000 (GMT)
Received: from mail1.bri.st.com (mail1.bri.st.com [10.65.7.198])
	by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2FB9CCDF
	for <linux-mtd@lists.infradead.org>;
	Tue, 15 Dec 2009 18:02:50 +0000 (GMT)
From: David MCKAY <david.mckay@st.com>
To: linux-mtd@lists.infradead.org
Subject: vmalloc used for BBT scanning
Date: Tue, 15 Dec 2009 18:02:48 +0000
MIME-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200912151802.49153.david.mckay@st.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I'm having some problems with BBT support.  Commit
c3f8abf481c2d2b221b028f7369bc6dd39a9590e changed the BBT scanning code
to use vmalloc() rather than kmalloc() to scan for the BBT.

The hardware I'm working on uses a DMA engine, My driver expects to
be able to do DMA on the buffers it is given. It's not very happy if
you pass it a vmalloc address.

It's very similar to the issue with the JFFS2 Summary blocks, which
was fixed by b7600dba6d4fbf3897e517b322d006986cce831a. I fell over
that one too:-)

If I change it back to a kmalloc() all is well, but since this is 128K
erase block + OOB , that is really too big  for kmalloc() hence the
original patch.

I see there has been some discussion of this and related issues a few
months ago on the list, it appears that ubi also uses vmalloc() in a
similar sort of way. 

Most of the usage in ubi at least is of the sort 

{
	vmalloc(erase_block_size);
	do something with it()
	vfree()
}


One solution I could think of is to use a special mtd specific
allocator for this style of usage, with the memory coming from a
pre-allocated chunk rather than vmalloc(). I think something like this
could be done without too much effort or massive code changes, as it
could default to vmalloc(). It's not terribly elegant however.

Another way is to do what the omap onenand driver does and detect that
a vmalloc() address is being passed in and do something. However, I'm
not convinced that the driver is the right place to be doing this sort
of thing. Also, as Russell King has pointed out that code won't work
on many arches as it doesn't take any account of aliasing. I guess the
OMAP2 platform doesn't have aliasing.

Or come up with something more clever in the higher levels.

Anyway, I'm wondering if anybody is actively looking at this area, I
suspect that DMA engines are going to become increasingly common for
driving NAND.

Thanks!
