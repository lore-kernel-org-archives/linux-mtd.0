Received: from mail2.spectraaccess.net ([208.65.172.25])
 by merlin.infradead.org with smtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SFNxC-0007ql-Nm
 for linux-mtd@lists.infradead.org; Wed, 04 Apr 2012 11:00:43 +0000
From: Atlant Schmidt <aschmidt@dekaresearch.com>
To: 'Matej Kupljen' <matej.kupljen@gmail.com>, Brian Norris
 <computersforpeace@gmail.com>
Date: Wed, 4 Apr 2012 06:54:00 -0400
Subject: RE: Unstable bits and JFFS2
Message-ID: <0A40042D85E7C84DB443060EC44B3FD3351F9CAD87@dekaexchange07.deka.local>
References: <CAHMF36FsVeg=ZVtZZz8H6YLj3GhKwD-ofCV1hcJcL5cVVKRK1A@mail.gmail.com>
 <CAN8TOE-2exM1YomfbiQ_CzkZn=MbotYwSxJnzU6mNVK4WPBNdQ@mail.gmail.com>
 <CAHMF36GrBOZBTzyBpxD2U+nkBcZExGqkvKY7fkA6494M2PtShw@mail.gmail.com>
In-Reply-To: <CAHMF36GrBOZBTzyBpxD2U+nkBcZExGqkvKY7fkA6494M2PtShw@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Matej:

> Artem, you said that this unstable bits only happen
> during power cuts, is this right? Would those appear
> also on simulated power cuts, the ones that integck
> can produce?

  (Note: This isn't Artem replying.)

  Unstable bits can happen anytime, but *REAL* power-cuts
  while writing are certainly a great way to produce them;
  after all, if you've only transferred half the electrons
  to the floating gate when power goes away, well, that
  Flash cell is now a roll-of-the-quantum-dice each time
  you read it.

  Simulated power cuts (that just stop the software
  processing at arbitrary and random points) can't
  produce this effect.

  But any time a read-disturb or write-disturb takes place,
  there's some probability that a Flash cell will be left
  with a "near-threshold" charge on the floating gate, so
  unstable bits are a fact of life that must be faced by
  any software that drives NAND Flash memory chips. This
  is, of course, especially true of MLC chips and even
  more-true for TLC chips (with three bits per cell).

                           Atlant

-----Original Message-----
From: linux-mtd-bounces@lists.infradead.org [mailto:linux-mtd-bounces@lists=
.infradead.org] On Behalf Of Matej Kupljen
Sent: Wednesday, April 04, 2012 05:17
To: Brian Norris
Cc: linux-mtd
Subject: Re: Unstable bits and JFFS2

Brian,

> On Wed, Mar 28, 2012 at 4:16 AM, Matej Kupljen <matej.kupljen@gmail.com> =
wrote:
>> during my experiments with the UBIFS crashing, I believe that I am exper=
iencing
>> the "unstable bit" issue.
>>
>> Would another FS, like JFFS2 work on such device, or I'd have the proble=
ms on
>> such device with all file systems?
>
> I doubt it. JFFS2 is not supported much anymore, and it is not
> designed for some of the problems with modern NAND flash.

Aha, I see.
Thank you for the information.

> Have you read the information here?
>
> http://www.linux-mtd.infradead.org/doc/ubifs.html#L_unstable_bits

Yes, I have. Artem already pointed me to that FAQ.

> I'm not much of an export on UBIFS or unstable bits, but I think that
> there are some unsolved problems. However, before ruling this an
> unstable bits problem, it's a good idea to rule out any other possible
> issues.

Yes, I'll check the MTD driver.

At the moment I am running again integrity check on my UBIFS for
almost 24 hours
now, but until now no error:
# ./integck -n 0 -v -e /media/card

The only difference from previous run, where I saw one bit flip is
that previously
I run the test with power failure option set to ON. Now it is off.

Artem, you said that this unstable bits only happen during power cuts,
is this right?
Would those appear also on simulated power cuts, the ones that can
integck produce?

As for the ECC correction of the empty space, nothing is mentioned in
the manual.
Maybe I should ask the manufacturer of the chip (NXP LPC3152)??
It uses HW error correction included in the FLASH controller, with:
"The error correction code used is Reed-Solomon over GF(2^9). The
primitive polynomial
g(x) over GF(2) is:
g(x) =3D x9 + x4 +1"

Thank you and Best Regards,
Matej

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/


 Click https://www.mailcontrol.com/sr/kqBJlvK+JBjTndxI!oX7Ulvwl1GqFAPrim4Oa=
E2i4BWjrlQi2a8dR8ju1tDr2izUVJQZBBFsBrWtoBNtFUgrMg=3D=3D  to report this ema=
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
