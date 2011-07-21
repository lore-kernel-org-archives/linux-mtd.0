Received: from mail.dekaresearch.com ([208.65.175.196]
	helo=dekaexchange07.deka.local)
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QjtNd-0003xM-Ag
	for linux-mtd@lists.infradead.org; Thu, 21 Jul 2011 13:33:34 +0000
From: Atlant Schmidt <aschmidt@dekaresearch.com>
To: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Date: Thu, 21 Jul 2011 09:33:31 -0400
Subject: Can major re-organization activities of the UBIfs be "deliberately
	provoked"?
Message-ID: <0A40042D85E7C84DB443060EC44B3FD32A7208F97E@dekaexchange07.deka.local>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
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

  We're using the UBIfs with our realtime equipment. We've
  noticed a behavior where, every so often, the flush-ubifs
  thread demands very, very large amounts of CPU time, blocking
  all of our other processes that use the Linux time-sliced
  scheduler. These bursts come at arbitrary intervals but
  commonly last ten to fifteen seconds.

  Naturally, these bursts come at exceedingly inconvenient
  times ;-).

  I *ASSUME* these bursts occur when the UBI file system has
  decided that it has to do some major Flash housekeeping;
  these bursts are associated with our application doing a
  lot of writing but *ARE NOT* associated with the display
  of any UBI/MTD error messages. (If my assumption is wrong,
  please feel free to correct me!)

  So three questions:

    1. Has this bursty behavior changed for the better
       in more-recent versions of the MTD/UBI/UBIfs code?
       (We're probably running pretty old versions of each.)

    2. Are there any tuning parameters that would let us
       spread this work out more smoothly (that is, in a
       less-bursty fashion)?

    3. Are there any APIs that would let us deliberately
       provoke this work at times that would be more-convenient
       for the rest of our application (such as when we're
       booting up or shutting down)?

                            Atlant


This e-mail and the information, including any attachments, it contains are=
 intended to be a confidential communication only to the person or entity t=
o whom it is addressed and may contain information that is privileged. If t=
he reader of this message is not the intended recipient, you are hereby not=
ified that any dissemination, distribution or copying of this communication=
 is strictly prohibited. If you have received this communication in error, =
please immediately notify the sender and destroy the original message.

Thank you.

Please consider the environment before printing this email.
