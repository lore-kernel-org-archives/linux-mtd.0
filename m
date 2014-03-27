Received: from mail-out.m-online.net ([212.18.0.9])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WT8TM-0002ix-8l
 for linux-mtd@lists.infradead.org; Thu, 27 Mar 2014 11:27:50 +0000
Date: Thu, 27 Mar 2014 12:27:22 +0100
From: Gerhard Sittig <gsi@denx.de>
To: "Gupta, Pekon" <pekon@ti.com>
Subject: Re: [PATCH] mtd: nand: Add support for Micron on-die ECC controller
 (rev2).
Message-ID: <20140327112722.GQ3998@book.gsilab.sittig.org>
References: <1395875121-9320-1-git-send-email-davidm@egauge.net>
 <20980858CB6D3A4BAE95CA194937D5E73EAB5F84@DBDE04.ent.ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20980858CB6D3A4BAE95CA194937D5E73EAB5F84@DBDE04.ent.ti.com>
Cc: David Mosberger <davidm@egauge.net>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

thanks for adding me to Cc:

On Thu, 2014-03-27 at 06:56 +0000, Gupta, Pekon wrote:
> 
> >From: linux-mtd [mailto:linux-mtd-bounces@lists.infradead.org] On Behalf Of David Mosberger
> >Subject: [PATCH] mtd: nand: Add support for Micron on-die ECC controller (rev2).
> >
> Sorry, I looked at this patch little lately.
> But good, if you can keep $subject consistent, like using
> prefix "[PATCH v2]"  instead of adding suffix "(rev2)".

David, "PATCH v2" (can be applied with --subject-prefix in the
--format-patch invocation) has several benefits, reviewers
clearly notice it's another iteration, and the irrelevant
"(rev2)" won't clobber the commit message upon application

