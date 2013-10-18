Received: from mail-wg0-f41.google.com ([74.125.82.41])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VXH38-0007HM-3H
 for linux-mtd@lists.infradead.org; Fri, 18 Oct 2013 20:53:35 +0000
Received: by mail-wg0-f41.google.com with SMTP id b13so2541294wgh.2
 for <linux-mtd@lists.infradead.org>; Fri, 18 Oct 2013 13:53:12 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAJ+vNU1JWZp=JoBDJALh59yFybGZ0iQxMEYy8qvTFGDLhyRzqg@mail.gmail.com>
References: <CAJ+vNU1JWZp=JoBDJALh59yFybGZ0iQxMEYy8qvTFGDLhyRzqg@mail.gmail.com>
Date: Fri, 18 Oct 2013 13:45:33 -0700
Message-ID: <CAJ+vNU0yDJcUaw5=6V1rFbecW3Y+6qOw40S3nJ4eeDwjZwdcCw@mail.gmail.com>
Subject: Re: gpmi-mtd ecc regression
From: Tim Harvey <tharvey@gateworks.com>
To: linux-mtd@lists.infradead.org, Huang Shijie <b32955@freescale.com>
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Oct 18, 2013 at 10:03 AM, Tim Harvey <tharvey@gateworks.com> wrote:
> Huang,
>
> The patch you made to obtain ECC info from the chip
> (http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/drivers/mtd/nand/gpmi-nand?id=2febcdf84b75aae627c61f0a5bf531a69299966c)
> has caused a regression for an i.MX6 board I'm working with that uses
> NAND and ubifs.
>
> I'm using a Micron MT29F8G08
> (http://download.micron.com/pdf/datasheets/flash/nand/2_4_8gb_nand_m49a.pdf)
> which has:
> page size: 2112 bytes (2048 + 64 bytes)
> block size: 1056 words (1024 + 32 words)
> plane size: 2 planes x 1024 blocks per plane
> device size: 2Gb: 2048 blocks
> ecc: 4bit
>
> The legacy_set_geometry function comes up with:
> gf_len=13
> ecc_strength=8
> page_size=2112
> metadata_size=10
> ecc_chunk_size=512
> ecc_chunk_count=4
> payload_size=2048
> auxiliary_size=16
> auxiliary_status_offset=12
> block_mark_byte_offset=1999
>
> and the new set_geometry_by_ecc_info comes up with:
> gf_len=13
> ecc_strength=4

digging more into the issue I believe the problem is that the 'chip'
has an internal 4-bit ECC which is now being used, whereas what we
want is the BCH's ECC to be used (which would use 8bit ECC with a NAND
device with a pagesize of 2048 + 64 OOB).  If I force ecc_stength such
as:

@@ -143,7 +143,7 @@ static bool set_geometry_by_ecc_info(struct
gpmi_nand_data *this)
                return false;
        }
        geo->ecc_chunk_size = chip->ecc_step_ds;
-       geo->ecc_strength = round_up(chip->ecc_strength_ds, 2);
+       geo->ecc_strength = 8;
        if (!gpmi_check_ecc(this))
                return false;

@@ -208,6 +208,7 @@ static bool set_geometry_by_ecc_info(struct
gpmi_nand_data *this)

then I have no issues.

Does this make sense and if so should we be using the chip's reported
ecc strength at all?

Tim
