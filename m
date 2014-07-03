Received: from mail.dekaresearch.com ([208.65.175.196]
 helo=dekaexchange07.deka.local)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X2hgP-0005SY-FW
 for linux-mtd@lists.infradead.org; Thu, 03 Jul 2014 14:08:17 +0000
From: Atlant Schmidt <aschmidt@dekaresearch.com>
To: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Date: Thu, 3 Jul 2014 10:07:51 -0400
Subject: Where is the "scrubbing" threshold set in UBI? Can it be easily
 varied?
Message-ID: <0A40042D85E7C84DB443060EC44B3FD36D986A2F14@dekaexchange07.deka.local>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: Andrew Coll <acoll@dekaresearch.com>,
 Cale Surgen <csurgen@dekaresearch.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Folks:

  Within the UBI layer, where is the threshold set that
  determines how many bit-flips must occur on a read
  before the block is "scrubbed" (stored into another
  location)?

  And is this done on a page-by-page basis or on a
  whole-LEB/PEB basis? That is, if a single page has
  more than threshold number of bit flips, will just
  that page be relocated or will the entire LEB be
  relocated to another PEB? (I'd assume the later
  because that's the level at which UBI understands
  the organization of the storage.)

  Also:

  It's a shame there doesn't seem to be a UBI ioctl()
  to control this; it would be nice to be able to run
  routinely with the threshold set high but be able to
  easily enter "scrubbing" mode where even single bit-
  flips could be scrubbed away.

  I've notice that our NAND flashes acquire persistent
  bit flips and I'd love to be able to scrub those blocks
  clean by just temporarily setting the threshold low and
  then reading through the whole device (and watching the
  ECC statistics to see when I should stop).

  This would make the NAND more immune to suddenly ending
  up with too many bit flips for the ECC to correct.

                          Atlant


This e-mail and the information, including any attachments it contains, are=
 intended to be a confidential communication only to the person or entity t=
o whom it is addressed and may contain information that is privileged. If t=
he reader of this message is not the intended recipient, you are hereby not=
ified that any dissemination, distribution or copying of this communication=
 is strictly prohibited. If you have received this communication in error, =
please immediately notify the sender and destroy the original message.

Thank you.

Please consider the environment before printing this email.
