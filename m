MIME-Version: 1.0
Date: Wed, 24 Oct 2012 12:38:14 +0200
Message-ID: <CABYn4syj0GZAsDYVQfXg_qKAFkbrxPLoZWpKRzwf3gfRkMGZkQ@mail.gmail.com>
Subject: Possible regression in arm/io.h
From: Bastian Hecht <hechtb@googlemail.com>
To: will.deacon@arm.com
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Will,

your introduction of the "+Qo" in arch/arm/include/asm/io.h makes some
drivers fail to compile on newer gnu ARM gccs. Like in
drivers/mtd/nand/docg4.c there is an offset of 0x800 from a pointer
used to address I/O memory. This leads to the error message:

/tmp/ccwLMdCy.s: Error: bad immediate value for 8-bit offset (2048)

The gnu gcc people tracked it down to the asm directive "+Qo". Do we
really want to enforce to allow only addresses that are offsetable
with one byte? If I understand it correctly from the gnu gcc docs, the
"o" is doing this.

excerpt from asm/io.h:
static inline void __raw_writew(u16 val, volatile void __iomem *addr)
{
        asm volatile("strh %1, %0"
                     : "+Qo" (*(volatile u16 __force *)addr)
                     : "r" (val));
}

Bug report:
http://gcc.gnu.org/bugzilla/show_bug.cgi?id=54983

So do we want to remove the "o" from all __raw_readX and __raw_writeX
functions? I've tried it and stuff compiles again without errors.

cheers,

Bastian Hecht
