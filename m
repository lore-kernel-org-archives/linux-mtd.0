From: "Gupta, Pekon" <pekon@ti.com>
To: Gerhard Sittig <gsi@denx.de>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>
Subject: RE: [PATCH v1 3/3] mtd: nand: introduce a READMODE command
Date: Tue, 1 Apr 2014 06:56:18 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73EABA0E1@DBDE04.ent.ti.com>
References: <1396100184-7110-1-git-send-email-gsi@denx.de>
 <1396100184-7110-4-git-send-email-gsi@denx.de>
In-Reply-To: <1396100184-7110-4-git-send-email-gsi@denx.de>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Alexander Shiyan <shc_work@mail.ru>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Gerhard,

>From: Gerhard Sittig [mailto:gsi@denx.de]
>
>the nand_command_lp() implementation derives a "READPAGE" sequence from
>a passed in READ0 opcode, i.e. emits a sequence of READ0 _and_ READSTART
>commands in this case
>
>introduce a "READMODE" command which sends the READ0 opcode to the chip
>exclusively and doesn't send the READSTART opcode
>
>such a "READMODE" command is useful in the context of on-die-ECC support
>where a sequence of READ0, READSTART, STATUS, READ0 is required; having
>support for READMODE in the common nand_command_lp() routine avoids the
>need for duplication and open coded cmd_ctrl() calls
>
>Signed-off-by: Gerhard Sittig <gsi@denx.de>
>---
> drivers/mtd/nand/nand_base.c |    4 +++-
> include/linux/mtd/nand.h     |   11 +++++++++++
> 2 files changed, 14 insertions(+), 1 deletion(-)
>
>diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
>index 9ae99c1ba772..9a74bd06004b 100644
>--- a/drivers/mtd/nand/nand_base.c
>+++ b/drivers/mtd/nand/nand_base.c
>@@ -706,7 +706,8 @@ static void nand_command_lp(struct mtd_info *mtd, unsi=
gned int command,
>
> 	/*
> 	 * Program and erase have their own busy handlers status, sequential
>-	 * in and status need no delay.
>+	 * in and status need no delay, read mode just reverts back to
>+	 * data output after a status command and needs no read start.
> 	 */
> 	switch (command) {
>
>@@ -717,6 +718,7 @@ static void nand_command_lp(struct mtd_info *mtd, unsi=
gned int command,
> 	case NAND_CMD_SEQIN:
> 	case NAND_CMD_RNDIN:
> 	case NAND_CMD_STATUS:
>+	case NAND_CMD_READMODE:
> 		return;
>

Thanks. This should help 'David Mosberger <davidm@egauge.net>' patches.
I think, NAND_CMD_READMODE should also be added to nand_command(), right ? =
=20
With that please feel free to apply ..
Acked-by: Pekon Gupta <pekon@ti.com>

with regards, pekon
