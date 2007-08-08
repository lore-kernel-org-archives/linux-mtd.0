Received: from rv-out-0910.google.com ([209.85.198.188])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IIrEn-0006pU-50
	for linux-mtd@lists.infradead.org; Wed, 08 Aug 2007 15:32:31 -0400
Received: by rv-out-0910.google.com with SMTP id c24so201865rvf
	for <linux-mtd@lists.infradead.org>;
	Wed, 08 Aug 2007 12:30:29 -0700 (PDT)
Message-ID: <4f6ba3b0708081230x4af48cd2x574dbb5b374ba075@mail.gmail.com>
Date: Wed, 8 Aug 2007 15:30:28 -0400
From: "Bob Beers" <bob.beers@gmail.com>
To: "Andy Kennedy" <akennedy@techmoninc.com>
Subject: Re: DiskOnChip 2000 (DOC 2000) woes.
In-Reply-To: <46BA05D6.4080605@techmoninc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <46B76F31.6020507@techmoninc.com> <46B9EE9B.7060805@techmoninc.com>
	<4f6ba3b0708081003u28766bbdg1db917078fc4ad2b@mail.gmail.com>
	<46BA05D6.4080605@techmoninc.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 8/8/07, Andy Kennedy <akennedy@techmoninc.com> wrote:
> Bob Beers wrote:
> > And, to give you some hope, I will tell you
> >  that I have done what you are trying.
> > fdisk /dev/nftla (create a linux partition or two)
> > mke2fs /dev/nftla1
> > mount /dev/nftla1 /mnt/doc
> > cp blahblahblah /mnt/doc/blahblah
> > etc. ...
> > end up with a bootable DoC on a SBC with no other drive.
>
> What kernel did you use?


I have used many 2.6.x, (2.6.15.4 for certain) with this relevant .config:

root@alakazam:/usr/src/linux-2.6.15.4-PM# grep MTD .config | grep -v ^#
CONFIG_MTD=y
CONFIG_MTD_MAP_BANK_WIDTH_1=y
CONFIG_MTD_MAP_BANK_WIDTH_2=y
CONFIG_MTD_MAP_BANK_WIDTH_4=y
CONFIG_MTD_CFI_I1=y
CONFIG_MTD_CFI_I2=y
CONFIG_MTD_NAND=y
CONFIG_MTD_NAND_IDS=y
CONFIG_MTD_NAND_DISKONCHIP=y
CONFIG_MTD_NAND_DISKONCHIP_PROBE_ADDRESS=0
CONFIG_MTD_NAND_DISKONCHIP_BBTWRITE=y

> How did you make it bootable. . . lilo?

yep, lilo v, 22.2, I think

> Did you follow a howto -- or just do it plain like I figured I could do. . .
> It shouldn't be that hard, right?

No, never found a howto.

If I recall correctly, it is very important to format the DoC with
 the DOS tools' dformat before trying any linux action on it.

I booted from a bootable DOS floppy and ran:

dformat /win:d800 /s:doc514.exb /ebda /y

Then reboot into DOS once more.
Then boot into linux and run fdisk,
 format the partitions, copy the files,
 run lilo, etc.

Hope this helps,
-Bob
