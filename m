Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1avmwU-0005DM-Av
 for linux-mtd@lists.infradead.org; Thu, 28 Apr 2016 14:29:23 +0000
From: Richard Weinberger <richard@nod.at>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Cc: Alexander Kaplan <alex@nextthing.co>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 David Gstir <david@sigma-star.at>,
 David Oberhollenzer <goliath@sigma-star.at>,
 =?UTF-8?B?QmVhbiBIdW8g6ZyN5paM5paMIChiZWFuaHVvKQ==?= <beanhuo@micron.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
Subject: [ANNOUNCE] MLC support for UBI/UBIFS
Message-ID: <57221E28.9050102@nod.at>
Date: Thu, 28 Apr 2016 16:28:56 +0200
MIME-Version: 1.0
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

Dear MTD folks,

As some of you might have noticed, the last few months Boris and I have been
heavily working on MLC support. Our first approaches targeted UBIFS since
we thought MLC NAND's most annoying feature, namely the paired pages constraint,
can be best addressed there. It turned out that UBIFS is the wrong layer and given
the massive changes required to make it work, we had to go back to the drawing board,
multiple times.
Finally we came up with an approach which is a) rather simple and b) working.
This approach operates on the UBI level and we call it "LEB consolidation",
it is also known as "write lower and merge".

The main problem with paired pages is that an interrupted write to a high page
will also damage the content of its partner, the low page. Some MLC NANDs
offer a safe SLC mode where only low pages are exposed and prevent data loss
due to interrupted writes can happen. The obvious down side is that you lose 50%
of your NAND's storage capacity.
While SLC mode is clearly not an option for us, the "LEB consolidation" approach
makes partial use of it. On MLC, UBI will operate on PEBs in two modes,
software emulated SLC and raw mode.
By default, LEBs are written in software emulated SLC mode. Hence, only lower
pages are written, such that interrupted writes won't damage already written
data. If UBI notices that it has no longer enough writable LEBs, it tries
to consolidate two full LEBs. Full means that the last page has been written
and therefore no further writes are expected. This works since you can program
an erase block only in linear manner and on MLC the number of programs (NOP)
is in general 1. This also means that there are no subpages.
LEB consolidation works more or less like UBI's atomic LEB change feature.
But instead of atomically exchanging the data of a LEB, it atomically moves
the data of two LEBs into another LEB in raw mode.
The pages of the source LEBs are read in SLC mode, on the consolidated LEB both
low and high pages are used since raw mode is used.
Consolidated LEBs are read-only by design. Especially as we merge only full LEBs.
This also implies that a PEB can host one or two LEBs.
If one LEB of a consolidated LEB pair is unmapped the other LEB is marked as
candidate for consolidation again.
If a PEB hosts consolidated LEBs it will carry two successive volume headers
right after the erase counter header. Currently the relationship between PEBs
and LEBs is 1:1, with MLC it is 1:2. Which means that UBI will expose two
times as many LEBs as PEBs. This complicates UBI a bit and userspace interfacing
needs some massaging since in many places the number of LEBs and PEBs were considered
to be the same, and the two different concepts where kind of interchangeable.
With MLC this matters and makes a difference.
As UBI is only allowed to consolidate full LEBs, a user on top of UBI should try
to fill LEBs as much as possible before mapping a new LEB. If half of all
available LEBs are mapped but not filled UBI will refuse to map more since all
available PEBs are full and there is no empty PEB to atomically consolidate two LEBs
into. Luckily, UBIFS behaves sane and does not map new LEBs before previously mapped
LEBs aren't full.

Adding MLC support in UBI requires changes in the on-flash layout, as now two
volume headers can exist. The original plan was just raising UBI version
from 1 to 2 but this turned out as almost impossible as UBI userspace
tools are not designed for backwards compatibility.
They refuse to work when UBI version is not 1. Instead of doing a flag day
release we stay with version 1 (for ever) and add a new feature flag to
UBI which indicates which extra features the implementation supports.
0x1 will be "basic UBI version 1" support, and 0x2 "LEB consolidation".

Our implementation is being tested on nandsim (with some hacks to have paired pages)
and real MLC NAND from Hynix, Micron and Toshiba.
So far it seems to work and no major issues have been spotted.
Of course it survives UBI tests too.

We'll soon start sending patches. Some patches are already on
the list and/or need an update.
For full MLC NAND support patch series for NAND core,
UBI and mtd-utils will be sent.

The current (not ready for mainline) code can be found here:
git://git.infradead.org/users/rw/ubi-mlc.git wip

Feedback and tests reports are very welcome!

We'd like to thank Next Thing co. for funding this work! :-)

Thanks,
//richard
