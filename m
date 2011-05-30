Received: from lo.gmane.org ([80.91.229.12])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QR3xs-00015g-Sc
	for linux-mtd@lists.infradead.org; Mon, 30 May 2011 15:01:10 +0000
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gldm-linux-mtd-36@m.gmane.org>) id 1QR3xo-0002BJ-Qd
	for linux-mtd@lists.infradead.org; Mon, 30 May 2011 17:01:04 +0200
Received: from mar92-9-82-237-75-54.fbx.proxad.net ([82.237.75.54])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Mon, 30 May 2011 17:01:04 +0200
Received: from gilles.ganault by mar92-9-82-237-75-54.fbx.proxad.net with
	local (Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Mon, 30 May 2011 17:01:04 +0200
To: linux-mtd@lists.infradead.org
From: Gilles <gilles.ganault@free.fr>
Subject: Re: [Ubi] Wrong major:minor
Date: Mon, 30 May 2011 17:00:53 +0200
Message-ID: <u4b7u6969ut0gkpjs51potbhdmsk7l2on8@4ax.com>
References: <5d84u6d24de3ikt776vdrqpnhhecs3aoio@4ax.com>
	<BANLkTimab0pKp68f_coPfsjm_6GdKAxSew@mail.gmail.com>
	<i1q6u61tl5go0ou25i0dcupco020ea94a3@4ax.com>
	<jlt6u6h28631h09gotqakl7ihtdcsbga7k@4ax.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 30 May 2011 14:06:57 +0200, Gilles <gilles.ganault@free.fr>
wrote:
>> ubiupdatevol /dev/ubi0_0 /var/tmp/rootfs.ubifs
>> mount -t ubifs ubi0:ubifs0 /mnt
>UBIFS error (pid 87): validate_sb: LEB size mismatch: 204800 in
>superblock, 129024 real
>UBIFS error (pid 87): validate_sb: bad superblock, error 1
>mount: mounting ubi0:ubifs0 on /mnt failed: Invalid argument

After more googling, the issue was wrong numbers between the original
root image, the Ubi image, and the NAND partition.

But I'm a bit lost as to how to harmonize settings in mkfs.ubifs,
ubi.cf/ubinize, and ubiformat.

Things work OK until I run "ubimkvol":
==================
1. Turn rootfs.ubifs into ubi.img:

> vi ubi.cfg
[ubifs]
mode=ubi
image=./images/rootfs.ubifs
vol_id=0
#"vol_size field must be larger than UBIFS image,
#but smaller than total flash space"
;4.915.200 images/rootfs.ubifs
;
;mtd2: 0f800000 00020000 "file system(nand)"
;f800000 = 260.046.848
vol_size=200MiB
vol_type=dynamic
vol_name=rootfs
vol_flags=autoresize

> ubinize -o ubi.img -m 2048 -p 128KiB -s 512 ubi.cfg

> mv ubi.img /var/www/

2. Download ubi.img from appliance:

> wget -c http://workstation/ubi.img

3. Format NAND mtd2 with ubi.img

> ubiformat /dev/mtd2 -s 512 -f ubi.img

4. Attach mtd2 to Ubi:
           
> ubiattach /dev/ubi_ctrl -m 2

5. Ask mdev to create ubi0 dev node:

> mdev -s
> ls -al /dev/ubi*

6. Create Ubi volume:

> ubimkvol /dev/ubi0 -m -N ubifs0
ubimkvol: error!: UBI device does not have free logical eraseblocks
==================

Thank you.
