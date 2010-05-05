Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1O9aKl-0008RP-H9
	for linux-mtd@lists.infradead.org; Wed, 05 May 2010 08:52:00 +0000
Subject: Re: Some questions on bit-flips and JFFS2
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
In-Reply-To: <Pine.LNX.4.64.1005051039490.22753@lnxricardw.se.axis.com>
References: <201005031505.18604.muehlfelder@enertex.de>
	<4BDFE8D6.1050704@aimvalley.nl>
	<201005041659.26262.muehlfelder@enertex.de>
	<4BE12D86.2070605@aimvalley.nl>
	<Pine.LNX.4.64.1005051039490.22753@lnxricardw.se.axis.com>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 05 May 2010 11:51:20 +0300
Message-ID: <1273049480.3702.129.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Thorsten =?ISO-8859-1?Q?M=FChlfelder?= <muehlfelder@enertex.de>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Norbert van Bolhuis <nvbolhuis@aimvalley.nl>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2010-05-05 at 10:40 +0200, Ricard Wanderlof wrote:
> On Wed, 5 May 2010, Norbert van Bolhuis wrote:
> 
> >> I've already thought about something like this:
> >> 1. After first succesful bootup dump a mtd0 image and calculate a md5sum of
> >> it:
> >> nanddump -o -b -f mtd0.img /dev/mtd0
> >> 2. Before each shutdown dump the image again and check if the md5sum has
> >> changed.
> >> 3. If it has changed write the initial dump back:
> >> flash_eraseall /dev/mtd0
> >> nandwrite -p /dev/mtd0 mtd0.img
> >>
> >> Would this be the right method?
> >
> > yes that's the idea, given that "refreshing" really helps to prevent
> > (actually delay) future read disturbs.
> > ...
> >
> > Another problem is a sudden reboot (e.g. crash or power-loss). There's 
> > no check then.
> 
> Also, if a power failure occurs during erase or nandwrite the system will 
> not boot next time.

Unless you supply your device with an UPS :-)

I did not really follow the discussion, so sorry if the following is
unrelated: I think it should not be too difficult to teach JFFS2 to
force GC on eraseblocks with bit-flips.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
