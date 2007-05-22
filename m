Received: from miranda.se.axis.com ([193.13.178.8])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HqS14-0001SW-Pm
	for linux-mtd@lists.infradead.org; Tue, 22 May 2007 06:55:03 -0400
Received: from lnxricardw.se.axis.com (lnxricardw.se.axis.com [10.13.11.219])
	by miranda.se.axis.com (8.13.4/8.13.4/Debian-3sarge3) with ESMTP id
	l4MAsoRE003198
	for <linux-mtd@lists.infradead.org>; Tue, 22 May 2007 12:54:50 +0200
Date: Tue, 22 May 2007 12:52:30 +0200 (CEST)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Linux mtd <linux-mtd@lists.infradead.org>
Subject: Re: Atmel Flash Fix: cfi_cmdset_0002.c (was: MTD problems)
In-Reply-To: <F5987F30E184CEF5E0835CBD@franken3>
Message-ID: <Pine.LNX.4.64.0705221250290.3966@lnxricardw.se.axis.com>
References: <CC48EEBFC8DCA477AECA2CAE@franken3>
	<6CE8DABE2FC06ACFDCE20EC2@franken3>
	<F5987F30E184CEF5E0835CBD@franken3>
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


On Thu, 10 May 2007, Michael K=F6nig wrote:

> On Atmel Flashes the do_write_buffer() function is not supposed to be cal=
led,=20
> and it seems that some patches to make sure of that weren't applied to th=
e=20
> code in the Linux kernel GIT.
>
> The following changes have to be applied to this file:=20
> drivers/mtd/chips/cfi_cmdset_0002.c

Although Michael subsequently provided a proper patch, it does not seem to=
=20
have made it into the mtd repository. Were there any issues with the patch=
=20
that prevented it being committed?

/Ricard
--
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
