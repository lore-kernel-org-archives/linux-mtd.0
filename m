Received: from mgw-ext13.nokia.com ([131.228.20.172])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1GhPJ9-0005Ao-1C
	for linux-mtd@lists.infradead.org; Tue, 07 Nov 2006 06:40:21 -0500
Subject: Re: UBI and OneNAND
From: Artem Bityutskiy <dedekind@infradead.org>
To: John Smith <john.smith@arrows.demon.co.uk>
In-Reply-To: <loom.20061107T110704-786@post.gmane.org>
References: <32544906.187201162866905328.JavaMail.weblogic@ep_ml06>
	<1162889433.5606.15.camel@localhost.localdomain>
	<loom.20061107T110704-786@post.gmane.org>
Content-Type: text/plain; charset=utf-8
Date: Tue, 07 Nov 2006 13:39:38 +0200
Message-Id: <1162899578.31636.19.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi, few notes:

On Tue, 2006-11-07 at 10:20 +0000, John Smith wrote:
> UBI: data offset:                2048
> UBI: max. allowed volumes:       128
> UBI: wear-levelling threshold:   4096
> UBI: number of internal volumes: 2
> UBI: number of user volumes:     1
> UBI: available PEBs:             49
> UBI: total number of reserved PEBs: 126
> UBI: number of PEBs reserved for bad PEB handling: 1
Hmm, only one PEB is reserved, may be it makes sense to reserve more -
there is a corresponding option.

>=20
>=20
> ##
> ## Then with the busybox shell I can list the MTD partitions
> ##
>=20
> / # cat /proc/mtd
> dev:    size   erasesize  name
> mtd0: 00c00000 00020000 "BootLoader"    <<< Nor Flash
> mtd1: 00400000 00020000 "OldCFE"        <<< Nor Flash
> mtd2: 00100000 00010000 "CFE"           <<< OneNAND Flash
> mtd3: 00400000 00010000 "Kernel"        <<< OneNAND Flash
> mtd4: 00af0000 00010000 "rootfs"        <<< OneNAND Flash
> mtd5: 00010000 00010000 "CFE-NVM"       <<< OneNAND Flash
> mtd6: 00753800 0000f800 "Kernel"        <<< UBI Partition on mtd4:
I would recommend you to use unique names for MTD partitions. You have
two "kernel" partitions.

> ##
> ## Look at existing devices
> ##
> / # ls -l /dev/mtdblock?
> brw-r-----    1 0        0         31,   0 Jan  1 00:00 /dev/mtdblock0
> brw-r-----    1 0        0         31,   1 Jan  1 00:00 /dev/mtdblock1
> brw-r-----    1 0        0         31,   2 Jan  1 00:00 /dev/mtdblock2
> brw-r-----    1 0        0         31,   3 Jan  1 00:00 /dev/mtdblock3
Yo do not need mtdblock devices to mount JFFS2 at all. JFFS2 anyway
works with MTD devices directly and this is just an old way to mount
JFFS2. /dev/mtdX are character devices and you cannot feed the mount
utility by character devices, so this is why fake block devices were
used. Nowadays there is device-less mount support and you may use:

mount mtd7 /mnt/nvm

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
