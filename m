Received: from miranda.se.axis.com ([193.13.178.8])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1GmtOO-0000OW-8q
	for linux-mtd@lists.infradead.org; Wed, 22 Nov 2006 09:48:09 -0500
Date: Wed, 22 Nov 2006 15:46:52 +0100 (CET)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Duke <ezbonites@gmail.com>
Subject: Re: mtd_debug usage
In-Reply-To: <79ac09b60611220623l48d5d3b0k152a196f512fc82a@mail.gmail.com>
Message-ID: <Pine.LNX.4.64.0611221544030.18210@lnxricardw.se.axis.com>
References: <79ac09b60611210826j33b6b2aeh95d9259ddd3f0481@mail.gmail.com>
	<79ac09b60611211505h6682e31ay46ecc5b8fe160b0@mail.gmail.com>
	<Pine.LNX.4.64.0611220832300.3738@lnxricardw.se.axis.com>
	<79ac09b60611220623l48d5d3b0k152a196f512fc82a@mail.gmail.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Wed, 22 Nov 2006, Duke wrote:

>> What does  ls -l /dev/mtd*  (and ls -l /dev/mtdblock*) say?
>
> It looks like this:
>
> crw-r--r--    1 root     root      90,   0 Mar 22  2005 /dev/mtd0
> crw-r--r--    1 root     root      90,   1 Mar 22  2005 /dev/mtd1
> crw-r--r--    1 root     root      90,   2 Mar 22  2005 /dev/mtd2
> crw-r--r--    1 root     root      90,   3 Mar 22  2005 /dev/mtd3
> crw-r--r--    1 root     root      90,   4 Nov 22  2006 /dev/mtd4
> brw-r--r--    1 root     root      31,   0 Mar 22  2005 /dev/mtdblock0
> brw-r--r--    1 root     root      31,   1 Mar 22  2005 /dev/mtdblock1
> brw-r--r--    1 root     root      31,   2 Mar 22  2005 /dev/mtdblock2
> brw-r--r--    1 root     root      31,   3 Mar 22  2005 /dev/mtdblock3
> brw-r--r--    1 root     root      31,   4 Nov 22  2006 /dev/mtdblock4
>

The minor numbers for /dev/mtdX are wrong. /dev/mtd0 should have a minor=20
no. of 0, /dev/mtd1 should have 2, /dev/mtd2 should have 4 etc. The=20
odd-numbered minor numbers are intended for read-only devices.

The numbers for the block devices however are correct. (Don't know why=20
the numbering scheme is not the same as for the character devices but that=
=20
seems to be the way it is.)

/Ricard
--
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
