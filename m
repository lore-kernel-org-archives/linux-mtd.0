Received: from smtp.nokia.com ([131.228.20.172] helo=mgw-ext13.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HCc4d-0007dH-Pw
	for linux-mtd@lists.infradead.org; Thu, 01 Feb 2007 08:34:02 -0500
Subject: Re: [RFC] [PATCH 1/1] [MTD] UBI: implement per-volume update
From: Artem Bityutskiy <dedekind@infradead.org>
To: tglx@linutronix.de
In-Reply-To: <1170335439.29240.277.camel@localhost.localdomain>
References: <20070201102105.15629.61206.sendpatchset@localhost.localdomain>
	<20070201102111.15629.24289.sendpatchset@localhost.localdomain>
	<1170335439.29240.277.camel@localhost.localdomain>
Content-Type: text/plain; charset=utf-8
Date: Thu, 01 Feb 2007 15:26:56 +0200
Message-Id: <1170336416.3628.3.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: Alexander Schmidt <alexs@linux.vnet.ibm.com>, linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2007-02-01 at 14:10 +0100, Thomas Gleixner wrote:
> On Thu, 2007-02-01 at 12:21 +0200, Artem Bityutskiy wrote:
> > This patch removes the global update marker support and everything
> > related to it. Now we have per-volume update marker bit in the
> > volume table. This makes us incompatible with older UBI images but
> > this is not a big deal - UBI is not used so widely so far and we
> > can afford dropping legacy stuff now.
>=20
> Uuurgh. Incompatible in what way ? Does this mean you cannot boot from
> an existing image anymore ?

Err, actually only those which have update marker on flash. If you do
not have it - it should be fine.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
