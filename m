Date: Tue, 11 Jan 2005 12:34:11 +0000 (GMT)
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: Josh Boyer <jdub@us.ibm.com>
In-Reply-To: <1105380565.17584.4.camel@weaponx.rchland.ibm.com>
Message-ID: <Pine.LNX.4.58.0501111231430.19297@phoenix.infradead.org>
References: <Pine.LNX.4.61.0501101246150.20261@localhost.localdomain>
	<1105380565.17584.4.camel@weaponx.rchland.ibm.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: Artem Bityuckiy <dedekind@infradead.org>
Cc: MTD mailing list <linux-mtd@lists.infradead.org>,
	"Robert P. J. Day" <rpjday@mindspring.com>
Subject: Re: how to loopback mount a JFFS2 filesystem on my linux box?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 10 Jan 2005, Josh Boyer wrote:

> On Mon, 2005-01-10 at 11:49, Robert P. J. Day wrote:
> >   i swear i once knew how to do this, but it's lost in the mists of
> > time.  i used "mkfs.jffs2" to create a simple JFFS2 image, and now i
> > just want to mount it on my fedora core 3 system using a loopback
> > mount.
> > 
> >   i have the jffs2 and mtdcore modules currently loaded, and normally,
> > what i would try is:
> > 
> >   # mkdir m
> >   # mount -o loop -t jffs2 <jffs2.img file> m
> > 
> > but what i get is:
> > 
> > # mount -o loop -t jffs2 hello.img m
> > mount: wrong fs type, bad option, bad superblock on /dev/loop0,
> >        or too many mounted file systems
> >        (could this be the IDE device where you in fact use
> >        ide-scsi so that sr0 or sda or so is needed?)
> > 
> >   i *vaguely* recall needing to do a bit more work, like loading
> > another module or two.  any pointers to a URL for this?  thanks.
> 
> You can't do that AFAIK because JFFS2 needs an MTD device.  Instead, use
> mtdram to create a fake MTD device, dd the image to it, and do:
> 
> # mount -t jffs2 /dev/mtdblock0 <mnt/point>
mtdblock is hardcoded to 4BM. So if you need larger, use nand/nandsim.c. 
This is NAND flash simulation driver and it is configurable, so you may 
configure it to have larger size. 
 
> Really though, we should look at making JFFS2 and/or the loopback driver
> grok each other.  Would be useful.  Maybe a JFFS3 candidate?
AFAIK, JFFS3 is candidate for all improvements :-)

> 
> josh
> 
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 

--
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
