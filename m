Received: from web20302.mail.yahoo.com ([216.136.226.83])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 16YmMX-0001RW-00
	for <linux-mtd@lists.infradead.org>; Thu, 07 Feb 2002 11:05:10 +0000
Message-ID: <20020207111620.70256.qmail@web20302.mail.yahoo.com>
Date: Thu, 7 Feb 2002 11:16:20 +0000 (GMT)
From: =?iso-8859-1?q?David=20Mackay?= <monitoreurope@yahoo.co.uk>
Subject: RE: CF
To: "Malik, Vipin \[FRCO/HOU\]" <Vipin.Malik@EmersonProcess.com>
Cc: Linux MTD Lists <linux-mtd@lists.infradead.org>
In-Reply-To: <AB8D0DF31D9BD511BE94000347959DC9C615A0@MXSFRCOHOU01>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
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

Hi Vipin,

Thanks for your 2c, allways valuable to hear
viewpoints before we cock things up ourselves! We are
kind of limited to CF for this product at this stage
so we have to live with its short commings i guess. We
were proposing to use ext3 for asynchronus power down
protection. However the product is not designed to be
powered down except in the event of brown and
blackouts.

Thanks again, David

 --- "Malik, Vipin [FRCO/HOU]"
<Vipin.Malik@EmersonProcess.com> wrote: > JFFS2 also
provides file system corruption
> protection in case of unclean
> shutdowns.
> 
> To really answer your question, you need to provide
> the fs that you are
> thinking about on top of CF.
> 
> ext2 will not work as it is not designed for regular
> unclean shutdowns (even
> with e2fsck).
> ext3 may work as it is journaled and a buddy of mine
> tested ext3 format
> reliability with a hard drive and was happy with it
> (for his needs).
> 
> However, I would not use CF for any app that may be
> suffer asynchronous
> power down. CF (at least the ones I tested a few
> years ago) are notoriously
> bad at being able to withstand an asynchronous
> shutdown if the OS is writing
> to them. They suffer from low level formatting
> failures (And in one case
> even a partial hardware failure- where a portion of
> the CF became completely
> unaccessable).
> 
> Just my 2c.
> 
> Vipin
> 
> 
> > -----Original Message-----
> > From: David Mackay
> [mailto:monitoreurope@yahoo.co.uk]
> > Sent: Wednesday, February 06, 2002 10:26 AM
> > To: Linux MTD Lists
> > Subject: CF
> > 
> > 
> > We have just been informed that CF disks have wear
> > levelling built in and we do not need therfore to
> > consider a file system such as JFFS(2), is this
> true?
> > 
> > Is so any comments about how sucsessful it is?
> > 
> > Thanks, David
> > 
> > __________________________________________________
> > Do You Yahoo!?
> > Everything you'll ever need on one web page
> > from News and Sport to Email and Music Charts
> > http://uk.my.yahoo.com
> > 
> >
>
______________________________________________________
> > Linux MTD discussion mailing list
> >
>
http://lists.infradead.org/mailman/listinfo/linux-mtd/
> >  

__________________________________________________
Do You Yahoo!?
Everything you'll ever need on one web page
from News and Sport to Email and Music Charts
http://uk.my.yahoo.com
