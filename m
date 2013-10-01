Received: from mail-vb0-x236.google.com ([2607:f8b0:400c:c02::236])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VR8xX-00008j-W0
 for linux-mtd@lists.infradead.org; Tue, 01 Oct 2013 23:02:28 +0000
Received: by mail-vb0-f54.google.com with SMTP id q14so13584vbe.27
 for <linux-mtd@lists.infradead.org>; Tue, 01 Oct 2013 16:02:06 -0700 (PDT)
MIME-Version: 1.0
From: Avery Pennarun <apenwarr@gmail.com>
Date: Tue, 1 Oct 2013 16:01:45 -0700
Message-ID: <CAHqTa-0d=U+W2nju8WeCJ=gL+ja8DVuK0BUquajOL6qXV5C0+g@mail.gmail.com>
Subject: Page corruption when writing non-sequential pages in an MLC NAND
 eraseblock
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi everyone,

Does this sound familiar?

Setup:
- Linux 2.6.37 or 3.2.26 (apologies for the old versions, but I
couldn't find any related patches in newer kernels and these are
embedded systems that are a bit hard to upgrade)
- Micron MT29F16G08CBACAWP - MLC NAND
- 1 Mbyte eraseblocks
- 1 kbyte pages
- Tested on two different hardware platforms (MIPS and ARM devices)

Steps:
- Disable ECC to avoid any confusion (ECC turns out to not affect the
test results, but I wanted to make sure)
- Erase any eraseblock
- Write all-zeroes to page 0x18 of that eraseblock; read it back -> ok
- Write all-zeroes to page 0x12 of that eraseblock; read it back ->
FAIL, all 0xff instead
- Read page 0x18 -> completely random data (about 12% of bits are flipped)

More details:
- It doesn't happen with a related Micron SLC NAND
- If you write the pages in the opposite order there is no problem
- Delays before/after reading and writing, and the sequence of reads,
has no effect
- This turns out to happen for any pair of pages, where pairs are
always exactly 6 pages apart (n and n+6), other than the first and
last 4 pages in each eraseblock, which are paired with different pages
to make the math work out

I've read about the concept of MLC "paired pages" causing corruption
elsewhere, but it supposedly only happens when you get a power
failure.  It's happening for me during normal runtime, which seems
wrong.

Has anyone heard of this?

Thanks,

Avery
