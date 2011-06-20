Received: from mail.dekaresearch.com ([208.65.175.196]
	helo=dekaexchange07.deka.local)
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QYjpt-0008O3-9v
	for linux-mtd@lists.infradead.org; Mon, 20 Jun 2011 19:08:41 +0000
From: Atlant Schmidt <aschmidt@dekaresearch.com>
To: 'ANDY KENNEDY' <ANDY.KENNEDY@adtran.com>, "linux-mtd@lists.infradead.org"
	<linux-mtd@lists.infradead.org>
Date: Mon, 20 Jun 2011 15:08:34 -0400
Subject: RE: NAND OOB data.
Message-ID: <0A40042D85E7C84DB443060EC44B3FD32A7208F91E@dekaexchange07.deka.local>
References: <F9C551623D2CBB4C9488801D14F864C6034536@ex-mb1.corp.adtran.com>
	<0A40042D85E7C84DB443060EC44B3FD32A7208F91A@dekaexchange07.deka.local>
	<F9C551623D2CBB4C9488801D14F864C6036086@ex-mb1.corp.adtran.com>
In-Reply-To: <F9C551623D2CBB4C9488801D14F864C6036086@ex-mb1.corp.adtran.com>
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

> All the other boards apparently are all good
> (is that normal?),

  It happens; we're in the midst of switching from
  MLC to SLC flash and while I'd never expect that
  from our MLC parts, it seems to be pretty-commonly
  true for our SLC parts.


> Okay, so how do I (without the luxury of u-boot), in user or
> kernel space, wipe the OOB data?  I'm looking at the code for
> u-boot nand_erase_nand right now.  I mean, I'm not above writing
> an userspace app that will do kernel level work for me.  I'm okay
> with using /dev/mem and screwing with stuff.  Am I on the right
> track?  I mean, I hate to go down this road if I'm just heading
> for a dead-end.

  I think there's enough "stuff" available simply through
  /dev/mtd... to let you do any of this. I do a lot of
  Flash manipulation simply using Perl, mtdinfo, ubinfo
  and the /dev/mtd... and /dev/ubi... devices.

  (Unfortunately, I can't share any of that code.)

                               Atlant

-----Original Message-----
From: ANDY KENNEDY [mailto:ANDY.KENNEDY@adtran.com]
Sent: Monday, June 20, 2011 13:54
To: Atlant Schmidt; linux-mtd@lists.infradead.org
Subject: RE: NAND OOB data.

> -----Original Message-----
> From: Atlant Schmidt [mailto:aschmidt@dekaresearch.com]
> Sent: Monday, June 20, 2011 6:14 AM
> To: ANDY KENNEDY; linux-mtd@lists.infradead.org
> Subject: RE: NAND OOB data.
>
> Andy:
>
>   If you don't have the old bad block information saved
>   away somewhere (a bad block table, a scrap of paper,
>   etc.), then you *CAN'T* completely recover from this
>   situation; the original bad block data for that chip
>   is probably irretrievably lost.*

All the other boards apparently are all good (is that normal?), but,
I'm not worried about the NAND having KNOWN bad blocks as this board
is supposed to be mine.

>
>   You can mark all the blocks as "good", of course, and
>   then exercise the chip a bit, marking bad blocks as you
>   go. You'll probably never achieve the same depth of
>   testing that the factory was able to achieve using
>   voltage, temperature, and timing margining, of course,
>   but the results may be "good enough".
>
>                           Atlant

Okay, so how do I (without the luxury of u-boot), in user or
kernel space, wipe the OOB data?  I'm looking at the code for
u-boot nand_erase_nand right now.  I mean, I'm not above writing
an userspace app that will do kernel level work for me.  I'm okay
with using /dev/mem and screwing with stuff.  Am I on the right
track?  I mean, I hate to go down this road if I'm just heading
for a dead-end.

Andy


This e-mail and the information, including any attachments, it contains are=
 intended to be a confidential communication only to the person or entity t=
o whom it is addressed and may contain information that is privileged. If t=
he reader of this message is not the intended recipient, you are hereby not=
ified that any dissemination, distribution or copying of this communication=
 is strictly prohibited. If you have received this communication in error, =
please immediately notify the sender and destroy the original message.

Thank you.

Please consider the environment before printing this email.
