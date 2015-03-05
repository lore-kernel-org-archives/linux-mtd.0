Date: Thu, 5 Mar 2015 14:08:43 +0100
From: Antoine Tenart <antoine.tenart@free-electrons.com>
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: Re: [PATCH v3 5/9] mtd: pxa3xx_nand: add support for the Marvell
 Berlin nand controller
Message-ID: <20150305130843.GC5265@kwain>
References: <1425555085-29531-1-git-send-email-antoine.tenart@free-electrons.com>
 <1425555085-29531-6-git-send-email-antoine.tenart@free-electrons.com>
 <20150305140000.39081aa8@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20150305140000.39081aa8@free-electrons.com>
Cc: zmxu@marvell.com, boris.brezillon@free-electrons.com,
 Antoine Tenart <antoine.tenart@free-electrons.com>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 ezequiel.garcia@free-electrons.com, jszhang@marvell.com,
 computersforpeace@gmail.com, dwmw2@infradead.org,
 linux-arm-kernel@lists.infradead.org, sebastian.hesselbarth@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Thomas,

On Thu, Mar 05, 2015 at 02:00:00PM +0100, Thomas Petazzoni wrote:
> On Thu,  5 Mar 2015 12:31:21 +0100, Antoine Tenart wrote:
> 
> >  struct pxa3xx_nand_host {
> > @@ -253,6 +258,12 @@ static struct pxa3xx_nand_flash builtin_flash_types[] = {
> >  { "512MiB 8-bit",  0xdc2c,  64, 2048,  8,  8, 4096 },
> >  { "512MiB 16-bit", 0xcc2c,  64, 2048, 16, 16, 4096 },
> >  { "256MiB 16-bit", 0xba20,  64, 2048, 16, 16, 2048 },
> > +{ }
> > +};
> > +
> > +static struct pxa3xx_nand_flash berlin_builtin_flash_types[] = {
> > +{ "4GiB 8-bit",    0xd7ec, 128, 8192,  8,  8, 4096 },
> > +{ },
> 
> This looks fishy. You know have two different definitions for the exact
> same chip_id. In the builtin_flash_types[] array:
> 
> { "4GiB 8-bit",    0xd7ec, 128, 4096,  8,  8, 8192 },
> 
> and in your new berlin_builtin_flash_types[] array:
> 
> { "4GiB 8-bit",    0xd7ec, 128, 8192,  8,  8, 4096 },
> 
> So you have twice a big pages, and twice as less blocks. Are you sure
> about your definition of the 0xd7ec NAND chip_id ?
> 
> Why cannot you use the same data for both the Berlin platform and the
> platforms already supported by the driver? Are you sure your NAND isn't
> using 4k pages ? Or maybe the 0xd7ec entry in builtin_flash_types[] is
> incorrect?
> 
> Or maybe like
> http://lists.infradead.org/pipermail/linux-mtd/2010-June/031159.html,
> the NAND chip_id is the same, but the NAND ext id is different.
> 
> Is there no common NAND mechanism to handle this, rather than having
> this specifically in the driver?

I totally agree, this is one more thing wrong with this driver. Using a
ext id would solve the issue here.

If a NULL table is given to the nand_get_flash_type() function, then the
nand_flash_ids is used. This should be handled this way.

Antoine

-- 
Antoine Ténart, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
