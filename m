Received: from eos.fwall.u-szeged.hu ([160.114.120.248])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DTc7D-0008Ie-CT
	for linux-mtd@lists.infradead.org; Thu, 05 May 2005 04:53:52 -0400
Message-ID: <4279DF8F.3020409@inf.u-szeged.hu>
Date: Thu, 05 May 2005 10:55:43 +0200
From: Ferenc Havasi <havasi@inf.u-szeged.hu>
MIME-Version: 1.0
To: Sergei Sharonov <sergei.sharonov@halliburton.com>
References: <loom.20050429T162520-770@post.gmane.org>	<42760103.4010202@inf.u-szeged.hu>
	<loom.20050502T180712-856@post.gmane.org>
In-Reply-To: <loom.20050502T180712-856@post.gmane.org>
Content-Type: text/plain; charset=ISO-8859-2; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: summary patch
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Sergei,

Unfortunatelly we don't have a real NAND device, just Artem's NAND 
simulator.

The emulated flash is: size:64M, erase block: 128KiB, page size: 2K page.

We tried the following:

modprobe nandsim
flash_eraseall -j /dev/mtd0c
mount /mnt/flash
cp linux-2.6.11.7.tar.bz2 /mnt/flash               (35 MB)
umount /mnt/flash
mount /mnt/flash

There was no error/warning messages, and using

jffs2dump -cv /dev/mtd0c |less

there was summary nodes on the flash at right places.

How did you used it? Which flash device do you use?

Bye,
Ferenc
