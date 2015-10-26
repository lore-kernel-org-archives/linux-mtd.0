Received: from mail-pa0-x22f.google.com ([2607:f8b0:400e:c03::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZqmII-0006Ea-0u
 for linux-mtd@lists.infradead.org; Mon, 26 Oct 2015 18:14:54 +0000
Received: by padhk11 with SMTP id hk11so195368503pad.1
 for <linux-mtd@lists.infradead.org>; Mon, 26 Oct 2015 11:14:33 -0700 (PDT)
Date: Mon, 26 Oct 2015 11:14:30 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Clay McClure <clay@daemons.net>
Cc: Ray Jui <rjui@broadcom.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Scott Branden <sbranden@broadcom.com>,
 "bcm-kernel-feedback-list@broadcom.com"
 <bcm-kernel-feedback-list@broadcom.com>
Subject: Re: [PATCH] mtd: brcmnand: Fix NAND_CMD_PARAM byte order
Message-ID: <20151026181430.GA13239@google.com>
References: <1445629626-27474-1-git-send-email-clay@daemons.net>
 <20151023232742.GV13239@google.com> <562AD54B.2000501@broadcom.com>
 <20151024011219.GW13239@google.com>
 <CAOVqfW-1YurDwJbKDgUJdQZVxJ_rWDg-x+28++SZtg-vPO4kYg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOVqfW-1YurDwJbKDgUJdQZVxJ_rWDg-x+28++SZtg-vPO4kYg@mail.gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Oct 24, 2015 at 11:35:11AM -0700, Clay McClure wrote:
> On Friday, October 23, 2015, Brian Norris <computersforpeace@gmail.com> wrote:
> 
> > But to be clear: none of the systems in question are running with big
> > endian CPUs, correct? If not, then it's apparent we have to do something
> > different for iProc-based chips than for STB chips; we can't just fiddle
> > with the cpu_to_*() macros. Maybe this works?
> >
> > diff --git a/drivers/mtd/nand/brcmnand/brcmnand.c
> > b/drivers/mtd/nand/brcmnand/brcmnand.c
> > index 9ü61a9ee4369c..073dbe4ce9bc 100644
> > --- a/drivers/mtd/nand/brcmnand/brcmnand.c
> > +++ b/drivers/mtd/nand/brcmnand/brcmnand.c
> > @@ -1168,8 +1168,6 @@ static void brcmnand_cmdfunc(struct mtd_info *mtd,
> > unsigned command,
> >                         native_cmd == CMD_PARAMETER_CHANGE_COL) {
> >                 int i;
> >
> > -               brcmnand_soc_data_bus_prepare(ctrl->soc);
> > -
> >                 /*
> >                  * Must cache the FLASH_CACHE now, since changes in
> >                  * SECTOR_SIZE_1K may invalidate it
> > @@ -1177,8 +1175,6 @@ static void brcmnand_cmdfunc(struct mtd_info *mtd,
> > unsigned command,
> >                 for (i = 0; i < FC_WORDS; i++)
> >                         ctrl->flash_cache[i] = brcmnand_read_fc(ctrl, i);
> >
> > -               brcmnand_soc_data_bus_unprepare(ctrl->soc);
> > -
> >                 /* Cleanup from HW quirk: restore SECTOR_SIZE_1K */
> >                 if (host->hwcfg.sector_size_1k)
> >                         brcmnand_set_sector_size_1k(host,
> >
> 
> Yes, that does solve the problem I'm seeing. I actually tried
> this approach before submitting my previous patch, but opted not to submit
> this because it seemed that some thought and effort had gone into making
> little-endian APB transfers (it's one of the only things iproc_nand
> actually does), and I assumed it was being done for a reason.
> 
> If you're happy with this, would you mind if I submit this patch?

Feel free, though I suppose technically it'd have my authorship. So for
the above:

Signed-off-by: Brian Norris <computersforpeace@gmail.com>

I'd like an ack (or test) from Ray too, if possible. Perhaps a comment
is in order too, to explain why there is no bus swapping for that
instance of brcmnand_read_fc(). (AIUI, the reason is that the base STB
design pushes out this data in big endian, so we need to match this on
iProc.)

> Also, you mentioned that the original code could stand to be cleaned up a
> bit. Any specific clean ups you'd like to see?

I wrote up this patch, but it's untested. If you can test this in
addition with the above, that'd be great. I'd also like a test from the
STB folks, if possible.

Brian

----8<----
>From 8efc0791d4dbb4a326e2223b14aeae04933ee9af Mon Sep 17 00:00:00 2001
From: Brian Norris <computersforpeace@gmail.com>
Date: Fri, 23 Oct 2015 17:39:40 -0700
Subject: [PATCH] mtd: brcmnand: clean up flash cache for parameter pages

The read_byte() handling for accessing the flash cache has some awkward
swapping being done in the read_byte() function. Let's just make this a
byte array, and do the swapping with the word-level macros during the
initial buffer copy.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
Cc: Clay McClure <clay@daemons.net>
Cc: Ray Jui <rjui@broadcom.com>
Cc: Scott Branden <sbranden@broadcom.com>
---
 drivers/mtd/nand/brcmnand/brcmnand.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/brcmnand/brcmnand.c b/drivers/mtd/nand/brcmnand/brcmnand.c
index d694d876631e..249b3728dc75 100644
--- a/drivers/mtd/nand/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/brcmnand/brcmnand.c
@@ -134,7 +134,7 @@ struct brcmnand_controller {
 	dma_addr_t		dma_pa;
 
 	/* in-memory cache of the FLASH_CACHE, used only for some commands */
-	u32			flash_cache[FC_WORDS];
+	u8			flash_cache[FC_BYTES];
 
 	/* Controller revision details */
 	const u16		*reg_offsets;
@@ -1166,6 +1166,8 @@ static void brcmnand_cmdfunc(struct mtd_info *mtd, unsigned command,
 
 	if (native_cmd == CMD_PARAMETER_READ ||
 			native_cmd == CMD_PARAMETER_CHANGE_COL) {
+		/* Copy flash cache word-wise */
+		u32 *flash_cache = (u32 *)ctrl->flash_cache;
 		int i;
 
 		brcmnand_soc_data_bus_prepare(ctrl->soc);
@@ -1175,7 +1177,8 @@ static void brcmnand_cmdfunc(struct mtd_info *mtd, unsigned command,
 		 * SECTOR_SIZE_1K may invalidate it
 		 */
 		for (i = 0; i < FC_WORDS; i++)
-			ctrl->flash_cache[i] = brcmnand_read_fc(ctrl, i);
+			/* cache is big endian for parameter pages? */
+			flash_cache[i] = be32_to_cpu(brcmnand_read_fc(ctrl, i));
 
 		brcmnand_soc_data_bus_unprepare(ctrl->soc);
 
@@ -1228,8 +1231,7 @@ static uint8_t brcmnand_read_byte(struct mtd_info *mtd)
 		if (host->last_byte > 0 && offs == 0)
 			chip->cmdfunc(mtd, NAND_CMD_RNDOUT, addr, -1);
 
-		ret = ctrl->flash_cache[offs >> 2] >>
-					(24 - ((offs & 0x03) << 3));
+		ret = ctrl->flash_cache[offs];
 		break;
 	case NAND_CMD_GET_FEATURES:
 		if (host->last_byte >= ONFI_SUBFEATURE_PARAM_LEN) {
-- 
2.6.0.rc2.230.g3dd15c0
