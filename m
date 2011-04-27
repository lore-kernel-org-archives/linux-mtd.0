Received: from bosmailout17.eigbox.net ([66.96.187.17])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1QF8EZ-0006dA-UU
	for linux-mtd@lists.infradead.org; Wed, 27 Apr 2011 17:09:04 +0000
Received: from bosmailscan04.eigbox.net ([10.20.15.4])
	by bosmailout17.eigbox.net with esmtp (Exim) id 1QF8EY-0007XV-Ik
	for linux-mtd@lists.infradead.org; Wed, 27 Apr 2011 13:09:02 -0400
Message-ID: <97ba6eaa0c79b74f56c22189d049dc2d.squirrel@emailmg.startlogic.com>
In-Reply-To: <Pine.LNX.4.64.1104270820560.15966@lnxricardw.se.axis.com>
References: <000201cc046b$b03a6310$10af2930$@janteq.com>
	<1303882262.2778.51.camel@localhost>
	<Pine.LNX.4.64.1104270820560.15966@lnxricardw.se.axis.com>
Date: Wed, 27 Apr 2011 13:08:16 -0400
Subject: Re: Discovering current MTD partition
From: umar@janteq.com
To: "Ricard Wanderlof" <ricard.wanderlof@axis.com>
MIME-Version: 1.0
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Sender: umar@janteq.com
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Umar Qureshey <umar@janteq.com>, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>
>> On Wed, 27 Apr 2011, Artem Bityutskiy wrote:
>>
>> > On Tue, 2011-04-26 at 16:43 -0700, Umar Qureshey wrote:
>> > Hi,
>> >
>> > I searched this list's archive but did not see anything pertinent.
>> >
>> > I was wondering if there is a way to find out what the currently
>> active mtd
>> > partition is.  In my system, I have a few flash partitions for my file
>> > system and the kernel boots with the partition that is specified on
>> the
>> > kernel command line.  Aside from scanning /proc/cmdline, is there a
>> way to
>> > programmatically ascertain which mtd partition is active *now*.
>> > I need to find this information within a Python script but really if
>> it can
>> > be done in C (perhaps a syscall?), it's all I need.
>>
>> What does active mean? Anyway, there is /proc/mtd at your disposal.
>
> If you want to find out which partition is mounted as root you could look
> at /proc/mounts .
>
> /Ricard

Hi,
/proc/mtd simply gives me a list of partition on the mtd device.  It
doesn't tell me which one we currently have booted from.

/proc/mounts as well doesn't relay any info about /dev/mtdXX.

~Umar
