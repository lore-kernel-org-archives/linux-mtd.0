Received: from mxsfrcohou01.daniel.com ([12.19.98.41])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16YXED-0000ZK-00
	for <linux-mtd@lists.infradead.org>; Wed, 06 Feb 2002 18:55:33 +0000
Message-ID: <AB8D0DF31D9BD511BE94000347959DC9C615A0@MXSFRCOHOU01>
From: "Malik, Vipin [FRCO/HOU]" <Vipin.Malik@EmersonProcess.com>
To: 'David Mackay' <monitoreurope@yahoo.co.uk>, Linux MTD Lists
	 <linux-mtd@lists.infradead.org>
Subject: RE: CF
Date: Wed, 6 Feb 2002 13:09:00 -0600 
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
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

JFFS2 also provides file system corruption protection in case of unclean
shutdowns.

To really answer your question, you need to provide the fs that you are
thinking about on top of CF.

ext2 will not work as it is not designed for regular unclean shutdowns (even
with e2fsck).
ext3 may work as it is journaled and a buddy of mine tested ext3 format
reliability with a hard drive and was happy with it (for his needs).

However, I would not use CF for any app that may be suffer asynchronous
power down. CF (at least the ones I tested a few years ago) are notoriously
bad at being able to withstand an asynchronous shutdown if the OS is writing
to them. They suffer from low level formatting failures (And in one case
even a partial hardware failure- where a portion of the CF became completely
unaccessable).

Just my 2c.

Vipin


> -----Original Message-----
> From: David Mackay [mailto:monitoreurope@yahoo.co.uk]
> Sent: Wednesday, February 06, 2002 10:26 AM
> To: Linux MTD Lists
> Subject: CF
> 
> 
> We have just been informed that CF disks have wear
> levelling built in and we do not need therfore to
> consider a file system such as JFFS(2), is this true?
> 
> Is so any comments about how sucsessful it is?
> 
> Thanks, David
> 
> __________________________________________________
> Do You Yahoo!?
> Everything you'll ever need on one web page
> from News and Sport to Email and Music Charts
> http://uk.my.yahoo.com
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 
