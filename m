Date: Tue, 22 Mar 2016 14:47:28 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Cc: dwmw2@infradead.org, computersforpeace@gmail.com,
 matthias.bgg@gmail.com, robh@kernel.org, linux-mtd@lists.infradead.org,
 xiaolei.li@mediatek.com, daniel.thompson@linaro.org, erin.lo@mediatek.com,
 linux-mediatek@lists.infradead.org
Subject: Re: [RFCv2 0/2] MTK Smart Device Gen1 NAND Driver
Message-ID: <20160322144728.0a1d8ecf@bbrezillon>
In-Reply-To: <1458653560-2679-1-git-send-email-jorge.ramirez-ortiz@linaro.org>
References: <1458653560-2679-1-git-send-email-jorge.ramirez-ortiz@linaro.org>
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

Hi Jorge,

On Tue, 22 Mar 2016 09:32:38 -0400
Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org> wrote:

> Fixes/Changes on v2 relative to: 
> --------------------------------
> 
>   tree		: https://github.com/bbrezillon/linux-0day
>   branch	: nand/ecclayout
>   commit	:
>  		commit eafabf3b93f5ba796081d1beab3b9ed0dea40a9a
> 		Author: Boris Brezillon <boris.brezillon@free-electrons.com>
> 		Date:	Thu Feb 4 10:16:18 2016 +0100
> 
> 		mtd: kill the nand_ecclayout struct
> 
>   RFC v2:

You can drop the RFC prefix for your next version (the driver does not
look bad, and it's definitely not an RFC ;)). Just prefix your patches
with "PATCH vX".

Best Regards,

Boris

-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
