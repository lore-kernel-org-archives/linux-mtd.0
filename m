Received: from imladris.infradead.org
	([194.205.184.45] helo=infradead.org ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 158kjw-0001b0-00
	for <linux-mtd@lists.infradead.org>; Sat, 09 Jun 2001 16:33:28 +0100
Received: from cisco7500-maingw.gts.cz
	([194.213.32.131] helo=bug.ucw.cz ident=root)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 158Oek-00023M-00
	for linux-mtd@lists.infradead.org; Fri, 08 Jun 2001 16:58:39 +0100
Date: Wed, 6 Jun 2001 19:44:34 +0000
From: Pavel Machek <pavel@suse.cz>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: kira brown <kira@linuxgrrls.org>, David Woodhouse <dwmw2@infradead.org>,
        "David S. Miller" <davem@redhat.com>, Chris Wedgwood <cw@f00f.org>,
        Jeff Garzik <jgarzik@mandrakesoft.com>, bjornw@axis.com,
        linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
Subject: Earyly Cyrix CPUs was Re: Missing cache flush.
Message-ID: <20010606194434.A38@toy.ucw.cz>
References: <Pine.LNX.4.30.0106051028390.10786-100000@carrot.linuxgrrls.org> <E157KRV-00076q-00@the-village.bc.nu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <E157KRV-00076q-00@the-village.bc.nu>; from alan@lxorguk.ukuu.org.uk on Tue, Jun 05, 2001 at 06:16:33PM +0100
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

Hi1

> > 3. Buggy implementations like the Cyrix 486es that don't properly maintain
> >    cache coherency.
> 
> The early Cyrix CPUs (and some 1.x rev 6x86 cpus I believe too) arent supported
> and dont work. The problem is best corrected with a hammer and a visit to
> ebay

What is list of cpu's not supported? I want one ;-).

[It is even more broken than 386? Wow!]

[Is it really not work-aroundable? LIke declaring no DMA on system and using
PIO for floppy?]
								Pavel
-- 
Philips Velo 1: 1"x4"x8", 300gram, 60, 12MB, 40bogomips, linux, mutt,
details at http://atrey.karlin.mff.cuni.cz/~pavel/velo/index.html.
