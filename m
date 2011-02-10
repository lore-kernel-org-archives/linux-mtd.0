Message-ID: <4D542657.2060903@users.sourceforge.net>
Date: Thu, 10 Feb 2011 18:54:31 +0100
From: =?ISO-8859-1?Q?Anders_Grafstr=F6m?= <grfstrm@users.sourceforge.net>
MIME-Version: 1.0
To: Michael Cashwell <mboards@prograde.net>
Subject: Re: Numonyx NOR and chip->mutex bug?
References: <16826B66-31FE-41AD-A6EF-E668A45AF1FE@prograde.net>	<OF0B032533.FA33B99E-ONC125782D.003AF89B-C125782D.003B43AA@transmode.se>	<4D4BDD48.6040600@keymile.com>	<OF5A6BB547.3462D591-ONC125782D.00475578-C125782D.0047EC74@transmode.se>	<541E19B8-D428-4F59-B6BB-A3BD8F455AE4@prograde.net>		<OF42EF<F66AF016-8A2B-4116-BE49-CE05B91BE50F@prograde.net>	<OF56DD046D.3279E067	<9098074B-C8F0-4608-BE25-D99A4C22176B@prograde.net>	<0488D3BA-7BA3-4E98-B289-3F3D1DB485D4@prograde.net>	<OF2C1ABD39	<4D5005E4.1040506@keymile.com>	<OFFF2C6D34.91E5D6C3-ONC1257	<96BD3889-E8AD-408D-8275-ED1A5FD55F1B@prograde.net>	<OF9738D658.F46	<4C117A67-5057-4ACD-8EBE-04E9C782570C@prograde.net>	<OF6D40AC82.1008D3DD-ONC1	<4D53E660.4020305@users.sourceforge.net>	<OF4E49CFD6.F0E578FE-ONC1257833.004BF8B1-C1257833.004D48AA@transmode.se>	<OF1160F22A.C6961712-ONC1257833.00526535-C1257833.0052DAD1@transmode.se>	<85661EDC-9882-41B1-A926-0A88EF1CEF2E@prograde.net>
	<DF9180D3-B5E5-4291-92E7-5F7C84EF8295@prograde.net>
In-Reply-To: <DF9180D3-B5E5-4291-92E7-5F7C84EF8295@prograde.net>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: linux-mtd-bounces@lists.infradead.org,
	Holger brunck <holger.brunck@keymile.com>, stefan.bigler@keymile.com,
	Joakim Tjernlund <joakim.tjernlund@transmode.se>,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 2011-02-10 17:43, Michael Cashwell wrote:
> On Feb 10, 2011, at 10:59 AM, Michael Cashwell wrote:
> Troublesome 65nm parts:
> run 1:
> NOR Flash: block erase suspended and resumed 29 times.
> buffered write fails.

Buffered write fails with SR[4] set?

Have you configured with CONFIG_MTD_UBI_DEBUG_PARANOID
so that UBI does the all 0xff check after erase?

I'm wondering if the blocks being written to are in a properly erased state.

/Anders
