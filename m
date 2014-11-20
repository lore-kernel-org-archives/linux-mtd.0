Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XrUMJ-00013I-H4
 for linux-mtd@lists.infradead.org; Thu, 20 Nov 2014 16:13:28 +0000
Message-ID: <546E1105.3050005@free-electrons.com>
Date: Thu, 20 Nov 2014 13:04:21 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
MIME-Version: 1.0
To: Richard Koch <n1gp@hotmail.com>
Subject: Re: Using ubiblock
References: <BLU180-W42CC73199E7C240289D55A87760@phx.gbl>
In-Reply-To: <BLU180-W42CC73199E7C240289D55A87760@phx.gbl>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Richard,

(Ccing the rest of the world)

On 11/20/2014 12:55 PM, Richard Koch wrote:
> 
> I was searching for a way to use squashfs for my read-only root file system
> and came across your kernel and mtd patches.
> 

Nice!

> I was hoping you could provide me with an example of how to use it. I tried
> using nandwrite but perhaps thats not the right way?
> 

Sigh, we really need to document this better!

> 
> / # cat /proc/mtd
> dev:    size   erasesize  name
> mtd0: 16c00000 00020000 "nand0.roroot"
> 
> / # flash_erase /dev/mtd0 0 0
> 
> / # ubiattach /dev/ubi_ctrl -m 0
> UBI: attaching mtd0 to ubi1
> UBI: scanning is finished
> UBI: attached mtd0 (name "nand0.roroot", size 364 MiB) to ubi1
> UBI: PEB size: 131072 bytes (128 KiB), LEB size: 126976 bytes
> UBI: min./max. I/O unit sizes: 2048/2048, sub-page size 2048
> UBI: VID header offset: 2048 (aligned 2048), data offset: 4096
> UBI: good PEBs: 2909, bad PEBs: 3, corrupted PEBs: 0
> UBI: user volume: 1, internal volumes: 1, max. volumes count: 128
> UBI: max/mean erase counter: 2/1, WL threshold: 4096, image sequence number: 1217120129
> UBI: available PEBs: 2747, total reserved PEBs: 162, PEBs reserved for bad PEB handling: 157
> UBI: background thread "ubi_bgt1d" started, PID 152
> 
> / # ubiblock -V
> ubiblock 1.5.1
> 
> / # ubiblock --create /dev/ubi1_0
> UBI: ubiblock1_0 created from ubi1:0(rootfs)
> 
> / # nandwrite -p /dev/ubiblock1_0 rootfs_cm6.sqsh
> nandwrite: can't open '/dev/ubiblock1_0': Operation not permitted
> 

nandwrite is applied on MTD char devices. However, the ubiblock1_0
device is a regular block device. Moreover, it's read-only so you can't
write to it.

Instead, you need to write to your volume (most likely with
ubiupdatevol), and then use ubiblock1_0 to mount your filesystem. The
UBI volume and the UBI block device are 1:1 mapped, which means that:

cat /dev/ubiblock1_0 and cat /dev/ubi1_0 should be equal (or we have a
very nasty bug).

-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
