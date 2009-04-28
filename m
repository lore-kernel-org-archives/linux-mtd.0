Received: from miranda.se.axis.com ([193.13.178.8])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LyohV-0007hB-O8
	for linux-mtd@lists.infradead.org; Tue, 28 Apr 2009 14:54:32 +0000
Date: Tue, 28 Apr 2009 16:54:20 +0200 (CEST)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Jatin Sharma <sharmaj@gmail.com>
Subject: Re: Mounting NAND flash as the root file system
In-Reply-To: <587a08410904280721k30a5045bifb03423ae3aed3ec@mail.gmail.com>
Message-ID: <Pine.LNX.4.64.0904281652020.25523@lnxricardw.se.axis.com>
References: <587a08410904271402h6e9cf4fl8d4bb843cd03990f@mail.gmail.com>
	<Pine.LNX.4.64.0904280922270.25523@lnxricardw.se.axis.com>
	<587a08410904280721k30a5045bifb03423ae3aed3ec@mail.gmail.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"gausinghnsit@gmail.com" <gausinghnsit@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Tue, 28 Apr 2009, Jatin Sharma wrote:

> Actually, I was mounting the block device but wrote it wrong in the email=
=2E
>
> WDS# mount -t jffs2 /dev/mtdblock0 /mnt
> mount: mounting /dev/mtdblock0 on /mnt failed

Ok. Well I don't really have any other ideas, it's just a typical mistake=
=20
that people make (I do it all the time...).

> Since the flash_eraseall and nandwrite tools are working on the NAND
> device, NAND driver is working fine. Would you agree? I don't have the
> nanddump tools on my file system but will include it to make sure NAND
> is getting updating after being written by nandwrite.

What happens if you erase the flash and the mount it directly (without=20
writing an image to it). An empty flash is a valid jffs2 file system, so=20
if this works, but mounting the partition with an image in it doesn't,=20
there could be something wrong with your image.

/Ricard
--
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
