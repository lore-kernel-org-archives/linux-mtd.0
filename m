Received: from anubis.se.axis.com ([195.60.68.12])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1QFLh6-0004Hr-CV
	for linux-mtd@lists.infradead.org; Thu, 28 Apr 2011 07:31:25 +0000
Date: Thu, 28 Apr 2011 09:31:22 +0200 (CEST)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: "umar@janteq.com" <umar@janteq.com>
Subject: Re: Discovering current MTD partition
In-Reply-To: <97ba6eaa0c79b74f56c22189d049dc2d.squirrel@emailmg.startlogic.com>
Message-ID: <Pine.LNX.4.64.1104280929290.15966@lnxricardw.se.axis.com>
References: <000201cc046b$b03a6310$10af2930$@janteq.com>
	<1303882262.2778.51.camel@localhost>
	<Pine.LNX.4.64.1104270820560.15966@lnxricardw.se.axis.com>
	<97ba6eaa0c79b74f56c22189d049dc2d.squirrel@emailmg.startlogic.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Wed, 27 Apr 2011, umar@janteq.com wrote:

> Hi,
>
> /proc/mounts as well doesn't relay any info about /dev/mtdXX.

Sorry, you are right of course. It just seems to say /dev/root on my=20
system.

The df command however seems to figure out which mtd device is mounted on=
=20
/ . I don't know exactly how it finds this out though. I'm pretty sure it=
=20
uses /proc/mounts, because if /proc/mounts is missing it doesn't output=20
anything, but it must be getting extra information from somewhere.

/Ricard
--=20
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
