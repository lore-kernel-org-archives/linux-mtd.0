Received: from zproxy.gmail.com ([64.233.162.206])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DbMnS-0007Y2-3X
	for linux-mtd@lists.infradead.org; Thu, 26 May 2005 14:09:31 -0400
Received: by zproxy.gmail.com with SMTP id 34so525012nzf
	for <linux-mtd@lists.infradead.org>;
	Thu, 26 May 2005 11:09:29 -0700 (PDT)
Message-ID: <6934efce05052611026685ab6f@mail.gmail.com>
Date: Thu, 26 May 2005 11:02:49 -0700
From: Jared Hulbert <jaredeh@gmail.com>
To: "JobHunts02@aol.com" <JobHunts02@aol.com>
In-Reply-To: <197.3f3af727.2fbed9f0@aol.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <197.3f3af727.2fbed9f0@aol.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Flash with boot blocks in kernel 2.4
Reply-To: Jared Hulbert <jaredeh@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 5/19/05, JobHunts02@aol.com <JobHunts02@aol.com> wrote:
> I am working with kernel 2.4 on a board with two flash chips that have bo=
ot
> blocks, Intel Advanced Boot Block Flash Memory (28F320C3).  I just read t=
hat
> "the 2.4 CFI code handles only devices with uniform eraseblock size -- no=
t the
> devices with 'boot blocks'. Current CVS fixes that for AMD chips, and it'=
s
> trivial to do the same for Intel chips, now it's been done once," accordi=
ng to the
> MTD project leader.
>=20
> Does anyone know where on the web I can find these "trivial" changes for
> Intel chips?
>=20
> Thank you.
>=20
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>=20

Newer MTD rev's fix this.  Back porting a new MTD should help you.

FYI - I don't think JFFS2 can span boot blocks and regular block,
though now that I think of it I've never tried.  Anybody know if
that's true or not?
