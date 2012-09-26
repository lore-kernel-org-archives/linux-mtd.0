Received: from mail-ie0-f177.google.com ([209.85.223.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TGkO1-0005fA-Aj
 for linux-mtd@lists.infradead.org; Wed, 26 Sep 2012 05:42:17 +0000
Received: by ieje14 with SMTP id e14so546026iej.36
 for <linux-mtd@lists.infradead.org>; Tue, 25 Sep 2012 22:42:15 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1346751620.12610.35.camel@sauron.fi.intel.com>
References: <CADqH6VzVhsGvCCbokjW8TAJSq5Sj33GiHt4gZxOFZaeHtJ4JeQ@mail.gmail.com>
 <1346751620.12610.35.camel@sauron.fi.intel.com>
Date: Wed, 26 Sep 2012 13:42:15 +0800
Message-ID: <CADqH6Vw0kY=U-jymgpj_JpzLkqLb0JjK7J1C1V6qF_uo-jDFng@mail.gmail.com>
Subject: Re: Offtopic: ubifs and best practice for supporting browser based
 firmware upgrades
From: Jaya Kumar <jayakumar.lkml@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Sep 4, 2012 at 5:40 PM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> Another approach people use is that they have "mirror" UBI volume of the
> same size, like "ubifs-reserve". Then the update image is put to
> ubifs-reserve, and after this you use the UBI volume rename feature and
> rename "ubifs-reserve into" "ubifs". This will kill the old "ubifs"
> volume. After this you may resize "ubifs" to something larger, and
> create a new "ubifs-reserve" volume.

Thanks Artem. I like above method. But one thing which I did not expect is that

I setup my single mtd partition with 2 volumes, rootfs and
rootfs_reserve. My system is running from volume 0 (rootfs), ie:
firmware upgrade is from there.

root@localhost:/# ubinfo -a
UBI version:                    1
Count of UBI devices:           1
UBI control device major/minor: 10:61
Present UBI devices:            ubi0

ubi0
Volumes count:                           2
Logical eraseblock size:                 129024 bytes, 126.0 KiB
Total amount of logical eraseblocks:     4036 (520740864 bytes, 496.6 MiB)
Amount of available logical eraseblocks: 0 (0 bytes)
Maximum count of volumes                 128
Count of bad physical eraseblocks:       0
Count of reserved physical eraseblocks:  80
Current maximum erase counter value:     2
Minimum input/output unit size:          2048 bytes
Character device major/minor:            252:0
Present volumes:                         0, 1

Volume ID:   0 (on ubi0)
Type:        dynamic
Alignment:   1
Size:        1829 LEBs (235984896 bytes, 225.1 MiB)
State:       OK
Name:        rootfs
Character device major/minor: 252:1
-----------------------------------
Volume ID:   1 (on ubi0)
Type:        dynamic
Alignment:   1
Size:        2123 LEBs (273917952 bytes, 261.2 MiB)
State:       OK
Name:        rootfs_reserve
Character device major/minor: 252:2

I'm then able to use ubiupdatevol to write the firmware (containing
new rootfs) update to the rootfs_reserve volume.

root@localhost:/# ubiupdatevol /dev/ubi0_1 /mnt/microsd/newfw/ubifs.img

But then when I go to rename rootfs_reserve to rootfs and rootfs to
rootfs_reserve, I get:

root@localhost:/# ubirename /dev/ubi0 rootfs rootfs_reserve
rootfs_reserve rootfs
UBI error: ubi_open_volume: cannot open device 0, volume 0, error -16
UBI error: rename_volumes: cannot open volume 0, error -16
ubirename: error!: cannot rename volumes
           error 16 (Device or resource busy)

It looks like I cannot perform the rename of the running volume, rootfs.

root@localhost:/# ubirename /dev/ubi0 rootfs oldrootfs
UBI error: ubi_open_volume: cannot open device 0, volume 0, error -16
UBI error: rename_volumes: cannot open volume 0, error -16
ubirename: error!: cannot rename volumes
           error 16 (Device or resource busy)

I can rename the reserve fine.
root@localhost:/# ubirename /dev/ubi0 rootfs_reserve somenewname

But I can't kill the name of the running volume.
root@localhost:/# ubirename /dev/ubi0 somenewname rootfs
UBI error: ubi_open_volume: cannot open device 0, volume 0, error -16
UBI error: rename_volumes: cannot open volume "rootfs", error -16
ubirename: error!: cannot rename volumes
           error 16 (Device or resource busy)

I think what this means is that after doing the rootfs upgrade using
ubiupdatevol, I must reboot into a 3rd partition running a minimal OS
to perform the ubirename of roofs_reserve and then reboot again. This
step seems expensive to have to boot into a 3rd partition to do the
rename operation.

I see someone else also has encountered this,
http://comments.gmane.org/gmane.linux.drivers.mtd/39415 and solved by
having a initramfs. I guess I could do that. But still seems messy.

Thanks,
jayakumar
