Received: from mail-wi0-x243.google.com ([2a00:1450:400c:c05::243])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y1wbf-0003s7-AT
 for linux-mtd@lists.infradead.org; Fri, 19 Dec 2014 12:24:32 +0000
Received: by mail-wi0-f195.google.com with SMTP id h11so596944wiw.6
 for <linux-mtd@lists.infradead.org>; Fri, 19 Dec 2014 04:24:08 -0800 (PST)
MIME-Version: 1.0
Date: Fri, 19 Dec 2014 20:24:08 +0800
Message-ID: <CAOx4H9CgOoxu82M9cpmFcRdfn=n7mQOwOVzVqvhdUiyzddEPSw@mail.gmail.com>
Subject: Get error -74 (ECC error) during ubiattach
From: t kevin <kevint324@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

I get below error message everytime when my box boots up.
It appears there is a ECC error. But such errors should be taken care
by UBI/UBIFS itself, right?
Is it because the background thread "ubi_bgt2d" has not started yet so
no one could do the data scrubbing during ubiattach stage?
Is it possible to do something like a fsck.ubifs to fix this issue?

The system can boot up correctly but this message is kind of terrifying.

Thanks a lot
Kevin

UBI: attaching mtd10 to ubi2
UBI: physical eraseblock size:   131072 bytes (128 KiB)
UBI: logical eraseblock size:    126976 bytes
UBI: smallest flash I/O unit:    2048
UBI: sub-page size:              512
UBI: VID header offset:          2048 (aligned 2048)
UBI: data offset:                4096
UBI warning: ubi_io_read: error -74 (ECC error) while reading 512
bytes from PEB 404:2048, read only 512 bytes, retry
UBI warning: ubi_io_read: error -74 (ECC error) while reading 512
bytes from PEB 404:2048, read only 512 bytes, retry
UBI warning: ubi_io_read: error -74 (ECC error) while reading 512
bytes from PEB 404:2048, read only 512 bytes, retry
UBI error: ubi_io_read: error -74 (ECC error) while reading 512 bytes
from PEB 404:2048, read 512 bytes
[<c0138160>] (unwind_backtrace+0x0/0xf4) from [<c02f43dc>]
(ubi_io_read+0x134/0x314)
[<c02f43dc>] (ubi_io_read+0x134/0x314) from [<c02f49cc>]
(ubi_io_read_vid_hdr+0x48/0x214)
[<c02f49cc>] (ubi_io_read_vid_hdr+0x48/0x214) from [<c02f8d48>]
(ubi_attach+0x1f0/0x1464)
[<c02f8d48>] (ubi_attach+0x1f0/0x1464) from [<c02ef284>]
(ubi_attach_mtd_dev+0x770/0xd04)
[<c02ef284>] (ubi_attach_mtd_dev+0x770/0xd04) from [<c02f081c>]
(ctrl_cdev_ioctl+0xc8/0x174)
[<c02f081c>] (ctrl_cdev_ioctl+0xc8/0x174) from [<c01cfd14>]
(do_vfs_ioctl+0x3e0/0x560)
[<c01cfd14>] (do_vfs_ioctl+0x3e0/0x560) from [<c01cfec8>] (sys_ioctl+0x34/0x64)
[<c01cfec8>] (sys_ioctl+0x34/0x64) from [<c0131aa0>] (ret_fast_syscall+0x0/0x30)
UBI: max. sequence number:       1599
UBI: attached mtd10 to ubi2
UBI: MTD device name:            "data"
UBI: MTD device size:            240 MiB
UBI: number of good PEBs:        1920
UBI: number of bad PEBs:         0
UBI: number of corrupted PEBs:   0
UBI: max. allowed volumes:       128
UBI: wear-leveling threshold:    4096
UBI: number of internal volumes: 1
UBI: number of user volumes:     1
UBI: available PEBs:             0
UBI: total number of reserved PEBs: 1920
UBI: number of PEBs reserved for bad PEB handling: 76
UBI: max/mean erase counter: 7/1
UBI: image sequence number:  1940927810
UBI: background thread "ubi_bgt2d" started, PID 575
