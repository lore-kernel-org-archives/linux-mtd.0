Received: from adsl-69-233-160-201.dsl.pltn13.pacbell.net ([69.233.160.201]
	helo=neptune.TidalNetworks.net)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CgoB4-00079Z-VT
	for linux-mtd@lists.infradead.org; Tue, 21 Dec 2004 12:52:08 -0500
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Dec 2004 09:51:58 -0800
Message-ID: <52BBA75459915749B68F93B604B636CD136C43@neptune.TidalNetworks.net>
From: "Fadi Nasser" <fnasser@TidalNetworks.net>
To: "David Woodhouse" <dwmw2@infradead.org>,
	"Pedro Aguilar" <paguilar@junkerhq.net>
Cc: linux-mtd@lists.infradead.org, jffs-dev@axis.com
Subject: JFFS2 for multi-partition Flash
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello all,
    I apologize I advance for my long email but I'll try to state
The few questions that I have in a detailed fashion. My flash
(sect_size=3D0x20000, starting@0xFE000000) looks like this:
physmap_partitions
0x00000->0x20000	   PPC hardware reset word
0x20000->0x1F00000   Filesystem section
0x1F00000->0x1F40000 U-boot
0x1F40000->0x1F80000 U-boot env

Basically, I only need a portion of Flash to use JFFS2. So I built my
Jffs2.img (padded to 0x1F00000-0x20000=3D0x1ee0000), burned it in flash.
/proc/mtd shows the proper partitions created (in proc at least).

Question#1
I get my jffs2.img filessize =3D 0x100000 (1MB) even though I'm padding =
to
0x1ee0000. Is this because of internal compression?

Problem#1
When linux comes up, I "mknod /dev/mtdblock1 b 31 0". If I try to "mount
-t jffs2 /dev/mtdblock1 /mnt", I see the jffs2_do_mount_fs call scanning
For the magic keys (0x1985) at offset 0x0 (where I don't have a JFFS
Image burned). How can I get the scan_medium and mount_fs files to start
at the proper offset!?

Problem#2
Even after hardcoding the offsets in the jffs2_do_fill_super call,=20
after the scan_medium is happy for the first 0x100000 bytes, I=20
start to see the msgs (0x1985 not found at 0x00100a18: xyz instead).
Jffs2_scan_eraseblock() scans every 4bytes & keeps complaining about n
ot finding the magic key (0x1985). I figured this is because my
img size is 0x100000 even though I padded it to 0x1ee0000. What am I
missing here?

Thank you so much for any pointers that you may offer.

-----Original Message-----
From: owner-jffs-dev@axis.com [mailto:owner-jffs-dev@axis.com] On Behalf
Of David Woodhouse
Sent: Tuesday, December 21, 2004 3:39 AM
To: Pedro Aguilar
Cc: jffs-dev@axis.com; linux-mtd@lists.infradead.org
Subject: Re: Kernel freezing when booting with jffs2

On Sat, 2004-12-11 at 16:11 +0100, Pedro Aguilar wrote:
> The problem is that when mounting the jffs2 filesystem it says
read-only
> (I'm not giving it any read-only flag in the MTD partition) and then
shows
> the msg 'Warning: unable to open an initial console'

Is there a /dev/console node in your file system? Mounting read-only is
normal -- add 'rw' on the command line if you don't want it read-only.

--=20
dwmw2


To unsubscribe from this list: send the line "unsubscribe jffs-dev" in
the body of a message to majordomo@axis.com
