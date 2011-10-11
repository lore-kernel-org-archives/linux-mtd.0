Received: from mail.dekaresearch.com ([208.65.175.196]
	helo=dekaexchange07.deka.local)
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1RDacg-0007Aw-Pv
	for linux-mtd@lists.infradead.org; Tue, 11 Oct 2011 11:35:52 +0000
From: Atlant Schmidt <aschmidt@dekaresearch.com>
To: 'Daniel Drake' <dsd@laptop.org>, "linux-mtd@lists.infradead.org"
	<linux-mtd@lists.infradead.org>
Date: Tue, 11 Oct 2011 07:35:45 -0400
Subject: RE: ubi vol_size and lots of bad blocks
Message-ID: <0A40042D85E7C84DB443060EC44B3FD33001C1D733@dekaexchange07.deka.local>
References: <CAMLZHHSW9daPS9RsMyBnhTfzUQLC0+e9_-=xqiWE4T6upbcaiQ@mail.gmail.com>
In-Reply-To: <CAMLZHHSW9daPS9RsMyBnhTfzUQLC0+e9_-=xqiWE4T6upbcaiQ@mail.gmail.com>
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

Daniel:

> The one bit I don't understand is what happens if another block goes
> bad later. If the autoresize functionality has modified reserved_pebs
> to represent the exact number of good blocks on the disk (i.e.
> reserved_pebs=3D=3Dgood_PEBs), next time a block goes bad the same
> reserved_pebs>good_PEBs boot failure would be hit again. But I am
> probably missing something.

  Be careful here -- the last time I looked, blocks that go
  bad *ARE NOT* actually permanently marked as bad; they may
  no longer be used during the current boot, but the next time
  you reboot, they're eligible for attempted-but-often-failing
  use once again.

  That is, once you've initialized the UBIfs, the number of
  bad PEBs never grows, no matter how many times it the software
  discovers that (say) PEB #1234 being just atrociously bad.

  And again, this may have changed but was definitely true the
  last time I tested this (although I'd love to be told otherwise).

                                  Atlant

-----Original Message-----
From: linux-mtd-bounces@lists.infradead.org [mailto:linux-mtd-bounces@lists=
.infradead.org] On Behalf Of Daniel Drake
Sent: Monday, October 10, 2011 08:09
To: linux-mtd@lists.infradead.org
Subject: ubi vol_size and lots of bad blocks

Hi,

We're still working on getting ubifs shipped on OLPC XO-1.

One outstanding issue we have is that on some laptops, when switching
from jffs2 to ubifs, the laptop simply does not boot (root fs mounting
difficulties).

One case of this is when there are a large number of bad blocks on the
disk, during boot we get:
[   76.855427] UBI error: vtbl_check: too large reserved_pebs 7850,
good PEBs 7765
[   76.867878] UBI error: vtbl_check: volume table check failed:
record 0, error 9

With so many bad blocks, this is likely a problematic nand or a
corrupt BBT. However, jffs2 worked in this situation, and (with many
of our laptops in remote places) it would be nice for us to figure out
how to make ubifs handle it as well.


There are other cases of this error in the archive, and people have
generally solved it by using a smaller vol_size in the ubinize config.
Am I right in saying that reserved_pebs is computed from the vol_size
specified in the ubinize config?

I guess "good PEBs" is calculated from the amount of non-bad blocks
found during the boot process.

This suggests that using vol_size is unsafe for installations such as
ours, where while we do know the NAND size in advance, we also want to
support an unknown, high number of bad blocks which will vary
throughout the field.

I found a note in the UBI FAQ where it says vol_size can be excluded
and it will be computed to be the size of the input image, and then
the autoresize flag can be used to expand the partition later.
Excluding vol_size in this way indeed solves the problem and the
problematic laptop now boots.

So, am I right in saying that for an installation such as OLPC, where
resilience to strange NAND conditions involving high numbers of bad
blocks is desired, it is advisable to *not* specify vol_size in
ubinize.cfg?

(If so I'll send in a FAQ update for the website.)

The one bit I don't understand is what happens if another block goes
bad later. If the autoresize functionality has modified reserved_pebs
to represent the exact number of good blocks on the disk (i.e.
reserved_pebs=3D=3Dgood_PEBs), next time a block goes bad the same
reserved_pebs>good_PEBs boot failure would be hit again. But I am
probably missing something.

cheers,
Daniel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/


 Click https://www.mailcontrol.com/sr/JXot!iSixtzTndxI!oX7UpJAdpTSMUBqW1!uL=
9x+cJDFU9F9FklsxoR4wEgrZ2pSIEZflx!5bMpTHufDF4Ashw=3D=3D  to report this ema=
il as spam.

This e-mail and the information, including any attachments, it contains are=
 intended to be a confidential communication only to the person or entity t=
o whom it is addressed and may contain information that is privileged. If t=
he reader of this message is not the intended recipient, you are hereby not=
ified that any dissemination, distribution or copying of this communication=
 is strictly prohibited. If you have received this communication in error, =
please immediately notify the sender and destroy the original message.

Thank you.

Please consider the environment before printing this email.
