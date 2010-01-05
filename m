Received: from [193.13.178.10] (helo=krynn.se.axis.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NS5e7-0007T0-SE
	for linux-mtd@lists.infradead.org; Tue, 05 Jan 2010 09:24:17 +0000
Date: Tue, 5 Jan 2010 10:23:32 +0100 (CET)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: linux newbie <linux.newbie79@gmail.com>
Subject: Re: JFFS2 - speed up while booting
In-Reply-To: <a64f67eb1001050013wd122746iab32bdfc93ba1aee@mail.gmail.com>
Message-ID: <Pine.LNX.4.64.1001051016020.5028@lnxricardw.se.axis.com>
References: <a64f67eb1001041649u500f3a6bx40d443c4a3415f1b@mail.gmail.com>
	<Pine.LNX.4.64.1001050905071.5028@lnxricardw.se.axis.com>
	<a64f67eb1001050013wd122746iab32bdfc93ba1aee@mail.gmail.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Tue, 5 Jan 2010, linux newbie wrote:

> Hi,
>
> It is slow during every boot. Seems it is scanning for bad blocks (If
> I enable the debug message. Usually debug is OFF).

During mount, JFFS2 will scan for cleanmarkers in the OOB area of each=20
block, indicating that the block has been erased and can be used for=20
storage. If cleanmarkers can not be found in blocks that appear to be=20
empty (=3D all FFh), it puts the blocks on the erase queue for subsequent=
=20
erasure. The erase process takes time and during erasure the flash cannot=
=20
be read from which can account for slow booting. However, this should only=
=20
happen the first time after mounting a newly flashed file system.=20
Subsequent mounts should detect the cleanmarkers, and no erase will be=20
performed. It can take a few minutes to complete the erase procedure=20
though; if you do a 'top' on your system you'll see the pdflush task at=20
the top while it is in progress, so if you reboot your system several=20
times in succession JFFS2 might not have time to complete the erase of all=
=20
unused blocks.

I don't know if this has been addressed recently, but the odd thing is=20
that if you for instance implement separate erase sequence for instance in=
=20
your flash driver, the total erase+boot time is much less than if you let=
=20
JFFS2 handle it via the pdflush task.

Another option is to write cleanmarkers to empty blocks while writing your=
=20
file system image. I don't think nandwrite has an option for that though.

But at any rate, you should only see this slowdown after first mount.=20
Subsequent mounts should find the cleanmarkers in place and no erasure=20
should be necessary. So I'm not convinced this is actually your problem.

/Ricard
--=20
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
