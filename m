Received: from orion.he.net ([216.218.179.2])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19SyBh-0004oE-5r
	for <linux-mtd@lists.infradead.org>; Thu, 19 Jun 2003 13:06:45 +0100
Received: from kenlap (81-31-97-214.adsl.entanet.co.uk [81.31.97.214]) by
	orion.he.net (8.8.6p2003-03-31/8.8.2) with SMTP id FAA18523 for
	<linux-mtd@lists.infradead.org>; Thu, 19 Jun 2003 05:07:13 -0700
Message-ID: <003701c3365b$52c1eaf0$1207a8c0@kenlap>
From: "Ken Gordon" <ken@magneticscrolls.com>
To: <linux-mtd@lists.infradead.org>
Date: Thu, 19 Jun 2003 13:07:14 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Subject: More protection register fun.
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

from cfi_intelext_read_prot_reg in cfi_cmdset_0001.c (in CVS)

        int ofs_factor = cfi->interleave * cfi->device_type;


                while (count && ((offst-base_offst) < reg_sz)) {
                        *buf =
map_read8(map,(chip->start+((extp->ProtRegAddr+1)*ofs_factor)+offst));
                        buf++;
                        offst++;
                        count--;
                }

In my case (2x Intel Strataflash J3 on a PXA255, configured as 2x16 bit on a
32 bit bus):

    interleave = 2
    device_type = 2

    so ofs_factor = 4

    Now ProtRegAddr is 0x100 and appears to be a byte address within the
device. Now I don't claim any understanding of what device_type means and I
can only test this on hardware I have so can someone who fully uderstands
this code say whether it ought to be more like:

while (count && ((offst-base_offst) < reg_sz)) {
                       *buf =
map_read8(map,(chip->start+((extp->ProtRegAddr+2)*cfi->interleave)+offst));
// also +2 not +1 'cos the lock register is 16 bits
                       buf++;
                       offst++;
                       count--;
               }

Actually this doen't really work either 'cos it gets the same bytes for each
of the two chips.

Any ideas (I'm about to hack my one for my hardware and stop spending time
on this)

    Ken
