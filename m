Date: Wed, 28 May 2008 13:18:21 +0100 (BST)
From: Alexey Korolev <akorolev@infradead.org>
To: dwmw2@infradead.org, tglx@linutronix.de, joern@logfs.org,
	dedekind@infradead.org, linux-mtd@lists.infradead.org
Subject: [RFC/PATCH 0/3] NAND multiple plane feature 
Message-ID: <alpine.LFD.1.10.0805281300100.23606@pentafluge.infradead.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: vasiliy.leonenko@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Here is a new feature for NAND subsystem which enables NAND dual
(multiple) plane support in Linux. 

What is it?
NAND devices with dual plane architecture are divided into two physical
planes with odd and even blocks and make it possible to program in
parallel two pages, one per each plane. Dual plane erases, allows
parallel erase of two blocks: one per each memory plane.
This feature increases significantly NAND write performance. Performance
gain depends on platform configuration. Theoretically it could double
write/erase speed. 
I think this feature might be interesting for many people especially
considering that a lot of new NAND devices support it.

This is a first attempt to submit this feature into the kernel. NAND
dual plane feature was validated on MainstoneII platform with 2GB ST
NAND devices. Two file systems JFFS2 and YAFFS2 were verified.
Compatibility with single plane devices was validated (1GB IMFT NAND).

Patch is split into three parts:

Part 1. Identification of NAND multiple plane feature. According to
datasheets the 5th byte of id contains info about number of planes.
Part 2. Combination of pages/blocks on different planes into large one.
As multiple plane feature assumes simultaneous write/erase of several
pages/blocks at the same time, we have to report modified
page/eraseblock sizes to upper layers. Part 2 represents these
modifications.
Part 3. This part adds multiplane commands support to read/write/erase
procedures.

Your comments questions and suggestions are welcome. 

Thanks,
Alexey
