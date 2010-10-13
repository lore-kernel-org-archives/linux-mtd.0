Received: from www.tglx.de ([62.245.132.106])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1P64BT-0000P8-Ut
	for linux-mtd@lists.infradead.org; Wed, 13 Oct 2010 16:28:08 +0000
Date: Wed, 13 Oct 2010 18:30:05 +0200
From: "Hans J. Koch" <hjk@linutronix.de>
To: linux-mtd@lists.infradead.org
Subject: ubifs: sync() causes writes even if nothing is changed
Message-ID: <20101013163005.GB1889@silverbox.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Adrian Hunter <adrian.hunter@nokia.com>,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Running this command:

# while true ; do sync; sleep 1; done

causes two eraseblocks being erased every second, although there
are no writes to the ubifs filesystem. I hacked some printks into
my NAND driver that print page_address and column for each erase.
With that, I get this output every second:

...
[   63.701765] erase p=0x0000ae40 c=0xffffffff
[   63.706534] erase p=0xffffffff c=0xffffffff
[   63.725492] erase p=0x0000ae80 c=0xffffffff
[   63.730260] erase p=0xffffffff c=0xffffffff
...

>From a quick glance at the ubifs code, this might come out of the
garbage collector that is triggered on every sync() and writes
something even if nothing has changed.

Is that really needed?

Thanks,
Hans
