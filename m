Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aL9Uw-0004Mv-Nw
 for linux-mtd@lists.infradead.org; Mon, 18 Jan 2016 13:05:32 +0000
Subject: Re: UBIFS - read only file system
To: Tiago Trota <tiagofgdt@gmail.com>
References: <CAO3V0Grneh8P053k=1eVucuSkW0oq5qf16-5k3mi6xAtcSY5bA@mail.gmail.com>
 <CAFLxGvw7o+omS5qtsjP6SXvXyyg4MbX-paw7KX1=JZZJL0_bSA@mail.gmail.com>
 <CAO3V0Gr1B4NoRO0a0QfJ1OO68AY7KpZPA2yaOTwJ_hjJsESn8w@mail.gmail.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
From: Richard Weinberger <richard@nod.at>
Message-ID: <569CE16F.3030101@nod.at>
Date: Mon, 18 Jan 2016 13:58:23 +0100
MIME-Version: 1.0
In-Reply-To: <CAO3V0Gr1B4NoRO0a0QfJ1OO68AY7KpZPA2yaOTwJ_hjJsESn8w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 18.01.2016 um 13:04 schrieb Tiago Trota:
> 2016-01-15 20:14 GMT+00:00 Richard Weinberger <richard.weinberger@gmail.com>:
>> Hi!
>>
>> On Fri, Jan 15, 2016 at 6:24 PM, Tiago Trota <tiagofgdt@gmail.com> wrote:
>>> I have a system with ARM which is using a NAND flash to store kernel
>>> and file system.
>>> After a reboot  I get these errors and the UBIFS file system becomes
>>> read-only. I can't revert this situation and it was the first time
>>> this happened. Is there anyhing I can do to repair it?
>>
>> The more interesting question is, why could this happen?
>> Did you see some other errors before that?
>> Is this a recent kernel?
> 
> Thank you for the reply.
> Before the reboot user processes and operations on log files were
> running. Is it possible the reboot was not clean?

No. UBIFS was designed not deal with unclean reboots just fine.

> I am using kernel 3.6.5.
> Actually I see the error "unrecognized mount option "v2" or missing
> value" every time the system boots, but at that point the fs is
> already mounted

v2 is not an UBIFS mount option.

> This is the fully ubi related dmesg output whe:
> 
>     UBI: attaching mtd1 to ubi0
>     UBI DBG (pid 1): ubi_attach_mtd_dev: sizeof(struct ubi_ainf_peb) 48
>     UBI DBG (pid 1): ubi_attach_mtd_dev: sizeof(struct ubi_wl_entry) 20
>     UBI DBG (pid 1): io_init: min_io_size      8192
>     UBI DBG (pid 1): io_init: max_write_size   8192
>     UBI DBG (pid 1): io_init: hdrs_min_io_size 8192
>     UBI DBG (pid 1): io_init: ec_hdr_alsize    8192
>     UBI DBG (pid 1): io_init: vid_hdr_alsize   8192
>     UBI DBG (pid 1): io_init: vid_hdr_offset   8192
>     UBI DBG (pid 1): io_init: vid_hdr_aloffset 8192
>     UBI DBG (pid 1): io_init: vid_hdr_shift    0
>     UBI DBG (pid 1): io_init: leb_start        16384
>     UBI DBG (pid 1): io_init: max_erroneous    358

Hmm, did you enable UBI debugging?

