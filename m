Received: from mail.dekaresearch.com ([208.65.175.196]
 helo=dekaexchange07.deka.local)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XTtNJ-0002YQ-8A
 for linux-mtd@lists.infradead.org; Tue, 16 Sep 2014 14:04:57 +0000
From: Atlant Schmidt <aschmidt@dekaresearch.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Date: Tue, 16 Sep 2014 10:04:29 -0400
Subject: Does UBI LEB-level access interlock happily with UBIfs access?
Message-ID: <0A40042D85E7C84DB443060EC44B3FD36D986A3009@dekaexchange07.deka.local>
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

Folks:

  We use the ordinary MTD/UBI/UBIfs stack on our
  Embedded Linux system.

  For the purposes of scrubbing-out single bit errors,
  I'd like to read through all of the LEBs stored in the
  UBI device and whenever the ECC information indicates
  that any correctable errors occurred, I'd like to
  *RE-WRITE* that LEB (thereby forcing it to be scrubbed).
  (Note: I might do this page-by-page rather than LEB-
  by-LEB.)

  But I would expect that because I'd have a hard
  (impossible?) time doing an atomic read/re-write of a
  LEB (or page), the UBIfs and my scrubber would interact
  badly with my scrubber eventually corrupting the UBIfs
  file system. Is there any easy way to interlock these
  accesses (from the UBIfs and from my UBI-level scrubber)?
  A way to temporarily suspend activity from the UBIfs?

  One kludge that might work is that I'm operating in a
  real-time environment. If I made my scrubbing requests
  from a very high priority (higher than the "System"
  tasks that run around Priority 50), could I be sure
  my read + rewrite scrubbing requests would at least
  enter the UBI's work queue immediately adjacent to
  each other (and without UBIfs requests intermingled)?

  Alternatively, I could probably dismount the UBIfs
  before doing scrubbing, but I'd rather not have to
  do that.
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
