Received: from mail-pa0-x233.google.com ([2607:f8b0:400e:c03::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZpnO0-0000LF-3R
 for linux-mtd@lists.infradead.org; Sat, 24 Oct 2015 01:12:44 +0000
Received: by padhk11 with SMTP id hk11so132047056pad.1
 for <linux-mtd@lists.infradead.org>; Fri, 23 Oct 2015 18:12:22 -0700 (PDT)
Date: Fri, 23 Oct 2015 18:12:19 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Ray Jui <rjui@broadcom.com>
Cc: Clay McClure <clay@daemons.net>, linux-mtd@lists.infradead.org,
 Florian Fainelli <f.fainelli@gmail.com>,
 Scott Branden <sbranden@broadcom.com>,
 bcm-kernel-feedback-list@broadcom.com
Subject: Re: [PATCH] mtd: brcmnand: Fix NAND_CMD_PARAM byte order
Message-ID: <20151024011219.GW13239@google.com>
References: <1445629626-27474-1-git-send-email-clay@daemons.net>
 <20151023232742.GV13239@google.com> <562AD54B.2000501@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <562AD54B.2000501@broadcom.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Oct 23, 2015 at 05:48:11PM -0700, Ray Jui wrote:
> On 10/23/2015 4:27 PM, Brian Norris wrote:
> >On Fri, Oct 23, 2015 at 12:47:06PM -0700, Clay McClure wrote:
> >>On systems using Broadcom Cortex-A9 SoCs (BCM585XX, BCM586XX, BCM56340),
> >>nand_flash_detect_onfi() fails at boot with:
> >>
> >>     Could not find valid ONFI parameter page; aborting
> >>
> >>brcmnand_read_byte()'s NAND_CMD_PARAM handler assumes the in-memory
> >>cache of the NAND controller's FLASH_CACHE registers is big-endian.
> >>But the iproc_nand driver forces little-endian APB bus transfers,
> >>so the in-memory cache ends up exactly backwards.
> >>
> >>The solution is to swap flash_cache byte order before extracting
> >>bytes from it. NAND_CMD_PARAM is not an oft-used command, so we
> >>don't need to worry about the overhead of byte swaps here.
> >>
> >>Fixes: 27c5b17cd1b1 ("mtd: nand: add NAND driver "library" for Broadcom STB NAND controller")
> >>Signed-off-by: Clay McClure <clay@daemons.net>
> >>---
> >>  drivers/mtd/nand/brcmnand/brcmnand.c | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >>diff --git a/drivers/mtd/nand/brcmnand/brcmnand.c b/drivers/mtd/nand/brcmnand/brcmnand.c
> >>index 7c1c306..932bc49 100644
> >>--- a/drivers/mtd/nand/brcmnand/brcmnand.c
> >>+++ b/drivers/mtd/nand/brcmnand/brcmnand.c
> >>@@ -1228,7 +1228,7 @@ static uint8_t brcmnand_read_byte(struct mtd_info *mtd)
> >>  		if (host->last_byte > 0 && offs == 0)
> >>  			chip->cmdfunc(mtd, NAND_CMD_RNDOUT, addr, -1);
> >>
> >>-		ret = ctrl->flash_cache[offs >> 2] >>
> >>+		ret = __cpu_to_be32(ctrl->flash_cache[offs >> 2]) >>
> >
> >This is most definitely wrong, as it breaks all the other little endian
> >systems that are using this. Not to say that the original code is
> >pretty... (It really should be cleaned up a bit.)
> >
> >Anyway, since looks like you're using iproc_nand, I'd solicit Scott and
> >Ray's opinions on what's really wrong here. Have you guys tested ONFI
> >paramater pages for Cygnus?
> >
> >Brian
> >
> 
> No, we have not tested ONFI parameter pages on Cygnus. And I believe
> this is observed on NSP instead of Cygnus? It looks like Cygnus and
> other iProc chips should have the same issue though.

OK, that's why I was asking. I expected that if Clay is messing with the
APB control, then you'd have the same problem.

> According to the commit message, it looks like the original logic is
> making the assumption that data in the flash cache buffer is in BE
> format?

Right, the current logic is treating it like big endian. All I can say
is that it works for a large class of little endian MIPS and ARM brcmstb
systems that I (used to) maintain, so I guess the cached data *is* in a
big endian format on those systems.

Really, I'm not too surprised that the behavior would be context
dependent, depending on the type of command sent to the controller. I
can easily imagine the hardware designers have the PARAMATER_READ path
looking different than the data path.

> I thought the raw NAND data in is expected to be in LE
> format, and data stored in the flash cache buffer here would be in
> the native CPU endian format since __raw_readl was used?
> 
> If so, then should the logic here be the following?
> 
> ret = cpu_to_le32(ctrl->flash_cache[offs >> 2]) >> ((offs & 0x03) << 3);

I guess so, but that's getting even uglier, not prettier. I have a
different patch locally that I can post to help clean it up.

But to be clear: none of the systems in question are running with big
endian CPUs, correct? If not, then it's apparent we have to do something
different for iProc-based chips than for STB chips; we can't just fiddle
with the cpu_to_*() macros. Maybe this works?

diff --git a/drivers/mtd/nand/brcmnand/brcmnand.c b/drivers/mtd/nand/brcmnand/brcmnand.c
index 961a9ee4369c..073dbe4ce9bc 100644
--- a/drivers/mtd/nand/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/brcmnand/brcmnand.c
@@ -1168,8 +1168,6 @@ static void brcmnand_cmdfunc(struct mtd_info *mtd, unsigned command,
 			native_cmd == CMD_PARAMETER_CHANGE_COL) {
 		int i;
 
-		brcmnand_soc_data_bus_prepare(ctrl->soc);
-
 		/*
 		 * Must cache the FLASH_CACHE now, since changes in
 		 * SECTOR_SIZE_1K may invalidate it
@@ -1177,8 +1175,6 @@ static void brcmnand_cmdfunc(struct mtd_info *mtd, unsigned command,
 		for (i = 0; i < FC_WORDS; i++)
 			ctrl->flash_cache[i] = brcmnand_read_fc(ctrl, i);
 
-		brcmnand_soc_data_bus_unprepare(ctrl->soc);
-
 		/* Cleanup from HW quirk: restore SECTOR_SIZE_1K */
 		if (host->hwcfg.sector_size_1k)
 			brcmnand_set_sector_size_1k(host,


Brian
