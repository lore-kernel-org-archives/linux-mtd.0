Received: from bosmailout05.eigbox.net ([66.96.188.5])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1QFUzZ-0001Qn-MW
	for linux-mtd@lists.infradead.org; Thu, 28 Apr 2011 17:27:06 +0000
Received: from bosmailscan03.eigbox.net ([10.20.15.3])
	by bosmailout05.eigbox.net with esmtp (Exim) id 1QFUzY-0003jN-Kk
	for linux-mtd@lists.infradead.org; Thu, 28 Apr 2011 13:27:04 -0400
Message-ID: <7bc099d4301235c5f76f9689cb956f2c.squirrel@emailmg.startlogic.com>
In-Reply-To: <201104281427.52402.IwoM@netcomm.com.au>
References: <000201cc046b$b03a6310$10af2930$@janteq.com>
	<4DB7C9F9.9000609@free-electrons.com>
	<d7bb9e8d1c11cece8092e2f4c40436e2.squirrel@emailmg.startlogic.com>
	<201104281427.52402.IwoM@netcomm.com.au>
Date: Thu, 28 Apr 2011 13:26:51 -0400
Subject: Re: Discovering current MTD partition
From: umar@janteq.com
To: "Iwo Mergler" <IwoM@netcomm.com.au>
MIME-Version: 1.0
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Sender: umar@janteq.com
Cc: David Wagner <david.wagner@free-electrons.com>,
	"umar@janteq.com" <umar@janteq.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> On Thu, 28 Apr 2011 03:14:36 umar@janteq.com wrote:
>> > On 04/27/2011 09:25 AM, umar@janteq.com wrote:
>> >> Hi,
>> >> [...]
>> >> What I'd like is to detect from userspace is which /dev/mtdX
>> partition
>> >> is
>> >> the currently executing program running on because that is the
>> partition
>> >> that has been obviously booted.
>> >
>> > I think you might want to take a look at getmntent (3) : it is a libc
>> > function for getting the /etc/mtab entries. It also seems to be
>> portable.
>> >
>> > Cheers,
>> > David.
>> >
>> > --
>> > David Wagner, Free Electrons
>> > Kernel, drivers, real-time and embedded Linux
>> > development, consulting, training and support.
>> > http://free-electrons.com
>>
>> This will give me the same info as /proc/mtab.  I cannot figure out how
>> I
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
> devpts /dev/pts devpts rw,relatime,mode=600 0 0
> etc.
>
> From this we can see that the current root file system is
> mtd:rfs
>
> root:/proc# cat mtd
> dev:    size   erasesize  name
> mtd0: 00100000 00020000 "S1S2EN"
> mtd1: 00400000 00020000 "rkern"
> mtd2: 00b00000 00020000 "rfs"
> mtd3: 00400000 00020000 "kernel"
> mtd4: 02000000 00020000 "root"
> etc.
>
> This tells us that mtd:rfs corresponds to mtd2, which
> should be accessible under /dev/mtd2, /dev/mtdblock2, etc.
>
>
> Best regards,
>
> Iwo
>
>

# cat /proc/mounts
rootfs / rootfs rw 0 0
ubi0:rootfs / ubifs rw,sync,relatime 0 0
proc /proc proc rw,relatime 0 0
tmpfs /tmp tmpfs rw,relatime 0 0
devpts /dev/pts devpts rw,relatime,gid=5,mode=620 0 0
sysfs /sys sysfs rw,relatime 0 0
debugfs /debug debugfs rw,relatime 0 0
tmpfs /webSvr/logs tmpfs rw,relatime 0 0

# cat /proc/mtd
dev:    size   erasesize  name
mtd0: 00020000 00020000 "bst"
mtd1: 00500000 00020000 "ptb"
mtd2: 00500000 00020000 "bld"
mtd3: 00500000 00020000 "hal"
mtd4: 00500000 00020000 "pba"
mtd5: 00800000 00020000 "pri"
mtd6: 00800000 00020000 "sec"
mtd7: 03c00000 00020000 "bak"
mtd8: 03c00000 00020000 "rmd"
mtd9: 03c00000 00020000 "rom"
mtd10: 00300000 00020000 "dsp"
mtd11: 03c00000 00020000 "lnx"

# df
Filesystem                Size      Used Available Use% Mounted on
ubi0:rootfs              52.7M     35.1M     17.5M  67% /
tmpfs                    65.4M     32.0K     65.4M   0% /tmp
tmpfs                    65.4M     32.0K     65.4M   0% /webSvr/logs

There's nothing above I can use to infer about which /dev/mtdXX is
currently booted - at least on this system.
I have resorted to my backup strategy of parsing /proc/cmdline within
Python to determine which partition is booted. *sigh*
