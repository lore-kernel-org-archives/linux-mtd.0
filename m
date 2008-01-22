Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JHHwO-00052e-GZ
	for linux-mtd@lists.infradead.org; Tue, 22 Jan 2008 12:09:26 +0000
Date: Tue, 22 Jan 2008 13:03:02 +0100
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Matthieu CASTET <matthieu.castet@parrot.com>
Subject: Re: Jffs2 and big file = very slow jffs2_garbage_collect_pass
Message-ID: <20080122120300.GA18884@lazybastard.org>
References: <479073D1.5010406@parrot.com>
	<20080118064852.026b0c82@zod.rchland.ibm.com>
	<4790D11E.6060201@parrot.com>
	<20080118115531.2deef9fb@zod.rchland.ibm.com>
	<20080118181744.GA15039@lazybastard.org>
	<4794C107.7070600@parrot.com>
	<20080121212555.GA14472@lazybastard.org>
	<20080121161612.3ca2f093@zod.rchland.ibm.com>
	<20080121222952.GC14472@lazybastard.org> <4795AFE3.506@parrot.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4795AFE3.506@parrot.com>
Cc: linux-mtd@lists.infradead.org, =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>,
	David Woodhouse <dwmw2@infradead.org>, Josh Boyer <jwboyer@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 22 January 2008 09:57:07 +0100, Matthieu CASTET wrote:
>
> On mtd->read I have see no checking for EBADMSG or EUCLEAN.

Correct.  The CRC check will barf when uncorrectable errors are
encountered.  Using -EUCLEAN as a trigger to scrub the blocks would be
useful.

> There no call to mtd->block_markbad or mtd->block_isbad (it is only 
> called in mtd_find_sb).

Used to be there and was removed.  mtd->erase() does the same as
mtd->block_isbad().  Calling both would be redundant and a waste of
time.  And logfs has its own bad block table (bad segment table,
actually), so mtd->block_markbad could only be called to play nice with
others after filesystem gets nuked and the flash reused for something
else.  Not all devices define that method.  For a while I carried a
patch that would add a dummy noop call in add_mtd_device (noop call is
faster than a conditional), but dropped it because it just doesn't
matter enough.

> Good test could be to add bad block simulation to nandsim.
> There is some patch  for this 
> (http://lists.infradead.org/pipermail/linux-mtd/2006-December/017107.html). 
> Note they don't simulate bit-flip on read.

Ramtd can simulate bit-flips as well.  A nice test setup needs a bit
more than that, some way to do random, yet repeatable errors.

Jörn

-- 
ticks = jiffies;
while (ticks == jiffies);
ticks = jiffies;
-- /usr/src/linux/init/main.c
