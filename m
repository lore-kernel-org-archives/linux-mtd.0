Received: from mail-ew0-f13.google.com ([209.85.219.13])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1LCBOj-0003Q3-96
	for linux-mtd@lists.infradead.org; Mon, 15 Dec 2008 11:14:02 +0000
Received: by ewy6 with SMTP id 6so3075767ewy.18
	for <linux-mtd@lists.infradead.org>;
	Mon, 15 Dec 2008 03:13:55 -0800 (PST)
Subject: Re: [PATCH] [UBI] 1/4 UBI volume notifications - UBI changes
From: dmitry pervushin <dpervushin@gmail.com>
To: dedekind@infradead.org
In-Reply-To: <1229023216.13686.391.camel@sauron>
References: <1228759160.7622.28.camel@hp.diimka.lan>
	<1228818989.13686.172.camel@sauron>
	<1228938622.7622.60.camel@hp.diimka.lan>
	<1228975678.13686.367.camel@sauron>
	<1228987532.7622.66.camel@hp.diimka.lan>
	<1229023216.13686.391.camel@sauron>
Content-Type: text/plain
Date: Mon, 15 Dec 2008 14:13:47 +0300
Message-Id: <1229339627.7900.19.camel@hp.diimka.lan>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dpervushin@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2008-12-11 at 21:20 +0200, Artem Bityutskiy wrote:
> On Thu, 2008-12-11 at 12:25 +0300, dmitry pervushin wrote:
> > > > > I do not understand this change. The point is to prevent anyone from
> > > > > opening the volume before it is completely initialized. What you do -
> > > > > you allow the volume to be opened while it is in the middle of
> > > > > initialization, which is wrong. E.g., what if the initialization fails
> > > > > at some point?
> > > > > 
> > > > > And this change does not seem to be relevant to this patch.
> > > > This change is absolutely needed :)
> > > > Well, the sequence of steps is as follows:
> > > > 1. uif_init calls ubi_add_volume
> > > > 2. ubi_add_volume notifies everyone about volume adding
> > > > 3. (successful exit is not interested to us)
> > > > 4. in case of errors reported by uif_init ubi_attach_mtd_dev calls
> > > > ubi_kill_volumes
> > > > 5. ubi_kill_volumes calls ubi_free_volume, which notifies everyone about
> > > > volume deleting.
> > 
> > Isn't it better then to protect the critical section in uif_init and
> > open_volume by mutexes?
> 
> May be. If you need this, feel free to send a patch. But it would not
> give you much, because you would have to call your notifiers _outside_
> the mutexes, i.e. at the very end of the attach function.
> 
> >  Now it looks as you are adding volumes on
> > non-existing-yet device.
> 
> Right. For a short period of time during the attach process you may see
> volumes which you cannot really open (you get -ENODEV). That was not a
> problem so far, and it was just easier to implement things this way.
> 
> If you want to improve this and make the opening processes wait on a
> mutex - please, go ahead. But I doubt you really need this.
Well, agreed. It makes sense. I am attaching new serie of patches:

ubi-notifications.patch		- ubi notifications
remove-gluebi.patch		- removes current mtd emulation
gluebi.patch			- adds notification-based one
mtdblkdevs.patch		- changes MTD blkdevs to accept NULL mtd and allow
dynamic major number assignment
ubiblock.patch			- simple FTL
