Received: from [2002:d556:63ea::1] (helo=phoenix.infradead.org)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1AOjWu-0005hE-Tb
	for <linux-mtd@lists.infradead.org>; Tue, 25 Nov 2003 20:11:24 +0000
Received: from smtp-out7.blueyonder.co.uk ([195.188.213.10])
	by phoenix.infradead.org with esmtp (Exim 4.22)
	id 1AOjV6-0006ev-H7
	for linux-mtd@lists.infradead.org; Tue, 25 Nov 2003 20:09:32 +0000
Message-ID: <000001c3b38f$b3118170$6401a8c0@f87htyy9967774jjyuww2>
From: "stephen" <lcbr17306@blueyonder.co.uk>
To: "lanas" <lanas@t-online.de>
References: 
	<20031124213552.5357c92a.lanas@t-online.de><20031125003817.GA1762@ei.homeip.net><Pine.LNX.4.53.0311250040510.2903@pink.linuxgrrls.org>
	<20031125053911.6526ba39.lanas@t-online.de>
Date: Tue, 25 Nov 2003 19:27:20 -0000
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

just managed to do it IM SO HAPPY! :E

karim yaghmours book, 'building embedded linux systems' if you follow it
exactly will show you how,

problem i was doing was replacing the SPL with stage2/pre_load2 converted to
grub_firmware by code in grub dir located in mtd cvs, patch not patching
correctly, also i'm using redhat 9, ive got no mkfs.minix (annoying) plus a
problem with 'automake' in regards to grub there is a patch that cures the
errors '-p1' which you can find here:

http://mail.gnu.org/archive/html/bug-grub/2003-01/msg00056.html

is it true redhat is now over , time for some slackware!

kind regards

stephen (happy as larry)

----- Original Message -----
From: "lanas" <lanas@t-online.de>
To: "Jasmine Strong" <jasmine@regolith.co.uk>
Cc: <linux-mtd@lists.infradead.org>
Sent: Tuesday, November 25, 2003 4:39 AM
Subject: Re: DoC newbie


> On Tue, 25 Nov 2003 00:43:40 -0100 (GMT+1)
> Jasmine Strong <jasmine@regolith.co.uk> wrote:
>
> > On Mon, 24 Nov 2003, Ilguiz Latypov wrote:
>
> > > LILO would need disk I/O int 0x13 emulation.  Such layer is offered
> > > by M-Sys.  I don't know if the source code for it is open.
>
> > It isn't.  Furthermore, this list isn't the right place for discussing
> > it, especially now that good free (and indeed Free) alternatives
> > exist.
>
> > > I saw messages on JFFS2 on NAND driver development in the MTD
> > > mailing list archives.
>
> > JFFS2 may not be the most appropriate filesystem for many NAND-based
> > embedded applications.  yaffs is nicer in some ways, for some
> > applications, and the nftl code has the advantage that grub groks nftl
> > and so does the M-Systems DOS firmware...
>
> Thanks for the replies, but what I really need is a very pratical
> evaluation of the situation.  Do I say yes to buying many DoCs or do I
> use simple IDE flash disks instead which I already got working and
> booting.  If I see there's still a lot to be done regarding making DoCs
> work with Linux then no problem.  The product has to be out in the
> coming months, not in two years.  So this is why I was asking if there's
> floating around a HOWTO of some sort or is this all 'still in the lab'
> so to speak.
>
> Cheers,
>
> Al
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
