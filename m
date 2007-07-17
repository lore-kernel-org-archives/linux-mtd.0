Received: from smtp1-g19.free.fr ([212.27.42.27])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IAuZm-0006oS-8p
	for linux-mtd@lists.infradead.org; Tue, 17 Jul 2007 17:27:26 -0400
Received: from [192.168.1.5] (tal33-2-82-228-175-43.fbx.proxad.net
	[82.228.175.43])
	by smtp1-g19.free.fr (Postfix) with ESMTP id 4B1451AB2E3
	for <linux-mtd@lists.infradead.org>;
	Tue, 17 Jul 2007 23:27:08 +0200 (CEST)
Message-ID: <469D3484.3020602@free.fr>
Date: Tue, 17 Jul 2007 23:28:36 +0200
From: Eric BENARD <ebenard@free.fr>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: JFFS2 doesn't mount read-only at boot in 2.6.22.1 anymore
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I'm testing Linux 2.6.22.1 on an AT91RM9200.
Before, with 2.6.21-rc5-gce20269d-dirty, I was able to pass "ro" option
on the boot command line and the rootfs was mounted readonly showing the
following message :
VFS: Mounted root (jffs2 filesystem) readonly.

Now, on 2.6.22.1, the "ro" option (same board, same rootfs), leads to
this message :
VFS: Mounted root (jffs2 filesystem).

The command line is (same in both case) :
root=/dev/mtdblock2 rootfstype=jffs2 console=ttyS0,115200
mtdparts=physmap-flash.0:256k(u-boot),1408k(kernel),-(rootfs) mem=32M ro

The config file for 2.6.22.1 is taken from 2.6.21-rc5 + make oldconfig
and default answer everywhere.

Do you have any idea of what may be wrong in my configuration ?
Is this an expected behaviour in 2.6.22.1 ?
Do you have any idea of where to dig to fix this problem ?

Thanks and best regards
Eric
