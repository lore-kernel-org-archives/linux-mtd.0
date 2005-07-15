Received: from mail.ssa.crane.navy.mil ([164.227.42.3])
	by pentafluge.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1DtWld-0002no-TD
	for linux-mtd@lists.infradead.org; Fri, 15 Jul 2005 21:26:58 +0100
Sender: tdennist@ssa.crane.navy.mil
Message-ID: <42D81ABD.B94A12FB@ssa.crane.navy.mil>
Date: Fri, 15 Jul 2005 15:21:17 -0500
From: Todd Denniston <Todd.Denniston@ssa.crane.navy.mil>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Subject: pcmciamtd and FTL status question.
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,
I am on a project that needs to support some "PRETEC", " SERIES-2  4MB FLASH
CARD" which are Intel type 2 "linear flash" cards.

In the original setup they were working on a 2.4.x kernel with the old
pcmcia-cs drivers (memory_cs & ftl_cs).  I would like to upgrade the
environment to a 2.6.X based kernel so that current fixes can be applied to
systems with a simple yum update.

What I would really like to know is has someone, who is willing to explain
how and what versions are needed, gotten a 2.6.X kernel + MTD->pcmciamtd +
MTD->flt working with an Intel type 2 "linear flash" card to the point where
they could ftlformat card_dev;mkdosfs ftl_card_dev; read&write_files on
dos_ftl_card_dev ???? 
Please CC me if you respond as I have not signed on to the list yet, thanks. 

>From the lack of traffic on the linux-mtd list, especially success stories,
about the pcmciamtd and even less when I combine that with ftl, I am also
wondering if they have stabilized to a useable point yet.

Read on if you want to see what I have tried and failed with.

I have built the kernel (kernel-2.6.11-1.14_FC3.src.rpm) to include
pcmciamtd and FTL,
in /etc/pcmcia/config I have set:
device "pcmciamtd" module "pcmciamtd"

#and a bit farther in the file:
card "PRETEC"
  version "PRETEC", " SERIES-2  4MB FLASH CARD"
  bind "pcmciamtd"


however when I boot up and try to use it I get (Note " \ \n\t"s added for
reading pleasure):
cardmgr[18200]: watching 2 sockets
kernel: cs: IO port probe 0xc00-0xcff: clean.
kernel: cs: IO port probe 0xc00-0xcff: clean.
kernel: cs: IO port probe 0x100-0x4ff: \
	excluding 0x170-0x177 0x200-0x207 0x370-0x37f
kernel: cs: IO port probe 0x100-0x4ff: \
	excluding 0x170-0x177 0x200-0x207 0x370-0x37f
kernel: cs: IO port probe 0xa00-0xaff: clean.
kernel: cs: IO port probe 0xa00-0xaff: clean.
cardmgr[18201]: socket 1: PRETEC
kernel: pcmciamtd: PCMCIA Flash memory card driver $Revision: 1.51 $
cardmgr[18201]: get dev info on socket 1 failed: \
	Resource temporarily unavailable

If I config the card with ftl:
card "PRETEC"
  version "PRETEC", " SERIES-2  4MB FLASH CARD"
  bind "pcmciamtd", "ftl"

I get a different message which seems strange considering what I have
configured:
cardmgr[18378]: socket 1: PRETEC
kernel: 2.6. kernels use pcmciamtd instead of memory_cs.c and do not require
special
kernel: MTD handling any more.

Why do I get this message, I have it configured for pcmciamtd and I have all
memory_cs lines commented out of the config?!!?

I have also attempted to use the mtd CVS (from ~Jul 15 10:43EST) but it
failed to compile with an error about:
drivers/mtd/maps/pcmciamtd.c:821: error: elements of array `pcmciamtd_ids'
have incomplete type
and other warnings and errors that I believe are caused by that.

-- 
Todd Denniston
Crane Division, Naval Surface Warfare Center (NSWC Crane) 
Harnessing the Power of Technology for the Warfighter
