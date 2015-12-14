Received: from mail-io0-x230.google.com ([2607:f8b0:4001:c06::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a8Tjj-0007cE-FB
 for linux-mtd@lists.infradead.org; Mon, 14 Dec 2015 14:04:24 +0000
Received: by ioae126 with SMTP id e126so44083169ioa.1
 for <linux-mtd@lists.infradead.org>; Mon, 14 Dec 2015 06:04:02 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20151212085900.2118eb2c@bbrezillon>
References: <1397034804-27161-1-git-send-email-helmut.schaa@googlemail.com>
 <20151209235823.GD144338@google.com>
 <CAGXE3d_v9hKCqNeTWfjpad_Uj=sKo1fn0B=Wz2s_t76JKUZhzQ@mail.gmail.com>
 <20151212004025.GA3047@localhost>
 <20151212085900.2118eb2c@bbrezillon>
Date: Mon, 14 Dec 2015 15:04:02 +0100
Message-ID: <CAGXE3d_iXx37GWREpQ+425p13nbBpqpHp5u82jKGsYUfikrpUw@mail.gmail.com>
Subject: Re: [PATCH] mtd: nand: Disable subpage writes for drivers without
 ecc->hwctl
From: Helmut Schaa <helmut.schaa@googlemail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 David Woodhouse <David.Woodhouse@intel.com>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Pekon Gupta <pekon.gupta@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Zhou Wang <wangzhou1@hisilicon.com>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Dec 12, 2015 at 8:59 AM, Boris Brezillon
<boris.brezillon@free-electrons.com> wrote:
> Hi Brian,
>
> On Fri, 11 Dec 2015 16:40:25 -0800
> Brian Norris <computersforpeace@gmail.com> wrote:
>
>> On Thu, Dec 10, 2015 at 10:31:32AM +0100, Helmut Schaa wrote:
>> > On Thu, Dec 10, 2015 at 12:58 AM, Brian Norris
>> > <computersforpeace@gmail.com> wrote:
>> > > On Wed, Apr 09, 2014 at 11:13:24AM +0200, Helmut Schaa wrote:
>> > >> nand_write_subpage_hwecc causes a crash if the driver did not register
>> > >> ecc->hwctl or ecc->calculate. Fix this by disabling subpage writes if
>> > >> ecc->hwctl or ecc->calculate is not provided by the driver.
>> > >>
>> > >> This behavior was introduced in commit 837a6ba4f3b6d23026674e6af6b6849a4634fff9
>> > >> "mtd: nand: subpage write support for hardware based ECC schemes".
>> > >>
>> > >> This fixes a crash with fsl_elbc_nand and maybe others:
>> > >>
>> > > [...]
>> > >>
>> > >> --- a/drivers/mtd/nand/nand_base.c
>> > >> +++ b/drivers/mtd/nand/nand_base.c
>> > >> @@ -3768,7 +3768,7 @@ int nand_scan_tail(struct mtd_info *mtd)
>> > >>                       ecc->write_oob = nand_write_oob_std;
>> > >>               if (!ecc->read_subpage)
>> > >>                       ecc->read_subpage = nand_read_subpage;
>
> Shouldn't we have the same kind of test for ->read_subpage.
>
>                 if (!ecc->read_subpage && ecc->correct &&
>                     ecc->calculate)
>                         ecc->read_subpage = nand_read_subpage;
>
>
>> > >> -             if (!ecc->write_subpage)
>> > >> +             if (!ecc->write_subpage && ecc->hwctl && ecc->calculate)
>> > >>                       ecc->write_subpage = nand_write_subpage_hwecc;
>> > >>
>> > >>       case NAND_ECC_HW_SYNDROME:
>> > >
>> > > I realize we've merged a fix for fsl_elbc_nand long ago (commit
>> > > f034d87def51 "mtd: eLBC NAND: fix subpage write support"), but this
>> > > change still looks sane, applies, and could possibly fix some other
>> > > drivers that are lurking somewhere. Any reason I shouldn't apply it?
>> >
>> > I'm not carrying this patch in my tree anymore and did not see any more
>> > crashes with the flash configuration I'm using. So, I think the original patch
>> > is kind of superfluous.
>>
>> There could easily be other drivers that don't have hwctl() or
>> calculate() callbacks yet use NAND_ECC_HW. By inspection, I see that
>> maybe the new hisi504_nand.c is susceptible, as well as sh_flctl.c and
>> maybe even sunxi_nand.c (?). Some of these might not be hit if they
>> don't use NAND that support subpage writes.
>
> Yep, sunxi platforms could be hit by this bug, but it seems nobody
> decided to design a board with an SLC NAND (and MLCs are not supporting
> subpage writes).
>
>>
>> Anyway, I think this patch is helpful, because it prevents drivers from
>> having to fill in a 'subpage' write callback that looks just like their
>> write_page() callback.
>
> I agree.

Fine with me then.
Helmut
