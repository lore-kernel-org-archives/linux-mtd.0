Date: Wed, 20 May 2015 16:08:32 +0200
From: Antoine Tenart <antoine.tenart@free-electrons.com>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Subject: Re: [PATCH v5 00/12] ARM: berlin: add nand support
Message-ID: <20150520140832.GO22054@kwain>
References: <1431356341-31640-1-git-send-email-antoine.tenart@free-electrons.com>
 <5557B8AF.9090703@vanguardiasur.com.ar>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5557B8AF.9090703@vanguardiasur.com.ar>
Cc: zmxu@marvell.com, boris.brezillon@free-electrons.com,
 Antoine Tenart <antoine.tenart@free-electrons.com>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 jszhang@marvell.com, computersforpeace@gmail.com, dwmw2@infradead.org,
 linux-arm-kernel@lists.infradead.org, sebastian.hesselbarth@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, May 16, 2015 at 06:37:51PM -0300, Ezequiel Garcia wrote:
> Hi Antoine,
> 
> This is a long patchset, which involves some very invasive changes
> to the driver. So, I think it'll be better to split it in different
> patchsets.
> 
> On 05/11/2015 11:58 AM, Antoine Tenart wrote:
> [..]
> > 
> > Antoine Tenart (12):
> 
> These two clock patches are related to Berlin support only.
> 
> >   mtd: pxa3xx_nand: add a non mandatory ECC clock
> >   Documentation: bindings: document the clocks for pxa3xx-nand
> 
> The next four patches rework the timing setup and remove the legacy
> device detection. I think we should try to get them merged in first place.
> 
> >   mtd: pxa3xx_nand: add a default chunk size
> >   mtd: pxa3xx_nand: add helpers to setup the timings
> >   mtd: pxa3xx_nand: rework flash detection and timing setup
> >   mtd: pxa3xx_nand: clean up the pxa3xx timings
> 
> Next one just adds support for a new device. It has little to do with
> the series. I already replied about using JEDEC ID; once we solve that,
> I suggest that you submit this patch alone.
> 
> >   mtd: nand: add Samsung K9GBG08U0A-M to nand_ids table
> 
> And finally, once we solve the timing rework, we can go through Berlin
> support.
> 
> >   mtd: pxa3xx_nand: add support for the Marvell Berlin nand controller
> >   Documentation: bindings: add the Berlin nand controller compatible
> >   mtd: nand: let Marvell Berlin SoCs select the pxa3xx driver
> >   ARM: berlin: add BG2Q node for the nand
> >   ARM: berlin: enable flash on the BG2Q DMP
> > 
> 
> What do you think?

So we'd have 3 series:
- Timing rework.
- Berlin stuff.
- Samsung K9GBG08U0A-M support.

I'm OK with splitting the series to ease the review process :)

Antoine

-- 
Antoine Ténart, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
