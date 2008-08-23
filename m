Received: from relay02.pair.com ([209.68.5.16])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KWv8j-0005X7-PV
	for linux-mtd@lists.infradead.org; Sat, 23 Aug 2008 15:34:58 +0000
Date: Sat, 23 Aug 2008 08:34:38 -0700
Subject: Re: Creating an Empty JFFS2 File System
From: Grant Erickson <gerickson@nuovations.com>
To: "\"linux-mtd@lists.infradead.org\"" <linux-mtd@lists.infradead.org>
Message-ID: <C4D57C1E.113B6%gerickson@nuovations.com>
In-Reply-To: <C3F6E812.DD80%gerickson@nuovations.com>
Mime-version: 1.0
Content-type: text/plain;
	charset="US-ASCII"
Content-transfer-encoding: 7bit
Cc: Josh Boyer <jwboyer@gmail.com>, Stefan Roese <sr@denx.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 3/7/08 12:39 PM, Grant Erickson wrote:
> On 3/7/08 10:37 AM, Josh Boyer wrote:
>> On Fri, 07 Mar 2008 09:55:13 -0800
>> Grant Erickson <gerickson@nuovations.com> wrote:
>>> Is creating an empty JFFS2 file system supported or is this a deprecated
>>> capability? The following steps seem to be incorrect or failing:
>>> 
>>>     # flash_eraseall -q -j /dev/mtd9
>>>     # mount -t jffs2 /dev/mtdblock9 /mnt
>>>     Cowardly refusing to erase blocks on filesystem with no valid JFFS2
>>>     nodes
>>>     empty_blocks 0, bad_blocks 0, c->nr_blocks 3840
>>> 
>>> Or, is the only way to accomplish this to create a NULL JFFS2 image with
>>> mkfs.jffs2 and then nandwrite it?
>> 
>> Just erase it completely without the -j option and mount.  JFFS2 will go
>> through and erase them all again and add the cleanmarkers itself.
> 
> Josh:
> 
> That technique is a no-go as well:
> 
>     # flash_eraseall -q /dev/mtd8
>     # mount -t jffs2 /dev/mtdblock8 /mnt
>     Cowardly refusing to erase blocks on filesystem with no valid JFFS2
>     nodes
>     empty_blocks 0, bad_blocks 0, c->nr_blocks 3840
>     mount: mounting /dev/mtdblock8 on /mnt failed: Input/output error

For those following this thread via Google, I finally had time to debug this
upon arrival of our prototype boards and thought I would close the thread
out with the root cause.

On the prototype board, which uses a Numonyx NAND01GW3B2B (128 KiB block / 2
KiB page), I found that I COULD successfully erase a NAND partition with
'nand erase' in u-boot or 'flash_eraseall' in Linux and then mount it:

    # flash_eraseall -q /dev/mtd9
    # mount -t jffs2 /dev/mtdblock9 /mnt/root0
    # df
    Filesystem           1k-blocks      Used Available Use% Mounted on
    ...
    /dev/mtdblock9            8192       512      7680   6% /mnt/root0

However, as before, I tried this on Haleakala/Kilauea with its Samsung
K9F1208U0B (16 KiB block / 512 B page) part using the same 2.6.25-rc3 DENX
kernel, I saw the following:

    # flash_eraseall -q /dev/mtd9
    # mount -t jffs2 /dev/mtdblock9 /mnt/root0
    Cowardly refusing to erase blocks on filesystem with no valid JFFS2
nodes
    empty_blocks 0, bad_blocks 0, c->nr_blocks 512
    mount: mounting /dev/mtdblock9 on /mnt/root0 failed: Input/output error

My suspicion was that this was somehow related to the custom OOB/ECC layout
specified in arch/powerpc/platforms/40x/kilauea-nand.c because an erase from
either u-boot with 'nand erase' or Linux with 'flash_eraseall' produced
identical results.

The larger page part on the prototype board uses a default OOB/ECC layout
(similar to Canyonlands, et al) and worked correctly in either case.

So, I made the following change in arch/powerpc/platforms/40x/kilauea-nand.c
in the DENX-2.6.26.2 kernel:

    -    .ecclayout = &nand_oob_16,
    +    .ecclayout = NULL,

and an empty/erased partition mount worked, both with an erase from u-boot
using 'nand erase' and from Linux using 'flash erase_all'.

Stefan Roese at DENX confirmed this was likely an arch/ppc to arch/powerpc
porting error/typo.

Regards,

Grant Erickson
