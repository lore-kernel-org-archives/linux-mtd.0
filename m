Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by casper.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W8xe2-0005SZ-CN
 for linux-mtd@lists.infradead.org; Thu, 30 Jan 2014 19:51:27 +0000
Date: Thu, 30 Jan 2014 16:51:08 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: "Gupta, Pekon" <pekon@ti.com>
Subject: Re: [PATCH 1/2] mtd: nand: force NAND_CMD_READID onto 8-bit bus
Message-ID: <20140130195107.GB10673@localhost>
References: <1391033909-6563-1-git-send-email-computersforpeace@gmail.com>
 <20980858CB6D3A4BAE95CA194937D5E73EA6C83A@DBDE04.ent.ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20980858CB6D3A4BAE95CA194937D5E73EA6C83A@DBDE04.ent.ti.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "u.kleine-koenig@pengutronix.de" <u.kleine-koenig@pengutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Jan 30, 2014 at 07:17:29PM +0000, Gupta, Pekon wrote:
> Hi Brian,
> 
> >From: Brian Norris [mailto:computersforpeace@gmail.com]
> >diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
> >index a719686c9cce..c034dc4224cb 100644
> >--- a/include/linux/mtd/nand.h
> >+++ b/include/linux/mtd/nand.h
> >@@ -832,4 +832,14 @@ static inline bool nand_is_slc(struct nand_chip *chip)
> > {
> > 	return chip->bits_per_cell == 1;
> > }
> >+
> >+/**
> >+ * Check if the opcode's address should be sent only on the lower 8 bits
> >+ * @command: opcode to check
> >+ */
> >+static inline int nand_opcode_8bits(unsigned int command)
> >+{
> >+	return command == NAND_CMD_READID;
> >+}
> >+
> >
> Can 'nand_opcode_8bits, made a macro instead of inline function ?
> #define IS_8BIT_CMD(cmd)  (unlikely(cmd == NAND_CMD_READID))
> 
> Because 'nand_opcode_8bits' is used in nand_command() and nand_command_lp()
> which is performance critical code (chip->cmd is called multiple times for fetching
> page data and OOB). Though we should expect compiler to treat this inline function
> same as macro here, But just to be doubly sure for future changes also.
> 

I'm not a compiler guru, but I'd be very surprised if the compiler would make
a difference here, given the function is static, inline and small. Besides,
an inline function is more readable and type-aware. I'd say it's the Right
Thing to do.

Nevertheless, I did a small check on my platform (handbuilt ARM GCC 4.7.2) and
both macro and inline is compiled into a "cmp" instruction. The unlikely
doesn't seem to have any effect.
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
