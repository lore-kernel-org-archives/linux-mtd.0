Received: from miranda.se.axis.com ([193.13.178.8])
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IqT68-0005OT-Rv
	for linux-mtd@lists.infradead.org; Fri, 09 Nov 2007 12:36:36 +0000
Received: from lnxricardw.se.axis.com (lnxricardw.se.axis.com [10.13.11.219])
	by miranda.se.axis.com (8.13.4/8.13.4/Debian-3sarge3) with ESMTP id
	lA9CaISR001261
	for <linux-mtd@lists.infradead.org>; Fri, 9 Nov 2007 13:36:18 +0100
Date: Fri, 9 Nov 2007 13:36:05 +0100 (CET)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Linux mtd <linux-mtd@lists.infradead.org>
Subject: Re: How to count NAND bad block from user space?
In-Reply-To: <ad7e75d70711090255w1da7470fg519dd73be4bd2b3c@mail.gmail.com>
Message-ID: <Pine.LNX.4.64.0711091335290.523@lnxricardw.se.axis.com>
References: <ad7e75d70711090255w1da7470fg519dd73be4bd2b3c@mail.gmail.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Fri, 9 Nov 2007, navigator.atreides@gmail.com wrote:

> I want to count number of the bad blocks on the nand device, so being
> inspired by ~/mtd/util/flash_eraseall.c I used follow call
>
> int ret =3D ioctl(fd, MEMGETBADBLOCK, &offset);
>
> as badness measure for block ( if (ret > 0) ).
>
> Could you please point me out if I'm on the right way?
> ...

Without having tried the code, looks good to me.

/Ricard
--
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
