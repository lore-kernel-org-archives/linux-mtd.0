Date: Thu, 13 Jan 2005 08:25:55 +0000 (GMT)
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: Jared Hulbert <jaredeh@gmail.com>
In-Reply-To: <6934efce0501121430471e55a8@mail.gmail.com>
Message-ID: <Pine.LNX.4.58.0501130825430.17045@phoenix.infradead.org>
References: <Pine.LNX.4.58.0501111221260.19297@phoenix.infradead.org>
	<20050111215102.GA6289@wohnheim.fh-wedel.de>
	<Pine.LNX.4.58.0501120913180.10617@phoenix.infradead.org>
	<6934efce050112084111ef438c@mail.gmail.com>
	<Pine.LNX.4.58.0501121708100.10617@phoenix.infradead.org>
	<6934efce0501121430471e55a8@mail.gmail.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: Artem Bityuckiy <dedekind@infradead.org>
Cc: David Woodhouse <dwmw2@infradead.org>,
	MTD List <linux-mtd@lists.infradead.org>
Subject: Re: JFFS3 & performance
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> I'm thinking the opposite conclusion.  If I understand this correctly
> most CRC's on NOR are wasted effort.  I don't claim to quite
> understand JFFS2 architecture yet but it seems to me the data CRC's
> are not needed for NOR, perhaps some of the other CRC's are not needed
> as well.
Hmm.

Suppose you have some device with NOR flash. That NOR flash stores your 
files (flash file system works there, e.g. JFFS2). Suppose one of your 
flash blocks become bad.

1. Scenario 1: You do not have any checksum or do not check it. 
One of network-related library is loaded corrupted. It is loaded and start 
sending private keys of your corporative clients to random addresses (if 
your device is some router/switch etc).
Lots of nasty things may happen.

2. Secenario 2: Filesystem detects the CRC error, realizes that this error 
is due to Media corruption. It prints the error message and returns -EIO 
to the caller task which loads your library.

Yes, in both cases you put your device/NOR flash to the rubbish can, but 
without checksum you may end up with much more serious consequences.

P.S. But JFFS2 does not behave as I described in scenario 2. I just 
ignores the bad node, prints the error message, but still returns OK. So 
you still might present private keys or another confidentional information 
to potential plotters. But JFFS2 is not supposed to be ideal :-)

--
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
