Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com
 ([52.27.115.49] helo=osg.samsung.com)
 by merlin.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dBWet-0005ga-Dm
 for linux-mtd@lists.infradead.org; Fri, 19 May 2017 01:24:49 +0000
From: Mauro Carvalho Chehab <mchehab@s-opensource.com>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@s-opensource.com>,
 Mauro Carvalho Chehab <mchehab@infradead.org>,
 linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-mtd@lists.infradead.org,
 Anil S Keshavamurthy <anil.s.keshavamurthy@intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 William Breathitt Gray <vilhelm.gray@gmail.com>,
 Steffen Klassert <steffen.klassert@secunet.com>,
 Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
 Johannes Thumshirn <morbidrsa@gmail.com>, linux-crypto@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>,
 "Richard Russon (FlatCap)" <ldm@flatcap.org>,
 Jaroslav Kysela <perex@perex.cz>, openipmi-developer@lists.sourceforge.net,
 Marc Zyngier <marc.zyngier@arm.com>, Darren Hart <dvhart@infradead.org>,
 linux-ntfs-dev@lists.sourceforge.net,
 Ananth N Mavinakayanahalli <ananth@linux.vnet.ibm.com>,
 Corey Minyard <minyard@acm.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 00/30] Standardize doc formats - part 2
Date: Thu, 18 May 2017 22:23:52 -0300
Message-Id: <cover.1495156975.git.mchehab@s-opensource.com>
Sender: Mauro Carvalho Chehab <mchehab@smtp.s-opensource.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Each document under Documentation/*.txt has its own format.
Some follow markup notations, some don't even have a title!

In order to try to get some order on it, change the document
style to the standard we're adopting after the adoption of
ReStructured Text.

The documents touched on this series now build fine with
Sphinx, if renamed to *.rst extension.

The main goal with this is to teach people by example about
what format is expected on newer documents. It also helps
to add those files to Kernel books.

In order to make things more palatable, I'm spliting the
conversion into three parts.

This is	part 2.

Mauro Carvalho Chehab (30):
  iostats.txt: update it to cover recent Kernels
  IPMI.txt: standardize document format
  IRQ-affinity.txt: standardize document format
  IRQ-domain.txt: standardize document format
  irqflags-tracing.txt: standardize document format
  IRQ.txt: add a markup for its title
  isapnp.txt: promote title level
  isa.txt: standardize document format
  kernel-per-CPU-kthreads.txt: standardize document format
  kobject.txt: standardize document format
  kprobes.txt: standardize document format
  kref.txt: standardize document format
  kselftest.txt: standardize document format
  ldm.txt: standardize document format
  lockup-watchdogs.txt: standardize document format
  lzo.txt: standardize document format
  mailbox.txt: standardize document format
  memory-barriers.txt: standardize document format
  memory-barriers.txt: use literals for variables
  memory-hotplug.txt: standardize document format
  men-chameleon-bus.txt: standardize document format
  nommu-mmap.txt: standardize document format
  nommu-mmap.txt: don't use all upper case on titles
  ntb.txt: standardize document format
  numastat.txt: standardize document format
  padata.txt: standardize document format
  parport-lowlevel.txt: standardize document format
  percpu-rw-semaphore.txt: standardize document format
  phy.txt: standardize document format
  pi-futex.txt: standardize document format

 Documentation/IPMI.txt                    |   76 +-
 Documentation/IRQ-affinity.txt            |   77 +-
 Documentation/IRQ-domain.txt              |   69 +-
 Documentation/IRQ.txt                     |    2 +
 Documentation/iostats.txt                 |   44 +-
 Documentation/irqflags-tracing.txt        |   10 +-
 Documentation/isa.txt                     |   53 +-
 Documentation/isapnp.txt                  |    1 +
 Documentation/kernel-per-CPU-kthreads.txt |  156 +++-
 Documentation/kobject.txt                 |   69 +-
 Documentation/kprobes.txt                 |  450 ++++++----
 Documentation/kref.txt                    |  285 ++++---
 Documentation/kselftest.txt               |   37 +-
 Documentation/ldm.txt                     |   54 +-
 Documentation/lockup-watchdogs.txt        |    3 +-
 Documentation/lzo.txt                     |   27 +-
 Documentation/mailbox.txt                 |  181 ++--
 Documentation/memory-barriers.txt         |  794 +++++++++---------
 Documentation/memory-hotplug.txt          |  357 ++++----
 Documentation/men-chameleon-bus.txt       |  298 +++----
 Documentation/nommu-mmap.txt              |   68 +-
 Documentation/ntb.txt                     |   55 +-
 Documentation/numastat.txt                |    5 +-
 Documentation/padata.txt                  |   27 +-
 Documentation/parport-lowlevel.txt        | 1303 ++++++++++++++++++-----------
 Documentation/percpu-rw-semaphore.txt     |    3 +-
 Documentation/phy.txt                     |  106 ++-
 Documentation/pi-futex.txt                |   15 +-
 28 files changed, 2683 insertions(+), 1942 deletions(-)

-- 
2.9.4
