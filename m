Received: from gw1.transmode.se ([213.115.205.20])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PnZfN-0006NO-SU
	for linux-mtd@lists.infradead.org; Thu, 10 Feb 2011 16:46:50 +0000
In-Reply-To: <97165996-D766-468D-AB90-974E29ABCFB7@prograde.net>
References: <16826B66-31FE-41AD-A6EF-E668A45AF1FE@prograde.net>
	<541E19B8-D428-4F59-B6BB-A3BD8F455AE4@prograde.net>
	<OF42EF<F66AF016-8A2B-4116-BE49-CE05B91BE50F@prograde.net>
	<OF56DD046D.3279E067
	<9098074B-C8F0-4608-BE25-D99A4C22176B@prograde.net>	<0488D3BA-7BA3-4E98-B289-3F3D1DB485D4@prograde.net>
	<OF2C1ABD39
	<4D5005E4.1040506@keymile.com>	<OFFF2C6D34.91E5D6C3-ONC1257	<96BD3889-E8AD-408D-8275-ED1A5FD55F1B@prograde.net>
	<OF9738D658.F46
	<4C117A67-5057-4ACD-8EBE-04E9C782570C@prograde.net>	<OF6D40AC82.1008D3DD-ONC1
	<4D53E660.4020305@users.sourceforge.net>
	<OF4E49CFD6.F0E578FE-ONC1257833.004BF8B1-C1257833.004D48AA@transmode.se>
	<85661EDC-9882-41B1-A926-0A88EF1CEF2E@prograde.net>
	<OFEF05BB2C.A2E3BADF-O
	<97165996-D766-468D-AB90-974E29ABCFB7@prograde.net>
Subject: Re: Numonyx NOR and chip->mutex bug?
To: Michael Cashwell <mboards@prograde.net>
Message-ID: <OFBD6C1723.E5530FEB-ONC1257833.005BF5C1-C1257833.005C2C61@transmode.se>
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Date: Thu, 10 Feb 2011 17:46:46 +0100
MIME-Version: 1.0
Content-type: text/plain; charset=US-ASCII
Cc: linux-mtd@lists.infradead.org, stefan.bigler@keymile.com,
	Holger brunck <holger.brunck@keymile.com>,
	=?ISO-8859-15?Q?Anders_Grafstr=F6m?= <grfstrm@users.sourceforge.net>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Michael Cashwell <mboards@prograde.net> wrote on 2011/02/10 17:41:23:
>
>
> On Feb 10, 2011, at 11:05 AM, Joakim Tjernlund wrote:
>
> > Michael Cashwell <mboards@prograde.net> wrote on 2011/02/10 16:59:50:
> >>
> >>> A simpler impl. would be a suspend counter. When no. of suspends > 1000, do usleep(500) or usleep(500) every 100-500 suspends.
> >>
> >> Our messages crossed each other. I just saw this problem with 29 suspends.
> >>
> >> I wonder if THAT is what's different between these chips and the older 130nm parts. And none of that addresses whether or not this change is just an anomaly in this batch or if we would continue to get them.
> >>
> >> I'm going to run my test on the older 130nm (2003 vintage) parts just for grins.
> >
> > Here is another idea, don't resume between every write_buffer etc. If less than 500 us has passed, just continue with the next write_buffer. That would be much more efficient.
>
> Wouldn't that extend the wrong time. That would ensure the erase stays *suspended* for at least 500us. But doesn't W602 specify that an erase should be allowed *to run* for 500us before suspension?
>
> It seems the other way around.

eeh, yes :(

 Jocke
