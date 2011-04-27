Received: from bosmailout08.eigbox.net ([66.96.188.8])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1QEz86-0000JM-Jp
	for linux-mtd@lists.infradead.org; Wed, 27 Apr 2011 07:25:47 +0000
Received: from bosmailscan17.eigbox.net ([10.20.15.17])
	by bosmailout08.eigbox.net with esmtp (Exim) id 1QEz85-0001GR-EH
	for linux-mtd@lists.infradead.org; Wed, 27 Apr 2011 03:25:45 -0400
Message-ID: <896346e425b9fed6ed42ee9c4144e135.squirrel@emailmg.startlogic.com>
In-Reply-To: <1303882262.2778.51.camel@localhost>
References: <000201cc046b$b03a6310$10af2930$@janteq.com>
	<1303882262.2778.51.camel@localhost>
Date: Wed, 27 Apr 2011 03:25:22 -0400
Subject: Re: Discovering current MTD partition
From: umar@janteq.com
To: dedekind1@gmail.com
MIME-Version: 1.0
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Sender: umar@janteq.com
Cc: linux-mtd@lists.infradead.org, Umar Qureshey <umar@janteq.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> On Tue, 2011-04-26 at 16:43 -0700, Umar Qureshey wrote:
>> Hi,
>>
>> I searched this list's archive but did not see anything pertinent.
>>
>> I was wondering if there is a way to find out what the currently active
>> mtd
>> partition is.  In my system, I have a few flash partitions for my file
>> system and the kernel boots with the partition that is specified on the
>> kernel command line.  Aside from scanning /proc/cmdline, is there a way
>> to
>> programmatically ascertain which mtd partition is active *now*.
>> I need to find this information within a Python script but really if it
>> can
>> be done in C (perhaps a syscall?), it's all I need.
>
> What does active mean? Anyway, there is /proc/mtd at your disposal.
>
> --
> Best Regards,
> Artem Bityutskiy (Артём Битюцкий)
>
>
Hi,
I have multiple redundant partitions on the flash chip.  Each of these
partitions has been flashed with a file system.  The kernel resides in yet
another partition.  The bootloader loads the kernel into RAM, passes it
the kernel command line, and passes control to the kernel.  The kernel
boots and mounts the partition it was told to do so via the command line.

So, for instance, I may have this scheme:

/dev/mtd2  ---> kernel
/dev/mtd3 -----> FS #1
/dev/mtd4 -----> FS #2

The kernel can boot and mount either /dev/mtd3 or /dev/mtd4 depending on
what command line the bootloader passed to the kernel.
What I'd like is to detect from userspace is which /dev/mtdX partition is
the currently executing program running on because that is the partition
that has been obviously booted.

My fallback idea is to just bite the bullet and parse /proc/cmdline to see
which partition is being passed to the kernel.  This should work fine. 
But I was curious if there is a "cleaner" more programmatic method of
determining this information without resorting to clever regular
expressions in parsing /proc/cmdline.
