Received: from maila.telia.com ([194.22.194.231])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16ew1c-0001n9-00
	for <linux-mtd@lists.infradead.org>; Sun, 24 Feb 2002 10:37:00 +0000
Message-ID: <000701c1bd20$b62ba000$8b97143e@jocke>
From: "Joakim Tjernlund" <Joakim.Tjernlund@lumentis.se>
To: "Gad Hayisraeli" <gad@syete.co.il>,
   "David Woodhouse" <dwmw2@infradead.org>
Cc: "Michael Michael" <memmel2@yahoo.com>, <linux-mtd@lists.infradead.org>
References: <441701c1ba2c$2cf1dc60$1900000a@v.vmanage.com>  <20020220063356.59191.qmail@web14702.mail.yahoo.com>  <24611.1014280415@redhat.com> <449501c1bd14$48bac5c0$1900000a@v.vmanage.com>
Subject: Re: Slow jffs2 startup on DOM 
Date: Sun, 24 Feb 2002 11:47:52 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

I see this too. Every time I boot with a fresh JFFS2 image or if
I remove som big files and reboot(does not matter if I wait before I
reboot), kupdate
runs like hell, consuming almost all cpu for a while before it calms down.
If I monitor the output from 'df', I see that the Use field slowly rises to
100% and
then its drops back to my real usage of the JFFS2 partition.

      Jocke

----- Original Message -----
From: "Gad Hayisraeli" <gad@syete.co.il>
To: "David Woodhouse" <dwmw2@infradead.org>
Cc: "Michael Michael" <memmel2@yahoo.com>; <linux-mtd@lists.infradead.org>
Sent: den 24 februari 2002 10:18
Subject: Re: Slow jffs2 startup on DOM


> you'll be very surprised, becasue many times that i had rebooted the
machine
> (mediaEngine, strataflash intel) and the loading of all the files was VERY
> slow, untill i had done "shutdown -r now" and after that the machine
> returned to normal operation, almost...
> still i encountering a little slowness sometimes, and i suspect that the
> jffs layer is fixing things online, but i'm not sure. (i got rid of the
jffs
> debug info so i cannot see its operation)
>
> maybe you can think of some e2fsck for jffs2, instead of fixing the blocks
> everytime without the user's knowledge ?
>
> Gad
>
> ----- Original Message -----
> From: "David Woodhouse" <dwmw2@infradead.org>
> To: "Gad Hayisraeli" <gad@syete.co.il>
> Cc: "Michael Michael" <memmel2@yahoo.com>; <linux-mtd@lists.infradead.org>
> Sent: Thursday, February 21, 2002 10:33 AM
> Subject: Re: Slow jffs2 startup on DOM
>
>
> >
> > gad@syete.co.il said:
> > >  in my case (mediaEngine + assabet), i encountered some slowness like
> > > you did, just when i previously shutdown the device without unmounting
> > > + syncing first
> >
> > Er, if that makes a difference to JFFS2 I'll be _very_ surprised. JFFS2
> > does nothing special on unmount. Checkpointing, either on unmount or
> > periodic opportunistic checkpoints, has been discussed a lot but never
> > actually implemented. I'm happy to give pointers if you seriously intend
> to
> > work on it.
> >
> > --
> > dwmw2
> >
> >
> >
> > ______________________________________________________
> > Linux MTD discussion mailing list
> > http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
