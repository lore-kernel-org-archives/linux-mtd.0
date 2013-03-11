Received: from comal.ext.ti.com ([198.47.26.152])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UEwIp-0002sF-8V
 for linux-mtd@lists.infradead.org; Mon, 11 Mar 2013 06:33:44 +0000
Message-ID: <513D7ABE.7070408@ti.com>
Date: Mon, 11 Mar 2013 12:03:34 +0530
From: pekon <pekon@ti.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: 'ubi clone' from Live NAND.
References: <BLU0-SMTP76D0EA572C27BC1C088C1FB8E40@phx.gbl>
 <20980858CB6D3A4BAE95CA194937D5E73E99E24B@DBDE01.ent.ti.com>
 <CAN8TOE-yrwMshXd+O-Ar0T7O79spzEY+APtxxzFrmA4rK5TKjQ@mail.gmail.com>
In-Reply-To: <CAN8TOE-yrwMshXd+O-Ar0T7O79spzEY+APtxxzFrmA4rK5TKjQ@mail.gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Bill Pringlemeir <bpringle@sympatico.ca>
Reply-To: pekon@ti.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Brian,

Had few queries below..

On 3/10/2013 12:08 PM, Brian Norris wrote:
> As a NAND driver developer and a developer of nanddump / nandwrite, I
> have some comments. Note, however, that I have not tried this kind of
> UBI clone, so my suggestions are somewhat of educated guesses.
>
> On Thu, Mar 7, 2013 at 4:11 AM, Gupta, Pekon <pekon@ti.com> wrote:
>>> If 'rootfs.ubi' is the 'ubinize' image, then I can mount and see the
>>> file system on my PC.  However, if the 'rootfs.ubi' is a 'dump' of the
>>> NAND flash, I fail with the following 'dmesg',
>> [pekon]
>> I have tried this, using following steps, and it works well
>>
>> (1) nanddump   -b -s 0x0  -l <size_of_source_partition>  -f  <image_dump.bin>  <source_partition>
> FYI, "-b" (or "omitbad") has been dropped from recent nanddump
> releases. A similar (but not identical) option is now available as
> --bb=skipbad (default). And then, you probably don't want to specify a
> -l (length) option, since the length actually refers to the length of
> the resulting image, which may vary depending on the number of bad
> blocks. So, with recent mtd-utils releases, the equivalent dump would
> be:
>
> nanddump --bb=skipbad -s 0x0 -f <image_dump.bin> <source_partition>
>
> or, because many of the provided options are defaults, the following
> is also equivalent:
>
> nanddump -f <image_dump.bin> <source_partition>
[Pekon]: In above example, you have not specified any length field.
But, If only subset of a partition needs to be dumped, then how should 
the 'length of data' to be dumped be specified ? (assuming there are 
bad-blocks).
Hoping '-l' option is not deprecated in newer versions of nanddump ?

>> (2) flash_erase   <target_partition>  0 0
>> (3) nandwrite -n -r   <target_partition>         <image_dump.bin>
> This looks likely to cause problems. See my comment below.
>
>> where,
>> source_partition= partition on source device from which NAND binary would be dumped. (/dev/mtdX)
>> target_partition= partition on another device which NAND dumped image would be flashed (/dev/mtdY)
>>
>>
>> You need to keep few things in mind..
>> (1) sizeof(target_partion) > sizeof(source_partition), So as to take care of bad-blocks present on target device.
>>
>> (2) '-n' option in nandwrite tells NAND driver not to calculate ECC while programming nand, as its is already part of 'raw' binary image
> The image dump command above does not contain any ECC information,
[Pekon]: While doing above, I was using 'nanddump -version 1.30' and 
'nandwrite revision 1.32' on kernel 2.6.37+, with ECC_HW scheme.
The <image_dump.bin> is actually the binary data dumped using nanddump 
in previous step. So it should contain OOB area bytes also ?


> so
> when you write with '-n', you aren't writing *any* ECC information.
> This is quite likely to cause your ECC decoder to flag all your data
> as uncorrectable. Are you sure this has worked for any length of time?
> I would strongly recommend against writing your image in this way.
[Pekon]: Also, while writing back the <image_dump.bin> I was using  raw 
mode.
-> '-r' (raw) was used to specify that input file contains OOB bytes 
along with MAIN area data.
-> '-n' was used to suppress ECC calculations while writing the data.
However, even I was not clear on, why do we need to explicitely give 
'-n' (suppress ECC) option along '-r' (raw) switch. It should be 
implicit, isn't it ?
Can you please also clarify on usage of -r (raw) option ?

> I'm guessing that your recommendation of '-n' (no ECC) is to solve the
> 0xFF page problem, documented here?
>
> http://www.linux-mtd.infradead.org/faq/ubifs.html#L_why_ubiformat
[Pekon]: Thanks for pointing this out, i missed it earlier.
>
> Anyway, I don't think you want nandwrite; just use ubiformat.
[Pekon]: I could not use 'ubiformat' because the <image_dump.bin> was 
not a standard UBI image. It was a binary data dumped using nanddump as 
given in previous steps.
>
> Brian
with regards, pekon
