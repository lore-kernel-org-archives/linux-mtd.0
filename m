Received: from e2.ny.us.ibm.com ([32.97.182.142])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1GhMfS-0002p8-6B
	for linux-mtd@lists.infradead.org; Tue, 07 Nov 2006 03:51:06 -0500
Received: from d01relay04.pok.ibm.com (d01relay04.pok.ibm.com [9.56.227.236])
	by e2.ny.us.ibm.com (8.13.8/8.12.11) with ESMTP id kA78ogSq025585
	for <linux-mtd@lists.infradead.org>; Tue, 7 Nov 2006 03:50:42 -0500
Received: from d01av04.pok.ibm.com (d01av04.pok.ibm.com [9.56.224.64])
	by d01relay04.pok.ibm.com (8.13.6/8.13.6/NCO v8.1.1) with ESMTP id
	kA78obCO105206
	for <linux-mtd@lists.infradead.org>; Tue, 7 Nov 2006 03:50:38 -0500
Received: from d01av04.pok.ibm.com (loopback [127.0.0.1])
	by d01av04.pok.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	kA78obHd016189
	for <linux-mtd@lists.infradead.org>; Tue, 7 Nov 2006 03:50:37 -0500
Subject: Re: UBI and OneNAND
From: Frank Haverkamp <haver@vnet.ibm.com>
To: kyungmin.park@samsung.com
In-Reply-To: <32544906.187201162866905328.JavaMail.weblogic@ep_ml06>
References: <32544906.187201162866905328.JavaMail.weblogic@ep_ml06>
Content-Type: text/plain; charset=UTF-8
Date: Tue, 07 Nov 2006 09:50:33 +0100
Message-Id: <1162889433.5606.15.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: haver@vnet.ibm.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Tue, 2006-11-07 at 02:35 +0000, 박경민 wrote:
> Hi,
> 
> Sorry for changing subject. My mail program has some problem.
> 
> > > I think the following commands just worked:
> > > 
> > >   mkdir /mnt/nvm
> > >   flash_eraseall /dev/mtd6
> > >   mount -t jffs2 /dev/mtdblock6 /mnt/nvm 

I think there is a missunderstanding here. UBI acts as volume management
system. The MTD you connect to UBI cannot be mounted. Instead you create
a UBI volume (with ubimkvol) which has an associated mtd which can be
used to host a jffs2. This can be mounted than.

> Umm. I think 'John' just mounts jffs2 without UBI.

Yes, I agree.
> 
> I also tried but I can't mount jffs2
> 
> It is my sequence.
> 
> # mkdir -p /mnt
> # insmod ubi.ko mtd=3

mtd3 is connected with UBI. This mtd is not to be used as rootfs.
Instead a UBI volume needs to be created to host the rootfs (see also
ubi_jffs2_test.sh).

Example:
  ubimkvol -d0 -n10 -tdynamic -NVOL10 -s 1310720
             ^    ^     ^         ^         ^
             |    |     |         |         |
             |    |     |         |       size here in bytes
             |    |     |       name of mtd & volume
             |    |    JFFS2/UBI volumes need to be dynamic
             |  Unique volume number
     UBI device (you may have multiple, but for me only one made sense)

After this has been executed sucessfully, an mtd named VOL10 should
appear.

Mount this with:
  mount -t jffs2 mtd:VOL10 /mnt

> 
> UBI: attached mtd3 to ubi0
> UBI: MTD device name:            "rootfs"

The structure should probably similar like this:
   ubimtd
     |- rootfs dynamic UBI volume (JFFS2)
     |- extra dynamic UBI volume (JFFS2)
     |- kernel0 static UBI volume
     |- kernel1 static UBI volume

> UBI: MTD device size:            16 MB
> UBI: physical eraseblock size:   131072 bytes (128 KB)
> UBI: logical eraseblock size:    126976 bytes
> UBI: number of good PEBs:        127
> UBI: number of bad PEBs:         1
> UBI: smallest flash I/O unit:    2048
> UBI: VID header offset:          2048 (aligned 2048)
> UBI: data offset:                4096
> UBI: max. allowed volumes:       124
> UBI: wear-levelling threshold:   4096
> UBI: number of internal volumes: 2
> UBI: number of user volumes:     0
> UBI: available PEBs:             122
> UBI: total number of reserved PEBs: 5
> UBI: number of PEBs reserved for bad PEB handling: 1
> 
> # mount -t jffs2 /dev/mtdblock3 /mnt
> 

Please do not try to mount the mtd you defined to be used by UBI.
>From this mtd UBI will take the blocks to run the UBI volumes.
The wearleveling will be accross mtd3 in your case.

> / # mount -t jffs2 /dev/mtdblock3 /tmp
> jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000000: 0x4255 id
> jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000004: 0x0001 id
> jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0000003c: 0xcedc id
> jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000800: 0x4255 id
> jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000804: 0x0101 id
> jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000808: 0xff7f id
> jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0000083c: 0x25b8 id
> jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000010a8: 0x16f1 id
> jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00001154: 0x16f1 id
> jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00001200: 0x16f1 id
> ...
> Cowardly refusing to erase blocks on filesystem with no valid JFFS2 nodes
> empty_blocks 0, bad_blocks 1, c->nr_blocks 128
> mount: Mounting /dev/mtdblock3 on /tmp failed: Input/output error

Frank
