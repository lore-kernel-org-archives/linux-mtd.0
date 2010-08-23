Received: from web112313.mail.gq1.yahoo.com ([98.137.26.168])
	by bombadil.infradead.org with smtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Onbpp-0004Hs-Sb
	for linux-mtd@lists.infradead.org; Mon, 23 Aug 2010 18:33:31 +0000
Message-ID: <752212.66527.qm@web112313.mail.gq1.yahoo.com>
Date: Mon, 23 Aug 2010 11:33:27 -0700 (PDT)
From: Sergei Zhirikov <sfzhi@yahoo.com>
Subject: Re: Mounting UBIFS readonly - is it really readonly?
To: dedekind1@gmail.com
In-Reply-To: <1282567283.24044.35.camel@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> From: Artem Bityutskiy <dedekind1@gmail.com>
> Subject: Re: Mounting UBIFS readonly - is it really readonly?
> To: "Sergei Zhirikov" <sfzhi@yahoo.com>
> Cc: linux-mtd@lists.infradead.org
> Date: Monday, August 23, 2010, 2:41 PM
> On Mon, 2010-08-23 at 15:23 +0300,
> Artem Bityutskiy wrote:
> > On Tue, 2010-07-27 at 21:05 +0200, Sergei Zhirikov
> wrote:
> > > As you can see, there is "ro", which causes UBIFS
> to be initially
> > > mounted readonly. And later it is *never*
> remounted read-write.
> > > Everything seems to work as expected (I get
> "Read-only file system"
> > > error upon a write attempt) except one thing.
> Somehow the modification
> > > time of /dev/console is updated every time the
> system boots. Note: I'm
> > > not talking about the /dev/console located inside
> the /dev mount
> > > (which is tmpfs and is obvously writable), I'm
> talking about
> > > the /dev/console located on the root file system
> and accessed
> > > (probably by init) before /dev is mounted. I'm
> really puzzled. How is
> > > this possible? The root filesystem has been
> readonly all the time and
> > > still the timestamp is somehow updated. Does
> anyone have an idea what
> > > might be going on there?
> > 
> > Did you solve the issue, I'm just curious.
> 
> I think you can use inotify to verify whether the FS is
> ever changed?
> 
> http://en.wikipedia.org/wiki/Inotify
> 
I made the changes you suggested earlier to see if/when something is written and the results were quite unexpected. Just as I assumed, UBIFS remains mounted read-only all the time. But contrary to what I expected, none of the functions related to writing is ever called. Nevertheless, the timestamp still changes.

I have also managed to reproduce the issue without involving system reboot. If I create a device node equivalent to /dev/console (major 5, minor 1) in any directory (on the root UBIFS) and then remount the FS read-only, the timestamp of the device node keeps changing upon any write operation to the device. The same thing happens when I try /dev/tty (major 5, minor 0), but with /dev/null (1,3) or /dev/zero (1,5) the timestamp does not change.

I'm now even more puzzled than I was in the beginning. It looks like the VFS decides to update the timestamp for some reason, but does not pass that change to UBIFS (perhaps, because it knows the latter is read-only). So the updated timestamp exists only cached in memory and is never actually written to the FS. I haven't tried to verify that theory yet (which shouldn't be difficult).

--
Sergei.


      
