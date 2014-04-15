Received: from devils.ext.ti.com ([198.47.26.153])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WZuic-0002Hk-Bz
 for linux-mtd@lists.infradead.org; Tue, 15 Apr 2014 04:11:42 +0000
From: "Gupta, Pekon" <pekon@ti.com>
To: Gerhard Sittig <gsi@denx.de>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>
Subject: RE: [PATCH v2 3/3] mtd: nand: introduce a READMODE command
Date: Tue, 15 Apr 2014 04:10:15 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73EAC305C@DBDE04.ent.ti.com>
References: <1396611948-4523-1-git-send-email-gsi@denx.de>
 <1396611948-4523-4-git-send-email-gsi@denx.de>
In-Reply-To: <1396611948-4523-4-git-send-email-gsi@denx.de>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: David
 Mosberger <davidm@egauge.net>, Brian Norris <computersforpeace@gmail.com>,
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
>for the non-"large page" setup (i.e. the nand_command() routine) both
>commands "READMODE" and "READ0" are identical, "READSTART" exclusively
>applies to large page configurations
>
>Signed-off-by: Gerhard Sittig <gsi@denx.de>
>---
>changes in v2:
>- update the commmit message to discuss that for the nand_command()
>  routine READMODE results in identical behaviour as READ0
>- rephrase the NAND_CMD_READMODE command to better reflect that it
>  re-uses the NAND_CMD_READ0 opcode plus has high bits set
>
> drivers/mtd/nand/nand_base.c |    4 +++-
> include/linux/mtd/nand.h     |   11 +++++++++++
> 2 files changed, 14 insertions(+), 1 deletion(-)
>
>diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
>index 7108191b1598..50b8a2a93b4f 100644
>--- a/drivers/mtd/nand/nand_base.c
>+++ b/drivers/mtd/nand/nand_base.c
>@@ -711,7 +711,8 @@ static void nand_command_lp(struct mtd_info *mtd, unsi=
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
>@@ -722,6 +723,7 @@ static void nand_command_lp(struct mtd_info *mtd, unsi=
gned int command,
> 	case NAND_CMD_SEQIN:
> 	case NAND_CMD_RNDIN:
> 	case NAND_CMD_STATUS:
>+	case NAND_CMD_READMODE:
> 		return;
>
> 	case NAND_CMD_RESET:

You probably missed doing same change in nand_command() also.

with regards, pekon
