Received: from smtp.nokia.com ([131.228.20.170] helo=mgw-ext11.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HGZi7-0000qu-Co
	for linux-mtd@lists.infradead.org; Mon, 12 Feb 2007 06:51:10 -0500
Subject: Re: [PATCH] [MTD] UBI: Fix counting of ec value
From: Artem Bityutskiy <dedekind@infradead.org>
To: Timo Lindhorst <lindhors@linux.vnet.ibm.com>
In-Reply-To: <45D045FC.7090902@linux.vnet.ibm.com>
References: <200702121016.40516.lindhors@linux.vnet.ibm.com>
	<1171273959.17314.16.camel@sauron>
	<45D045FC.7090902@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8
Date: Mon, 12 Feb 2007 13:38:10 +0200
Message-Id: <1171280290.17314.23.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: MTD list <linux-mtd@lists.infradead.org>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2007-02-12 at 11:48 +0100, Timo Lindhorst wrote:=20
> > So why have you moved this memory allocation here?
> Actually I have not moved up the allocation, but moved down the
> 'if (unlikely(ec > UBI_MAX_ERASECOUNTER)) { ... ' block, since we need=20
> to know the new ec value before we can do this test.

OK, fine, just free the memory there.

> > What's the point in the new 'ret' variable? Why ec +=3D err does not wo=
rk?
> I just thought adding an error code to a counter seems odd. Do you=20
> prefer this way?

Well, it's anyway better then a distinct variable IMO. Moreover, it is
used like this across the UBI code, so just assume it is UBI style :-)

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
