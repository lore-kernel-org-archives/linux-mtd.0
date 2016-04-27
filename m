Received: from gate2.alliedtelesis.co.nz ([2001:df5:b000:5::4])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1avHha-0002xz-K4
 for linux-mtd@lists.infradead.org; Wed, 27 Apr 2016 05:07:55 +0000
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 6E918800E6
 for <linux-mtd@lists.infradead.org>; Wed, 27 Apr 2016 17:07:28 +1200 (NZST)
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
CC: Henry Shen <Henry.Shen@alliedtelesis.co.nz>
Subject: secure file deletion/SECRM support for JFFS2 and UBIFS
Date: Wed, 27 Apr 2016 05:07:26 +0000
Message-ID: <b80a613015cd4b018148cf22865c43ea@svr-chch-ex1.atlnz.lc>
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

Hi,=0A=
=0A=
We have a customer request for "secure file deletion" for our embedded =0A=
devices (kernel version 4.4.6). The first device is running JFFS2 on =0A=
parallel NOR flash but we expect to see the same requirement pop up on =0A=
our newer devices running UBIFS on top of NAND.=0A=
=0A=
I found a couple of old threads related to UBIFS but they all appear to =0A=
have fallen silent. Nothing really for JFFS2.=0A=
=0A=
For our application we're not really concerned about defeating =0A=
determined attackers who have access to the device and hardware that can =
=0A=
do detailed analysis on the transistors that make up the chip. But we =0A=
are trying to protect against casual attackers (or recipients of =0A=
re-furbished hardware) who can run 'dd'.=0A=
=0A=
So I think for us it'd be enough to implement chattr +s and have the =0A=
file's data over written with a fixed value (e.g 0 for NOR flash) when =0A=
it's blocks are added to the garbage collection list.=0A=
=0A=
Is that something people on this list would be interested in? I realize =0A=
JFFS2 is kind of in a twilight phase but we're really not able to =0A=
migrate some customers away from it.=0A=
=0A=
Thanks,=0A=
Chris=0A=