>     UBI: physical eraseblock size:   1048576 bytes (1024 KiB)
>     UBI: logical eraseblock size:    1032192 bytes
>     UBI: smallest flash I/O unit:    8192
>     UBI: VID header offset:          8192 (aligned 8192)
>     UBI: data offset:                16384
>     etc_watchdog releasing MDIO access; ethlinkup(0x0)
>     UBI DBG (pid 1): scan_all: scanning is finished
>     UBI: max. sequence number:       737
>     UBI: attached mtd1 to ubi0
>     UBI: MTD device name:            "rootfs"
>     UBI: MTD device size:            3584 MiB
>     UBI: number of good PEBs:        3582
>     UBI: number of bad PEBs:         2
>     UBI: number of corrupted PEBs:   0
>     UBI: max. allowed volumes:       128
>     UBI: wear-leveling threshold:    4096
>     UBI: number of internal volumes: 1
>     UBI: number of user volumes:     1
>     UBI: available PEBs:             0
>     UBI: total number of reserved PEBs: 3582
>     UBI: number of PEBs reserved for bad PEB handling: 70
>     UBI: max/mean erase counter: 2/1
>     UBI: image sequence number:  1469497926
>     UBI: background thread "ubi_bgt0d" started, PID 442
>     drivers/rtc/hctosys.c: unable to open rtc device (rtc0)
>     UBIFS DBG (pid 444): ubifs_bg_thread: background thread
> "ubifs_bgt0_0" started, PID 444
>     UBIFS: recovery needed
>     UBIFS: recovery completed
>     UBIFS: mounted UBI device 0, volume 0, name "rootfs"
>     UBIFS: file system size:   3610607616 bytes (3525984 KiB, 3443
> MiB, 3498 LEBs)
>     UBIFS: journal size:       12517376 bytes (12224 KiB, 11 MiB, 13 LEBs)
>     UBIFS: media format:       w4/r0 (latest is w4/r0)
>     UBIFS: default compressor: none
>     UBIFS: reserved for root:  0 bytes (0 KiB)
>     UBIFS DBG (pid 1): mount_ubifs: compiled on:         Dec 21 2015 at 13:50:37
>     UBIFS DBG (pid 1): mount_ubifs: min. I/O unit size:  8192 bytes
>     UBIFS DBG (pid 1): mount_ubifs: max. write size:     8192 bytes
>     UBIFS DBG (pid 1): mount_ubifs: LEB size:            1032192 bytes
> (1008 KiB)
>     UBIFS DBG (pid 1): mount_ubifs: data journal heads:  1
>     UBIFS DBG (pid 1): mount_ubifs: UUID:
> 2FC6B795-E73D-402A-80FD-4D0C4BB34AC5
>     UBIFS DBG (pid 1): mount_ubifs: big_lpt              0
>     UBIFS DBG (pid 1): mount_ubifs: log LEBs:            4 (3 - 6)
>     UBIFS DBG (pid 1): mount_ubifs: LPT area LEBs:       2 (7 - 8)
>     UBIFS DBG (pid 1): mount_ubifs: orphan area LEBs:    1 (9 - 9)
>     UBIFS DBG (pid 1): mount_ubifs: main area LEBs:      3498 (10 - 3507)
>     UBIFS DBG (pid 1): mount_ubifs: index LEBs:          7
>     UBIFS DBG (pid 1): mount_ubifs: total index bytes:   2783616 (2718
> KiB, 2 MiB)
>     UBIFS DBG (pid 1): mount_ubifs: key hash type:       0
>     UBIFS DBG (pid 1): mount_ubifs: tree fanout:         8
>     UBIFS DBG (pid 1): mount_ubifs: reserved GC LEB:     443
>     UBIFS DBG (pid 1): mount_ubifs: first main LEB:      10
>     UBIFS DBG (pid 1): mount_ubifs: max. znode size      240
>     UBIFS DBG (pid 1): mount_ubifs: max. index node size 192
>     UBIFS DBG (pid 1): mount_ubifs: node sizes:          data 48,
> inode 160, dentry 56
>     UBIFS DBG (pid 1): mount_ubifs: node sizes:          trun 56, sb
> 4096, master 512
>     UBIFS DBG (pid 1): mount_ubifs: node sizes:          ref 64, cmt.
> start 32, orph 32
>     UBIFS DBG (pid 1): mount_ubifs: max. node sizes:     data 4144,
> inode 4256 dentry 312, idx 188
>     UBIFS DBG (pid 1): mount_ubifs: dead watermark:      8192
>     UBIFS DBG (pid 1): mount_ubifs: dark watermark:      8192
>     UBIFS DBG (pid 1): mount_ubifs: LEB overhead:        336
>     UBIFS DBG (pid 1): mount_ubifs: max. dark space:     28655616
> (27984 KiB, 27 MiB)
>     UBIFS DBG (pid 1): mount_ubifs: maximum bud bytes:   8388608 (8192
> KiB, 8 MiB)
>     UBIFS DBG (pid 1): mount_ubifs: BG commit bud bytes: 6815744 (6656
> KiB, 6 MiB)
>     UBIFS DBG (pid 1): mount_ubifs: current bud bytes    614400 (600 KiB, 0 MiB)
>     UBIFS DBG (pid 1): mount_ubifs: max. seq. number:    289228
>     UBIFS DBG (pid 1): mount_ubifs: commit number:       145

Same here.
Maybe a left over from your BSP vendor? ;)

>     VFS: Mounted root (ubifs filesystem) on device 0:11.
>     devtmpfs: mounted
>     Freeing init memory: 184K
>     UBIFS: parse v2
>     UBIFS error (pid 450): ubifs_parse_options: unrecognized mount
> option "v2" or missing value
>     UBIFS error (pid 450): ubifs_remount_fs: invalid or unknown
> remount parameter
> 
> 
> These are the bootargs from u-boot that I am using
> bootargs = console=ttyS0,115200 envaddr=0x1e0c0000 maxcpus=2 mem=1024M
> mtdparts=nand_iproc.0:10M(linux),3584M(rootfs),-(rootfsbk)
> ubi.mtd=rootfs root=ubi0_0 rw rootfstype=ubifs
> 
>>
>>> UBIFS error (pid 454): ubifs_iget: failed to read inode 41930, error -2
>>> UBIFS error (pid 454): ubifs_lookup: dead directory entry 'snmpd.pid', error -2
>>> UBIFS warning (pid 454): ubifs_ro_mode: switched to read-only mode, error -2
>>
>> This is:
>>         inode = ubifs_iget(dir->i_sb, le64_to_cpu(dent->inum));
>>         if (IS_ERR(inode)) {
>>                 /*
>>                  * This should not happen. Probably the file-system needs
>>                  * checking.
>>                  */
>>                 err = PTR_ERR(inode);
>>                 ubifs_err(c, "dead directory entry '%pd', error %d",
>>                           dentry, err);
>>                 ubifs_ro_mode(c, err);
>>                 goto out;
>>         }
>>
>> Can you share the filesystem?
> 
> I have the original ubi image that was flashed on nand device, if that
> is what you are asking, but it is about 50MB. I can show you the mkfs
> and ubinize options that were used.

No I mean the flashed image. i.e. created by nanddump.
To understand the corruption.

> If I do a nand erase (preserving bad blocks info only...) and then
> reflash the nand device with the original ubi image the fs mounts
> without that error.
> I am not sure if it was a nand problem or ubifs. Is there any tests I
> can perform?

You can run MTD tests (within the kernel)
and UBI tests from mtd-utils source package.
Please give them a try.

Thanks,
//richard
