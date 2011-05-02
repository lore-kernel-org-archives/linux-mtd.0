Received: from ra.se.axis.com ([195.60.68.13])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1QGoxL-0004YZ-0f
	for linux-mtd@lists.infradead.org; Mon, 02 May 2011 08:58:15 +0000
Date: Mon, 2 May 2011 10:58:10 +0200 (CEST)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: angelo <angelo70@gmail.com>
Subject: Re: help request, jffs2 fs files get lost
In-Reply-To: <4DBE6BCD.3050400@gmail.com>
Message-ID: <Pine.LNX.4.64.1105021057420.15966@lnxricardw.se.axis.com>
References: <4DBD4572.5040508@gmail.com>
	<Pine.LNX.4.64.1105020853440.15966@lnxricardw.se.axis.com>
	<4DBE6BCD.3050400@gmail.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Mon, 2 May 2011, angelo wrote:

> If this is in fact what you're doing, you're overwriting your jffs2.img f=
ile with the all-ff's contents of the newly erased /dev/mtd2. Swap the two =
arguments instead.
>
> sorry, was just a bad had-written text,
> i generally do "cp jffs2.img /dev/mtd2", and after mounting mtdblock2 i s=
ee correctly the root tree.
>
> I did some other tests:
> if i mount the new created jffs2 and unmount it, nothing is lost.
> If i mount it, open a file, append some text, close it and unmount, then =
at the next mount everything is disapperaed (checking mtd2, all is set to 0=
xff).
>
> Saving modified files i notice a warning:
> Writing files is also notice some MTD debug trace, maybe an error:
> Node totlen on flash (0xffffffff) !=3D totlen from node ref (0x00000074)

Out of curiosity, what exactly is the type of flash you are using?

/Ricard
--=20
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
