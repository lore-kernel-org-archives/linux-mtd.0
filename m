Received: from web14703.mail.yahoo.com ([216.136.224.120])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 16dnau-0003DC-00
	for <linux-mtd@lists.infradead.org>; Thu, 21 Feb 2002 07:24:44 +0000
Message-ID: <20020221073559.89225.qmail@web14703.mail.yahoo.com>
Date: Wed, 20 Feb 2002 23:35:59 -0800 (PST)
From: Michael Michael <memmel2@yahoo.com>
Subject: Re: Slow jffs2 startup on DOM
To: linux-mtd@lists.infradead.org
In-Reply-To: <441701c1ba2c$2cf1dc60$1900000a@v.vmanage.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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

Ahh thanks I know what it is. I'm using a nfs root and
have modified nfs to read the DOM as a persistant
local cache at boot (cool IMHO). So I'm not unmounting
the DOM clean when I unmount the NFS root. Thanks just
needed to look in the right place and "know" for sure
that it can be fast.
I had already tested and seen that if you mount/umount
its fast the second time but I guess I'm always
unclean it the case of the NFS root since I can't
manually unmount the Cache in this case oops. Of
course a nice message from JFF2 saying its doing a
clean/dirty mount would be nice of maybe I missed that
to : )

Thanks agian I'll go back into hiding

Mike

--- Gad Hayisraeli <gad@syete.co.il> wrote:
> 
> ----- Original Message -----
> From: "Michael Michael" <memmel2@yahoo.com>
> To: <linux-mtd@lists.infradead.org>
> Sent: Wednesday, February 20, 2002 8:33 AM
> Subject: Slow jffs2 startup on DOM
> 
> 
> > Hello I'm using jffs2 on a DOM with the block
> device
> > driver. I find the startup times very slow. It
> seams
> > to me from reading the source that jffs2 may be
> > scanning every block with this driver. It takes
> about
> > 3 min for the first mount. Is there anyway to fix
> this
> > ?
> > Would it be  possible to add say a checkpoint such
> > that if the disk  is "clean" we proceed with
> normal
> > startup ?
> > I do write to the DOM but I can certianly ensure
> that
> > its clean except on sudden power downs.  I suspect
> > that a lot of people who write to the devices can
> > ensure that the writes are checkpointed so we
> don't
> > have to do a full scan.
> >
> > Mike
> >
> 
> in my case (mediaEngine + assabet), i encountered
> some slowness like you
> did, just when i previously shutdown the device
> without unmounting + syncing
> first
> (this commands are regularly handled by  S0Reboot on
> rc6.d dir)
> 
> Gad
> 
> 
> 
> 
>
______________________________________________________
> Linux MTD discussion mailing list
>
http://lists.infradead.org/mailman/listinfo/linux-mtd/


__________________________________________________
Do You Yahoo!?
Yahoo! Sports - Coverage of the 2002 Olympic Games
http://sports.yahoo.com
