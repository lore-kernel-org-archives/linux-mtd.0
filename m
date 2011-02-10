Subject: Re: Numonyx NOR and chip->mutex bug?
Mime-Version: 1.0 (Apple Message framework v1082)
Content-Type: text/plain; charset=us-ascii
From: Michael Cashwell <mboards@prograde.net>
In-Reply-To: <OF1160F22A.C6961712-ONC1257833.00526535-C1257833.0052DAD1@transmode.se>
Date: Thu, 10 Feb 2011 10:59:50 -0500
Content-Transfer-Encoding: quoted-printable
Message-Id: <85661EDC-9882-41B1-A926-0A88EF1CEF2E@prograde.net>
References: <16826B66-31FE-41AD-A6EF-E668A45AF1FE@prograde.net>	<OF0B032533.FA33B99E-ONC125782D.003AF89B-C125782D.003B43AA@transmode.se>
	<4D4BDD48.6040600@keymile.com>	<OF5A6BB547.3462D591-ONC125782D.00475578-C125782D.0047EC74@transmode.se>
	<541E19B8-D428-4F59-B6BB-A3BD8F455AE4@prograde.net>		<OF42EF<F66AF016-8A2B-4116-BE49-CE05B91BE50F@prograde.net>
	<OF56DD046D.3279E067	<9098074B-C8F0-4608-BE25-D99A4C22176B@prograde.net>	<0488D3BA-7BA3-4E98-B289-3F3D1DB485D4@prograde.net>
	<OF2C1ABD39	<4D5005E4.1040506@keymile.com>	<OFFF2C6D34.91E5D6C3-ONC1257	<96BD3889-E8AD-408D-8275-ED1A5FD55F1B@prograde.net>
	<OF9738D658.F46	<4C117A67-5057-4ACD-8EBE-04E9C782570C@prograde.net>	<OF6D40AC82.1008D3DD-ONC1
	<4D53E660.4020305@users.sourceforge.net>
	<OF4E49CFD6.F0E578FE-ONC1257833.004BF8B1-C1257833.004D48AA@transmode.se>
	<OF1160F22A.C6961712-ONC1257833.00526535-C1257833.0052DAD1@transmode.se>
To: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Cc: linux-mtd-bounces@lists.infradead.org, linux-mtd@lists.infradead.org,
	Holger brunck <holger.brunck@keymile.com>, stefan.bigler@keymile.com,
	=?iso-8859-1?Q?Anders_Grafstr=F6m?= <grfstrm@users.sourceforge.net>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Feb 10, 2011, at 10:04 AM, Joakim Tjernlund wrote:

> A simpler impl. would be a suspend counter. When no. of suspends > =
1000, do usleep(500) or usleep(500) every 100-500 suspends.

Our messages crossed each other. I just saw this problem with 29 =
suspends.

I wonder if THAT is what's different between these chips and the older =
130nm parts. And none of that addresses whether or not this change is =
just an anomaly in this batch or if we would continue to get them.

I'm going to run my test on the older 130nm (2003 vintage) parts just =
for grins.

-Mike
