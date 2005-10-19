Received: from rproxy.gmail.com ([64.233.170.205])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1ES1mK-0004Ho-IV
	for linux-mtd@lists.infradead.org; Tue, 18 Oct 2005 20:26:08 -0400
Received: by rproxy.gmail.com with SMTP id b11so30944rne
	for <linux-mtd@lists.infradead.org>;
	Tue, 18 Oct 2005 17:25:59 -0700 (PDT)
Message-ID: <9b7ca6570510181725r678b865n667f046ea18b7a25@mail.gmail.com>
Date: Wed, 19 Oct 2005 09:25:59 +0900
From: Daniel Ann <ktdann@gmail.com>
To: =?ISO-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>
In-Reply-To: <9b7ca6570510181721v7eb18241yaee7444605a1a4ad@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <9b7ca6570510121624h5abdbf3erf526aab893bf285a@mail.gmail.com>
	<20051018234914.GF20236@wohnheim.fh-wedel.de>
	<9b7ca6570510181721v7eb18241yaee7444605a1a4ad@mail.gmail.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: FYI, problem in CVS version
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 10/19/05, Daniel Ann <ktdann@gmail.com> wrote:
> On 10/19/05, J=F6rn Engel <joern@wohnheim.fh-wedel.de> wrote:
> > On Thu, 13 October 2005 08:24:31 +0900, Daniel Ann wrote:
> > >
> > > I've downloaded CVS version yesterday and patched linux-2.6.12.3
> > > kernel but everytime I try to do make mrproper I get an error saying
> > > fs/jffs3/makefile.clean doesnt exist.
> > >
> > > I've noticed that patch didnt include any JFFS3 files since there
> > > werent any fs/jffs3 directory to start with, but fs/Makefile had line
> > > mentioning JFFS3. So, I've commented out and did make mrproper which
> > > worked.
> > >
> > > Just to let you know how I've patched the kernel, I've executed
> > > patchkernel.sh with following argument,
> > > ./patchkernel.sh -c -2 -3 -v /usr/src/linux-2.6.12.3
> >
> > Not adding the "-3" would have avoided your problem.  Jffs3 has been
> > removed for the most part, but it looks like fs/Makefile.jffs3 and
> > some bits inside patchkernel.sh have survived.  Would you mind sending
> > a patch to kill those bits as well?
>
> Yeah, you are right about fs/Makefile.jffs3 and few other bits such as
> Kconfig related files.
> I definately dont mind sending in a patch, but I'm not familiar with
> submitting a patch. Is there a guideline which I could follow if I
> ever had to submit one ?
>

Just been looking at how others have submitted patch, is it just a
diff against the mtd patched kernel file and file that I changed ?

--
Daniel
