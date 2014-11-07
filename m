Received: from mail1.bemta8.messagelabs.com ([216.82.243.200])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XmcHH-0005n4-ND
 for linux-mtd@lists.infradead.org; Fri, 07 Nov 2014 05:40:08 +0000
From: Iwo Mergler <Iwo.Mergler@netcommwireless.com>
To: K Richard Pixley <rpixley@graphitesystems.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Date: Fri, 7 Nov 2014 16:35:52 +1100
Subject: RE: jffs2 usage question: nandwrite
Message-ID: <EACD232272DA4849B060F0828564D13B449961CFFA@ntcex01.corp.netcomm.com.au>
References: <545C32CF.9060502@graphitesystems.com>
In-Reply-To: <545C32CF.9060502@graphitesystems.com>
Content-Language: en-AU
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


Hi Rich,


JFFS2 keeps all the relevant information in every block. That is, you can =
shuffle
the erase blocks any way you like and you still have a valid file system.

The holes made by skipping bad blocks are not a problem.


Best regards,

Iwo

________________________________________
From: linux-mtd [linux-mtd-bounces@lists.infradead.org] On Behalf Of K Ric=
hard Pixley [rpixley@graphitesystems.com]
Sent: Friday, 7 November 2014 1:47 PM
To: linux-mtd@lists.infradead.org
Subject: jffs2 usage question: nandwrite

I'm a newbie to flash file systems and I've spent my day reading.
However, I seem to be missing something.

Several sets of instructions encourage me to build my file system using
mkfs.jffs2, which I understand creates an image, (akin to mkisofs),
rather than operating on a device file.  However, once I have the image,
they recommend placing the image onto flash using nandwrite.

I can't find any doc on nandwrite, but I'm guessing that it does a "bad
block aware" sequential copy, meaning that it simply skips any blocks
that it recognizes as bad according to a manufacturer mark. Assuming so,
doesn't this hole in my fresh jffs2 file system cause jffs2 grief?  I
mean, it would cause most other file systems grief to have an extra
block inserted in the middle of their block sequence.

What am I missing?

--rich

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

______________________________________________________________________
This communication contains information which may be confidential or privi=
leged. The information is intended solely for the use of the individual or=
 entity named above.  If you are not the intended recipient, be aware that=
 any disclosure, copying, distribution or use of the contents of this info=
rmation is prohibited.  If you have received this communication in error, =
please notify me by telephone immediately.
______________________________________________________________________
