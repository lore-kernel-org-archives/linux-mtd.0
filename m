Received: from mailsrv.broadlight.com ([212.179.23.161])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PMgZX-0002qE-PL
	for linux-mtd@lists.infradead.org; Sun, 28 Nov 2010 12:41:41 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: RE: simple ubi reader
Date: Sun, 28 Nov 2010 14:37:43 +0200
Message-ID: <AFC5977FF9FA3E449BB7803E9BA754EF01D8AF55@mailsrv.broadlight.com>
In-Reply-To: <4CF22EF4.7010501@gmail.com>
From: "Vladimir Khmelnitsky" <vladimir@broadlight.com>
To: "Marek Skuczynski" <mareksk7@gmail.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Marek,

Thanks for your reply.
But may be you know some simpler code performing ubi read. It looks to
me rather complicated to cut out from u-boot, and even from barebox -
code responsible only for ubi read dropping mtd staff.

Regards,
Vladimir

-----Original Message-----
From: Marek Skuczynski [mailto:mareksk7@gmail.com]=20
Sent: Sunday, November 28, 2010 12:29 PM
To: Vladimir Khmelnitsky
Cc: linux-mtd@lists.infradead.org
Subject: Re: simple ubi reader

Hi Vladimir,
> I need to write bootloader which should read its second stage binary
> from ubi volume.
> I wonder if there is some simple open source code I can use to
implement
> ubi volume reader?
I can take a look at these places:
- U-boot <http://git.denx.de/?p=3Du-boot.git>
- Barebox aka U-boot2 <http://git.pengutronix.de/?p=3Dbarebox.git>

Regards,
 Marek
