Received: from mail-by2on0141.outbound.protection.outlook.com
 ([207.46.100.141] helo=na01-by2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YceCU-0000R0-6b
 for linux-mtd@lists.infradead.org; Mon, 30 Mar 2015 18:14:14 +0000
From: "Kline, Matthew" <matthew.kline@flukenetworks.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Mounting UBIFS images with a min. I/O unit of 1 byte
Date: Mon, 30 Mar 2015 18:13:47 +0000
Message-ID: <E8C63C11EA3FB04DBDFEDECEFD927FD1140C207A@US-EVT-EXM04-P.global.tektronix.net>
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

Hello all,

I am attempting to mount a UBIFS image to extract and inspect the files wit=
hin.
Unfortunately, I'm running into a bunch of problems. For starters, there do=
esn't
seem to be a canonical way to do so - the process listed at
http://www.linux-mtd.infradead.org/faq/ubifs.html#L_ubifs_extract
seems out of date given how my kernel (3.19.2) behaves and compared to proc=
esses
listed at more recent sources such as
http://elinux.org/UBIFS#Mounting_UBI_Image_on_PC_using_nandsim or
https://gist.github.com/naodesu/10620506. At any rate, I have had the most =
luck
with the third method, but mount fails, logging to dmesg,
"validate_sb: min. I/O unit mismatch: 8 in superblock, 2048 real".

After asking around on the IRC channel #mtd, I understand that the
problem is caused by the UBIFS image being byte-addressable
(with mkfs.ubifs being passed -m 1), while the NAND device nandsim is simul=
ating
is addressable to 2048 bit (or byte?) blocks (hence the dmesg output).

So, if the image has a minimum I/O unit of 1 byte and most NAND memory
has a unit of >=3D 512 bytes
(as mentioned at http://linux-mtd.infradead.org/doc/ubi.html#L_min_io_unit)=
,
is mounting it with nandsim out of the question? Is there any other approac=
h
I can take?

Best wishes,

Matt Kline
Fluke Networks
