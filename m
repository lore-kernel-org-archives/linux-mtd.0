Received: from miranda.se.axis.com ([193.13.178.8])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1Ga8nL-0000hv-WA
	for linux-mtd@lists.infradead.org; Wed, 18 Oct 2006 06:37:14 -0400
Date: Wed, 18 Oct 2006 12:38:19 +0200 (CEST)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: =?ISO-8859-2?Q?D=E9mi_Zsolt?= <zsdemi@psolv.hu>
Subject: Re: jffs2_flash_writev(): Non-contiguous write to
In-Reply-To: <4535FCC3.2090201@psolv.hu>
Message-ID: <Pine.LNX.4.64.0610181233570.25906@lnxricardw.se.axis.com>
References: <4535EDD2.8060407@psolv.hu>
	<Pine.LNX.4.64.0610181112180.25906@lnxricardw.se.axis.com>
	<4535FCC3.2090201@psolv.hu>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: Linux mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Wed, 18 Oct 2006, D=E9mi Zsolt wrote:

>> While I don't think this is the solution to your problem, note that=20
>> there there now is an mtd-utils 1.0.1 from the same place. I know at=20
>> least some of the applications in 1.0.0 don't work properly with 2.6.18=
=20
>> due to mtd changes.
>>=20
> Thanks, but I don't see any changes in the produced jffs2 image file...

Well I didn't really think it was a solution, just a longshot since there=
=20
was an updated version available.

> the problem is in wbuf.c in the kernel jffs2 file system driver... I'm=20
> using the mtd-utils only for erasing the flash (I have tested and it's=20
> fill the hole section with 0xff) , copying the image into flash (I have=
=20
> tested, the image correctly copied into flash), and producing image file=
=20
> containing jffs2 file system.

Sounds ok so far.

> The jffs2 file system driver is the part of the mtd?

Yes, in the sense that it is developed by the group of people, but it=20
lives in fs/jffs2 in the kernel tree rather than in drivers/mtd .

/Ricard
--
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
