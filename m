Received: from mail-lb0-x229.google.com ([2a00:1450:4010:c04::229])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W8RC2-00033V-LS
 for linux-mtd@lists.infradead.org; Wed, 29 Jan 2014 09:12:23 +0000
Received: by mail-lb0-f169.google.com with SMTP id q8so1235635lbi.14
 for <linux-mtd@lists.infradead.org>; Wed, 29 Jan 2014 01:12:00 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <52E8AE25.8080502@nod.at>
References: <20140122051510.GB17284@gmail.com>
 <CAFLxGvwmzftdQKSjjjwpFLS8g3EJqMrQ2gU2scBsh2MvG7Wyyw@mail.gmail.com>
 <20140127163939.GA27809@gmail.com>
 <20140129053238.GA6035@gmail.com> <52E8AE25.8080502@nod.at>
Date: Wed, 29 Jan 2014 10:12:00 +0100
Message-ID: <CAAQYJAtYqE2PiTYGixiny2BewZpdJHJ5yZVOh=2xi5vZrWTj2w@mail.gmail.com>
Subject: Re: [BUG] reproducable ubifs reboot assert and corruption
From: Andrea Adami <andrea.adami@gmail.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

...cut...

Hi,

I'm following this thread because I experience similar symptoms:
corruption after a cycle of mount/remount.
My solution for the moment was CMDSET0001_DISABLE_ERASE_SUSPEND_ON_WRITE [1].

The setup I have is different, 2 interleaved multi-partitioned Sharp
NOR chips so I'm suspecting some issue in the suspend/erase/suspend
cycles.
Strangely this 'race' happens apparently only with ubifs: mtd_tests
and jffs2 do not show immediately the issue so it seems the ubi thread
in background makes the difference.

The alternative steps to reproduce the error in my case are:

A) ubiformat -f /rootfs.ubi /dev/mtd2 then mount/umount/ cycle or
write the mounted partition
B) creating empty volume wit ubiupdatevol -t  then mount/remount several times

See some old logs [2]
I've got in touch with Nico who originally wrote the multi-partition
code and I'm doing new tests.
Fresh logs coming.

Cheers

Andrea


[1] http://cgit.openembedded.org/meta-handheld/tree/recipes-kernel/linux/linux-yocto-dev/patches/patches-mtd/collie-LH28F640BF.patch
[2] https://github.com/andrea-adami/collie-nor-flash/tree/master/debug-20140108
