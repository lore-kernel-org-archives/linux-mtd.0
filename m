Date: Wed, 14 Jan 2015 11:25:10 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Zhou Wang <wangzhou1@hisilicon.com>
Subject: Re: [PATCH v6 1/2] mtd: hisilicon: add a new NAND controller driver
 for hisilicon hip04 Soc
Message-ID: <20150114192510.GY9759@ld-irv-0074>
References: <1421047734-30818-1-git-send-email-wangzhou1@hisilicon.com>
 <1421047734-30818-2-git-send-email-wangzhou1@hisilicon.com>
 <20150113035844.GJ9759@ld-irv-0074>
 <54B6625F.8060607@hisilicon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <54B6625F.8060607@hisilicon.com>
Cc: devicetree@vger.kernel.org, liguozhu@hisilicon.com, xuwei5@hisilicon.com,
 linux-mtd@lists.infradead.org, haojian.zhuang@gmail.com, caizhiyong@huawei.com,
 yubingxu@hisilicon.com, David Woodhouse <dwmw2@infradead.org>,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jan 14, 2015 at 08:34:39PM +0800, Zhou Wang wrote:
> On 2015/1/13 11:58, Brian Norris wrote:
> > On Mon, Jan 12, 2015 at 03:28:53PM +0800, Zhou Wang wrote:
> >> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
> >> +	chip->IO_ADDR_R = chip->IO_ADDR_W = devm_ioremap_resource(dev, res);
> > 
> > Hmm, do you really have to reuse IO_ADDR_{R,W} here? Those are only
> > targeted for NAND systems which have a direct MMIO mapping to the NAND
> > I/O pins. See nand_base's {read,write}_buf() and read_{byte,word}()
> > implementations. But you override those.
> 
> There is a hardware buffer in this NAND controller, and the buffer can be
> accessed as MMIO.

Sure.

> IO_ADDR_R/W just indicates the base address of this buffer.

But I was noting that IO_ADDR_{R,W} actually serve a very particular
purpose in nand_base.c, which seems distinct from your HW buffer.

> Maybe I need to use a void __iomem pointer stored in my host struct to use
> this buffer instead of IO_ADDR_R/W as you said below here?

Yes, I think that would be better.

> > It's best if it's obvious if nand_base is somehow inadvertently using
> > these pointers. So leaving them NULL is helpful.
> > 
> > As an alternative, you can just stash another private void __iomem
> > pointer in you your host struct.

Thanks,
Brian
