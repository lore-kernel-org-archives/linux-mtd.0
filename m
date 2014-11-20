Received: from mout.web.de ([212.227.15.3])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XrTxX-0003fn-1l
 for linux-mtd@lists.infradead.org; Thu, 20 Nov 2014 15:47:52 +0000
MIME-Version: 1.0
Message-ID: <trinity-73ac0136-01d6-4251-acb9-e48ca8ce1273-1416498438753@3capp-webde-bs05>
From: "Roland Kletzing" <devzero@web.de>
To: linux-mtd@lists.infradead.org
Subject: please consider removing netsc520 driver from drivers/mtd/maps/
Content-Type: text/plain; charset=UTF-8
Date: Thu, 20 Nov 2014 16:47:18 +0100
Content-Transfer-Encoding: quoted-printable
Cc: fengguang.wu@intel.com, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

every now and then i stumble across this "broken" module, and wonder if thi=
s=20
cannot be removed in 2014. I`m quite sure nobody will be missing that one =
in=20
3.18+ kernels.

it`s still being shipped as a module by popular distros like recent debian=
 or
ubuntu. waste of diskspace and compile time, imho.

there are even chances that these driver being accidentally statically lin=
ked
into kernels, e.g. https://lkml.org/lkml/2013/9/25/666 (cc fenguang wu bec=
ause=20
of this)

also see

https://bugzilla.kernel.org/show_bug.cgi?id=3D10840
---
This is a driver for an obscure embedded demonstration board. It's also on=
e where
there doesn't seem to be a good way to sanity check before probing. Quite =
why any
standard PC distro would ship it is beyond me
---

https://bugzilla.kernel.org/show_bug.cgi?id=3D11226
---
This is a specific driver for an embedded bosrd without autodetect possibi=
lities,
so you shouldn't be loading it on random unrelated hardware.
---

netsc520.c:
 * The NetSc520 is a demonstration board for the Elan Sc520 processor avai=
lable
 * from AMD.  It has a single back of 16 megs of 32-bit Flash ROM and anot=
her
 * 16 megs of SDRAM.

http://sewoon.com/icmaster/Semi/amd/pdf/24323a.pdf
---
NetSC520 Demonstration Board User =E2=80=99s Manual
Demonstration Board Features
The NetSC520 demonstration board provides the following features. For deta=
ils see
Board Functional Description
*ElanSC520 microcontroller
*AMD Am79C973 PCnet-FAST III single-chip 10/100 Mbit/s Ethernet controller
*16 Mbytes SDRAM
*16 Mbytes XIP Flash memory
---

regards
roland

ps:
not subscribed to this list - hope this list allows for unsubscribed posti=
ng=20
like lkml
