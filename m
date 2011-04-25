Received: from mail.dekaresearch.com ([208.65.175.196]
	helo=dekaexchange07.deka.local)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QEJJa-0006bF-Mu
	for linux-mtd@lists.infradead.org; Mon, 25 Apr 2011 10:46:54 +0000
From: Atlant Schmidt <aschmidt@dekaresearch.com>
To: 'Kartik Nagar' <kartik.n.nagar@gmail.com>, "linux-mtd@lists.infradead.org"
	<linux-mtd@lists.infradead.org>
Date: Mon, 25 Apr 2011 06:47:15 -0400
Subject: RE: Actual number of writes to a MTD device
Message-ID: <0A40042D85E7C84DB443060EC44B3FD32A694157A1@dekaexchange07.deka.local>
References: <loom.20110423T144945-306@post.gmane.org>
In-Reply-To: <loom.20110423T144945-306@post.gmane.org>
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

Kartik:

  I don't know if the UBI or MTD layers keep such
  statistics directly, but over time, you can
  certainly *INFER* such statistics: just watch
  the erase counters. Because no flash area can
  be written more than once without erasing, you
  can be sure that if you see the sum of all of
  the erase counters increase by "n", then you have
  written approximately (n * bytes_per_LEB) bytes
  of data.

  This is only valid when measured over a reasonably
  long time, of course. Over a short time, there's
  too much "noise" in the signal because slight
  variations in the LEB-to-PEB mapping can cause
  big variations in exactly when erase blocks get
  erased.

                       Atlant

-----Original Message-----
From: linux-mtd-bounces@lists.infradead.org [mailto:linux-mtd-bounces@lists=
.infradead.org] On Behalf Of Kartik Nagar
Sent: Saturday, April 23, 2011 08:56
To: linux-mtd@lists.infradead.org
Subject: Actual number of writes to a MTD device

Hi,

I am using UBIFS on top of UBI on top of a MTD partition and then running s=
ome
workloads on the UBIFS filesystem. I actually want to determine the write
amplification factor for the workload, for which i need the actual number o=
f
writes going to the MTD device. Do UBIFS/MTD systems record such statistics=
, or
will I have to make changes to the source code to obtain the statistics?


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
