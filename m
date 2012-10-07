Received: from mail-out.m-online.net ([2001:a60:0:28:0:1:25:1])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TKhZ1-0003Gz-B5
 for linux-mtd@lists.infradead.org; Sun, 07 Oct 2012 03:30:01 +0000
From: Marek Vasut <marex@denx.de>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 9/9] mtd: nand: detect Samsung K9GBG08U0A, K9GAG08U0F ID
Date: Sun, 7 Oct 2012 05:29:51 +0200
References: <1348544455-17656-1-git-send-email-computersforpeace@gmail.com>
 <201210050337.12011.marex@denx.de>
 <CAN8TOE-3s7o8KX1MJKSHdTog2-rsHtrvK=LXSpeO2XDfM8M6LA@mail.gmail.com>
In-Reply-To: <CAN8TOE-3s7o8KX1MJKSHdTog2-rsHtrvK=LXSpeO2XDfM8M6LA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201210070529.51557.marex@denx.de>
Cc: Fabio Estevam <fabio.estevam@freescale.com>,
 Angus Clark <angus.clark@st.com>, Mike Dunn <mikedunn@newsguy.com>,
 Artem Bityutskiy <dedekind1@gmail.com>, Huang Shijie <b32955@freescale.com>,
 linux-mtd@lists.infradead.org, Shmulik Ladkani <shmulik.ladkani@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear Brian Norris,

> Hi Marek,
> 
> On Thu, Oct 4, 2012 at 6:37 PM, Marek Vasut <marex@denx.de> wrote:
> > This breaks my board with K9F2G08 part:
> > 
> > [    0.860000] NAND device: Manufacturer ID: 0xec, Chip ID: 0xda (Samsung
> > NAND 256MiB 3,3V 8-bit), page size: 2048, OOB size: 64
> 
> Thanks for the report. I really appreciate the testing! Exactly which
> part is this, and what is the full 8-byte ID? For instance, I can
> reproduce this on K9F2G08U0B, with ID EC DA 10 95 44 00 EC DA.

Yep, that's it ...

ec da 10 95 44 00 ec da

> >> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> >> index 7e93d0d..bcb58ce 100644
> >> --- a/drivers/mtd/nand/nand_base.c
> >> +++ b/drivers/mtd/nand/nand_base.c
> >> @@ -2939,19 +2939,18 @@ static void nand_decode_ext_id(struct mtd_info
> >> *mtd, struct nand_chip *chip, /*
> >> 
> >>        * Field definitions are in the following datasheets:
> >>        * Old style (4,5 byte ID): Samsung K9GAG08U0M (p.32)
> >> 
> >> -      * New style   (6 byte ID): Samsung K9GBG08U0M (p.40)
> >> +      * New style   (6 byte ID): Samsung K9GAG08U0F (p.44)
> >> 
> >>        * Hynix MLC   (6 byte ID): Hynix H27UBG8T2B (p.22)
> >>        *
> >>        * Check for ID length, cell type, and Hynix/Samsung ID to decide
> >>        what * to do.
> >>        */
> >> 
> >> -     if (id_len == 6 && id_data[0] == NAND_MFR_SAMSUNG &&
> >> -                     (chip->cellinfo & NAND_CI_CELLTYPE_MSK)) {
> >> +     if (id_len == 6 && id_data[0] == NAND_MFR_SAMSUNG) {
> > 
> > [...]
> > 
> > I believe the above hunk is wrong, reverting it fixes the problem.
> 
> Yeah, that is one fix. But my real issue is in the ID length, not SLC
> vs. MLC. Its datasheet *says* it has a 5-byte ID, but it actually
> wraps around at the 6-byte mark (i.e., EC DA 10 95 44 00 EC DA ...) so
> its ID length appears as 6. Now, the above hunk is intentional, since
> I found Samsung SLC NAND with 6-byte ID which follow this same
> pattern. And I don't have any recorded Samsung 6-byte ID SLC who
> *don't* follow this pattern. See the following doc, plus I have more
> NAND data that should be updated here sometime:
> 
> http://www.linux-mtd.infradead.org/nand-data/nanddata.html

Nice!

> Anyway, according to my data, the problem is actually in this hunk in patch
> 6:
> 
> mtd: nand: add generic READ ID length calculation functions
> 
> -       if (id_data[0] == id_data[6] && id_data[1] == id_data[7] &&
> -                       id_data[0] == NAND_MFR_SAMSUNG &&
> -                       (chip->cellinfo & NAND_CI_CELLTYPE_MSK) &&
> -                       id_data[5] != 0x00) {
> +       if (id_len == 6 && id_data[0] == NAND_MFR_SAMSUNG &&
> +                       (chip->cellinfo & NAND_CI_CELLTYPE_MSK)) {
> 
> Notice that I dropped the 'id_data[5] != 0x00' check. So I think if I
> squash the following diff (probably mangled) into the series, this
> solves your problems and mine. Can you test?

Yes, that's a good solution.

Tested-by: Marek Vasut <marex@denx.de>

> If it works, I'll probably resend this diff with a full, proper
> explanation (and Tested-by credit), or else I can send a v2 of patches
> 6 and 9. (It's up to Artem, which form he'd rather maintain in his
> tree.)
> 
> Thanks,
> Brian
> 
> ---
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index ec6841d..fa1ae76 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -2989,7 +2989,8 @@ static void nand_decode_ext_id(struct mtd_info
> *mtd, struct nand_chip *chip,
>  	 * Check for ID length, cell type, and Hynix/Samsung ID to decide what
>  	 * to do.
>  	 */
> -	if (id_len == 6 && id_data[0] == NAND_MFR_SAMSUNG) {
> +	if (id_len == 6 && id_data[0] == NAND_MFR_SAMSUNG &&
> +			id_data[5] != 0x00) {
>  		/* Calc pagesize */
>  		mtd->writesize = 2048 << (extid & 0x03);
>  		extid >>= 2;
