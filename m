Received: from mail-vw0-f49.google.com ([209.85.212.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1Qjf51-0002Rl-DN
	for linux-mtd@lists.infradead.org; Wed, 20 Jul 2011 22:17:24 +0000
Received: by vws8 with SMTP id 8so635360vws.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 20 Jul 2011 15:17:19 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAJcvjphp3Cjew0=P6LWQ05Hb6HWpPy3D2FOBd8J5KwVGQpwcwA@mail.gmail.com>
References: <CAJcvjphp3Cjew0=P6LWQ05Hb6HWpPy3D2FOBd8J5KwVGQpwcwA@mail.gmail.com>
Date: Wed, 20 Jul 2011 18:17:19 -0400
Message-ID: <CAPBSBxqEzqkMV=1zJgmfsjO+OF2AQ3j+wpmhn1F+b_ZE6QYZug@mail.gmail.com>
Subject: Re: UBIFS support for SLC and MLC
From: "Matthew L. Creech" <mlcreech@gmail.com>
To: John <jtburch62@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jul 20, 2011 at 4:53 PM, John <jtburch62@gmail.com> wrote:
> I'm exploring flash memory technology for a new product and am
> confused about whether UBIFS fully supports SLC and MLC NAND. =A0When I
> read the FAQ at
> http://www.linux-mtd.infradead.org/faq/ubifs.html#L_ubifs_mlc, it
> states that one of the two aspects of MLC that are not supported is
> "program disturb". =A0However, the document link referenced in the same
> FAQ (http://www.linux-mtd.infradead.org/faq/ubifs.html#L_ubifs_mlc)
> states that "program disturb" is common to both SLC and MLC - just at
> different error rates.
>
> 1. =A0How does UBIFS address the "program disturb" effect in SLC NAND?
>
> 2. =A0Why doesn't the FAQs explanation for how UBIFS handles "read
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

--=20
Matthew L. Creech
