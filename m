Received: from mx.novero.com ([212.23.138.198])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UuLbl-0000Ci-Lz
 for linux-mtd@lists.infradead.org; Wed, 03 Jul 2013 11:52:26 +0000
From: "Anna Fischer (novero/Bochum)" <Anna.Fischer@novero.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Date: Wed, 3 Jul 2013 13:51:59 +0200
Subject: XIP support
Message-ID: <CBB26B88EF85F6489575628B28ECBE6D4326BAAE1E@ablexc01.internal.novero.com>
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

Hi everyone,

I'm looking for help on Linux XIP support on MTD devices.

I'd like to create a system where I can use a single NOR as XIP device and =
at the same time as data storage device. E.g. I can imagine that on my NOR =
flash device I create two partitions: one as ROMFS supporting XIP which hol=
ds kernel and application code, and one as standard data storage, for examp=
le holding a read-write YAFFS2 file system which my applications can use to=
 store data.

Can anyone clarify if this is supported with the current kernel infrastruct=
ure, and if yes then what support do I need on the NOR flash device itself?=
 I assume that the device itself will need to support reading from one segm=
ent in NOR (e.g. XIP partition) whilst writing to another one (data partiti=
on). Many flash vendors call this read-while-erase support. On the other ha=
nd I assume that if the software is capable, then it should also be suffici=
ent that the NOR flash support partial erase functions, and suspend/resume =
for those operations. Can anyone confirm that this can be handled in Linux =
MTD drivers?

Many thanks for any pointers.

Anna
