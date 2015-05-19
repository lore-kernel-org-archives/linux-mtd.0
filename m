Received: from mailsec102.isp.belgacom.be ([195.238.20.98])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YulXY-0004d2-5E
 for linux-mtd@lists.infradead.org; Tue, 19 May 2015 17:42:53 +0000
Date: Tue, 19 May 2015 19:42:22 +0200 (CEST)
From: Fabian Frederick <fabf@skynet.be>
Reply-To: Fabian Frederick <fabf@skynet.be>
To: Richard Weinberger <richard.weinberger@gmail.com>
Message-ID: <1796356142.534811.1432057342188.open-xchange@webmail.nmp.proximus.be>
In-Reply-To: <CAFLxGvy=QWcaHbgQyk+WjH1KX__u1Ye6eZ+W4NR7RTifQy3CWQ@mail.gmail.com>
References: <1431726240-4675-1-git-send-email-fabf@skynet.be>
 <1431726240-4675-6-git-send-email-fabf@skynet.be>
 <CAFLxGvy=QWcaHbgQyk+WjH1KX__u1Ye6eZ+W4NR7RTifQy3CWQ@mail.gmail.com>
Subject: Re: [PATCH 6/6 linux-next] ubifs: remove else after return
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: Adrian Hunter <adrian.hunter@intel.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



> On 19 May 2015 at 00:17 Richard Weinberger <richard.weinberger@gmail.com>
> wrote:
>
>
> On Fri, May 15, 2015 at 11:44 PM, Fabian Frederick <fabf@skynet.be> wrote=
:
> > simplify code in add_to_lpt_heap()
> >
> > Signed-off-by: Fabian Frederick <fabf@skynet.be>
> > ---
> >=C2=A0 fs/ubifs/lprops.c | 11 +++++------
> >=C2=A0 1 file changed, 5 insertions(+), 6 deletions(-)
> >
> > diff --git a/fs/ubifs/lprops.c b/fs/ubifs/lprops.c
> > index a0011aa..e1454cf 100644
> > --- a/fs/ubifs/lprops.c
> > +++ b/fs/ubifs/lprops.c
> > @@ -208,13 +208,12 @@ static int add_to_lpt_heap(struct ubifs_info *c,
> > struct ubifs_lprops *lprops,
> >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}
> >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dbg_check_=
heap(c, heap, cat, -1);
> >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0; =
/* Not added to heap */
> > -=C2=A0 =C2=A0 =C2=A0 =C2=A0} else {
> > -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0lprops->hpos =
=3D heap->cnt++;
> > -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0heap->arr[lprop=
s->hpos] =3D lprops;
> > -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0move_up_lpt_hea=
p(c, heap, lprops, cat);
> > -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dbg_check_heap(=
c, heap, cat, lprops->hpos);
> > -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 1; /* Ad=
ded to heap */
> >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}
> > +=C2=A0 =C2=A0 =C2=A0 =C2=A0lprops->hpos =3D heap->cnt++;
> > +=C2=A0 =C2=A0 =C2=A0 =C2=A0heap->arr[lprops->hpos] =3D lprops;
> > +=C2=A0 =C2=A0 =C2=A0 =C2=A0move_up_lpt_heap(c, heap, lprops, cat);
> > +=C2=A0 =C2=A0 =C2=A0 =C2=A0dbg_check_heap(c, heap, cat, lprops->hpos);
> > +=C2=A0 =C2=A0 =C2=A0 =C2=A0return 1; /* Added to heap */
>
> Just because of paranoia, did you test your changes?

Hello Richard,

=C2=A0 =C2=A0 =C2=A0 =C2=A0 All was compiled but untested.
=C2=A0 =C2=A0 =C2=A0 =C2=A0
Regards,
Fabian


>
> --
> Thanks,
> //richard
