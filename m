Received: from gateway.prograde.net ([66.92.163.78] helo=sol.prograde.net)
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Plpym-0003uI-NX
	for linux-mtd@lists.infradead.org; Sat, 05 Feb 2011 21:47:41 +0000
Subject: Re: Numonyx NOR and chip->mutex bug?
Mime-Version: 1.0 (Apple Message framework v1082)
Content-Type: text/plain; charset=us-ascii
From: Michael Cashwell <mboards@prograde.net>
In-Reply-To: <76241A6C-ECA0-46B1-B8B4-F3786FCBA339@prograde.net>
Date: Sat, 5 Feb 2011 16:47:33 -0500
Content-Transfer-Encoding: quoted-printable
Message-Id: <F66AF016-8A2B-4116-BE49-CE05B91BE50F@prograde.net>
References: <16826B66-31FE-41AD-A6EF-E668A45AF1FE@prograde.net>
	<OF669CD6B0.87299771-ONC1257823.007EE3A7-C1257823.007F2FD2@transmode.se>
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
	<541E19B8-D428-4F59-B6BB-A3BD8F455AE4@prograde.net>
	<OF42EFA99A.95A8E75E-ONC125782E.00384CCF-C125782E.00399CFC@transmode.se>
	<76241A6C-ECA0-46B1-B8B4-F3786FCBA339@prograde.net>
To: Joakim Tjernlund <joakim.tjernlund@transmode.se>
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

Sorry, I misattributed these log entries. That's Stefan's info, not =
Joakim's.

But still interesting...

On Feb 2, 2011, at 12:37 PM, Stefan Bigler wrote:

> [2307][465] erase suspend 1         adr=3D0x03fe5000
> [2307][465] map_write 0x70 to 0x03fe5000
> [2307][465] map_write 0xe8 to 0x03fe5000
> [2307][209] map_write 0x70 to 0x00020000
> [2307][209] map_write 0x50 to 0x00020000
> [2307][209] map_write 0xd0 to 0x00020000
> [2307][209] map_write 0x70 to 0x00020000
> [2311][209] erase resumed 2b        adr=3D0x00020000
> [2319][209] do_erase_oneblock end   adr=3D0x00020000 len=3D0x20000
> [2319][465] map_write 0x1ff to 0x03fe5000
> [2319][465] map_write 0xc03c0000 to 0x03fe5000
> [2319][465] map_write 0xc03c0000 to 0x03fe5002

Focusing even more on this... The last 3 lines are telling. That looks =
very much like a word count for the buffered write followed by data.

So I think we're on the right track overall. Between the 0xe8 and the =
word count 0x1ff a suspended erase thread is jumping in and disturbing =
things.

It's not that doing that causes incorrect bits in the SR but that it =
disrupts up the 0xe8/count/data... sequence that must happen atomically. =
That later causes a command sequence error, which is what the status =
0xb0 means.

So how is an erase thread waking up and not seeing the chip->state to be =
something other than the FL_ERASING and going back to sleep?

More Monday.

-Mike
