Received: from mail-wm0-x242.google.com ([2a00:1450:400c:c09::242])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c03bR-0001RZ-N0
 for linux-mtd@lists.infradead.org; Fri, 28 Oct 2016 09:37:35 +0000
Received: by mail-wm0-x242.google.com with SMTP id b80so6547177wme.2
 for <linux-mtd@lists.infradead.org>; Fri, 28 Oct 2016 02:37:12 -0700 (PDT)
Date: Fri, 28 Oct 2016 11:37:08 +0200
From: Ralph Sennhauser <ralph.sennhauser@gmail.com>
To: Richard Weinberger <richard@nod.at>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
Subject: [REGRESSION 4.9-rc2] "c83ed4c - ubifs: Abort readdir upon error"
 breaks mount
Message-ID: <20161028113708.4d5535ba@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear Richard, dear list

When testing 4.9-rc2 the device wouldn't boot, as it turns out commit
c83ed4c9dbb358b9e7707486e167e940d48bfeed prevent's me mounting root.


The relevant portion of init in the initramfs:

  modprobe ubi mtd=$(get_mtd_from_root_arg) block=0,0 || rescue_shell "ubi"
  modprobe ubifs || rescue_shell "ubifs"
  sleep 1

  mount -o ro -t squashfs /dev/ubiblock0_0 /rom || rescue_shell "mount rootfs"
  mount -o rw,noatime -t ubifs /dev/ubi0_1 /overlay || rescue_shell "mount rootfs_data"

  mkdir -p /overlay/upper || rescue_shell "mkdir upper"
  mkdir -p /overlay/work || rescue_shell "mkdir work"

  mount -o rw,noatime,lowerdir=/rom,upperdir=/overlay/upper,workdir=/overlay/work \
        -t overlay overlay /newroot || rescue_shell "mount overlay"


The corresponding output:

  [    1.396152] ubi0: attaching mtd5
  [    1.407127] random: fast init done
  [    1.471770] ubi0: scanning is finished
  [    1.491499] ubi0: volume 1 ("rootfs_data") re-sized from 9 to 111 LEBs
  [    1.498325] ubi0: attached mtd5 (name "rootfs1", size 34 MiB)
  [    1.504106] ubi0: PEB size: 131072 bytes (128 KiB), LEB size: 126976 bytes
  [    1.511007] ubi0: min./max. I/O unit sizes: 2048/2048, sub-page size 2048
  [    1.517826] ubi0: VID header offset: 2048 (aligned 2048), data offset: 4096
  [    1.524819] ubi0: good PEBs: 272, bad PEBs: 0, corrupted PEBs: 0
  [    1.530848] ubi0: user volume: 2, internal volumes: 1, max. volumes count: 128
  [    1.538102] ubi0: max/mean erase counter: 1/0, WL threshold: 4096, image sequence number: 1823239451
  [    1.547275] ubi0: available PEBs: 0, total reserved PEBs: 272, PEBs reserved for bad PEB handling: 20
  [    1.556613] ubi0: background thread "ubi_bgt0d" started, PID 575
  [    1.562933] block ubiblock0_0: created from ubi0:0(rootfs)
  [    2.588027] UBIFS (ubi0:1): default file-system created
  [    2.593689] UBIFS (ubi0:1): background thread "ubifs_bgt0_1" started, PID 586
  [    2.626943] UBIFS (ubi0:1): UBIFS: mounted UBI device 0, volume 1, name "rootfs_data"
  [    2.634816] UBIFS (ubi0:1): LEB size: 126976 bytes (124 KiB), min./max. I/O unit sizes: 2048 bytes/2048 bytes
  [    2.644781] UBIFS (ubi0:1): FS size: 12824576 bytes (12 MiB, 101 LEBs), journal size 1015809 bytes (0 MiB, 6 LEBs)
  [    2.655175] UBIFS (ubi0:1): reserved for root: 605735 bytes (591 KiB)
  [    2.661646] UBIFS (ubi0:1): media format: w4/r0 (latest is w4/r0), UUID FC75053C-E958-4BBC-BD2B-CFCD72BD47F6, small LPT model
  mount: mounting overlay on /newroot failed: No such file or directory
  Error in /init: mount overlay
  -install: applet not found


  BusyBox v1.25.1 () built-in shell (ash)

  sh: can't access tty; job control turned off
  #


The device is a Linksys WRT1900ACS (Shelby), for a basically identical device
see ./arch/arm/boot/dts/armada-385-linksys-cobra.dts


Regards
Ralph
