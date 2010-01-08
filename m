Received: from mail-px0-f200.google.com ([209.85.216.200])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NTCar-0005WC-Rk
	for linux-mtd@lists.infradead.org; Fri, 08 Jan 2010 11:01:30 +0000
Received: by pxi38 with SMTP id 38so8099244pxi.28
	for <linux-mtd@lists.infradead.org>;
	Fri, 08 Jan 2010 03:01:24 -0800 (PST)
MIME-Version: 1.0
From: Shweta Shetty <shyamashweta@gmail.com>
Date: Fri, 8 Jan 2010 16:31:04 +0530
Message-ID: <c58fcbf21001080301h4847f425u2fdecd9085fafbe@mail.gmail.com>
Subject: ubi2- a proposed design for reducing mount time of ubi
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi!

We are 4 computer engineering students who are working on ubi2 as our
final year computer project.
We are focusing on reducing the mount time by writing the header data
in a contiguous format on flash itself.
We present the following design for your consideration and would be
grateful for any constructive comments.

Overview:

MEB =96 A PEB that contains only header data.

1)For each individual PEB, the following header data will be stored
Pnum (Physical block number)
Lnum (Logical block number)
Ec(Erase count)
Sequence number(For versioning)
Vid =96 Volume id to which the leb belongs
Scrub info
(This is basically the information stored in the rb trees in Ram)

2) This data will be stored consecutively within each MEB. This
information requires 34 bytes . Thus 1 MEB can contain metadata for
(Size of PEB/34) number of PEBs. We can thus compute the total no of
MEBs required from the total number of physical blocks in flash.

3) The different MEBs will be maintained as a singly linked closed
hash bucket. Reason for this is given later.

4)1 PEB will act as a header to this bucket.

5)2 PEBs (say PEB 0 and PEB 1) are reserved as anchor blocks.

6) 1 PEB is present as a chain block. Anchor blocks will contain a
pointer to chain block which will contain a pointer to the header
block.

7) The anchor blocks CANNOT be wear-levelled. The chain block, header
block and all MEBs may be wear-levelled by the existing UBI
wear-levelling subsystem. The chain block and header block are present
to guarantee that by the time the anchor blocks go bad, the entire
flash will have gone bad.

8)The anchor blocks, chain block and header block will be handled by
dividing them into sectors. This is the same as the anchor block
concept given in the JFFS3 design document by Artem Bityutskiy. It is
mentioned briefly below:

9) The anchor blocks, chain block and header block will be divided
into sectors of size min i/o units. Initially the 1st sector will
contain valid pointers to next block. If the location of the next
block changes, then the next sector will be written to, without
erasing the entire block. The valid sector can be determined by
reading the block into a buffer and finding the first sector before
0xFF data starts. The entire block needs to be erased only if first
sector needs to be re-written.

10)The MEB hash bucket is maintained as follows:
=09
1)We will be assigning a logical volume for all of the above blocks.
2)We will be mapping required no of blocks i.e required no. of MEBs +
4 to this volume.
3)Each PEB=92s header data will then be mapped to its corresponding MEB
by hash function. The hash function will give the logical number of
the MEB. The data will then be written to the corresponding physical
MEB.
4) During use of flash, whenever header data is updated, we can
directly obtain the corresponding MEB using the hash function and
update it too.

11)Construction of these blocks on flash will be done only on first
use of flash by ubi2. At all other mounts only the MEBs will be read
for constructing the rb trees.

We would be grateful for any suggestions.

--
Shweta Shetty
http://shweta-kaleidoscope.blogspot.com/
Humility is a strange thing. The minute you know you have got it you
have lost it.
