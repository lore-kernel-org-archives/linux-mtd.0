Date: Tue, 12 May 2015 16:39:43 +0200
From: Antoine Tenart <antoine.tenart@free-electrons.com>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Subject: Re: [PATCH v5 05/12] mtd: pxa3xx_nand: rework flash detection and
 timing setup
Message-ID: <20150512143943.GC32171@kwain>
References: <1431356341-31640-1-git-send-email-antoine.tenart@free-electrons.com>
 <1431356341-31640-6-git-send-email-antoine.tenart@free-electrons.com>
 <555128F0.30702@vanguardiasur.com.ar>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <555128F0.30702@vanguardiasur.com.ar>
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

Ezequiel,

On Mon, May 11, 2015 at 07:10:56PM -0300, Ezequiel Garcia wrote:
> 
> On 05/11/2015 11:58 AM, Antoine Tenart wrote:
> [..]
> > -
> > -	/* calculate flash information */
> > -	host->read_id_bytes = (f->page_size == 2048) ? 4 : 2;
> > -
> 
> [..]
> > @@ -1732,6 +1669,7 @@ static int alloc_nand_resource(struct platform_device *pdev)
> >  		host->mtd = mtd;
> >  		host->cs = cs;
> >  		host->info_data = info;
> > +		host->read_id_bytes = 4;
> 
> Are you sure this is correct? The value is set according to the page
> size before this patch.

Before reading the ID, the pxa3xx driver uses a default configuration,
builtin_flash_types[0], which defines a page size of 2048 leading to set
host->read_id_bytes to 4.

I'm using this default value here.

There might be an issue, as host->read_id_bytes isn't updated after
reading the ID (and getting the actual page size). I don't know if this
can be a problem. I can modify pxa3xx_nand_config_flash() to update
host->read_id_bytes if needed. What do you think?

Antoine

-- 
Antoine Ténart, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
