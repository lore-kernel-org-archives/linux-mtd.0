Received: from mail.dekaresearch.com ([208.65.175.196]
 helo=dekaexchange07.deka.local)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X1xqt-0008LA-HA
 for linux-mtd@lists.infradead.org; Tue, 01 Jul 2014 13:12:03 +0000
From: Atlant Schmidt <aschmidt@dekaresearch.com>
To: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Date: Tue, 1 Jul 2014 09:11:35 -0400
Subject: Does UBI still place a just-tortured block first in the free block
 list?
Message-ID: <0A40042D85E7C84DB443060EC44B3FD36D986A2F0A@dekaexchange07.deka.local>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: Cale Surgen <csurgen@dekaresearch.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Folks:

  Several years ago, the behavior of UBI was that if a block
  failed to write, UBI would torture-test the block (with 0x5A
  and 0xA5 patterns) and if the block passed the torture test,
  it would be placed at the top of the list of available blocks.

  With this algorithm, UBI would attempt to again use the just-
  tortured block for the data that was still waiting to be written.
  But because the write failures were often data-dependent, in
  our experience, the block would frequently again fail to store
  the data to be written. It would be tortured again, passed again,
  and the cycle would repeat. We've seen this cycle continue for
  minutes at a time.

  Is the algorithm still the same? Or is the just-tortured block
  now placed at the bottom of the list of available blocks so that
  it will only show up again later (when the data to be written
  will probably be different)?

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
