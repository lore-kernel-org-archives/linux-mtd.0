Received: from uproxy.gmail.com ([66.249.92.168])
	by canuck.infradead.org with esmtp (Exim 4.61 #1 (Red Hat Linux))
	id 1FY2RR-0003vI-Ks
	for linux-mtd@lists.infradead.org; Mon, 24 Apr 2006 10:53:42 -0400
Received: by uproxy.gmail.com with SMTP id j3so896095ugf
	for <linux-mtd@lists.infradead.org>;
	Mon, 24 Apr 2006 07:53:32 -0700 (PDT)
Message-ID: <625fc13d0604240753s3ca04002jec764e1d652a8431@mail.gmail.com>
Date: Mon, 24 Apr 2006 09:53:32 -0500
From: "Josh Boyer" <jwboyer@gmail.com>
To: "Nicolas Pitre" <nico@cam.org>
In-Reply-To: <Pine.LNX.4.64.0604240932340.18520@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <625fc13d0604240550x2bdcf5e0p179a25ae25483551@mail.gmail.com>
	<Pine.LNX.4.64.0604240932340.18520@localhost.localdomain>
Cc: =?ISO-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>,
	MTD mailing list <linux-mtd@lists.infradead.org>
Subject: Re: Sibley and wbuf fixups
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 4/24/06, Nicolas Pitre <nico@cam.org> wrote:
> On Mon, 24 Apr 2006, Josh Boyer wrote:
>
> > Howdy,
> >
> > Joern and I were discussing a patch in his tree that merges some of
> > the ECC'd NOR code in JFFS2 with the code for Sibley flashes that was
> > put in recently.  The patch can be found here:
> >
> > http://git.infradead.org/?p=3Dusers/joern/mtd-2.6.git;a=3Dcommitdiff;h=
=3Daf97d29fbcc5c4fffdb39f617730e73ad4ce2863
> >
> > A question came up because the patch removes a fixup for the wbuf that
> > is needed on ECC'd NOR chips in regards to the cleanmarker size.  The
> > cleanmarkers on ECC'd NOR chips have to be 16 bytes in length.  This
> > is because the minimum write size on those chips is 8 bytes.  The
> > structure is too small to fit in 8 bytes and we need to prevent JFFS2
> > from trying to write to the last 4 bytes of the second write region,
> > since those chips prevent writes to a section that has already been
> > written.  Hence, 16 bytes for a cleanmarker size.
> >
> > The fixup looks for this and corrects the wbuf offset and length so
> > that JFFS2 does not throw a non-contiguous write error a bit further
> > down in the code.  As it stands now, the patch is broken for the ECC'd
> > NOR chips.  However, our main question is does Sibley need a similar
> > fixup for the wbuf?  If not, why?

Nevermind.  I hadn't realized that some of the other code in that
function had changed and that the fixup was not needed any longer.

Stupid me.

josh
