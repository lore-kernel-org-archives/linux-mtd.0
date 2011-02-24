Received: from gateway.prograde.net ([66.92.163.78] helo=sol.prograde.net)
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Psc96-0003R3-NU
	for linux-mtd@lists.infradead.org; Thu, 24 Feb 2011 14:26:21 +0000
Subject: Re: Numonyx NOR and chip->mutex bug?
Mime-Version: 1.0 (Apple Message framework v1082)
Content-Type: text/plain; charset=iso-8859-1
From: Michael Cashwell <mboards@prograde.net>
In-Reply-To: <OF4F0E6D3D.15AAB003-ONC1257841.0039EF76-C1257841.003B8AD2@transmode.se>
Date: Thu, 24 Feb 2011 09:28:15 -0500
Content-Transfer-Encoding: quoted-printable
Message-Id: <C4258022-44CD-43FB-9109-50382538C53D@prograde.net>
References: <16826B66-31FE-41AD-A6EF-E668A45AF1FE@prograde.net>	<4D4AD9ED.8060104@keymile.com>
	<4D4B37D4.4050204@keymile.com>	<OF0B032533.FA33B99E-ONC125782D.003AF89B-C125782D.003B43AA@transmode.se>
	<4D4BDD48.6040600@keymile.com>	<OF5A6BB547.3462D591-ONC125782D.00475578-C125782D.0047EC74@transmode.se>
	<541E19B8-D428-4F59-B6BB-A3BD8F455AE4@prograde.net>		<OF42EF<F66AF016-8A2B-4116-BE49-CE05B91BE50F@prograde.net>
	<OF56DD046D.3279E067	<9098074B-C8F0-4608-BE25-D99A4C22176B@prograde.net>	<0488D3BA-7BA3-4E98-B289-3F3D1DB485D4@prograde.net>
	<OF2C1ABD39	<4D5005E4.1040506@keymile.com>	<OFFF2C6D34.91E5D6C3-ONC1257	<96BD3889-E8AD-408D-8275-ED1A5FD55F1B@prograde.net>
	<OF9738D658.F46	<4C117A67-5057-4ACD-8EBE-04E9C782570C@prograde.net>	<OF6D40AC82.1008D3DD-ONC1
	<4D53E660.4020305@users.sourceforge.net>
	<OF4F0E6D3D.15AAB003-ONC1257841.0039EF76-C1257841.003B8AD2@transmode.se>
To: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Cc: linux-mtd@lists.infradead.org, stefan.bigler@keymile.com,
	Holger brunck <holger.brunck@keymile.com>,
	=?iso-8859-1?Q?Anders_Grafstr=F6m?= <grfstrm@users.sourceforge.net>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Anders Grafstr=F6m <grfstrm@users.sourceforge.net> wrote on 2011/02/10 =
14:21:36:

> It produced this output at one occasion:
>=20
> 6000 loops
> status 00800080
> ffff0000
> ffff0000
> 4783 suspends
> ---------------------
> See the status 00800080 ?
> Looking at the code this should not be possible, right?


It's similar but not identical to my issue. I was seeing a buffered =
programming operation (done while an erase was suspended) appear to fail =
because the status read looking for program completion would return =
garbage. Your case is only erase, not programming.

But yours looks similar to mine in that your resumed erase completes =
(00800080) and then the next several status read returns garbage. =
Interestingly, the low chip returns correct status (WSM busy, nothing =
suspended, no errors, etc.) but the high chip returns FFFF. That was =
often what mine did during buffer program.

I also sometimes would see other values, not always FFFF. But with bits =
set in the upper byte whatever was being read was clearly NOT status. =
Since FFFF is correct for erased array data I assumed the part had =
dropped out of status-read mode but I've not been able to determine why.

Also, on my parts there is a loose restriction on the minimum time =
between starting or resuming an erase and the next suspend of it. It's =
500=B5s for my part and they say that "repeated violations" of that time =
can cause erase failures. The hard part is that the 500=B5s is only a =
typical value and no hard number is given for how many violations are =
needed to cause a failure. I suspect it varies from part to part.

Your code suspends immediately after starting the erase, so that would =
be a violation on my part. And depending on the value of loops you might =
be violating it often.

On Feb 24, 2011, at 6:36 AM, Joakim Tjernlund wrote:

> Michael, have you made any progress?

Sadly, management was breathing down my neck to get it working and I've =
been pulled completely off onto a different project. I do still want to =
find the real answer but currently the people who control the purse =
strings have other ideas. There is another board in the pipeline here =
that might have this part on it. When that arrives on my desk I'll see =
if I can pick this up again.

> Can you run Anders program too?

Not as written. My board only has one flash chip where Anders' clearly =
has two chips in parallel. It wouldn't be too hard to change it to =
1-wide but I'm overloaded on my other project at present.

-Mike
