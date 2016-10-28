Received: from mout02.posteo.de ([185.67.36.142])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c09si-0002Qs-Dl
 for linux-mtd@lists.infradead.org; Fri, 28 Oct 2016 16:19:49 +0000
Message-ID: <1477671544.8927.1.camel@embedded.rocks>
Subject: Re: [PATCH] ubifs: Fix regression in ubifs_readdir()
From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
To: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
Cc: dedekind1@gmail.com, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org,  adrian.hunter@intel.com,
 ralph.sennhauser@gmail.com, peda@axentia.se
Date: Fri, 28 Oct 2016 18:19:04 +0200
In-Reply-To: <1477648432-9543-1-git-send-email-richard@nod.at>
References: <1477648432-9543-1-git-send-email-richard@nod.at>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Fri, 2016-10-28 at 11:53 +0200, Richard Weinberger wrote:
> Commit c83ed4c9dbb35 ("ubifs: Abort readdir upon error") broke
> overlayfs support because the fix exposed an internal error
> code to VFS.
> 
> Reported-by: Peter Rosin <peda@axentia.se>
> Tested-by: Peter Rosin <peda@axentia.se>
> Reported-by: Ralph Sennhauser <ralph.sennhauser@gmail.com>
> Fixes: c83ed4c9dbb35 ("ubifs: Abort readdir upon error")
> Cc: stable@vger.kernel.org
> Signed-off-by: Richard Weinberger <richard@nod.at>
> ---
>  fs/ubifs/dir.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
> index bd4a5e8ce441..ca16c5d7bab1 100644
> --- a/fs/ubifs/dir.c
> +++ b/fs/ubifs/dir.c
> @@ -543,6 +543,14 @@ static int ubifs_readdir(struct file *file,
> struct dir_context *ctx)
>  
>  	if (err != -ENOENT)
>  		ubifs_err(c, "cannot find next direntry, error %d",
> err);
> +	else
> +		/*
> +		 * -ENOENT is a non-fatal error in this context, the
> TNC uses
> +		 * it to indicate that the cursor moved past the
> current directory
> +		 * and readdir() has to stop.
> +		 */
> +		err = 0;
> +
>  
>  	/* 2 is a special value indicating that there are no more
> direntries */
>  	ctx->pos = 2;

I'm not sure if it's related to the issue reported by Peter Rosin and
Ralph Sennhauser, but I am still getting a kernel panic using UBIFS
with OverlayFS on Linux v4.9.0-rc2 with this patch applied:


