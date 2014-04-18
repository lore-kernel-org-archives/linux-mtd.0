From: "Gupta, Pekon" <pekon@ti.com>
To: Gerhard Sittig <gsi@denx.de>
Subject: RE: [PATCH v2 3/3] mtd: nand: introduce a READMODE command
Date: Fri, 18 Apr 2014 10:21:26 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73EAC3BF4@DBDE04.ent.ti.com>
References: <1396611948-4523-1-git-send-email-gsi@denx.de>
 <1396611948-4523-4-git-send-email-gsi@denx.de>
 <20980858CB6D3A4BAE95CA194937D5E73EAC305C@DBDE04.ent.ti.com>
 <20140415084301.GX3528@book.gsilab.sittig.org>
In-Reply-To: <20140415084301.GX3528@book.gsilab.sittig.org>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: David
 Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Alexander Shiyan <shc_work@mail.ru>, David Mosberger <davidm@egauge.net>
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
>>On Tue, 2014-04-15 at 04:10 +0000, Gupta, Pekon wrote:
>>
>> Hi Gerhard,
>>
>> >From: Gerhard Sittig [mailto:gsi@denx.de]
>> >
>> >the nand_command_lp() implementation derives a "READPAGE" sequence from
>> >a passed in READ0 opcode, i.e. emits a sequence of READ0 _and_ READSTAR=
T
>> >commands in this case
>> >
>> >introduce a "READMODE" command which sends the READ0 opcode to the chip
>> >exclusively and doesn't send the READSTART opcode
>> >
>> >such a "READMODE" command is useful in the context of on-die-ECC suppor=
t
>> >where a sequence of READ0, READSTART, STATUS, READ0 is required; having
>> >support for READMODE in the common nand_command_lp() routine avoids the
>> >need for duplication and open coded cmd_ctrl() calls
>> >
>> >for the non-"large page" setup (i.e. the nand_command() routine) both
>> >commands "READMODE" and "READ0" are identical, "READSTART" exclusively
>> >applies to large page configurations
>> >
>> >Signed-off-by: Gerhard Sittig <gsi@denx.de>
>> >---
>> >changes in v2:
>> >- update the commmit message to discuss that for the nand_command()
>> >  routine READMODE results in identical behaviour as READ0
>> >- rephrase the NAND_CMD_READMODE command to better reflect that it
>> >  re-uses the NAND_CMD_READ0 opcode plus has high bits set
>> >
>> > drivers/mtd/nand/nand_base.c |    4 +++-
>> > include/linux/mtd/nand.h     |   11 +++++++++++
>> > 2 files changed, 14 insertions(+), 1 deletion(-)
>> >
>> >diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.=
c
>> >index 7108191b1598..50b8a2a93b4f 100644
>> >--- a/drivers/mtd/nand/nand_base.c
>> >+++ b/drivers/mtd/nand/nand_base.c
>> >@@ -711,7 +711,8 @@ static void nand_command_lp(struct mtd_info *mtd, u=
nsigned int command,
>> >
>> > 	/*
>> > 	 * Program and erase have their own busy handlers status, sequential
>> >-	 * in and status need no delay.
>> >+	 * in and status need no delay, read mode just reverts back to
>> >+	 * data output after a status command and needs no read start.
>> > 	 */
>> > 	switch (command) {
>> >
>> >@@ -722,6 +723,7 @@ static void nand_command_lp(struct mtd_info *mtd, u=
nsigned int command,
>> > 	case NAND_CMD_SEQIN:
>> > 	case NAND_CMD_RNDIN:
>> > 	case NAND_CMD_STATUS:
>> >+	case NAND_CMD_READMODE:
>> > 		return;
>> >
>> > 	case NAND_CMD_RESET:
>>
>> You probably missed doing same change in nand_command() also.
>
>Thank you for looking at the patches, again!
>
>AFAICS nothing is missing, the difference is there by purpose.
>
>The READMODE command does not require special handling in the
>nand_command() case, as the sequence of READ0, READSTART, STATUS,
>READ0 does not apply there (it's only relevant to large page
>setups).
>
>In the nand_command() case the sequence would be READ0, STATUS,
>READ0 -- and so READ0 and READMODE are handled identically,
>READSTART does not exist in that scenario.  And the STATUS and
>READ0 only would apply in the on-die-ECC scenario, which might as
>well not occur at all without large pages.
>
>I tried to reason about this situation in the commit message, but
>might not have come up with the best phrases there.  (That's the
>reason for the excessive quotation above.)
>
>There is a difference between nand_command_lp() and
>nand_command() in that for the latter the re-emitted READMODE
>will result in another busy check (or a delay in the absence of
>an R/B pin condition).  So we fail on the safe side, which should
>be OK.
>
Ok thanks for the explanation, I missed reading your new commit message.
Though I don't have any small-page NAND device datasheet, but from the
code I can see the difference in implementation of nand_command() and
nand_command_lp() w.r.t. NAND_CMD_READ0 (0x00).

Probably for small-page devices, NAND_CMD_READ0 (0x00) need
not be followed by NAND_CMD_READSTART(0x30). So, for small-page
devices NAND_CMD_READ0(0x00) itself will act as NAND_CMD_READMODE.


>Would an improved commit message help?  Or shall I put an
>explicit comment into nand_command() about why it's different
>from nand_command_lp()?  Although it already is, the situation is
>not new ...
>
I'll let Brian review it once. But from my side ...

Acked-by: Pekon Gupta <pekon@ti.com>

>
>virtually yours
>Gerhard Sittig
>--

Thanks.
with regards, pekon
