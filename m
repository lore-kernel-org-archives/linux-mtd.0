Received: from mail.mediatrix.com ([205.237.248.11])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 157dSp-0006BE-00
	for <linux-mtd@lists.infradead.org>; Wed, 06 Jun 2001 14:35:11 +0100
Message-ID: <F1BED55F35F4D3118C0F00E0295CFF4D99548C@mail.mediatrix.com>
From: Frederic Giasson <fgiasson@mediatrix.com>
To: 'David Woodhouse' <dwmw2@infradead.org>, Abraham vd Merwe
	 <abraham@2d3d.co.za>
Cc: MTD for Linux <linux-mtd@lists.infradead.org>
Subject: RE: mtd_info->write 
Date: Wed, 6 Jun 2001 09:34:07 -0400 
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

That's right, but a read back validation has to show the error.

Fr=E9d=E9ric Giasson




-----Original Message-----
From: David Woodhouse [mailto:dwmw2@infradead.org]
Sent: Wednesday, June 06, 2001 9:36 AM
To: Abraham vd Merwe
Cc: Frederic Giasson; MTD for Linux
Subject: Re: mtd_info->write=20




abraham@2d3d.co.za said:
> > If the data is all ones ("1"), it has been erased.   If not, it has
> > not.

> Yes, I know, but I want to know whether I have to check if that's the
> case or not.=20

The chip driver is not required to check that the data are all ones. =
You=20
are permitted to write to the same location of a chip repeatedly. If =
you=20
write a 1 where previously there was a zero, obviously the result will =
be a=20
zero. But that is not an error.

--
dwmw2
