Received: from mailout01.sul.t-online.com ([194.25.134.80])
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BVyXN-00029i-HA
	for linux-mtd@lists.infradead.org; Thu, 03 Jun 2004 16:10:08 -0400
From: tglx@linutronix.de (Thomas Gleixner)
To: "Carlos, John J USAATC" <john.carlos@atc.army.mil>,
	linux-mtd@lists.infradead.org
Date: Thu, 3 Jun 2004 22:04:36 +0200
References: <EFF9A3506F74924AB5CC77BDC66E79351812AE@atcml01.atc.army.mil>
In-Reply-To: <EFF9A3506F74924AB5CC77BDC66E79351812AE@atcml01.atc.army.mil>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <200406032204.36458.tglx@linutronix.de>
Cc: 
Subject: Re: Another mkfs.jffs2 question pagesize verse size of image?
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thursday 03 June 2004 22:01, Carlos, John J USAATC wrote:
> Hi,
>
>   I run mkfs.jffs2 on my host.  When I use defaults to create image and t=
he
> try to write to the DOC using nandwrite I get input file is not page
> aligned.  When I try to create the jffs2 image using the -s 512 and -e
> 32768 my image grows to large.  Should the values of page size be 512 byt=
es
> " from documentation pdf file" and 32768 erase size as reported by
> mtd_debug???????

nandwrite does not work on DOC if you use the DOC driver in mtd/devices. JF=
=46S2=20
does neither.

Dan Brown is working on the DOC code which uses the generic nand driver cod=
e=20
and can be used with JFFS2 and the nand tools.

Read the maillist archive and contact Dan.

=2D-=20
Thomas
________________________________________________________________________
Steve Ballmer quotes the statistic that IT pros spend 70 percent of their=20
time managing existing systems. That couldn=E2=80=99t have anything to do w=
ith=20
the fact that 99 percent of these systems run Windows, could it?
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
