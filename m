Received: from pony1.arc.nasa.gov ([128.102.31.31] helo=mail.arc.nasa.gov)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 1944wF-0004oR-OQ
	for <linux-mtd@lists.infradead.org>; Fri, 11 Apr 2003 21:15:55 +0100
Message-Id: <5.1.1.5.2.20030411131136.0190b008@mail.arc.nasa.gov>
Date: Fri, 11 Apr 2003 13:18:04 -0700
To: Ilguiz Latypov <ilgiz@rogers.com>, Mercier.Andre@ireq.ca
From: "Edward A. Hildum" <ehildum@mail.arc.nasa.gov>
In-Reply-To: <Pine.LNX.4.44.0304110432370.4112-100000@CPE00e0292061fa-CM
 014370001917.cpe.net.cable.roger>
References: <C1641369CCE2784593A091F212BF90D202D54F@caracas.ireq.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Transfer-Encoding: quoted-printable
cc: linux-mtd@lists.infradead.org
Subject: Re: Newbie questions: MTD vs M-Sys, ... RTLinuxPro
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Andre,
         I'm also having problems with the 256MB DoC2000 with TrueFFS=20
5.1.4.  I've built a recent kernel (2.4.18) with MTD.  When it starts, the=
=20
DoC is recognized as a DoC Millenium, and the driver says the flash chips=20
are not recognized.  I am trying now to get information about the flash=20
chips from M-Systems.  If I get this, it should be easy to update the table=
=20
of known flash chips so MTD can access the new DoC.
         I'm also working on booting from the DoC using GRUB, but I am=20
having trouble getting information from M-Systems.  If I find a solution, I=
=20
will post it to this list.

Ted Hildum

At 04:35 AM 4/11/2003 -0400, you wrote:

>On Tue, 8 Apr 2003, "Mercier, Andr=E9" wrote:
>
> > I have looked at the
> > http://www.gctglobal.com/Download/DiskOnChip/diskonchip.html web site
> > for some information, but there are still some questions to be answered:
> >
> > 1) Does MTD work with new DOC2000 release (256 MB with TrueFSS 5.1.4)?
> > 2) Which Redhat distribution is the best choice for MTD (7.3, 8.0,=20
> ...9.0) ?
> > 3) What are the specific steps to include the MTD stuff with the=
 RTLinuxPro
> >     distribution (note: RTLinux has been tested with Redhat 7.2, 7.3,=
 ...
> >     I did not buy the full kernel sources package, but I can make a=
 bzImage
> >     and modules without problems) and be able to boot RTLinux from DOC?
>
>
>Andre,
>
>I can't answer your questions, but this page may provide some instructions
>on setting up DoC2000 and Millennium:
>
>http://www.lakeshoremicro.com/diskonchip-grub-howto.html
>
>Thanks,
>
>--
>Ilguiz Latypov
>Montreal, Quebec
>Canada
>
>tel. +1 (514) 526-6911
>
>
>______________________________________________________
>Linux MTD discussion mailing list
>http://lists.infradead.org/mailman/listinfo/linux-mtd/
