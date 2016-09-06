To: Miklos Szeredi <miklos@szeredi.hu>, linux-unionfs@vger.kernel.org,
 Richard Weinberger <richard@nod.at>, Artem Bityutskiy <dedekind1@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>, linux-mtd@lists.infradead.org
Cc: lede-dev@lists.infradead.org
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Subject: overlayfs + ubifs: power cut results in "failed to create directory
 /overlay/work/work (errno: 17); mounting read-only"
Message-ID: <58c7c482-9a51-73d1-7694-e1928f3bedb0@gmail.com>
Date: Tue, 6 Sep 2016 12:46:30 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
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

In LEDE/OpenWrt we use UBI with two volumes: "rootfs" and "rootfs_data". With
rootfs mounted at / we mount rootfs_data volume at /overlay and then use
overlayfs to combine these two.

1) Before:
/dev/root on / type squashfs (ro,relatime)
/dev/ubi0_1 on /overlay type ubifs (rw,noatime)

2) Mounting overlayfs
mount("overlayfs:/overlay", "/mnt", "overlay", MS_NOATIME, "lowerdir=/,upperdir=/overlay/upper,workdir=/overlay/work")

3) After:
/dev/root on / type squashfs (ro,relatime)
/dev/ubi0_1 on /overlay type ubifs (rw,noatime)
overlayfs:/overlay on /mnt type overlay (ro,noatime,lowerdir=/,upperdir=/overlay/upper,workdir=/overlay/work)

It works fine as long as there aren't unexpected power cuts. I can easily break
it in a well-reproducible way by doing:
date > bar.txt && rm foo.sh
sleep 2s
[power cut]

On the next boot LEDE/OpenWrt script calls the same mount function but it
results in:
[   10.017235] overlayfs: failed to create directory /overlay/work/work (errno: 17); mounting read-only

I tracked that error and got a following forward trace for it:
ovl_fill_super
ovl_workdir_create
ovl_cleanup
vfs_rmdir
ubifs_rmdir
check_dir_empty

In other words mounting overlayfs fails because ubifs refuses to remove
work/work as this directory is not empty. On a clean boot /overlay/work/work is
empty and everything works fine but after a power cut I can see
/overlay/work/work/#c752f2a8 file.

I don't really know anything about overlayfs and its workdir, I just expected
overlayfs to recover from such situation on its own. FWIW after a power cut and
reboot my bar.txt is an empty file and foo.sh still exists.

Does it sound like an overlayfs issue to you? Can you think of some way of
fixing this?

-- 
Rafał
