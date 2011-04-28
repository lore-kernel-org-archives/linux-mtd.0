Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QFN1T-00052F-G2
	for linux-mtd@lists.infradead.org; Thu, 28 Apr 2011 08:56:35 +0000
Received: by eyh6 with SMTP id 6so890267eyh.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 28 Apr 2011 01:56:29 -0700 (PDT)
Subject: Re: Discovering current MTD partition
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
In-Reply-To: <Pine.LNX.4.64.1104280959150.15966@lnxricardw.se.axis.com>
References: <000201cc046b$b03a6310$10af2930$@janteq.com>
	<1303882262.2778.51.camel@localhost>
	<Pine.LNX.4.64.1104270820560.15966@lnxricardw.se.axis.com>
	<97ba6eaa0c79b74f56c22189d049dc2d.squirrel@emailmg.startlogic.com>
	<Pine.LNX.4.64.1104280929290.15966@lnxricardw.se.axis.com>
	<1303976257.2778.86.camel@localhost>
	<Pine.LNX.4.64.1104280959150.15966@lnxricardw.se.axis.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 28 Apr 2011 11:52:18 +0300
Message-ID: <1303980738.2778.97.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"umar@janteq.com" <umar@janteq.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2011-04-28 at 10:00 +0200, Ricard Wanderlof wrote:
> On Thu, 28 Apr 2011, Artem Bityutskiy wrote:
> 
> > On Thu, 2011-04-28 at 09:31 +0200, Ricard Wanderlof wrote:
> >> On Wed, 27 Apr 2011, umar@janteq.com wrote:
> >>
> >>> Hi,
> >>>
> >>> /proc/mounts as well doesn't relay any info about /dev/mtdXX.
> >>
> >> Sorry, you are right of course. It just seems to say /dev/root on my
> >> system.
> >>
> >> The df command however seems to figure out which mtd device is mounted on
> >> / . I don't know exactly how it finds this out though. I'm pretty sure it
> >> uses /proc/mounts, because if /proc/mounts is missing it doesn't output
> >> anything, but it must be getting extra information from somewhere.
> >>
> >> /Ricard
> >
> > Well, the best it to look at df sources. But here is my guess:
> >
> > /dev/root must have come from the kernel command line, if I'm not
> > mistaken. You can find out what is your /dev/root from /proc/cmdline -
> > find rootfs=<xxx> there, and xxx is your device.
> 
> Well, in this case /dev/cmdline says
> 
> console=ttyS0 root=/dev/mtdblock3 rw rootfstype=jffs2 init=/linuxrc
> 
> so no mention of /dev/root there.

/dev/root is the alias for whatever is in root=, so in your
case /dev/root = /dev/mtdblock3

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
