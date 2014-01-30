Received: from bear.ext.ti.com ([192.94.94.41])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W8x7m-0002bW-0O
 for linux-mtd@lists.infradead.org; Thu, 30 Jan 2014 19:18:06 +0000
From: "Gupta, Pekon" <pekon@ti.com>
To: Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: RE: [PATCH 1/2] mtd: nand: force NAND_CMD_READID onto 8-bit bus
Date: Thu, 30 Jan 2014 19:17:29 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73EA6C83A@DBDE04.ent.ti.com>
References: <1391033909-6563-1-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1391033909-6563-1-git-send-email-computersforpeace@gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 "u.kleine-koenig@pengutronix.de" <u.kleine-koenig@pengutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Brian,

>From: Brian Norris [mailto:computersforpeace@gmail.com]
>diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
>index a719686c9cce..c034dc4224cb 100644
>--- a/include/linux/mtd/nand.h
>+++ b/include/linux/mtd/nand.h
>@@ -832,4 +832,14 @@ static inline bool nand_is_slc(struct nand_chip *chip=
)
> {
> 	return chip->bits_per_cell =3D=3D 1;
> }
>+
>+/**
>+ * Check if the opcode's address should be sent only on the lower 8 bits
>+ * @command: opcode to check
>+ */
>+static inline int nand_opcode_8bits(unsigned int command)
>+{
>+	return command =3D=3D NAND_CMD_READID;
>+}
>+
>
Can 'nand_opcode_8bits, made a macro instead of inline function ?
#define IS_8BIT_CMD(cmd)  (unlikely(cmd =3D=3D NAND_CMD_READID))

Because 'nand_opcode_8bits' is used in nand_command() and nand_command_lp()
which is performance critical code (chip->cmd is called multiple times for =
fetching
page data and OOB). Though we should expect compiler to treat this inline f=
unction
same as macro here, But just to be doubly sure for future changes also.

[1] http://stackoverflow.com/questions/1571392/pros-and-cons-of-different-m=
acro-function-inline-methods-in-c
[2] http://stackoverflow.com/questions/5226803/inline-function-v-macro-in-c=
-whats-the-overhead-memory-speed

with regards, pekon
