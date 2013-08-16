Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VAQBf-0002Hi-Jo
 for linux-mtd@lists.infradead.org; Fri, 16 Aug 2013 19:59:57 +0000
Message-ID: <520E84A0.6060302@nod.at>
Date: Fri, 16 Aug 2013 21:59:28 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Bill Pringlemeir <bpringlemeir@nbsps.com>
Subject: Re: Fail to mount cloned disk image with fastmap.
References: <87a9kjt73h.fsf@nbsps.com>
 <CAFLxGvwTz=2G89uxzZijcHfj7iqs8o=uyM=yvzHc4tso8Pkq8w@mail.gmail.com>
 <87wqnlqv0d.fsf@nbsps.com>
In-Reply-To: <87wqnlqv0d.fsf@nbsps.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: richard -rw- weinberger <richard.weinberger@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 16.08.2013 21:46, schrieb Bill Pringlemeir:
> On 15 Aug 2013, richard.weinberger@gmail.com wrote:
> 
>> On Thu, Aug 15, 2013 at 3:29 PM, Bill Pringlemeir wrote:
> 
>>> I have back-ported the fastmap code from the 3.0 series to a 2.6.36
>>> kernel on an ARM cpu.  It has been running for some time without issue
>>> and the boot time is reduced by 1/2 second.  I just ran a test over
>>> night with 'pppd' capturing packets and likely filled up the disk.
>>>
>>> It appears that my kernel does not boot, so I made a clone of the disk
>>> and then attempt to mount it on my Ubuntu machine with the following,
> 
>> BTW: What exactly does "my kernel does not boot" mean?
>> Does it also fail at the said WARN_ON()?
> 
>> The WARN_ON() can also trigger if made the image in a wrong way.
>> A truncated image would explain both error messages.
> 
> Unfortunately, the device where this occurs does not have a serial port
> for a console.  So, the boot sequence stops.  My guess was/is that it
> just can not mount the 'UbiFS rootfs'; just like trying to mount it on
> the 3.8 nandsim doesn't work.

Guessing is not good. We like hard facts. :-)

>> fm_autoconvert=0 tells UBI to use the fastmap if one is found but
>> not to automatically convert non-fastmap images to fastmap.
> 
> I thought of this right after 'send'.  At one point there was a '0,1,2'
> value that could disable fastmap?  This must have been a different
> parameter and I think it has been removed.

Yep.
Now the parameter is a Boolean.
MODULE_PARM_DESC(fm_autoconvert, "Set this parameter to enable fastmap automatically on images without a fastmap.");

>> Yes, please try to attach the image with MTD_UBI_FASTMAP=n.
> 
> With no changes to 'mtd3', the non-fast map version seems to boot fine.
> There is some of the initial kernel logs below.  The 'UbiFs' performed a
> 'recovery' as well.

Now I'm really interested in the image to analyze it.

>>> additional issues are encountered.  But I think that some of the UBI
>>> issues might be a problem?  Can I use some other flash with a bigger
>>> size so that 'PEBs' can be reserved?
> 
>>> Of course, I have the disk image and can send additional information.
> 
>> Can you please upload the image somewhere where I can analyze it?
> 
> Is there a program to extract the UBI headers?  I can send the data, but
> I will have to look through it for some time to make sure there is
> nothing I shouldn't give out; downloaded data files, etc. which is
> probably a trival amount of the total image.

Please no mangled images.
Will send you a private mail in a few minutes.

> I will be away for 2 weeks.  It was back ported code and I have just
> disabled 'fastmap' for now.  Are you interested in why the more current
> code has issues?  Or has someone else reported a similar issue?  The
> nand flash controller was an imx25 and I have the NAND driver updates
> to,

Yes! I'm interested in fastmap issues.
So far fastmap has not much users and as it is an experimental feature
I expect issues. ;)

>    commit 657f28f8811c92724db10d18bbbec70d540147d6
>    mtd: kill MTD_NAND_VERIFY_WRITE
> 
> I can not take the infra-structure changes, only the chipset bug fixes
> as we are stuck at 2.6.36 for now.

