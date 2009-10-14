Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Mxzf7-00054W-9v
	for linux-mtd@lists.infradead.org; Wed, 14 Oct 2009 08:56:53 +0000
Subject: Re: a UBIFS image makes task pdflush blocked > 120 seconds
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Norbert van Bolhuis <nvbolhuis@aimvalley.nl>
In-Reply-To: <4AD30069.8060101@aimvalley.nl>
References: <4ACF3478.1060503@aimvalley.nl>
	<1255269148.16942.95.camel@localhost> <4AD30069.8060101@aimvalley.nl>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 14 Oct 2009 11:56:40 +0300
Message-Id: <1255510600.32489.130.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2009-10-12 at 12:09 +0200, Norbert van Bolhuis wrote:
> Artem Bityutskiy wrote:
> > On Fri, 2009-10-09 at 15:02 +0200, Norbert van Bolhuis wrote:
> >> We're using a 19MB UBIFS image (preprogrammed by manufacturing)
> >> for a 156 MB NOR flash partition.
> > 
> > Wow, really huge NOR. Keep in mind that we have not tested UBIFS
> > for NOR well enough.
> It's a MTD_CONCATENATED 128MB NOR flash + 28MB NOR flash partition.
> ok, that's good to realize.
> Are there any (more) thorough UBIFS tests scheduled for NOR flash ?

Not by us. But you may do this. Although, I did test power-cut recovery
for NOR recently. This was on the "Kilauea" board.

> >> This message repeats once. Apart from the message everything is
> >> functioning OK.
> >> so it's the UBIFS commit_sem that's causing this.
> > 
> > Not the semaphore itself, but it is locked for too long time and we
> > cannot acquire it for too long. Since make_reservation needs it only
> > in read mode, it is obvious that the it is is locked somewhere in
> > the commit code, which is strange.
> > 
> > How full if the FS when this happens? What is your eraseblock size?
> > 
> 
> The UBIFS image contains only 1 file (of 18MB) and a few directories. Several
> application processes create (small) files and make modifications. I guess that
> the FS contains only 20MB.
> PEB-size = 131072, LEB-size = 130944

Hmm, then GC should have almost no work to do.

> >> We're using linux-2.6.28. The linux-next backport for 2.6.28
> >> (from git://git.infradead.org/~dedekind/ubifs-v2.6.28.git) changes
> >> are in.
> >>
> >> I guess that, initially, there's a lot of work to be done
> >> for UBI. I'm thinking about scan entire 156MB, add UBI VID/EC headers
> >> for the empty 137MB, make LEB mappings, etc..
> >>
> >> I don't understand why this would block UBIFS/pdflush.
> > 
> > It shouldn't. UBI spends time for scanning when you attach your flash.
> > You pay the price at the very beginning, and then it should be fast.
> > 
> 
> but, this "problem" does occur (~ 1 minute after) the very beginning (when power is
> applied for the 1st time to the board).

OK.

> > What I suggest you is to inject some code to UBIFS which measures for
> > how long the 'commit_sem' is locked in "write" mode, and find the times.
> > Then try to investigate why this actually happens. I cannot tell why
> > this could be, off the top of my head.
> > 
> 
> ok, will do that. I'll track commit_sem, io_mutex and ubifs_garbage_collect().
> I'll report back.
> 
> Btw. stackdump is the same (2 out of 2 times).

OK. I really do not have any idea off the top of my head now, sorry.
Try to investigate this a beet deeper.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
