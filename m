Received: from gw1.transmode.se ([213.115.205.20])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PmTrd-0001Tq-4R
	for linux-mtd@lists.infradead.org; Mon, 07 Feb 2011 16:23:03 +0000
In-Reply-To: <96BD3889-E8AD-408D-8275-ED1A5FD55F1B@prograde.net>
References: <16826B66-31FE-41AD-A6EF-E668A45AF1FE@prograde.net>
	<OF562F5C46.D2EDB17F-ONC125782C.00358774-C125782C.0036154D@transmode.se>
	<6FC0E416-EEBD-453F-AAB9-88BB6D90BFAB@prograde.net>
	<4D4AD9ED.8060104@keymile.com> <4D4B37D4.4050204@keymile.com>
	<OF0B032533.FA33B99E-ONC125782D.003AF89B-C125782D.003B43AA@transmode.se>
	<4D4BDD48.6040600@keymile.com>
	<OF5A6BB547.3462D591-ONC125782D.00475578-C125782D.0047EC74@transmode.se>
	<541E19B8-D428-4F59-B6BB-A3BD8F455AE4@prograde.net>
	<OF42EF<F66AF016-8A2B-4116-BE49-CE05B91BE50F@prograde.net>
	<OF56DD046D.3279E067
	<9098074B-C8F0-4608-BE25-D99A4C22176B@prograde.net>		
	<0488D3BA-7BA3-4E98-B289-3F3D1DB485D4@prograde.net> <OF2C1ABD39
	<4D5005E4.1040506@keymile.com> <OFFF2C6D34.91E5D6C3-ONC1257
	<96BD3889-E8AD-408D-8275-ED1A5FD55F1B@prograde.net>
Subject: Re: Numonyx NOR and chip->mutex bug?
To: Michael Cashwell <mboards@prograde.net>
Message-ID: <OF9738D658.F46DCBA1-ONC1257830.00591756-C1257830.0059F97E@transmode.se>
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Date: Mon, 7 Feb 2011 17:22:45 +0100
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

Michael Cashwell <mboards@prograde.net> wrote on 2011/02/07 16:46:22:
>
> On Feb 7, 2011, at 10:01 AM, Joakim Tjernlund wrote:
>
> > Stefan Bigler <stefan.bigler@keymile.com> wrote on 2011/02/07 15:47:00:

>
> My current workaround from my problem is to do a throw-away status read "(void) map_read(map, addr);" after that 0x50, 0xd0, 0x70 sequence.
>
> Since no one else is seeing my problem I expect it's some issue with my specific batch of chips. Ugh.

Possibly, or an accident waiting to happen to the rest of us.
The map_read will probably force some HW completion. Perhaps some sync() op. will do the same? Just to nail it down.

BTW, do you have CONFIG_MTD_COMPLEX_MAPPINGS=y ? I do
