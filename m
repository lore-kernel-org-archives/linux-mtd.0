Received: from zproxy.gmail.com ([64.233.162.202])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1Eh8xm-0003gI-Je
	for linux-mtd@lists.infradead.org; Tue, 29 Nov 2005 12:08:24 -0500
Received: by zproxy.gmail.com with SMTP id i11so1326825nzi
	for <linux-mtd@lists.infradead.org>;
	Tue, 29 Nov 2005 09:08:17 -0800 (PST)
Message-ID: <625fc13d0511290908h528df3e5j7a81163e7854ee1a@mail.gmail.com>
Date: Tue, 29 Nov 2005 11:08:16 -0600
From: Josh Boyer <jwboyer@gmail.com>
To: Michael Richardson <mcr@sandelman.ottawa.on.ca>
In-Reply-To: <v0sltfeb45.fsf@marajade.sandelman.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <v0mzjofaup.fsf@marajade.sandelman.ca>
	<20051129100937.AF133353F54@atlas.denx.de>
	<v0sltfeb45.fsf@marajade.sandelman.ca>
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

On 11/29/05, Michael Richardson <mcr@sandelman.ottawa.on.ca> wrote:
>
> >>>>> "Wolfgang" =3D=3D Wolfgang Denk <wd@denx.de> writes:
>     Wolfgang> In message <v0mzjofaup.fsf@marajade.sandelman.ca> you wrote=
:
>     >> This adds an option to ignore CVS directories.
>
>     Wolfgang> This doesn't make sense to me. You can and should use "cvs
>     Wolfgang> export" to create the directory trees you want to package.
>
>   yes, one could do that. I chose not to.
>   It isn't like I forced this option to be on.
>
>   cvs export requires that I actually check my changes in before I can te=
st
> them, which causes a lot of needless churn.
>   It may also mean that developers in my team will check in debug stateme=
nts
> and forget to remove them.
>
>     Wolfgang> You use CVS, others use GIT, or Subversion, or ClearCase, o=
r
>     Wolfgang> Monotone, or darcs, or ... - it would not be really practic=
al
>     Wolfgang> to add special rules for everybody's favorite tool.
>
>   It would very much be practical to do this.
>   I'd rather have a more general --exclude.
>
>   Of course, you argue for removing equivalent options from rsync and oth=
er
> things.  Accept the patch or not.

I believe the answer is "not".

josh
