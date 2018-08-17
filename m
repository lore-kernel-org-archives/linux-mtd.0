Received: from callisto.digivation.com.au ([198.35.45.124])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fqfrD-00043n-Hb
 for linux-mtd@lists.infradead.org; Fri, 17 Aug 2018 14:36:09 +0000
Subject: Re: [RFC PATCH] UBI fixable bit-flip issue
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>
References: <1bcbe82a-85e5-52f8-dc54-9d22e5b390fa@digivation.com.au>
 <20180817102559.7ab14fd9@bbrezillon>
From: Mark Spieth <mspieth@digivation.com.au>
Message-ID: <227ad167-4e57-638d-a4cb-1e82613de2bc@digivation.com.au>
Date: Sat, 18 Aug 2018 00:33:25 +1000
MIME-Version: 1.0
In-Reply-To: <20180817102559.7ab14fd9@bbrezillon>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 8/17/2018 6:25 PM, Boris Brezillon wrote:
> Hi Mark,
>
> On Fri, 17 Aug 2018 10:34:21 +1000
> Mark Spieth <mspieth@digivation.com.au> wrote:
>
>> Hi
>>
>> Richard Weinberger suggested I post this here. It is also in the uboot
>> mailing list
>>
>> In the process of investigating a boot failure on one of our devices, the
>>
>> UBI: fixable bit-flip detected at PEB
>>
>> message was seen with the following behaviour during kernel load in u-boot.
>>
>> Read [2285568] bytes
>> UBI: fixable bit-flip detected at PEB 415
>> UBI: schedule PEB 415 for scrubbing
>> UBI: fixable bit-flip detected at PEB 415
>> UBI: fixable bit-flip detected at PEB 419
>> UBI: schedule PEB 419 for scrubbing
>> UBI: fixable bit-flip detected at PEB 419
>> UBI: fixable bit-flip detected at PEB 420
>> UBI: schedule PEB 420 for scrubbing
>> UBI: fixable bit-flip detected at PEB 420
>> UBI: fixable bit-flip detected at PEB 419
>> UBI: fixable bit-flip detected at PEB 420
>> UBI: fixable bit-flip detected at PEB 419
>> UBI: fixable bit-flip detected at PEB 420
>> UBI: fixable bit-flip detected at PEB 419
>> UBI: fixable bit-flip detected at PEB 420
>> UBI: fixable bit-flip detected at PEB 419
>> UBI: fixable bit-flip detected at PEB 420
>> UBI: fixable bit-flip detected at PEB 419
>> UBI: fixable bit-flip detected at PEB 420
>> UBI: fixable bit-flip detected at PEB 419
>>
>> his repeats until reset.
>>
>> U boot is a patched version of 2010.06 supplied by the chip vendor. No
>> newer version is available from the vendor to try.
>>
>> The patches include the init eba/wl swap.
>>
>> A more detailed log with debugging available follows:
>>
>> UBI: fixable bit-flip detected at PEB 419
>> UBI DBG: schedule_erase: schedule erasure of PEB 419, EC 19, torture 0
>> UBI DBG: erase_worker: erase PEB 419 EC 19
>> UBI DBG: sync_erase: erase PEB 419, old EC 19
>> UBI DBG: do_sync_erase: erase PEB 419
>> UBI DBG: sync_erase: erased PEB 419, new EC 20
>> UBI DBG: ubi_io_write_ec_hdr: write EC header to PEB 419
>> UBI DBG: ubi_io_write: write 2048 bytes to PEB 419:0
>> UBI DBG: ensure_wear_leveling: schedule scrubbing
>> UBI DBG: wear_leveling_worker: scrub PEB 420 to PEB 419
>> UBI DBG: ubi_io_read_vid_hdr: read VID header from PEB 420
>> UBI DBG: ubi_io_read: read 2048 bytes from PEB 420:2048
>> UBI DBG: ubi_eba_copy_leb: copy LEB 6:11, PEB 420 to PEB 419
>> UBI DBG: ubi_eba_copy_leb: read 126976 bytes of data
>> UBI DBG: ubi_io_read: read 126976 bytes from PEB 420:4096
>> UBI: fixable bit-flip detected at PEB 420
>> UBI DBG: ubi_io_write_vid_hdr: write VID header to PEB 419
>> UBI DBG: ubi_io_write: write 2048 bytes to PEB 419:2048
>> UBI DBG: ubi_io_read_vid_hdr: read VID header from PEB 419
>> UBI DBG: ubi_io_read: read 2048 bytes from PEB 419:2048
>> UBI DBG: ubi_io_write: write 126976 bytes to PEB 419:4096
>> UBI DBG: ubi_io_read: read 126976 bytes from PEB 419:4096
>> UBI: fixable bit-flip detected at PEB 419
>> UBI DBG: schedule_erase: schedule erasure of PEB 419, EC 20, torture 0
>> UBI DBG: erase_worker: erase PEB 419 EC 20
>> UBI DBG: sync_erase: erase PEB 419, old EC 20
>> UBI DBG: do_sync_erase: erase PEB 419
>> UBI DBG: sync_erase: erased PEB 419, new EC 21
>> UBI DBG: ubi_io_write_ec_hdr: write EC header to PEB 419
>> UBI DBG: ubi_io_write: write 2048 bytes to PEB 419:0
>> UBI DBG: ensure_wear_leveling: schedule scrubbing
>> UBI DBG: wear_leveling_worker: scrub PEB 420 to PEB 419
>> UBI DBG: ubi_io_read_vid_hdr: read VID header from PEB 420
>> UBI DBG: ubi_io_read: read 2048 bytes from PEB 420:2048
>> UBI DBG: ubi_eba_copy_leb: copy LEB 6:11, PEB 420 to PEB 419
>> UBI DBG: ubi_eba_copy_leb: read 126976 bytes of data
>> UBI DBG: ubi_io_read: read 126976 bytes from PEB 420:4096
>> UBI: fixable bit-flip detected at PEB 420
>> UBI DBG: ubi_io_write_vid_hdr: write VID header to PEB 419
>> UBI DBG: ubi_io_write: write 2048 bytes to PEB 419:2048
>> UBI DBG: ubi_io_read_vid_hdr: read VID header from PEB 419
>> UBI DBG: ubi_io_read: read 2048 bytes from PEB 419:2048
>> UBI DBG: ubi_io_write: write 126976 bytes to PEB 419:4096
>> UBI DBG: ubi_io_read: read 126976 bytes from PEB 419:4096
>> UBI: fixable bit-flip detected at PEB 419
>>
>> Investigation showed that a read with correctable bit errors was done
>> returning -EUCLEAN to the ubi read function.
>>
>> Having read
>> https://lists.denx.de/pipermail/u-boot/2013-September/161961.html which
>> details a workaround to not return EUCLEAN from the NAND reader unless
>> the number of fixed bits returned was 75% of the total number of
>> correctable bits was exceeded during the read. This was impleneted in
>> this version of ubi in uboot 2010.06 and it does hide the bit-flip
>> infinite issue since this is new NAND FLASH. The original 2010.06
>> implementation returns EUCLEAN for any number of fixable bit flips and
>> thus causes the PEB move to the best free one (scrub mode in
>> wear_leveling_worker).
> What's your NAND ECC requirements, and how many bitflips do you
> actually have in those blocks? Also, which NAND controller are we
> talking about?
I will get you the nand and chip info on monday.
It is a SOC by Lantiq/Intel, so no external controller. No hardware ECC 
anyway.
4 bits per 512 byte block correction (software).
75% means 4 bits are be corrected before a -UCLEAN is returned, though 
the data is good.
The original nand flash was brand new in a unit straight from 
production. The uboot driver triggered UCLEAN after a single bit is 
corrected, so only 1 bit triggered this in the original UBI driver (2010 
vintage prior to the 75% threshold being added). Other wise we would not 
have seen the issue. This affected approx 0.4% of units from production 
(43k units with approx 200 failing with recurrent bit-flip errors and 
unbootable at the time prior to the patch attached + 75% threshold patch 
i.e. 4 bits to trigger scrubbing).
>
>> This fix is not a root cause fix though. Investigating further led to
>> the following root cause solution. The following is AFAICT.
>>
>> When the scrubber chooses a PEB to move the from the free balanced tree.
>> This tree is sorted by EC (erase count) and then by PEB number.
>>
>> The find_wl_entry call uses a max parameter of WL_FREE_MAX_DIFF which is
>> 8192 in this config. So the find_wl_entry function will find a PEB that
>> is better in erase count that the current PEB EC. This can easily cause
>> it to find the PEB that was just moved from if it is the lowest numbered
>> PEB in the free tree. Waiting for EC to go above 8192 would take a long
>> time and cause premature aging of the flash PEBs in question.
>>
>> The easy solution is to change the max parameter for scrubbing to this
>> call to 0 so it finds a PEB with a smaller EC than the one being
>> replaced. This means it wont use the previously discarded PEB as its
>> first choice.
> Setting it to 0 sounds a bit aggressive. I guess the idea behind this
> MAX_DIFF was to avoid spending too much time searching for the smallest
> EC val when most of them are close enough. On the other hand, 8192 is
> big an probably only suitable for NANDs that allows 100000 PE cycles.
I did not know the design behind this threshold and chose 0 so it would 
pick the least erased PEB which should be a better choice than the first 
one that is less than 4000.
What would be better is a way to detect scrubbing reusing a PEB that was 
used in the same scrubbing session so that the infinite loop does not 
occur. In our case a hardware watchdog kicks in and it reboots, with the 
same error sequence and no boot as a result. This occurs forever but we 
didnt wait long enough for the PEBs in question to be destroyed.
I did say my solution was not ideal. :-)
>> This fix was implemented and fixable bit-flip errors no longer
>> hang/freeze the boot process! UBI erase and reformat was used between
>> re-tests to get consistent results.
>>
>> Adding the above 75% correctable bitflip threshold is also a good thing
>> as less movement will ensue when the FLASH is new, but as the flash
>> ages, the root cause will once again be invoked causing un-recoverable
>> boot failures.
> It shouldn't. As long as you configure the threshold to a proper
> value (if you think 75% is too high, set it to 50%) UBI should have
> time to detect blocks containing too many bitflips and move them
> around.
This threshold is not a root cause. It hides the root cause. When the 
flash ages and hits the condition, the same infinite loop will occur on 
scrubbing, thus IO locking the disk subsystem, effectively freezing the 
OS. My old (5 years) Samsung Galaxy 4 is currently doing exactly this. 
My analysis may be wrong though. And it may affect other flash wear 
leveling filesystems too. IDK.
>> Note this fault is also in the latest kernel drivers for UBI and may
>> also exist in other wear leveling implementations. The kernel driver
>> issue may be at fault for android devices locking up/freezing
>> sporadically during FLASH read when scrubbing with a relatively full
>> flash and marginally correctable errors causing ping pong PEB moves.
>>
>> The following patch is a workaround and is almost certainly not an
>> optimal solution.
>>
>> What is required for CONFIG_MTD_UBI_FASTMAP is uncertain.
>>
>> I am in the process of writing a unit test to highlight this ping ping
>> move behaviour but have not completed that yet.
>>
>> I hope this description is clear enough.
> Well, I think selecting the bitflip threshold properly is really
> important, simply because some NANDs (including SLC NANDs) are showing
> bitflips even on blocks that have a low EC. Check the NAND ECC
> requirements, and if it's something like 8bit/512bytes, I guess that's
> more or less expected (it all depends on how many bitflips you have in
> the faulty block). It's less likely on NANDs requiring 1bit/512bytes
> ECC, and if that happens on such NANDs, you may have a problem in the
> controller driver.
4 bits ECC per 512 bytes, from memory 28 bytes in OOB, using software 
ECC in the MTD driver.
As I said, I believe the better threshold is hiding the root cause. It 
is only a band-aid.

Thanks for looking into this Boris.

Mark
