Received: from mail.dekaresearch.com ([208.65.175.196]
 helo=dekaexchange07.deka.local)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RhnNW-0006Kt-N0
 for linux-mtd@lists.infradead.org; Mon, 02 Jan 2012 19:17:03 +0000
From: Atlant Schmidt <aschmidt@dekaresearch.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Date: Mon, 2 Jan 2012 14:11:33 -0500
Subject: I need help analyzing a failed UBIfs
Message-ID: <0A40042D85E7C84DB443060EC44B3FD33254FA3C54@dekaexchange07.deka.local>
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

  I've been asked to analyze a 2GB NAND flash that contains
  a single volume UBIfs file system that has developed an
  uncorrectable ECC error in one PEB (which is apparently
  in use storing a LEB).

  The one thing I'd really like to determine is:

    o Is the failed LEB part of the UBIfs "Wandering
      Journal" or is it storing actual, fully-committed
      parts of the data volume such as iNodes, directories,
      or file data extents?*

  Looking at a data dump of the volume (from the MTD
  level), is there an easy way to determine this?
  For example, "All the Journal LEBs are listed in
  a table at..."**

                          Atlant


 * I'm assuming that LEBs are either fully-allocated to
   the Wandering Journal or fully-available to the "data
   volume"; if this assumption is incorrect, I'm sure
   someone will correct me!

** I have a Perl script that I wrote that helps me automate
   this and could easily extend my script to do more analysis
   if I knew what I was looking for.



This e-mail and the information, including any attachments, it contains are=
 intended to be a confidential communication only to the person or entity t=
o whom it is addressed and may contain information that is privileged. If t=
he reader of this message is not the intended recipient, you are hereby not=
ified that any dissemination, distribution or copying of this communication=
 is strictly prohibited. If you have received this communication in error, =
please immediately notify the sender and destroy the original message.

Thank you.

Please consider the environment before printing this email.
