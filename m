Received: from miranda.se.axis.com ([193.13.178.8])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NXDxu-000213-N1
	for linux-mtd@lists.infradead.org; Tue, 19 Jan 2010 13:17:54 +0000
Date: Tue, 19 Jan 2010 14:17:22 +0100 (CET)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Johnny Hung <johnny.hacking@gmail.com>
Subject: Re: mount ramdisk rootfs /etc directory to jffs2 filesystem.
In-Reply-To: <cb9ecdfa1001190403v433d839dy6ba2bc018024ce15@mail.gmail.com>
Message-ID: <Pine.LNX.4.64.1001191414090.32263@lnxricardw.se.axis.com>
References: <cb9ecdfa1001190120r593f7799sf566df5a855b8a54@mail.gmail.com>
	<20100119095024.GD16182@darwin>
	<cb9ecdfa1001190213u69469505k9c42142bdc17f750@mail.gmail.com>
	<20100119102026.GF16182@darwin>
	<cb9ecdfa1001190403v433d839dy6ba2bc018024ce15@mail.gmail.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: kernelnewbies <kernelnewbies@nl.linux.org>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>,
	Matthias Kaehlcke <matthias@kaehlcke.net>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Tue, 19 Jan 2010, Johnny Hung wrote:

> Okay, I think the steps is below if my rootfs is ramdisk and configure
> files in jffs2,
>
> 1. cp /etc/* /mnt/mtd/etc/    (/mnt/mtd is my jffs2 fs)
> 2. rm -rf /etc/*
> 3. make symbolic links from all /etc/xx to /mnt/mtd/etc/xxx
> 4. remake ramdisk rootfs
>
> It seems all files in ramdisk rootfs /etc all links to /mnt/mtd/etc/
> and try to modify these files is effective after reboot.
> But is this a common way in embedded linux ?

In principle, but it is easier (and cleaner) to make a symbolic link from=
=20
(say) /etc -> /mnt/mtd/etc without linking every individual file and=20
directory.

You could also use a jffs2 file system in flash for your rootfs, that way=
=20
you wouldn't need a ramdisk at all.

/Ricard
--=20
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
