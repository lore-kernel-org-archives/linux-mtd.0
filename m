Received: from phoenix.infradead.org ([2001:8b0:10b:1:2c0:f0ff:fe31:e18])
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1D9NVv-0001Om-Rc
	for linux-mtd@lists.infradead.org; Thu, 10 Mar 2005 08:15:44 -0500
Date: Thu, 10 Mar 2005 13:15:27 +0000 (GMT)
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: Konstantin Kletschke <lists@ku-gbr.de>
In-Reply-To: <20050309131453.GA2497@synertronixx3>
Message-ID: <Pine.LNX.4.58.0503101314570.4649@phoenix.infradead.org>
References: <20050309131453.GA2497@synertronixx3>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: Artem Bityuckiy <dedekind@infradead.org>
Cc: linux-mtd@lists.infradead.org
Subject: Re: jffs2 with sync burst mode
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> Hi people!
>
> These days I have time again for my embedded system to investigate what
> weird shit is happening here with the probplems introduced trying to
> configure the Flash device to run in sync burst mode.
> It is an intel 28F128K3 device with a motorola i.MX cpu.
>
> I now set up a debug environment: I am running a classical kernel
> locatedt in FLASH which is succesfully copied and decompressed into
> SDRAM. It mounts its root via nfs from server and from there I mount
> /dev/mtdblockX for testing purposes with jffs2 and mtd debug turned on.
>
> First weird thing is, reading writing from the device works perfect.
> I diffed original and copy and diff putted out no difference. I copied
> from flash back into root, copied the copy and diffed on the PC also, 

First of all we ask to try the latest MTD snapshot. Did you do that?

Just general suggestions:

Try to mount empty filesystem then copy your tree there by "cp -r -a", 
umount, mount. This will exclude errors during JFFS2 image 
creation/flashing.

Try to use mtdram device.

--
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
