Received: from smtp-out5.blueyonder.co.uk ([195.188.213.8])
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1AOy7R-0007Th-QP
	for <linux-mtd@lists.infradead.org>; Wed, 26 Nov 2003 11:46:05 +0000
Message-ID: <003601c3b413$28b7ac50$6401a8c0@f87htyy9967774jjyuww2>
From: "stephen" <lcbr17306@blueyonder.co.uk>
To: "lanas" <lanas@t-online.de>
References: 
	<20031124213552.5357c92a.lanas@t-online.de><20031125003817.GA1762@ei.homeip.net><Pine.LNX.4.53.0311250040510.2903@pink.linuxgrrls.org><20031125053911.6526ba39.lanas@t-online.de><000001c3b38f$b3118170$6401a8c0@f87htyy9967774jjyuww2>
	<20031126054700.1d653837.lanas@t-online.de>
Date: Wed, 26 Nov 2003 11:48:07 -0000
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: DoC newbie
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

its quite tricky, I mean in :

/usr/src

I have:

3 versions of grub(0.92, 0.93, cvs "10/10/02")
4 versions of mtd snapshot(one which contains grub patch 10/08/2002)
3 kernels ("2.4".19 , .21, .22)
3 rtlinux versions (pre1, pre2, pre3)

I haven't patched kernel with mtd, I just used default, could this be
something to do with why nftl_format will not compile? if i go back to a
snapshot in 2002 I can compile nftl_format (?) or could this also be to do
with redhat 9 as base system (or one of tool set / compiler - havent checked
that), if I load the DOC with 'GRUB_F~1` :) SPL via DFORMAT utility, it
works (not with old toolset though) but my nftl formatting all went
pear-shape, also 'ctrlbypass' is very good, instead of me hot plugging the
jumper on the board im using. So I have used 'doc_loadbios' from the latest
MTD, 'nftl_format' from the 2002 MTD, grub patch 10/08/2002 from another
MTD, grub-automake patch downloaded from net (redhat uses latest - im not
very good on version numbers for compiler and toolsets).

 I'm not that sure how to use jffs2, I didn't include it in my kernel build
, but as far as I can tell at the moment it replaces the whole of my DOC
including SPL, so I have nftla1 partition with ext3 on it, currently its
booting the kernel from /boot, but chumps out on root filesystem thats
because i haven't built it yet, maybe that I should have made two
partitions, 2 MB, boot partition, rest as nftla2 for root. What about
resierfs? this is journalling also (i think), is ext3 a good choice? ill
make sure I back up my rootfs and do some power off tests (hehe)

cheers

stephen

----- Original Message -----
From: "lanas" <lanas@t-online.de>
To: <linux-mtd@lists.infradead.org>
Sent: Wednesday, November 26, 2003 4:47 AM
Subject: Re: DoC newbie


> On Tue, 25 Nov 2003 19:27:20 -0000
> "stephen" <lcbr17306@blueyonder.co.uk> wrote:
>
> Thanks to all for all the replies so far.  I've taken notes and I'll get
> on with it today.
>
> Meanwhile, is it also possible to install either the jffs2 file system
> or either another type of journaling system targeted for leveling cell
> wear on a regular flash IDE device ?
>
> > just managed to do it IM SO HAPPY! :E
>
> I hope to say this soon too ! ;-)
>
> Cheers,
>
> Al
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
