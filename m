Subject: Re: Numonyx NOR and chip->mutex bug?
Mime-Version: 1.0 (Apple Message framework v1082)
Content-Type: text/plain; charset=iso-8859-1
From: Michael Cashwell <mboards@prograde.net>
In-Reply-To: <4D542657.2060903@users.sourceforge.net>
Date: Fri, 11 Feb 2011 10:05:54 -0500
Content-Transfer-Encoding: quoted-printable
Message-Id: <F0DA0AC2-A143-4A11-BE83-CF514BC6F678@prograde.net>
References: <16826B66-31FE-41AD-A6EF-E668A45AF1FE@prograde.net>	<OF0B032533.FA33B99E-ONC125782D.003AF89B-C125782D.003B43AA@transmode.se>	<4D4BDD48.6040600@keymile.com>	<OF5A6BB547.3462D591-ONC125782D.00475578-C125782D.0047EC74@transmode.se>	<541E19B8-D428-4F59-B6BB-A3BD8F455AE4@prograde.net>		<OF42EF<F66AF016-8A2B-4116-BE49-CE05B91BE50F@prograde.net>	<OF56DD046D.3279E067	<9098074B-C8F0-4608-BE25-D99A4C22176B@prograde.net>	<0488D3BA-7BA3-4E98-B289-3F3D1DB485D4@prograde.net>	<OF2C1ABD39	<4D5005E4.1040506@keymile.com>	<OFFF2C6D34.91E5D6C3-ONC1257	<96BD3889-E8AD-408D-8275-ED1A5FD55F1B@prograde.net>	<OF9738D658.F46	<4C117A67-5057-4ACD-8EBE-04E9C782570C@prograde.net>	<OF6D40AC82.1008D3DD-ONC1	<4D53E660.4020305@users.sourceforge.net>	<OF4E49CFD6.F0E578FE-ONC1257833.004BF8B1-C1257833.004D48AA@transmode.se>	<OF1160F22A.C6961712-ONC1257833.00526535-C1257833.0052DAD1@transmode.se>	<85661EDC-9882-41B1-A926-0A88EF1CEF2E@prograde.net>
	<DF9180D3-B5E5-4291-92E7-5F7C84EF8295@prograde.net> <4D
	542657.2060903@users.sourceforge.net>
To: =?iso-8859-1?Q?Anders_Grafstr=F6m?= <grfstrm@users.sourceforge.net>
Cc: linux-mtd-bounces@lists.infradead.org, stefan.bigler@keymile.com,
	Holger brunck <holger.brunck@keymile.com>,
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

On Feb 10, 2011, at 12:54 PM, Anders Grafstr=F6m wrote:

> On 2011-02-10 17:43, Michael Cashwell wrote:
>> On Feb 10, 2011, at 10:59 AM, Michael Cashwell wrote:
>> Troublesome 65nm parts:
>> run 1:
>> NOR Flash: block erase suspended and resumed 29 times.
>> buffered write fails.
>=20
> Buffered write fails with SR[4] set?

The error messages variously report block locked and Vpp errors but they =
are not legitimate. I changed them to actually print the status word and =
it's often 0xffff or other values with set bits in the upper byte. That =
tells me the chip is not properly in status-read mode at that point.

So I think the answer to your question is no, not reliably with SR[4] =
set because it's reading array data instead of status.

> Have you configured with CONFIG_MTD_UBI_DEBUG_PARANOID so that UBI =
does the all 0xff check after erase?

I've used some of the debugging modes at the top of cfi_cmdset_0001.c =
but I had not used the config option. I will do that and report back.

> I'm wondering if the blocks being written to are in a properly erased =
state.

Yes, it's a possibility. However, I've never seen an erase report any =
error.

More next week.

-Mike
