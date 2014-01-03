Received: from mail-pd0-x229.google.com ([2607:f8b0:400e:c02::229])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vz1IS-0002dH-Rm
 for linux-mtd@lists.infradead.org; Fri, 03 Jan 2014 09:44:05 +0000
Received: by mail-pd0-f169.google.com with SMTP id v10so15137461pde.14
 for <linux-mtd@lists.infradead.org>; Fri, 03 Jan 2014 01:43:41 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20131219051050.GA12530@shlinux2.ap.freescale.net>
References: <1387393632-5338-1-git-send-email-eliedebrauwer@gmail.com>
 <1387393632-5338-2-git-send-email-eliedebrauwer@gmail.com>
 <20131219051050.GA12530@shlinux2.ap.freescale.net>
Date: Fri, 3 Jan 2014 10:43:41 +0100
Message-ID: <CAGWqfii6=8bS8Au0m=u6zhdhmaFgAtCOCATodb_9nBtUu1geXA@mail.gmail.com>
Subject: Re: [PATCH v6] mtd: gpmi: Deal with bitflips in erased regions regions
From: Elie De Brauwer <eliedebrauwer@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: Huang Shijie <shijie8@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Dec 19, 2013 at 6:10 AM, Huang Shijie <b32955@freescale.com> wrote:
> On Wed, Dec 18, 2013 at 08:07:12PM +0100, Elie De Brauwer wrote:
>> The BCH block typically used with a GPMI block on an i.MX28/i.MX6 is only
>> able to correct bitflips on data actually streamed through the block.
>> When erasing a block the data does not stream through the BCH block
>> and therefore no ECC data is written to the NAND chip. This causes
>> gpmi_ecc_read_page to return failure as soon as a single non-1-bit is
>> found in an erased page. Typically causing problems at higher levels
>> (ubifs corrupted empty space warnings). This problem was also observed
>> when using SLC NAND devices.
>>
>> This patch configures the BCH block to mark a block as 'erased' if
>> not too much bitflips are found. Next HW_BCH_STATUS0:ALLONES
>> is used to check if the data read were all ones, indicating a read of a
>> properly erased chunk was performed. If this was not the case a slow path
>> is entered where bitflips are counted and corrected in software,
>> allowing the upper layers to take proper actions.
>>
>> Signed-off-by: Elie De Brauwer <eliedebrauwer@gmail.com>
>> Acked-by: Peter Korsgaard <peter@korsgaard.com>
>
> thanks a lot!
>
> Acked-by: Huang Shijie <b32955@freescale.com>
>

Hello Huang, all,

Huang, you suggested earlier after checking with your hw guys to make
use of the ALLONES bit
in the HW_BCH0_STATUS0 register, this looked like a nice solution
since this could introduce a fast
path. However the documentation did not mention how the ALLONES bit is
implemented, including whether
or not it takes the erase threshold into account. Obviously V6 of my
patch will only function if ALLONES function if _all bits are
physically one_ and fail to function if allones something like the AND
of all statusses of the chunk.

I've been given a board with another bitflip (jay). It propgates as
the following error:
"UBIFS error (pid 36): ubifs_recover_master_node: failed to recover master node"

And if I look at the data I see the LEB consists out of 55 valid
master nodes, but two pages after the last valid master node there is
a bitflip which causes in ubifs/recovery.c get_master_node() to
trigger:
                if (!is_empty(buf, len))
                        goto out_err;

When dumping the data read I get to see a bitflip:
[    4.094719] c8a32e30: ff ff ff fd ff ff ff ff ff ff ff ff ff ff ff
ff  ................

This leads me to believe that the ALLONES bit is actually not behaving
the way I think it was. Implying that it actually is taking the
ERASE_THRESHOLD into account. (I verified this by dumping the status
register which was 0xff10 and counting the bitflips which actually
showed allones to be set while a bitflip was found) Making the allones
bit more or less useless in our case. Hence I suggest to revert the
use of the allones bit to the, (somewhat slower when reading erased
blocks) solution which always checks the erased blocks in
gpmi_ecc_read_page():

if (*status == STATUS_ERASED) {
   /* Erased block with bitflips. */
   flips = erased_sector_bitflips(payload_virt, i, nfc_geo);
} else {
   /* BCH block corrected some errors for us. */
   flips = *status;
}

What do you think and/or could you verify with your hardware guys ?

Thanks
E.
-- 
Elie De Brauwer
