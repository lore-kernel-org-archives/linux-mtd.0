Received: from outbound01.mx-relay.com ([5.39.185.33]
 helo=outbound01-b.mx-relay.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cnosy-00027E-Or
 for linux-mtd@lists.infradead.org; Tue, 14 Mar 2017 16:01:23 +0000
Subject: Re: One bit flip in erased page causes uncorrectable error using
 (LS1020A) HW ECC
To: Richard Weinberger <richard.weinberger@gmail.com>
References: <8f214368-48d1-ae21-b303-b36431abbeb9@aimvalley.nl>
 <CAFLxGvxrcUDEBcUsnQibYbX=-8BRSuP7ir3vzpFD-GL+Ofk7wg@mail.gmail.com>
Cc: Linux MTD <linux-mtd@lists.infradead.org>,
 Norbert van Bolhuis <nvbolhuis@aimvalley.nl>
From: Kees Trommel <ctrommel@aimvalley.nl>
Message-ID: <09b0b187-4232-0018-b112-c7f8d24d2cd7@aimvalley.nl>
Date: Tue, 14 Mar 2017 16:56:33 +0100
MIME-Version: 1.0
In-Reply-To: <CAFLxGvxrcUDEBcUsnQibYbX=-8BRSuP7ir3vzpFD-GL+Ofk7wg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Richard,

 > So, I fear your driver needs a better way to work around these bit flips

That was I afraid of, thanks for you answer.

 > What exactly does UBI report?

fsl,ifc-nand 7e800000.flash: NAND Flash ECC Uncorrectable Error
ubi0 warning: ubi_io_read: error -74 (ECC error) while reading 4096 
bytes from PEB 500:4096, read only 4096 bytes, retry
fsl,ifc-nand 7e800000.flash: NAND Flash ECC Uncorrectable Error
ubi0 warning: ubi_io_read: error -74 (ECC error) while reading 4096 
bytes from PEB 500:4096, read only 4096 bytes, retry
fsl,ifc-nand 7e800000.flash: NAND Flash ECC Uncorrectable Error
ubi0 warning: ubi_io_read: error -74 (ECC error) while reading 4096 
bytes from PEB 500:4096, read only 4096 bytes, retry
fsl,ifc-nand 7e800000.flash: NAND Flash ECC Uncorrectable Error
ubi0 error: ubi_io_read: error -74 (ECC error) while reading 4096 bytes 
from PEB 500:4096, read 4096 bytes
CPU: 0 PID: 81 Comm: ubiattach Not tainted 4.1.8-rt8+gbd51baf #13
Hardware name: Freescale LS1021A
[<80011319>] (unwind_backtrace) from [<8000f237>] (show_stack+0xb/0xc)
[<8000f237>] (show_stack) from [<802fd1b1>] (dump_stack+0x51/0x64)
[<802fd1b1>] (dump_stack) from [<80204adf>] (ubi_io_read+0x14f/0x1e4)
[<80204adf>] (ubi_io_read) from [<80204e3b>] 
(ubi_io_read_vid_hdr+0x4f/0x144)
[<80204e3b>] (ubi_io_read_vid_hdr) from [<802081ab>] 
(scan_all.constprop.9+0xef/0x662)
[<802081ab>] (scan_all.constprop.9) from [<802088d1>] (ubi_attach+0x59/0xd0)
[<802088d1>] (ubi_attach) from [<80201271>] (ubi_attach_mtd_dev+0x15f/0x5ea)
[<80201271>] (ubi_attach_mtd_dev) from [<80201c45>] 
(ctrl_cdev_ioctl+0x81/0x110)
[<80201c45>] (ctrl_cdev_ioctl) from [<8009f157>] (do_vfs_ioctl+0x329/0x3e2)
[<8009f157>] (do_vfs_ioctl) from [<8009f233>] (SyS_ioctl+0x23/0x40)
[<8009f233>] (SyS_ioctl) from [<8000cf61>] (ret_fast_syscall+0x1/0x4c)
ubi0: scanning is finished
ubi0: attached mtd2 (name "UBI FS", size 508 MiB)
ubi0: PEB size: 262144 bytes (256 KiB), LEB size: 253952 bytes
ubi0: min./max. I/O unit sizes: 4096/4096, sub-page size 4096
ubi0: VID header offset: 4096 (aligned 4096), data offset: 8192
ubi0: good PEBs: 2028, bad PEBs: 4, corrupted PEBs: 0
ubi0: user volume: 1, internal volumes: 1, max. volumes count: 128
ubi0: max/mean erase counter: 22/12, WL threshold: 4096, image sequence 
number: 0
ubi0: available PEBs: 0, total reserved PEBs: 2028, PEBs reserved for 
bad PEB handling: 36
ubi0: background thread "ubi_bgt0d" started, PID 82
UBI device number 0, total 2028 LEBs (515014656 bytes, 491.2 MiB), 
available 0 LEBs (0 bytes), LEB size 253952 bytes (248.0 KiB)

Kees.

On 9-3-2017 23:15, Richard Weinberger wrote:
> Kees,
>
> On Tue, Mar 7, 2017 at 10:15 AM, Kees Trommel <ctrommel@aimvalley.nl> wrote:
>> Hello,
>>
>> I am doing development on a custom board with a NXP LS1020A of which the
>> NAND controller supports HW ECC. Unfortunately the implementation of the HW
>> ECC does not do the final XOR with the ECC of an empty page (like the Linux
>> SW implementation does). This causes that a read of an empty page (both data
>> and OOB) causes the HW to report an uncorrectable error. The Linux driver of
>> this NAND controller (drivers/mtd/nand/fsl_ifc_nand.c) tries to workaround
>> this by checking whether a page with an uncorrectable error is erased and if
>> so the uncorrectable error is suppressed. However this work around does not
>> work when a bit flips in an erased page because the page is no longer
>> regarded as empty:(
>>
>> I observed a few times that UBI reports uncorrectable errors for the above
>> reason and I am wondering whether this can cause a corruption of the
>> UBI/UBIFS on top of the NAND mtd?
> What exactly does UBI report?
>
>> Until now I did not observe an UBI/UBIFS corruption but I am not sure
>> whether I am just lucky or whether UBI/UBIFS can deal with uncorrectable
>> errors in erased pages. I am  hoping that someone with a more in depth
>> knowledge of UBI/UBIFS can answer this.
> UBIFS assumes that empty space is really empty and assumes that the layers below
> deals with bit flips in empty pages.
> So, I fear your driver needs a better way to work around these bit flips.
>
