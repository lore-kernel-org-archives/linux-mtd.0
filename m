Received: from mail-bw0-f43.google.com ([209.85.214.43])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PTZzg-0007FK-K6
	for linux-mtd@lists.infradead.org; Fri, 17 Dec 2010 13:05:13 +0000
Received: by bwz14 with SMTP id 14so833628bwz.30
	for <linux-mtd@lists.infradead.org>;
	Fri, 17 Dec 2010 05:05:03 -0800 (PST)
Subject: Re: Static UBI volumes and ubiupdatevol ?
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
In-Reply-To: <Pine.LNX.4.64.1012171036510.7024@lnxricardw.se.axis.com>
References: <Pine.LNX.4.64.1012150855090.6187@lnxricardw.se.axis.com>
	<Pine.LNX.4.64.1012151129250.7024@lnxricardw.se.axis.com>
	<1292516775.2364.108.camel@localhost>
	<Pine.LNX.4.64.1012171036510.7024@lnxricardw.se.axis.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 17 Dec 2010 15:04:29 +0200
Message-ID: <1292591069.2412.25.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2010-12-17 at 10:39 +0100, Ricard Wanderlof wrote:
> (Crud, I was trying to concatenate both replies into one message to avoid 
> two threads on the same issue but then I thought of something else after 
> sending the first one off).
> 
> On Thu, 16 Dec 2010, Artem Bityutskiy wrote:
> 
> >> With a system based on mtd+jffs2 it is actually possible to reflash the
> >> partition with the [read only] root file system on it without unmounting,
> >> as long as no accesses are made to the physical flash during the rewrite
> >> or afterwards. In other words, immediately after reflashing the system
> >> must be rebooted.
> >
> > Hmm, I presume you can do this with UBIFS, but you need to make sure all
> > the backgound stuff like moving and eraseing eraseblocs is done before
> > doing this by doing fsync() on your /dev/ubiX_Y device (UBI volume
> > character device), see the 'vol_cdev_fsync()' function. Ah, and of
> > course you need to sync UBIFS before this.
> >
> > Then if you can guarantee that no one is reading writing to it, you can
> > change the flash.
> 
> It would be nice to use ubiupdatevol to do this, but it won't let me do 
> that if the volume is mounted (naturally). I don't know if this is 
> something that is enforced by ubiupdatevol or ubi. I would assume the 
> latter but I haven't checked the code.
> 
> Of course I could always write my own "ubiupdatevol" to deal with this but 
> it's always nice to use existing and supported tools.

This is UBI - it does not allow updating if someone keeps the volume
open. When UBI is mounted, it keeps the volume open. It closes the
volume when unmounted.

It looks error-prone to allow updating while there are users, from UBI
POW, I think.

And I cannot think of a nice way of doing this.

Why can't you just
1. lazily unmount UBIFS
2. find all users of UBIFS and kill them
3. this will make UBIFS finally unmount
4. you safely update the UBI volume

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
