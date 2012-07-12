Received: from mx1.watchguard.com ([206.191.171.101] helo=watchguard.com)
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SpPaP-0006GY-TF
 for linux-mtd@lists.infradead.org; Thu, 12 Jul 2012 20:02:06 +0000
From: Noah Romer <Noah.Romer@watchguard.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: skip erase blocks when creating fs image from jffs2 partition?
Date: Thu, 12 Jul 2012 20:02:01 +0000
Message-ID: <01A8FA6BB5F06344A6DE41FAA912A96404AFF5BB@MBX1.wgti.net>
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

Based on my reading of the docs, and some initial experimentation, it seems=
 as though it's possible to create a usable raw image of a jffs2 partition =
in which you skip both bad blocks and empty/erase blocks. Then, when you wr=
ite out the image to a different (erased) flash partition, you end up with =
a jffs2 filesystem in which all empty blocks reside at the end of the files=
ystem (at least until additional data gets written to the filesystem and ge=
ts scattered around, due to wear levelling).=0A=
=0A=
Is that understanding correct? Particularly with regards to whether or not =
the resulting image would be usable.=0A=
=0A=
Thanks,=0A=
Noah=0A=
=0A=
--=0A=
Noah Romer | Staff Software Engineer=0A=
WatchGuard Technologies, Inc. | www.watchguard.com=0A=
=0A=
noah.romer@watchguard.com=
