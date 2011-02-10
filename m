Received: from gw1.transmode.se ([213.115.205.20])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PnZuU-0006ZM-TC
	for linux-mtd@lists.infradead.org; Thu, 10 Feb 2011 17:02:27 +0000
In-Reply-To: <OFBD6C1723.E5530FEB-ONC1257833.005BF5C1-C1257833.005C2C61@transmode.se>
References: <16826B66-31FE-41AD-A6EF-E668A45AF1FE@prograde.net>	<OF42EF<F66AF016-8A2B-4116-BE49-CE05B91BE50F@prograde.net>
	<OF56DD046D.3279E067	<9098074B-C8F0-4608-BE25-D99A4C22176B@prograde.net>	<0488D3BA-7BA3-4E98-B289-3F3D1DB485D4@prograde.net>
	<OF2C1ABD39	<4D5005E4.1040506@keymile.com>	<OFFF2C6D34.91E5D6C3-ONC1257	<96BD3889-E8AD-408D-8275-ED1A5FD55F1B@prograde.net>
	<OF9738D658.F46	<4C117A67-5057-4ACD-8EBE-04E9C782570C@prograde.net>	<OF6D40AC82.1008D3DD-ONC1
	<4D53E660.4020305@users.sourceforge.net>	<OF4E49CFD6.F0E578FE-ONC1257833.004BF8B1-C1257833.004D48AA@transmode.se>
	<85661EDC-9882-41B1-A926-0A88EF1CEF2E@prograde.net>	<OFEF05BB2C.A2E3BADF-O
	<97165996-D766-468D-AB90-974E29ABCFB7@prograde.net>
	<OFBD6C1723.E5530FEB-ONC1257833.005BF5C1-C1257833.005C2C61@transmode.se>
Subject: Re: Numonyx NOR and chip->mutex bug?
Message-ID: <OF4FEF6422.2B862198-ONC1257833.005D4A8B-C1257833.005D9A9E@transmode.se>
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Date: Thu, 10 Feb 2011 18:02:24 +0100
MIME-Version: 1.0
Content-type: text/plain; charset=US-ASCII
Cc: linux-mtd@lists.infradead.org, stefan.bigler@keymile.com,
	Holger brunck <holger.brunck@keymile.com>,
	=?ISO-8859-15?Q?Anders_Grafstr=F6m?= <grfstrm@users.sourceforge.net>,
	Michael Cashwell <mboards@prograde.net>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


> > > Here is another idea, don't resume between every write_buffer etc. If less than 500 us has passed, just continue with the next write_buffer. That would be much more efficient.
> >
> > Wouldn't that extend the wrong time. That would ensure the erase stays *suspended* for at least 500us. But doesn't W602 specify that an erase should be allowed *to run* for 500us before suspension?
> >
> > It seems the other way around.
>
> eeh, yes :(

And this reminds me that if the spec is to be trusted, the delay should be just before
erase suspend, otherwise you miss the time between the initial erase and the first suspend.

 Jocke
