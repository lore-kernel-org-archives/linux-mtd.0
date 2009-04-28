Received: from miranda.se.axis.com ([193.13.178.8])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LyhfE-0006ZJ-Et
	for linux-mtd@lists.infradead.org; Tue, 28 Apr 2009 07:23:42 +0000
Date: Tue, 28 Apr 2009 09:23:31 +0200 (CEST)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Jatin Sharma <sharmaj@gmail.com>
Subject: Re: Mounting NAND flash as the root file system
In-Reply-To: <587a08410904271402h6e9cf4fl8d4bb843cd03990f@mail.gmail.com>
Message-ID: <Pine.LNX.4.64.0904280922270.25523@lnxricardw.se.axis.com>
References: <587a08410904271402h6e9cf4fl8d4bb843cd03990f@mail.gmail.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Mon, 27 Apr 2009, Jatin Sharma wrote:

> When I boot the kernel using ramdisk (FS in RAM), I am able to run the
> flash_eraseall utility successfully. But the mount command fails:
>
> WDS# mount -t jffs2 /dev/mtd0 /mnt
> mount: mounting /dev/mtd0 on /mnt failed

You should be using the block device - /dev/mtdblock0 - and not the=20
character device when mounting.

/Ricard
--
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
