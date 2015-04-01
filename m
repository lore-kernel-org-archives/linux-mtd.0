Received: from smtp2-g21.free.fr ([2a01:e0c:1:1599::11])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YdLh6-0001pA-V6
 for linux-mtd@lists.infradead.org; Wed, 01 Apr 2015 16:40:46 +0000
Message-ID: <551C1F71.3040508@free.fr>
Date: Wed, 01 Apr 2015 18:40:17 +0200
From: Mason <slash.tmp@free.fr>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Tiny delays in drivers/mtd/nand/nand_base.c
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello everyone,

In drivers/mtd/nand/nand_base.c there are several instances of
the following code:

	/*
	 * Apply this short delay always to ensure that we do wait tWB in
	 * any case on any machine.
	 */
	ndelay(100);


Is the intent to spin for 100 nanoseconds?

It seems that, for most platforms, ndelay is defined as:
udelay(DIV_ROUND_UP(x, 1000))

So it will resolve to udelay(1) if I understand correctly?
(I suppose sleeping longer is not a problem.)

However the comment implies that 100 ns are sufficient, right?

So if I override ndelay with a function that sleeps *exactly*
the amount requested, everything should keep working?

The reason I ask is because someone added this comment in my
source tree:

#ifdef CONFIG_TANGOX
	udelay(1); /* needs to make it much longer than tWB */
#else
	ndelay(100);
#endif

Also I have to figure out why the build is not picking up this
definition for ndelay (from include/asm-generic/delay.h)

/* 0x5 is 2**32 / 1000000000 (rounded up) */
#define ndelay(n)							\
	({								\
		if (__builtin_constant_p(n)) {				\
			if ((n) / 20000 >= 1)				\
				__bad_ndelay();				\
			else						\
				__const_udelay((n) * 5ul);		\
		} else {						\
			__ndelay(n);					\
		}							\
	})

Although it seems it should take HZ into account, as the argument
is then multiplied by ticks_per_jiffy (which is FREQ/HZ).

Regards.
