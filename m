Received: from zproxy.gmail.com ([64.233.162.205])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1Eh91U-0003tA-Bm
	for linux-mtd@lists.infradead.org; Tue, 29 Nov 2005 12:12:19 -0500
Received: by zproxy.gmail.com with SMTP id i11so1327799nzi
	for <linux-mtd@lists.infradead.org>;
	Tue, 29 Nov 2005 09:12:07 -0800 (PST)
Message-ID: <625fc13d0511290912v16aca7c2lc3610f738ff85a6d@mail.gmail.com>
Date: Tue, 29 Nov 2005 11:12:07 -0600
From: Josh Boyer <jwboyer@gmail.com>
To: Michael Richardson <mcr@sandelman.ottawa.on.ca>
In-Reply-To: <625fc13d0511290908h528df3e5j7a81163e7854ee1a@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <v0mzjofaup.fsf@marajade.sandelman.ca>
	<20051129100937.AF133353F54@atlas.denx.de>
	<v0sltfeb45.fsf@marajade.sandelman.ca>
	<625fc13d0511290908h528df3e5j7a81163e7854ee1a@mail.gmail.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH 1/2] --cvs-exclude for mkfs.jffs2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 11/29/05, Josh Boyer <jwboyer@gmail.com> wrote:
> On 11/29/05, Michael Richardson <mcr@sandelman.ottawa.on.ca> wrote:
> >
> > >>>>> "Wolfgang" =3D=3D Wolfgang Denk <wd@denx.de> writes:
> >     Wolfgang> In message <v0mzjofaup.fsf@marajade.sandelman.ca> you wro=
te:
> >     >> This adds an option to ignore CVS directories.
> >
> >     Wolfgang> This doesn't make sense to me. You can and should use "cv=
s
> >     Wolfgang> export" to create the directory trees you want to package=
.
> >
> >   yes, one could do that. I chose not to.
> >   It isn't like I forced this option to be on.
> >
> >   cvs export requires that I actually check my changes in before I can =
test
> > them, which causes a lot of needless churn.
> >   It may also mean that developers in my team will check in debug state=
ments
> > and forget to remove them.
> >
> >     Wolfgang> You use CVS, others use GIT, or Subversion, or ClearCase,=
 or
> >     Wolfgang> Monotone, or darcs, or ... - it would not be really pract=
ical
> >     Wolfgang> to add special rules for everybody's favorite tool.
> >
> >   It would very much be practical to do this.
> >   I'd rather have a more general --exclude.
> >
> >   Of course, you argue for removing equivalent options from rsync and o=
ther
> > things.  Accept the patch or not.
>
> I believe the answer is "not".

To clarify, the answer is no because you've hard coded this exclude
stuff in the tool itself.  Making a more generic --exclude which reads
what to exclude from a file might be an option that is acceptable.=20
Then for your specific case you could simply have "CVS" and ".KEEP_ME"
listed there.

josh
