Received: from mail.dekaresearch.com ([208.65.175.196]
	helo=dekaexchange07.deka.local)
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1Qjt3n-0003qI-0F
	for linux-mtd@lists.infradead.org; Thu, 21 Jul 2011 13:13:07 +0000
From: Atlant Schmidt <aschmidt@dekaresearch.com>
To: "'Matthew L. Creech'" <mlcreech@gmail.com>, John <jtburch62@gmail.com>
Date: Thu, 21 Jul 2011 09:12:56 -0400
Subject: RE: UBIFS support for SLC and MLC
Message-ID: <0A40042D85E7C84DB443060EC44B3FD32A7208F97C@dekaexchange07.deka.local>
References: <CAJcvjphp3Cjew0=P6LWQ05Hb6HWpPy3D2FOBd8J5KwVGQpwcwA@mail.gmail.com>
	<CAPBSBxqEzqkMV=1zJgmfsjO+OF2AQ3j+wpmhn1F+b_ZE6QYZug@mail.gmail.com>
In-Reply-To: <CAPBSBxqEzqkMV=1zJgmfsjO+OF2AQ3j+wpmhn1F+b_ZE6QYZug@mail.gmail.com>
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

Matthew, John:

> Hence the need for the "flash crawler" mentioned in the FAQ, which
> puts an upper bound on the length of time any flash page will go
> without being read.  As far as I know (someone please correct me --
> and update the FAQ -- if this is wrong), UBIFS itself doesn't
> implement this crawling right now.

  Yes, that's correct; there's no "Flash crawler" in the UBIfs
  right now. (I just recently asked this on the list and had
  this answer confirmed.)

  Any user of a UBIfs absolutely needs to have a flash scrubbing
  strategy in place and as Matthew states, you have to determine
  (based on the metrics of your own application and the "disturb"
  rates of your own flash) what crawl rate is acceptable.

  FYI: I've done a lot of experimentation with scrubbing MLC
  Flash and I've found that for *SOME SAMPLES* of MLC memories
  (that is, some particularly bad examples of specific chips),
  the disturb rate is so high that you can't actually scrub
  that memory clean; every "pass" through scrubs some errors
  and introduces others.

  Because of its generally lower error rates, I haven't seen
  that phenomenon with SLC Flash.

                                      Atlant


-----Original Message-----
From: linux-mtd-bounces@lists.infradead.org [mailto:linux-mtd-bounces@lists=
.infradead.org] On Behalf Of Matthew L. Creech
Sent: Wednesday, July 20, 2011 18:17
To: John
Cc: linux-mtd@lists.infradead.org
Subject: Re: UBIFS support for SLC and MLC

On Wed, Jul 20, 2011 at 4:53 PM, John <jtburch62@gmail.com> wrote:
> I'm exploring flash memory technology for a new product and am
> confused about whether UBIFS fully supports SLC and MLC NAND.  When I
> read the FAQ at
> http://www.linux-mtd.infradead.org/faq/ubifs.html#L_ubifs_mlc, it
> states that one of the two aspects of MLC that are not supported is
> "program disturb".  However, the document link referenced in the same
> FAQ (http://www.linux-mtd.infradead.org/faq/ubifs.html#L_ubifs_mlc)
> states that "program disturb" is common to both SLC and MLC - just at
> different error rates.
>
> 1.  How does UBIFS address the "program disturb" effect in SLC NAND?
>
> 2.  Why doesn't the FAQs explanation for how UBIFS handles "read
> disturb" apply to "program disturb"?
>

I think the first "read disturb" that is discussed in the FAQ is a
rather specific case: repeated READs of a page cause bit-flips on that
same page.  The solution is simply to correct the block on-flash
("scrub" it) whenever a bit-flip is detected.

Then there's a more general "read disturb" case, which is called the
"paired pages" problem in the FAQ: repeated READs of a page (A) cause
bit-flips on some *other* page (B).  This is trickier to handle,
because READs may be happening all the time on A, while B isn't
accessed for a long time.  In that case, the bit-flips on B will have
a chance to accumulate, potentially beyond the point at which we can
repair them.  This case is basically the same as the "program disturb"
case -- it will be handled just fine, but only as long as the pages in
question are read periodically.

Hence the need for the "flash crawler" mentioned in the FAQ, which
puts an upper bound on the length of time any flash page will go
without being read.  As far as I know (someone please correct me --
and update the FAQ -- if this is wrong), UBIFS itself doesn't
implement this crawling right now.  So depending on the strength of
your ECC algorithm, propensity of your flash to experience bit-flips,
and how often certain parts of the filesystem are accessed, you could
potentially experience corruption if you've got a filesystem where
certain parts are read/written often, and other parts sit idly for
extended periods of time (probably months).

It's worth noting that some of the problems noted from the UBIFS FAQ
also apply to next-generation SLC.  For example, many new SLC chips
already require at least 4-bit BCH correction (this used to only be
the case for MLC).  Their eraseblock life-cycle has also steadily
decreased (although this is offset by increasing capacities, since UBI
does wear leveling).  And their tendency to experience problems such
as read/program disturb has gone up compared to previous-gen SLC.

So the FAQ is slightly out of date in this regard: you may have to
take many of these issues into consideration regardless of whether you
go with SLC or MLC.  Hope this helps.

--
Matthew L. Creech

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