"""
[    2.709197] ubi0: default fastmap pool size: 15
[    2.713806] ubi0: default fastmap WL pool size: 7
[    2.718776] ubi0: attaching mtd5
[    3.690342] ubi0: scanning is finished
[    3.726232] ubi0 warning: ubi_eba_init: cannot reserve enough PEBs
for bad PEB handling, reserved 18, need 20
[    3.756003] ubi0: attached mtd5 (name "ubi-0", size 44 MiB)
[    3.761658] ubi0: PEB size: 131072 bytes (128 KiB), LEB size: 126976
bytes
[    3.768857] ubi0: min./max. I/O unit sizes: 2048/2048, sub-page size
2048
[    3.775860] ubi0: VID header offset: 2048 (aligned 2048), data
offset: 4096
[    3.782886] ubi0: good PEBs: 352, bad PEBs: 0, corrupted PEBs: 0
[    3.789080] ubi0: user volume: 1, internal volumes: 1, max. volumes
count: 128
[    3.796501] ubi0: max/mean erase counter: 1/0, WL threshold: 4096,
image sequence number: 955660178
[    3.805742] ubi0: available PEBs: 0, total reserved PEBs: 352, PEBs
reserved for bad PEB handling: 18
[    3.815502] ubi0: background thread "ubi_bgt0d" started, PID 40
[    3.822173] ubi1: default fastmap pool size: 10
[    3.827213] ubi1: default fastmap WL pool size: 5
[    3.832016] ubi1: attaching mtd7
[    4.278806] ubi1: scanning is finished
[    4.376526] ubi1: volume 0 ("user") re-sized from 13 to 162 LEBs
[    4.391959] ubi1: attached mtd7 (name "data", size 36 MiB)
[    4.397813] ubi1: PEB size: 131072 bytes (128 KiB), LEB size: 126976
bytes
[    4.404761] ubi1: min./max. I/O unit sizes: 2048/2048, sub-page size
2048
[    4.411752] ubi1: VID header offset: 2048 (aligned 2048), data
offset: 4096
[    4.418909] ubi1: good PEBs: 288, bad PEBs: 0, corrupted PEBs: 0
[    4.425107] ubi1: user volume: 2, internal volumes: 1, max. volumes
count: 128
[    4.432399] ubi1: max/mean erase counter: 1/0, WL threshold: 4096,
image sequence number: 1961582752
[    4.441714] ubi1: available PEBs: 0, total reserved PEBs: 288, PEBs
reserved for bad PEB handling: 20
[    4.451267] ubi1: background thread "ubi_bgt1d" started, PID 41
[    4.469335] input: gpio-keys as /devices/soc0/gpio-keys/input/input0
[    4.492732] stmp3xxx-rtc 80056000.rtc: setting system clock to 1970-
01-01 00:01:07 UTC (67)
[    4.506810] ALSA device list:
[    4.509854]   #0: mxs_wm8524
[    4.523140] uart-pl011 80074000.serial: no DMA platform data
[    4.909981] UBIFS (ubi0:1): UBIFS: mounted UBI device 0, volume 1,
name "rootfs", R/O mode
[    4.919428] UBIFS (ubi0:1): LEB size: 126976 bytes (124 KiB),
min./max. I/O unit sizes: 2048 bytes/2048 bytes
[    4.933097] UBIFS (ubi0:1): FS size: 40378368 bytes (38 MiB, 318
LEBs), journal size 5586944 bytes (5 MiB, 44 LEBs)
[    4.944659] UBIFS (ubi0:1): reserved for root: 0 bytes (0 KiB)
[    4.954275] UBIFS (ubi0:1): media format: w4/r0 (latest is w4/r0),
UUID 3F29D9B8-363D-4A54-8CE4-BF6969BB9687, small LPT model
[    4.993543] VFS: Mounted root (ubifs filesystem) readonly on device
0:13.
[    5.023313] devtmpfs: mounted
[    5.036855] Freeing unused kernel memory: 144K (c0506000 - c052a000)
[    5.043278] This architecture does not have kernel memory
protection.
[    5.869112] UBIFS (ubi1:0): background thread "ubifs_bgt1_0"
started, PID 43
[    6.056630] UBIFS (ubi1:0): start fixing up free space
[    6.162648] UBIFS (ubi1:0): free space fixup complete
[    6.263554] UBIFS (ubi1:0): UBIFS: mounted UBI device 1, volume 0,
name "user"
[    6.271600] UBIFS (ubi1:0): LEB size: 126976 bytes (124 KiB),
min./max. I/O unit sizes: 2048 bytes/2048 bytes
[    6.285552] UBIFS (ubi1:0): FS size: 19300352 bytes (18 MiB, 152
LEBs), journal size 3047424 bytes (2 MiB, 24 LEBs)
[    6.296731] UBIFS (ubi1:0): reserved for root: 0 bytes (0 KiB)
[    6.306432] UBIFS (ubi1:0): media format: w4/r0 (latest is w4/r0),
UUID A5813F13-6645-4096-B663-A08D87959541, small LPT model
[    6.542487] random: crng init done
mount: mounting overlay on /mnt/overlay failed: No such file or
directory
mount: mounting /dev on /mnt/overlay/dev failed: No such file or
directory
mount: mounting /mnt/user on /mnt/overlay/mnt/user failed: No such file
or directory
chroot: can't execute '/sbin/init': No such file or directory
[    6.670206] Kernel panic - not syncing: Attempted to kill init!
exitcode=0x00007f00
[    6.670206] 
[    6.679426] CPU: 0 PID: 1 Comm: chroot Not tainted 4.9.0-rc2-LINTECH 
#1
[    6.686075] Hardware name: Freescale MXS (Device Tree)
[    6.691320] [<c000f150>] (unwind_backtrace) from [<c000d318>]
(show_stack+0x10/0x14)
[    6.699143] [<c000d318>] (show_stack) from [<c0092338>]
(panic+0xb4/0x23c)
[    6.706098] [<c0092338>] (panic) from [<c00183dc>]
(do_exit+0x450/0x84c)
[    6.712866] [<c00183dc>] (do_exit) from [<c0019ecc>]
(do_group_exit+0xb8/0xbc)
[    6.720150] [<c0019ecc>] (do_group_exit) from [<c0019ee0>]
(SyS_exit_group+0x10/0x14)
[    6.728037] [<c0019ee0>] (SyS_exit_group) from [<c000a160>]
(ret_fast_syscall+0x0/0x1c)
[    6.736155] ---[ end Kernel panic - not syncing: Attempted to kill
init! exitcode=0x00007f00
"""

This is my preinit script:

"""
#!/bin/sh

mount -t ubifs /dev/ubi1_0 /mnt/user

mkdir -p /mnt/user/overlay
mkdir -p /mnt/user/work

# Overlay read-only rootfs and read-write user filesystem.
mount -t overlay overlay -o
lowerdir=/,upperdir=/mnt/user/overlay,workdir=/mnt/user/work,noatime
/mnt/overlay

# Move necessary mount points
mount -n --move /dev /mnt/overlay/dev
mount -n --move /mnt/user /mnt/overlay/mnt/user

exec chroot /mnt/overlay /sbin/init
"""

Note, this is working on Linux 4.7.

Best regards
Jörg Krause
