Received: from sphere.barak.net.il ([212.150.48.98])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17GyCs-0004ud-00
	for <linux-mtd@lists.infradead.org>; Sun, 09 Jun 2002 09:37:50 +0100
Message-ID: <006f01c20f99$38780d80$1900000a@v.vmanage.com>
Reply-To: "Gad Hayisraeli" <gad@syete.co.il>
From: "Gad Hayisraeli" <gad@syete.co.il>
To: <justin.wojdacki@analog.com>
Cc: "Linux - MTD list" <linux-mtd@lists.infradead.org>
References: <006801c20d82$697b6800$1900000a@v.vmanage.com> <3CFFA37C.F222E9E0@analog.com>
Subject: Re: Fw: jffs2 crc errors
Date: Sun, 9 Jun 2002 11:37:06 +0200
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

----- Original Message -----
From: "Justin Wojdacki" <justin.wojdacki@analog.com>
To: "Gad Hayisraeli" <gad@syete.co.il>
Cc: "Linux - MTD list" <linux-mtd@lists.infradead.org>
Sent: Thursday, June 06, 2002 8:01 PM
Subject: Re: Fw: jffs2 crc errors


> Gad Hayisraeli wrote:
> >
> > > i encounter this err in boot:
> > >
> > > jffs2_scan_inode_node(): Data CRC failed on node at 0x001eaa24: Read
> > > 0xda7b03c2,
> > >  calculated 0x0da9fb30
> > >
> > > and it keeps appearing every boot.
> > >
> > > is it bad ?
> > >
> > > maybe its not fixed becuse i'm terminating the jffs optimization
thread in
> > > the middle of the init process ?
> > >
> > > thanks
> > >
> > > Gad
> >
>
> Well, this could mean that the sector the node is in is going bad
> (which would be a bad thing for you). Or it could mean that the write
> process didn't complete, and so the calculated CRC is coming off of
> stale data.
>
> Why are you killing off the optimization thread?
>

this bad thread is making me nuts , because its slowers the FS alot !
David Woodhouse suggested it for me.
now i'm asking if it hurts to kill it (BTW i cannot kill it but the most i
can do it to stop it) ?
(especially in relation to this bad crc errs)

thanks

Gad
