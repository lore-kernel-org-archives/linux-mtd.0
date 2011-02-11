Received: from gw1.transmode.se ([213.115.205.20])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Pnv5x-0000ON-EL
	for linux-mtd@lists.infradead.org; Fri, 11 Feb 2011 15:39:42 +0000
In-Reply-To: <F0DA0AC2-A143-4A11-BE83-CF514BC6F678@prograde.net>
References: <16826B66-31FE-41AD-A6EF-E668A45AF1FE@prograde.net>	<4D4BDD48.6040600@keymile.com>
	<OF5A6BB547.3462D591-ONC125782D.00475578-C125782D.0047EC74@transmode.se>	<541E19B8-D428-4F59-B6BB-A3BD8F455AE4@prograde.net>
	<OF42EF<F66AF016-8A2B-4116-BE49-CE05B91BE50F@prograde.net>	<OF56DD046D.3279E067
	<9098074B-C8F0-4608-BE25-D99A4C22176B@prograde.net>	<0488D3BA-7BA3-4E98-B289-3F3D1DB485D4@prograde.net>
	<OF2C1ABD39	<4D5005E4.1040506@keymile.com>	<OFFF2C6D34.91E5D6C3-ONC1257	<96BD3889-E8AD-408D-8275-ED1A5FD55F1B@prograde.net>
	<OF9738D658.F46	<4C117A67-5057-4ACD-8EBE-04E9C782570C@prograde.net>	<OF6D40AC82.1008D3DD-ONC1
	<4D53E660.4020305@users.sourceforge.net>	<OF4E49CFD6.F0E578FE-ONC1257833.004BF8B1-C1257833.004D48AA@transmode.se>
	<F0DA0AC2-A143-4A11-BE83-CF514BC6F678@prograde.net>
Subject: Re: Numonyx NOR and chip->mutex bug?
To: Michael Cashwell <mboards@prograde.net>
Message-ID: <OF24342672.F4BEF9FA-ONC1257834.0055AEE1-C1257834.00560756@transmode.se>
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Date: Fri, 11 Feb 2011 16:39:39 +0100
MIME-Version: 1.0
Content-type: text/plain; charset=ISO-8859-15
Content-transfer-encoding: quoted-printable
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

Michael Cashwell <mboards@prograde.net> wrote on 2011/02/11 16:05:54:
>
> On Feb 10, 2011, at 12:54 PM, Anders Grafstr=F6m wrote:
>
> > On 2011-02-10 17:43, Michael Cashwell wrote:
> >> On Feb 10, 2011, at 10:59 AM, Michael Cashwell wrote:
> >> Troublesome 65nm parts:
> >> run 1:
> >> NOR Flash: block erase suspended and resumed 29 times.
> >> buffered write fails.
> >
> > Buffered write fails with SR[4] set?
>
> The error messages variously report block locked and Vpp errors but t=
hey are not legitimate. I changed them to actually print the status wor=
d and it's often 0xffff or other values with set bits in the upper byte=
. That tells me the chip is not properly in status-read mode at that po=
int.
>
> So I think the answer to your question is no, not reliably with SR[4]=
 set because it's reading array data instead of status.
>
> > Have you configured with CONFIG_MTD_UBI_DEBUG_PARANOID so that UBI =
does the all 0xff check after erase?
>
> I've used some of the debugging modes at the top of cfi_cmdset_0001.c=
 but I had not used the config option. I will do that and report back.
>
> > I'm wondering if the blocks being written to are in a properly eras=
ed state.
>
> Yes, it's a possibility. However, I've never seen an erase report any=
 error.

Mike, does this small patch change anything:
diff --git a/drivers/mtd/chips/cfi_cmdset_0001.c b/drivers/mtd/chips/cf=
i_cmdset_0001.c
index 9772a62..bdcd8c1 100644
--- a/drivers/mtd/chips/cfi_cmdset_0001.c
+++ b/drivers/mtd/chips/cfi_cmdset_0001.c
@@ -808,7 +808,8 @@ static int chip_ready (struct map_info *map, struct=
 flchip *chip, unsigned long
 		     (mode =3D=3D FL_WRITING && (cfip->SuspendCmdSupport & 1))))
 			goto sleep;

-
+		/* Numonyx Axcell chips needs a Read Status */
+		map_write(map, CMD(0x70), adr);
 		/* Erase suspend */
 		map_write(map, CMD(0xB0), adr);


Possibly this u-boot add on would make it easier to test suspend/resume=
:

http://lists.infradead.org/pipermail/linux-mtd/2008-April/021280.html
=
