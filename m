Received: from gw1.transmode.se ([213.115.205.20])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Pm1Ct-00068F-1n
	for linux-mtd@lists.infradead.org; Sun, 06 Feb 2011 09:46:59 +0000
In-Reply-To: <F66AF016-8A2B-4116-BE49-CE05B91BE50F@prograde.net>
References: <16826B66-31FE-41AD-A6EF-E668A45AF1FE@prograde.net>
	<25631ED7-C6A0-44B1-B33D-F48DC48C812E@prograde.net>
	<OF695F4526.1DB1C212-ONC125782B.00602EFA-C125782B.006F0621@transmode.se>
	<626D0191-85FC-41E2-94C7-CBFF9D9629BE@prograde.net>
	<OFAEC8E64A.F4C40EA8-ONC125782C.002A10F5-C125782C.002D0641@transmode.se>
	<OF562F5C46.D2EDB17F-ONC125782C.00358774-C125782C.0036154D@transmode.se>
	<6FC0E416-EEBD-453F-AAB9-88BB6D90BFAB@prograde.net>
	<4D4AD9ED.8060104@keymile.com> <4D4B37D4.4050204@keymile.com>
	<OF0B032533.FA33B99E-ONC125782D.003AF89B-C125782D.003B43AA@transmode.se>
	<4D4BDD48.6040600@keymile.com>
	<OF5A6BB547.3462D591-ONC125782D.00475578-C125782D.0047EC74@transmode.se>
	<541E19B8-D428-4F59-B6BB-A3BD8F455AE4@prograde.net> <OF42EF
	<F66AF016-8A2B-4116-BE49-CE05B91BE50F@prograde.net>
Subject: Re: Numonyx NOR and chip->mutex bug?
To: Michael Cashwell <mboards@prograde.net>
Message-ID: <OF56DD046D.3279E067-ONC125782F.00353F6C-C125782F.0035BCA9@transmode.se>
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Date: Sun, 6 Feb 2011 10:46:57 +0100
MIME-Version: 1.0
Content-type: text/plain; charset=US-ASCII
Cc: linux-mtd@lists.infradead.org, Holger brunck <holger.brunck@keymile.com>,
	stefan.bigler@keymile.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Michael Cashwell <mboards@prograde.net> wrote on 2011/02/05 22:47:33:
>
> Sorry, I misattributed these log entries. That's Stefan's info, not Joakim's.
>
> But still interesting...
>
> On Feb 2, 2011, at 12:37 PM, Stefan Bigler wrote:
>
> > [2307][465] erase suspend 1         adr=0x03fe5000
> > [2307][465] map_write 0x70 to 0x03fe5000
> > [2307][465] map_write 0xe8 to 0x03fe5000
> > [2307][209] map_write 0x70 to 0x00020000
> > [2307][209] map_write 0x50 to 0x00020000
> > [2307][209] map_write 0xd0 to 0x00020000
> > [2307][209] map_write 0x70 to 0x00020000
> > [2311][209] erase resumed 2b        adr=0x00020000
> > [2319][209] do_erase_oneblock end   adr=0x00020000 len=0x20000
> > [2319][465] map_write 0x1ff to 0x03fe5000
> > [2319][465] map_write 0xc03c0000 to 0x03fe5000
> > [2319][465] map_write 0xc03c0000 to 0x03fe5002
>
> Focusing even more on this... The last 3 lines are telling. That looks very much like a word count for the buffered write followed by data.
>
> So I think we're on the right track overall. Between the 0xe8 and the word count 0x1ff a suspended erase thread is jumping in and disturbing things.
>
> It's not that doing that causes incorrect bits in the SR but that it disrupts up the 0xe8/count/data... sequence that must happen atomically. That later causes a command sequence error, which is what the status 0xb0 means.
>
> So how is an erase thread waking up and not seeing the chip->state to be something other than the FL_ERASING and going back to sleep?

The only thing I can think of the the earlier discussion about dropping the lock.

Oh, one more thing, possibly one needs to add cpu_relax() or similar
to force gcc to reload chip->state in the while loop?

 Jocke
