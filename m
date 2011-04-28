Received: from anubis.se.axis.com ([195.60.68.12])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1QFLoU-0004MW-Ez
	for linux-mtd@lists.infradead.org; Thu, 28 Apr 2011 07:39:03 +0000
Date: Thu, 28 Apr 2011 09:39:00 +0200 (CEST)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Iwo Mergler <IwoM@netcomm.com.au>
Subject: Re: Discovering current MTD partition
In-Reply-To: <201104281427.52402.IwoM@netcomm.com.au>
Message-ID: <Pine.LNX.4.64.1104280936270.15966@lnxricardw.se.axis.com>
References: <000201cc046b$b03a6310$10af2930$@janteq.com>
	<4DB7C9F9.9000609@free-electrons.com>
	<d7bb9e8d1c11cece8092e2f4c40436e2.squirrel@emailmg.startlogic.com>
	<201104281427.52402.IwoM@netcomm.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: David Wagner <david.wagner@free-electrons.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"umar@janteq.com" <umar@janteq.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Thu, 28 Apr 2011, Iwo Mergler wrote:

>> This will give me the same info as /proc/mtab.  I cannot figure out how =
I
>> can infer which /dev/mtdXX was booted from with this information.
>>
>
> Here is an example from the embedded system I have on my desk
> right now:
>
> root:/proc# cat /proc/mounts
> rootfs / rootfs rw 0 0
> mtd:rfs / jffs2 rw,relatime 0 0
> proc /proc proc rw,relatime 0 0
> devpts /dev/pts devpts rw,relatime,mode=3D600 0 0
> etc.

On the other hand, here's another example from a system on my desk:

# cat  /proc/mounts
rootfs / rootfs rw 0 0
/dev/root / jffs2 rw,relatime 0 0
proc /proc proc rw,relatime 0 0
sysfs /sys sysfs rw,relatime 0 0
udev /dev tmpfs rw,relatime 0 0
tmpfs /dev/shm tmpfs rw,relatime 0 0
/dev/part/rwfsblock /mnt/flash jffs2 rw,relatime 0 0
tmpfs /var tmpfs rw,relatime 0 0
devpts /dev/pts devpts rw,relatime,mode=3D600 0 0

The root partition is just listed as /dev/root without any information=20
about what that refers to. The system doesn't even have a /dev/root so=20
it's just some sort of placeholder.

On the other hand, on the same system, df says:

# df
Filesystem           1k-blocks      Used Available Use% Mounted on
/dev/mtdblock3           28672     22384      6288  78% /
udev                     66588         4     66584   0% /dev
tmpfs                    66588         0     66588   0% /dev/shm
/dev/part/rwfsblock     228864      5456    223408   2% /mnt/flash
tmpfs                    66588     25660     40928  39% /var

which tells exactly where the root file system is. Don't know exactly how=
=20
it obtains the information though.

The system is running busybox so a quick look in the code for the df=20
command should explain how its done.

/Ricard
--=20
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