> >+static int
> >+check_for_bitflips(struct mtd_info *mtd, struct nand_chip *chip, int page)
> >+{
> >+	int flips = 0, max_bitflips = 0, i, j, read_size;
> >+	uint8_t *chkbuf, *rawbuf, *chkoob, *rawoob;
> >+	uint32_t *eccpos;
> >+
> >+	chkbuf = chip->buffers->chkbuf;
> >+	rawbuf = chip->buffers->rawbuf;
> >+	read_size = mtd->writesize + mtd->oobsize;
> >+
> >+	/* Read entire page w/OOB area with on-die ECC on: */
> >+	chip->read_buf(mtd, chkbuf, read_size);
> 
> This should have been called directly from nand_read_page_on_die()

given that there are questions and concerns raised, a comment in
the source about the program flow (in the "good" and "corrected"
and "beyond repair" cases) might be good

I'll respond to the "don't do this here" below

> >+static int check_read_status_on_die(struct mtd_info *mtd,
> >+				    struct nand_chip *chip, int page)
> >+{
> >+	int max_bitflips = 0;
> >+	uint8_t status;
> >+
> >+	/* Check ECC status of page just transferred into NAND's page buffer: */
> >+	chip->cmdfunc(mtd, NAND_CMD_STATUS, -1, -1);
> >+	status = chip->read_byte(mtd);
> >+
> >+	/* Switch back to data reading: */
> >+	chip->cmd_ctrl(mtd, NAND_CMD_READ0,
> >+		       NAND_NCE | NAND_CLE | NAND_CTRL_CHANGE);
> >+	chip->cmd_ctrl(mtd, NAND_CMD_NONE,
> >+		       NAND_NCE | NAND_CTRL_CHANGE);
> >+
> >+	if (status & NAND_STATUS_FAIL) {
> >+		/* Page has invalid ECC. */
> >+		mtd->ecc_stats.failed++;
> >+	} else if (status & NAND_STATUS_REWRITE) {
> >+		/*
> >+		 * The Micron chips turn on the REWRITE status bit for
> >+		 * ANY bit flips.  Some pages have stuck bits, so we
> >+		 * don't want to migrate a block just because of
> >+		 * single bit errors because otherwise, that block
> >+		 * would effectively become unusable.  So, work out in
> >+		 * software what the max number of flipped bits is for
> >+		 * all subpages in a page:
> >+		 */
> >+		max_bitflips = check_for_bitflips(mtd, chip, page);
> >+	}
> >+	return max_bitflips;
> >+}

a quick search even suggests that the REWRITE status bit need not
be seen upon _any_ fixable ECC error, but might depend on an
internal threshold (i.e. when this chip or a later model thinks
that a data refresh might be due); this is an assumption, cannot
tell whether it was verified

http://lists.infradead.org/pipermail/linux-mtd/2012-November/044855.html

it's a pity that the hardware won't tell how many bit errors were
detected, and that you feel you have to do the dance of switching
modes and reading raw data just to find this detail for yourself
:(  this is a new quality in all the patches I have seen floating
around


> >+/**
> >+ * nand_read_page_on_die - [INTERN] read raw page data without ecc
> >+ * @mtd: mtd info structure
> >+ * @chip: nand chip info structure
> >+ * @buf: buffer to store read data
> >+ * @oob_required: caller requires OOB data read to chip->oob_poi
> >+ * @page: page number to read
> >+ */
> >+static int nand_read_page_on_die(struct mtd_info *mtd, struct nand_chip *chip,
> >+				 uint8_t *buf, int oob_required, int page)
> >+{
> >+	uint32_t failed;
> >+	int ret;
> >+
> >+	failed = mtd->ecc_stats.failed;
> >+
> 
> This is the entry point of chip->ecc.read_page(),  So, your first call to ecc.read_buf
> should have happened here, not in check_for_bitflips(). And you should have just
> passed the read_buffer to for checking of bit-flips.
> 
> >+	ret = check_read_status_on_die(mtd, chip, page);
> Also this should have been part of nand_chip->ecc.correct() interface.

AFAIU the sequence of commands which the NAND chip requires
doesn't quite map to the sequence of what the MTD layer does
(emit the read command, read the data, optionally check ECC)

when "on die ECC" is enabled, the chip requires a sequence of
- read page command (READ0, addresses, READSTART)
- status check (mandatory! cmd 70, to check FAIL and REWRITE bits)
- re-enter data read mode (READ0, _without_ addresses and START)
- fetch data bytes

actually the READ0 plus READSTART does a transfer from the chip's
array into the chip's caches, before data is fetched out of the
chip into the SoC; the repeated READ0 does some kind of "rewind"
from status output to data output, it doesn't re-read the array
within the chip

> 
> >+	if (ret < 0 || mtd->ecc_stats.failed != failed) {
> >+		memset(buf, 0, mtd->writesize);
> 
> This is not required, because if there are ECC failure (uncorrectable bit-flips)
> then, nand_do_read_ops() will automatically convert it into -EBADMSG.
> And then let above layers MTD, UBI determine what to do with the corrupted data.
> Un-correctable bit-flips may be in those portions of  a page which do not
> contain any data. Hence, you should not reset the buffer even for ECC failures.
> 
> Example: UBIFS erase-header and volume-id-headers occupy on first few
> bytes of the page. And so UBIFS uses in-band CRC checks to see if its headers
> have any corruption. Now, even if the NAND page had some uncorrectable
> bit-flips, but those bit-flips do not affect the data of UBIFS headers,
> then UBIFS just reads those pages and scrubs the block.

that's a good hint, one might want to check the other ECC
callback routines (I thought I saw that pattern elsewhere, but
was working on a different kernel version)

> >+		if (oob_required)
> >+			memset(chip->oob_poi, 0, mtd->oobsize);
>  -- same here --
> 
> >+		return ret;
> >+	}
> >+
> >+	chip->read_buf(mtd, buf, mtd->writesize);
> 
> This is not correct. You first read the data, and then check for bit-flips.
> You *don't* re-read the page again, because on re-read you may find
> new bit-flips due to read-disturb errors, which were not accounted in
> the earlier count. 
> 
> So, if you follow the below sequence..
> (1) read buffer (with on-die ECC == ON)
> (2) check for bit-flips (just pass the read_buffer)
> (3) correct bit-flips (again just pass read_buffer)
> Then probably you don't need this call, and you can re-use existing generic
> NAND driver implementations.

unfortunately this is not possible according to the chip's
datasheet; even if you _evaluate_ the status only later, you have
to _fetch_ it before the data, and thus do the command re-issue
dance, and cannot use nand_command_lp() since it automatically
does READSTART for READ0

adding another pseudo command with high bits set and LSB 0x00
might help (similar to deplete), then the common command routine
can get re-used

> >@@ -3956,6 +4184,25 @@ int nand_scan_tail(struct mtd_info *mtd)
> > 		ecc->strength = ecc->bytes * 8 / fls(8 * ecc->size);
> > 		break;
> >
> >+	case NAND_ECC_HW_ON_DIE:
> >+		/* nand_bbt attempts to put Bbt marker at offset 8 in
> >+		   oob, which is used for ECC by Micron
> >+		   MT29F4G16ABADAWP, for example.  Fixed by not using
> >+		   OOB for BBT marker.  */
> >+		chip->bbt_options |= NAND_BBT_NO_OOB;
> >+		chip->ecc.layout = &nand_oob_64_on_die;
> >+		chip->ecc.read_page = nand_read_page_on_die;
> >+		chip->ecc.read_subpage = nand_read_subpage_on_die;
> >+		chip->ecc.write_page = nand_write_page_raw;
> >+		chip->ecc.read_oob = nand_read_oob_std;
> >+		chip->ecc.read_page_raw = nand_read_page_raw;
> >+		chip->ecc.write_page_raw = nand_write_page_raw;
> >+		chip->ecc.write_oob = nand_write_oob_std;
> >+		chip->ecc.size = 512;
> >+		chip->ecc.bytes = 8;
> >+		chip->ecc.strength = 4;
> >+		break;
> >+

I was wondering, have you seen an explicit discussion of how many
data bytes to read and to write in read and program requests?  I
missed this in the datasheet, neither found it in TN-29-56, but
just might have been blind ...


> >@@ -4023,8 +4270,13 @@ int nand_scan_tail(struct mtd_info *mtd)
> > 	/* Invalidate the pagebuffer reference */
> > 	chip->pagebuf = -1;
> >
> >-	/* Large page NAND with SOFT_ECC should support subpage reads */
> >-	if ((ecc->mode == NAND_ECC_SOFT) && (chip->page_shift > 9))
> >+	/*
> >+	 * Large page NAND with SOFT_ECC or on-die ECC should support
> >+	 * subpage reads.
> >+	 */
> >+	if (((ecc->mode == NAND_ECC_SOFT)
> >+	     || (chip->ecc.mode == NAND_ECC_HW_ON_DIE))
> >+	    && (chip->page_shift > 9))
> > 		chip->options |= NAND_SUBPAGE_READ;
> >
> > 	/* Fill in remaining MTD driver data */

this might apply to this specific model, but is it a general rule
that chips with on-die-ECC will have subpage support?  and that
we always want to use it?

> Also, can include a link to public copy of the Micron device datasheet
> which has on-die ECC feature. It would be helpful to understand your patch

I don't have a link at hand, but the datasheet's footer reads
"m60a_4gb_8gb_16gb_ecc_nand.pdf"

searching for implementations, there's the "sketch" or outline in
TN-29-56, but I haven't seen an official implementation from
Micron yet, and all the floating patches appear to "be inspired
by each other" if they are not identical (they all follow a
certain scheme, and even use identical identifiers) -- would be
nice to see some official reference, regardless of how much test
an "arbitrary" external implementation has received


virtually yours
Gerhard Sittig
-- 
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr. 5, D-82194 Groebenzell, Germany
Phone: +49-8142-66989-0 Fax: +49-8142-66989-80  Email: office@denx.de
