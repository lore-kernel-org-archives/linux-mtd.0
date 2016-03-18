Date: Fri, 18 Mar 2016 15:24:27 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Cc: dwmw2@infradead.org, computersforpeace@gmail.com,
 matthias.bgg@gmail.com, robh@kernel.org, daniel.thompson@linaro.org,
 xiaolei.li@mediatek.com, linux-mtd@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 2/3] mtd: mediatek: driver for MTK Smart Device Gen1 NAND
Message-ID: <20160318152427.672c3957@bbrezillon>
In-Reply-To: <56EC09F5.5020704@linaro.org>
References: <1456938013-8819-1-git-send-email-jorge.ramirez-ortiz@linaro.org>
 <1456938013-8819-3-git-send-email-jorge.ramirez-ortiz@linaro.org>
 <20160308172437.6eccce05@bbrezillon> <56E08112.7040201@linaro.org>
 <20160309214348.5aa78af5@bbrezillon> <56EC09F5.5020704@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 18 Mar 2016 10:00:21 -0400
Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org> wrote:

> On 03/09/2016 03:43 PM, Boris Brezillon wrote:
> > On Wed, 9 Mar 2016 15:01:22 -0500
> > Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org> wrote:
> >
> >> On 03/08/2016 11:24 AM, Boris Brezillon wrote:
> >>>> +	switch (mtd->writesize) {
> >>>>> +	case KB(2):
> >>>>> +		fmt = PAGEFMT_512_2K;
> >>>>> +		chip->ecc.layout = &nand_2k_64;
> >>>>> +		break;
> >>>>> +	case KB(4):
> >>>>> +		fmt = PAGEFMT_2K_4K;
> >>>>> +		chip->ecc.layout = &nand_4k_128;
> >>>>> +		break;
> >>>>> +	case KB(8):
> >>>>> +		fmt = PAGEFMT_4K_8K;
> >>>>> +		break;
> >>>>> +	default:
> >>>>> +		dev_err(dev, "invalid page size: %d\n", mtd->writesize);
> >>>>> +		return -EINVAL;
> >>>>> +	}
> >>> ecclayout info should be exposed through mtd_ooblayout_ops now.
> >>>
> >> do you have an approximate date for when this interface will be merged in
> >> git://git.infradead.org/l2-mtd.git?
> >>
> > Should be ready for 4.7, in the meantime you can base your work on my
> > branch [1] (which is based on l2-mtd/master).
> >
> > [1]https://github.com/bbrezillon/linux-0day/tree/nand/ecclayout
> 
> 
> hi Boris, just a quick one, please could you confirm that you would like to see
> the RFC v2 patch-set for this driver based on this branch?

Yes, I confirm you can base your work on this tree.

> or should we rebase on some other tree?

You may have to rebase on a different tree after 4.6-rc1 is out though.

-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
