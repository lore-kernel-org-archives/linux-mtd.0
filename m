Received: from mail-ob0-x22f.google.com ([2607:f8b0:4003:c01::22f])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W8yX8-0005A2-1p
 for linux-mtd@lists.infradead.org; Thu, 30 Jan 2014 20:48:23 +0000
Received: by mail-ob0-f175.google.com with SMTP id wn1so4061805obc.34
 for <linux-mtd@lists.infradead.org>; Thu, 30 Jan 2014 12:48:00 -0800 (PST)
Date: Thu, 30 Jan 2014 12:47:56 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: "Gupta, Pekon" <pekon@ti.com>
Subject: Re: [PATCH 1/2] mtd: nand: force NAND_CMD_READID onto 8-bit bus
Message-ID: <20140130204756.GI8919@ld-irv-0074>
References: <1391033909-6563-1-git-send-email-computersforpeace@gmail.com>
 <20980858CB6D3A4BAE95CA194937D5E73EA6C83A@DBDE04.ent.ti.com>
 <20140130195107.GB10673@localhost>
 <20980858CB6D3A4BAE95CA194937D5E73EA6C85E@DBDE04.ent.ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20980858CB6D3A4BAE95CA194937D5E73EA6C85E@DBDE04.ent.ti.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 "u.kleine-koenig@pengutronix.de" <u.kleine-koenig@pengutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Jan 30, 2014 at 08:18:07PM +0000, Pekon Gupta wrote:
> >> >+static inline int nand_opcode_8bits(unsigned int command)
> >> >+{
> >> >+	return command == NAND_CMD_READID;
> >> >+}
> >> >+
> >> >
> >> Can 'nand_opcode_8bits, made a macro instead of inline function ?
> >> #define IS_8BIT_CMD(cmd)  (unlikely(cmd == NAND_CMD_READID))
> >>
> >> Because 'nand_opcode_8bits' is used in nand_command() and nand_command_lp()
> >> which is performance critical code (chip->cmd is called multiple times for fetching
> >> page data and OOB). Though we should expect compiler to treat this inline function
> >> same as macro here, But just to be doubly sure for future changes also.
> >>
> >
> >I'm not a compiler guru, but I'd be very surprised if the compiler would make
> >a difference here, given the function is static, inline and small. Besides,
> >an inline function is more readable and type-aware. I'd say it's the Right
> >Thing to do.
> >
> >Nevertheless, I did a small check on my platform (handbuilt ARM GCC 4.7.2) and
> >both macro and inline is compiled into a "cmp" instruction. The unlikely
> >doesn't seem to have any effect.
> >
> Please check the JMP instruction just after CMP instruction..
> In-case of (unlikely(x == y)) JMP/JE will be used to branch when x == y.
> where as in-case of (likely(x == y)) JMP/JNE will be used to branch x != y.
...
> (this is my understanding, however may be for small branches this has
>  no effect because both paths can be fetched simultaneously into pipeline).

With small branches, ARM just turns them into very compact conditional
instructions, rather than true branches.

This program generates identical code for functionA() and functionB()
when compiled with -O2 on ARM:

/* ------------- BEGIN PROGRAM ---------------- */
#define unlikely(x)    __builtin_expect(!!(x), 0)
#define NAND_CMD_READID	17

#define NAND_OPCODE_8BITS(x) (unlikely(command == NAND_CMD_READID))

static inline int nand_opcode_8bits(unsigned int command)
{
	return unlikely(command == NAND_CMD_READID);
}

int functionA(int command, int col)
{
	if (nand_opcode_8bits(command))
		return col;
	return col >> 1;
}

int functionB(int command, int col)
{
	if (NAND_OPCODE_8BITS(command))
		return col;
	return col >> 1;
}
/* ------------- END PROGRAM ---------------- */

Disassembly:

00000000 <functionA>:
   0:   e3500011        cmp     r0, #17
   4:   11a010c1        asrne   r1, r1, #1
   8:   e1a00001        mov     r0, r1
   c:   e12fff1e        bx      lr

00000010 <functionB>:
  10:   e3500011        cmp     r0, #17
  14:   11a010c1        asrne   r1, r1, #1
  18:   e1a00001        mov     r0, r1
  1c:   e12fff1e        bx      lr

Let's stop the nonsense then :) If you really want to pursue this, give me (1)
an example where they compile differently with (2) real, significant
performance differences. The burden is on you!

Brian