Please make sure that your backport works correctly.
Did you run ubi-tests on it?

Thanks,
//richard

> Thanks,
> Bill Pringlemeir.
> 
> [    1.650000] UBI: attaching mtd3 to ubi0
> [    1.650000] UBI DBG (pid 1): ubi_attach_mtd_dev: sizeof(struct ubi_ainf_peb) 48
> [    1.650000] UBI DBG (pid 1): ubi_attach_mtd_dev: sizeof(struct ubi_wl_entry) 20
> [    1.650000] UBI DBG (pid 1): io_init: min_io_size      2048
> [    1.650000] UBI DBG (pid 1): io_init: max_write_size   2048
> [    1.650000] UBI DBG (pid 1): io_init: hdrs_min_io_size 512
> [    1.650000] UBI DBG (pid 1): io_init: ec_hdr_alsize    512
> [    1.650000] UBI DBG (pid 1): io_init: vid_hdr_alsize   512
> [    1.650000] UBI DBG (pid 1): io_init: vid_hdr_offset   512
> [    1.650000] UBI DBG (pid 1): io_init: vid_hdr_aloffset 512
> [    1.650000] UBI DBG (pid 1): io_init: vid_hdr_shift    0
> [    1.650000] UBI DBG (pid 1): io_init: leb_start        2048
> [    1.650000] UBI DBG (pid 1): io_init: max_erroneous    191
> [    1.650000] UBI: physical eraseblock size:   131072 bytes (128 KiB)
> [    1.660000] UBI: logical eraseblock size:    129024 bytes
> [    1.670000] UBI: smallest flash I/O unit:    2048
> [    1.670000] UBI: sub-page size:              512
> [    1.680000] UBI: VID header offset:          512 (aligned 512)
> [    1.690000] UBI: data offset:                2048
> [    2.640000] UBI DBG (pid 1): scan_all: scanning is finished
> [    2.640000] UBI: max. sequence number:       9141
> [    2.800000] UBI: attached mtd3 to ubi0
> [    2.800000] UBI: MTD device name:            "root"
> [    2.800000] UBI: MTD device size:            239 MiB
> [    2.800000] UBI: number of good PEBs:        1914
> [    2.800000] UBI: number of bad PEBs:         4
> [    2.800000] UBI: number of corrupted PEBs:   0
> [    2.800000] UBI: max. allowed volumes:       128
> [    2.800000] UBI: wear-leveling threshold:    4096
> [    2.800000] UBI: number of internal volumes: 1
> [    2.800000] UBI: number of user volumes:     1
> [    2.800000] UBI: available PEBs:             0
> [    2.810000] UBI: total number of reserved PEBs: 1914
> [    2.820000] UBI: number of PEBs reserved for bad PEB handling: 19
> [    2.830000] UBI: max/mean erase counter: 51/5
> [    2.840000] UBI: image sequence number:  739038085
> [    2.850000] UBI: background thread "ubi_bgt0d" started, PID 189
> [    2.870000] Freeing init memory: 1176K
> [    3.520000] UBIFS: background thread "ubifs_bgt0_3" started, PID 212
> [    3.560000] UBIFS: recovery needed
> [    3.770000] UBIFS: recovery completed
> [    3.770000] UBIFS: mounted UBI device 0, volume 3, name "rootfs"
> [    3.770000] UBIFS: LEB size: 129024 bytes (126 KiB), min./max. I/O unit sizes: 2048 bytes/2048 bytes
> [    3.770000] UBIFS: FS size: 242565120 bytes (231 MiB, 1880 LEBs), journal size 9033728 bytes (8 MiB, 71 LEBs)
> [    3.770000] UBIFS: reserved for root: 4190434 bytes (4092 KiB)
> [    3.770000] UBIFS: media format: w4/r0 (latest is w4/r0), UUID 82867E3B-5B71-485C-B911-409531E9DA4B, small LPT model
> 
