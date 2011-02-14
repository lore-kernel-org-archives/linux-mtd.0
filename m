Received: from gateway.prograde.net ([66.92.163.78] helo=sol.prograde.net)
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Pp0a0-0002wD-5F
	for linux-mtd@lists.infradead.org; Mon, 14 Feb 2011 15:43:13 +0000
Subject: Re: Numonyx NOR and chip->mutex bug?
Mime-Version: 1.0 (Apple Message framework v1082)
Content-Type: text/plain; charset=us-ascii
From: Michael Cashwell <mboards@prograde.net>
In-Reply-To: <OF626FDFE6.CA621532-ONC1257833.005E857C-C1257833.005F4BE2@transmode.se>
Date: Mon, 14 Feb 2011 10:44:23 -0500
Content-Transfer-Encoding: quoted-printable
Message-Id: <D8D411EA-2621-4BD6-AF36-A6CBFDFB40FF@prograde.net>
References: <16826B66-31FE-41AD-A6EF-E668A45AF1FE@prograde.net>
	<OF56DD046D.3279E067	<9098074B-C8F0-4608-BE25-D99A4C22176B@prograde.net>
	<0488D3BA-7BA3-4E98-B289-3F3D1DB485D4@prograde.net>
	<OF2C1ABD39	<4D5005E4.1040506@keymile.com>
	<OFFF2C6D34.91E5D6C3-ONC1257	<96BD3889-E8AD-408D-8275-ED1A5FD55F1B@prograde.net>
	<OF9738D658.F46
	<4C117A67-5057-4ACD-8EBE-04E9C782570C@prograde.net>	<OF6D40AC82.1008D3DD-ONC1
	<4D53E660.4020305@users.sourceforge.net>	<OF4E49CFD6.F0E578FE-ONC1257833.004BF8B1-C1257833.004D48AA@transmode.se>
	<85661EDC-9882-41B1-A926-0A88EF1CEF2E@prograde.net>
	<OFEF05BB2C.A2E3BADF-O
	<97165996-D766-468D-AB90-974E29ABCFB7@prograde.net>
	<OFBD6C1723.E5530FEB-ONC1257833.005BF5C1-C1257833.005C2C61@transmode.se>
	<OF4FEF6422.2B862198-ONC125783
	<3B106371-0DA1-4F15-9482-7307110A86E2@prograde.net>
	<OF626FDFE6.CA621532-ONC1257833.005E857C-C1257833.005F4BE2@transmode.se>
To: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Cc: stefan.bigler@keymile.com, Holger brunck <holger.brunck@keymile.com>,
	linux-mtd@lists.infradead.org,
	=?iso-8859-1?Q?Anders_Grafstr=F6m?= <grfstrm@users.sourceforge.net>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Feb 10, 2011, at 12:20 PM, Joakim Tjernlund wrote:

> Michael Cashwell <mboards@prograde.net> wrote on 2011/02/10 18:10:18:
>> On Feb 10, 2011, at 12:02 PM, Joakim Tjernlund wrote:
>>=20
>>> And this reminds me that if the spec is to be trusted, the delay =
should be just before erase suspend, otherwise you miss the time between =
the initial erase and the first suspend.
>>=20
>> Probably true to be completely sure. I bet the need for "repeated =
violations" is why I've been able to make it work by delaying after. But =
I agree.
>=20
> Yes, but you also indicated that a throw away status read made the =
problem go away?
> Can you move that status read to just before suspend and get the same =
results?

Well, sort of. The place where I've been doing the udelay or throw-away =
status read is when resuming, not suspending.

But interestingly, doing it right before the resume works just as well =
as right after.

-Mike
