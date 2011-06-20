Received: from mail.dekaresearch.com ([208.65.175.196]
	helo=dekaexchange07.deka.local)
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QYcQR-0007Vx-8w
	for linux-mtd@lists.infradead.org; Mon, 20 Jun 2011 11:13:52 +0000
From: Atlant Schmidt <aschmidt@dekaresearch.com>
To: 'ANDY KENNEDY' <ANDY.KENNEDY@adtran.com>, "linux-mtd@lists.infradead.org"
	<linux-mtd@lists.infradead.org>
Date: Mon, 20 Jun 2011 07:13:45 -0400
Subject: RE: NAND OOB data.
Message-ID: <0A40042D85E7C84DB443060EC44B3FD32A7208F91A@dekaexchange07.deka.local>
References: <F9C551623D2CBB4C9488801D14F864C6034536@ex-mb1.corp.adtran.com>
In-Reply-To: <F9C551623D2CBB4C9488801D14F864C6034536@ex-mb1.corp.adtran.com>
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

Andy:

  If you don't have the old bad block information saved
  away somewhere (a bad block table, a scrap of paper,
  etc.), then you *CAN'T* completely recover from this
  situation; the original bad block data for that chip
  is probably irretrievably lost.*

  You can mark all the blocks as "good", of course, and
  then exercise the chip a bit, marking bad blocks as you
  go. You'll probably never achieve the same depth of
  testing that the factory was able to achieve using
  voltage, temperature, and timing margining, of course,
  but the results may be "good enough".

                          Atlant


* A few chip designs apparently blow fuses for the
  factory bad sectors and these blown fuses prevent
  you from ever writing the OOB bits to the state
  that would indicate a good block. For chips of
  these designs, you can fully recover the factory
  bad block data.


-----Original Message-----
From: linux-mtd-bounces@lists.infradead.org [mailto:linux-mtd-bounces@lists=
.infradead.org] On Behalf Of ANDY KENNEDY
Sent: Friday, June 17, 2011 18:09
To: linux-mtd@lists.infradead.org
Subject: NAND OOB data.

I have overwritten my OOB data, to the point where all blocks are seen
as bad.  What do I do to recover from this?

Thanks,
Andy

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

This e-mail and the information, including any attachments, it contains are=
 intended to be a confidential communication only to the person or entity t=
o whom it is addressed and may contain information that is privileged. If t=
he reader of this message is not the intended recipient, you are hereby not=
ified that any dissemination, distribution or copying of this communication=
 is strictly prohibited. If you have received this communication in error, =
please immediately notify the sender and destroy the original message.

Thank you.

Please consider the environment before printing this email.
