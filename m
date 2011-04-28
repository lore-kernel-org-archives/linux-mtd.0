Received: from anubis.se.axis.com ([195.60.68.12])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1QFM95-0004X8-Fz
	for linux-mtd@lists.infradead.org; Thu, 28 Apr 2011 08:00:20 +0000
Date: Thu, 28 Apr 2011 10:00:17 +0200 (CEST)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: Discovering current MTD partition
In-Reply-To: <1303976257.2778.86.camel@localhost>
Message-ID: <Pine.LNX.4.64.1104280959150.15966@lnxricardw.se.axis.com>
References: <000201cc046b$b03a6310$10af2930$@janteq.com>
	<1303882262.2778.51.camel@localhost>
	<Pine.LNX.4.64.1104270820560.15966@lnxricardw.se.axis.com>
	<97ba6eaa0c79b74f56c22189d049dc2d.squirrel@emailmg.startlogic.com>
	<Pine.LNX.4.64.1104280929290.15966@lnxricardw.se.axis.com>
	<1303976257.2778.86.camel@localhost>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"umar@janteq.com" <umar@janteq.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Thu, 28 Apr 2011, Artem Bityutskiy wrote:

> On Thu, 2011-04-28 at 09:31 +0200, Ricard Wanderlof wrote:
>> On Wed, 27 Apr 2011, umar@janteq.com wrote:
>>
>>> Hi,
>>>
>>> /proc/mounts as well doesn't relay any info about /dev/mtdXX.
>>
>> Sorry, you are right of course. It just seems to say /dev/root on my
>> system.
>>
>> The df command however seems to figure out which mtd device is mounted o=
n
>> / . I don't know exactly how it finds this out though. I'm pretty sure i=
t
>> uses /proc/mounts, because if /proc/mounts is missing it doesn't output
>> anything, but it must be getting extra information from somewhere.
>>
>> /Ricard
>
> Well, the best it to look at df sources. But here is my guess:
>
> /dev/root must have come from the kernel command line, if I'm not
> mistaken. You can find out what is your /dev/root from /proc/cmdline -
> find rootfs=3D<xxx> there, and xxx is your device.

Well, in this case /dev/cmdline says

console=3DttyS0 root=3D/dev/mtdblock3 rw rootfstype=3Djffs2 init=3D/linuxrc

so no mention of /dev/root there.

/Ricard
--=20
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
