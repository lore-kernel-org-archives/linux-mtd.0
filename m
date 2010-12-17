Received: from anubis.se.axis.com ([195.60.68.12])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PTZTD-0007HG-QY
	for linux-mtd@lists.infradead.org; Fri, 17 Dec 2010 12:31:41 +0000
Date: Fri, 17 Dec 2010 13:31:32 +0100 (CET)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: Static UBI volumes and ubiupdatevol ?
In-Reply-To: <1292588817.2412.7.camel@localhost>
Message-ID: <Pine.LNX.4.64.1012171328380.7024@lnxricardw.se.axis.com>
References: <Pine.LNX.4.64.1012150855090.6187@lnxricardw.se.axis.com>
	<1292516353.2364.101.camel@localhost>
	<Pine.LNX.4.64.1012170946190.7024@lnxricardw.se.axis.com>
	<1292588817.2412.7.camel@localhost>
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


On Fri, 17 Dec 2010, Artem Bityutskiy wrote:

> Ah, yes, you see, you know the things quite well yourself :-)

Well, I try to convince myself that I think I know, but there's always the=
=20
very real and likely possibilty that I'm wrong because I've misunderstood=
=20
something.

>> I guess I could read from the /dev/ubix_y device to just get the raw UBI=
FS
>> data which shouldn't change even in the event of scrubbing? Or should I
>> use gluebi to get both a raw mtd partition corresponding to the raw UBIF=
S
>> data, as well as using UBIFS (on /dev/ubix_y) for the file system?
>
> No, gluebi is not needed, it would just give you an /dev/mtdZ device
> with contents equivalent to /dev/ubiX_Y

So what does gluebi in fact add, does it just supply all the necessary=20
ioctl's to make /dev/ubiX_Y look like a /dev/mtdZ device, in addition to=20
the already existing functionality of being able to read and write to the=
=20
volume using read and write? (Yes, I could dig through the code, but even=
=20
though it might give me the answer on what it looks like right now, it=20
might not tell what the intention was...).

/Ricard
--=20
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
