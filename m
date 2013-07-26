Received: from post.merula.co.uk ([217.146.97.9])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V2gCY-0005rJ-0i
 for linux-mtd@lists.infradead.org; Fri, 26 Jul 2013 11:28:51 +0000
Received: from remote.lucyautomation.co.uk ([62.6.155.233])
 (authenticated bits=0)
 by post.merula.co.uk (8.13.8/8.13.8) with ESMTP id r6QBSR3S023917
 (version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
 for <linux-mtd@lists.infradead.org>; Fri, 26 Jul 2013 12:28:28 +0100
From: John Parker <John.Parker@lucyautomation.co.uk>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Date: Fri, 26 Jul 2013 12:28:25 +0100
Subject: ubifs on SPI NOR Flash with uniform 4k erase block size
Message-ID: <EAF1F21DA385DA4797F21C5DCAEF6BAC45856DEF1C@AUTOSERVER1.auto.local>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all

I'm trying to get ubifs to work optimally on an 2M SPI NOR flash which has =
a 4k erase block size. The device is correctly recognised by the m25p80 dri=
ver which specifies that it supports 4k sectors.

Mtd-utils is 1.5.0. Kernel is 2.6.31 but with a newer m25p80 driver to supp=
ort the specific write commands for this particular flash device.

Mtdinfo reports it correctly
Ubiformat, ubiattach, and ubimkvol all work as expected and ubinfo reports =
that the device has a PEB of 4096 and LEB of 3968.

However, when I use mkfs.ubifs -v /dev/ubi0_0 it complains that the LEB is =
too small and should be a minimum of 15360 (UBIFS_MIN_LEB_SZ).

	Error: too small LEB sixe 3968, minimum is 15360

(note there is an error in mkfs.ubifs.c in that the validate_options() func=
tion reports c->min_io_size instead of c->leb_size if c->leb_size is less t=
han UBIFS_MIN_LEB_SZ - confusing but easy to fix)

Where does the 15*1024 value for UBIFS_MIN_LEB_SZ come from in terms of the=
 ubifs design? I know it's defined in ubifs-media.h - what I mean is why is=
 it 15k?

Is it really a problem? If I take out the 4k sector capability from the dev=
ice spec in the m25p80 driver and let it use the 64k block size I only get =
32 PEBs but the mkfs.ubifs works and I can mount and use the filesystem.

There are a large number of these 4k uniform erase block devices out there =
so others must have hit this problem.

Any ideas?

Kind regards

John
