Date: Sun, 8 Feb 2015 00:35:14 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Zhou Wang <wangzhou1@hisilicon.com>
Subject: Re: [PATCH v8 0/2] mtd: hisilicon: add a new driver for NAND
 controller of hisilicon hip04 Soc
Message-ID: <20150208083514.GD3670@norris-Latitude-E6410>
References: <1422183194-10148-1-git-send-email-wangzhou1@hisilicon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1422183194-10148-1-git-send-email-wangzhou1@hisilicon.com>
Cc: devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 liguozhu@hisilicon.com, xuwei5@hisilicon.com, linux-mtd@lists.infradead.org,
 haojian.zhuang@gmail.com, caizhiyong@huawei.com, yubingxu@hisilicon.com,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Jan 25, 2015 at 06:53:12PM +0800, Zhou Wang wrote:
> This patchset adds the support for NAND controller of hisilicon hip04 Soc.
> The NAND controller IP was developed by hisilicon and needs a new driver to
> support it. This patchset is based on l2-mtd/master.
> 
> I have tested this NAND flash controller driver in Hip04 D01 board using MTD
> test modules. All testes passed except mtd_nandbiterrs. The reason is that this
> NAND controller doesn't support to write raw page in ECC mode. In the test of
> mtd_nandbiterrs, when rewriting raw page(with some bits changed) back, this NAND
> controller will also produce ECC codes and write into NAND flash OOB area. As
> ECC codes in OOB area have been broken, read error comes out as follow.
> 
> Hi Brian,
> 
> As the patch have been reviewed for some time, could you consider to take this
> driver for v3.20? If there is something still not good, please let me know.

It's all looking good. Pushed to l2-mtd.git, probably for 3.20. I have
one or two small comments that may be worth thinking about though.

Brian
