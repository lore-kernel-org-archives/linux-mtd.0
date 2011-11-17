Subject: Re: Missing patches for pxa3xx_nand
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Daniel Mack <zonque@gmail.com>
Date: Thu, 17 Nov 2011 23:13:59 +0200
In-Reply-To: <4EB7C084.4060706@gmail.com>
References: <4EB7C084.4060706@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1321564441.2272.1.camel@koala>
Mime-Version: 1.0
Cc: Lei Wen <leiwen@marvell.com>, Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
 linux-mtd@lists.infradead.org, David Woodhouse <David.Woodhouse@intel.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2011-11-07 at 12:27 +0100, Daniel Mack wrote:
> Hi,
> 
> In June, there have been important patches submitted for the pxa3xx_nand 
> driver after it was broken by Lei's rework series. These patches were 
> discussed in June, and they are present in
> 
>    git://git.infradead.org/mtd-2.6.git linux-fallback
> 
> but not in the master branch of the same git. Also, they have not been 
> merged to Linus' master tree which renders the pxa3xx_nand driver 
> unusable in 3.0 and 3.1.
> 
> A selection of the patches I'm talking about are titled
> 
>    mtd: pxa3xx_nand: Fix blank page ECC mismatch
>    mtd: pxa3xx_nand: fix nand detection issue
>    mtd: pxa3xx_nand don't specify default parsing options

All three patches have been merged upstreem, you should have looked at
the l2-mtd-2.6.git tree or linux-next as well.

Artem.
