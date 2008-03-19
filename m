Received: from miranda.se.axis.com ([193.13.178.8])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Jbv6s-0007nz-RW
	for linux-mtd@lists.infradead.org; Wed, 19 Mar 2008 10:01:27 +0000
Date: Wed, 19 Mar 2008 11:01:03 +0100 (CET)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: gxk <gxkahn@gmail.com>
Subject: Re: question > new jffs2 partition 
In-Reply-To: <frqjtj$ggi$1@ger.gmane.org>
Message-ID: <Pine.LNX.4.64.0803191057550.6032@lnxricardw.se.axis.com>
References: <frqjtj$ggi$1@ger.gmane.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Wed, 19 Mar 2008, gxk wrote:

> Does the kernel format erased flash, defined as partition?
>
> From the Uboot prompt i erase the space:
> erase 0xa0000000 +2800000
>
> Configured my kernel to have 3 partitions.
> The 3rd is started at address 0xa0000000 with size 0x2800000.
> This partition mounted at system boot:
>
> mount -t jffs22 /dev/mtdblock/2 /mnt
>
> and after simple make dir
>
> mkdir -p /mnt/abcd
>
> Now, when i start the system 1st time, it is taking more time to load
> at the `mkdir'. All follow reboots go smooth.
>
> It is look like mtd driver formats the partition. Can anybody confirm thi=
s?
> When is it happen?

mtd doesn't, but the jffs2 driver erases all seemingly empty blocks and=20
writes cleanmarkers to them. This is ultimately handled by the pdflush=20
kernel task once the kernel is up and running, and for some reason it=20
takes quite a while to accomplish, e.g. pdflush runs with a high CPU load=
=20
for a minute or so although the required operations would take just a few=
=20
seconds. I once tried to dive into the code to figure out why but failed=20
to come up with anything.

/Ricard
--
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
