Received: from mail.dekaresearch.com ([208.65.175.196]
 helo=dekaexchange07.deka.local)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1S9bIB-0005Gb-PG
 for linux-mtd@lists.infradead.org; Mon, 19 Mar 2012 12:02:28 +0000
From: Atlant Schmidt <aschmidt@dekaresearch.com>
To: 'Shmulik Ladkani' <shmulik.ladkani@gmail.com>, Peter Barada
 <peter.barada@gmail.com>
Date: Mon, 19 Mar 2012 08:02:23 -0400
Subject: RE: Distinguishing bitflips due to read-disturb or due to wear-out
Message-ID: <0A40042D85E7C84DB443060EC44B3FD33511A52C65@dekaexchange07.deka.local>
References: <20120318115946.5614a889@pixies.home.jungo.com>
In-Reply-To: <20120318115946.5614a889@pixies.home.jungo.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Shmulik:

> > The bigger issue is how to discern whether the degradation is
> > due to read-disturb (which can be recovered by erasing/reprogramming
> > the block) or the page physically wearing out (in which case it
> > needs to be retired).
>
> Question is, do we really need to distinguish between the two?

  I'm not sure one can distinguish read-disturb
  from wear-out or (as you suggest) that it's even
  meaningful to try and do so. Read-disturb effects
  increase as hot-carrier injection permanently shift
  the threshold of each FET closer and closer to that
  FET reporting "0", right?

  Meanwhile, yes, if things have gotten so bad that
  erasure (an attempt to tunnel all of the electrons
  off the floating gate) still leaves that transistor
  with enough negative charge in the gate region that
  it is unable to report a "1", then that flash block
  is, indeed, toast and (IMO) should never be accepted
  for use again.

  What I *THINK* UBI is missing is the keeping of
  appropriate statistics on which PEBs have had what
  history of "soft" failures. UBI always lives "in
  the here and now" and makes its decisions on the
  1 bit of data it has at the instant (the latest
  operation on the PEB succeeded or failed). Instead,
  UBI should know that (e.g.) PEB 1234 ended up giving
  it problems in 14 out of last 16 writes to that PEB
  and maybe that PEB isn't worth using right now based
  on the fill-ratio of the entire flash chip.

                         Atlant

-----Original Message-----
From: linux-mtd-bounces@lists.infradead.org [mailto:linux-mtd-bounces@lists=
.infradead.org] On Behalf Of Shmulik Ladkani
Sent: Sunday, March 18, 2012 06:00
To: Peter Barada
Cc: linux-mtd@lists.infradead.org
Subject: Distinguishing bitflips due to read-disturb or due to wear-out

Quote from [1].
Started a new thread as this is off-topic.

[1]
http://lists.infradead.org/pipermail/linux-mtd/2012-March/040336.html

> The bigger issue is how to discern whether the degredation is due to
> read-disturb (which can be recovered by erasing/reprogramming the block)
> or the page physically wearing out (in which case it needs to be
> retired).

Question is, do we really need to distinguish between the two?

If there is a "dangerously high" number of bit errors, then scrubbing
should be performed.
If the reason for the bit errors was due to read-disturb, then those
error are gone after scrubbing (for now, until read-disturb affects
again).
If the reason was wear-out, then it is likely that high number of bit
errors will be evident, again. But if the block is totally worn-out,
shouldn't the device return an error status for the erase operation,
eventually? (and as such, the MTD software will retire the block)?

Regards
Shmulik

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/


 Click https://www.mailcontrol.com/sr/Ou7js+CRY53TndxI!oX7UpIgRUnoDh5vf5rSB=
oHNPBn5pZkbXubHkUx!N+lzbBSc6mSRkLg5P3o5ky06sDJQ0Q=3D=3D  to report this ema=
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
