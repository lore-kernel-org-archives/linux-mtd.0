Received: from mailout11.sul.t-online.com ([194.25.134.85])
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BT5zv-0008Sr-Ff
	for linux-mtd@lists.infradead.org; Wed, 26 May 2004 17:31:40 -0400
From: tglx@linutronix.de (Thomas Gleixner)
To: "Eisenhut, Daniel (MED)" <Daniel.Eisenhut@med.ge.com>,
	"'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Date: Wed, 26 May 2004 23:26:29 +0200
References: <77FE4A1FA59FF947845A42194AD6676202E30F72@uswaumsx07medge.med.ge.com>
In-Reply-To: <77FE4A1FA59FF947845A42194AD6676202E30F72@uswaumsx07medge.med.ge.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <200405262326.29385.tglx@linutronix.de>
Cc: 
Subject: Re: Accessing an MTD device from kernel space
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday 26 May 2004 23:21, Eisenhut, Daniel (MED) wrote:
> To list,
>
> I've successfully setup MTD devices for our NOR flash chips and
> everything is working great from userspace.  But I have a need to access
> the NOR flash from within kernelspace, such as in a /proc entry.
>
> What is the best way to access the flash from within the kernel?  The
> only way I've be able to so far is to just dereference a pointer
> pointing to the flash address.  But this creates two issues (that I know
> about):
>
> 1. A race condition between my proc entry that reads the flash and
> another process using the MTD device.
>
> 2. The MTD device does not always leave the flash chip in read mode.
>
> Is there anything setup in the current MTD code to allow access from
> within the kernel?

Just use the mtd API which is used from fs drivers and anything else which=
=20
accessed the mtd devices from kernel space

mtd->read(....), mtd->erase(...)=20

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
