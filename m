Received: from mail-pd0-f180.google.com ([209.85.192.180])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YJXnw-0006Ft-OJ
 for linux-mtd@lists.infradead.org; Fri, 06 Feb 2015 01:33:57 +0000
Received: by pdbft15 with SMTP id ft15so11307570pdb.11
 for <linux-mtd@lists.infradead.org>; Thu, 05 Feb 2015 17:33:35 -0800 (PST)
Date: Thu, 5 Feb 2015 17:33:31 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Zhou Wang <wangzhou1@hisilicon.com>
Subject: Re: [PATCH v4 0/2] mtd: hisilicon: add a new driver for NAND
 controller of hisilicon hip04 Soc
Message-ID: <20150206013331.GE30781@ld-irv-0074>
References: <1415105221-7732-1-git-send-email-wangzhou.bry@gmail.com>
 <20141130090853.GG3608@norris-Latitude-E6410>
 <548987D3.3060407@gmail.com> <20141217062333.GD7112@brian-ubuntu>
 <5491638B.5090403@gmail.com> <20150113041701.GM9759@ld-irv-0074>
 <54C06E05.9050205@hisilicon.com>
 <20150122084529.GC3268@brian-ubuntu> <54C4A71F.30200@hisilicon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <54C4A71F.30200@hisilicon.com>
Cc: mark.rutland@arm.com, Zhou Wang <wangzhou.bry@gmail.com>,
 Iwo Mergler <Iwo.Mergler@netcommwireless.com>, pawel.moll@arm.com,
 devicetree@vger.kernel.org, liguozhu@hisilicon.com,
 ijc+devicetree@hellion.org.uk, haojian.zhuang@gmail.com, robh+dt@kernel.org,
 linux-mtd@lists.infradead.org, xuwei5@hisilicon.com, galak@codeaurora.org,
 caizhiyong@huawei.com, yubingxu@hisilicon.com,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Jan 25, 2015 at 04:19:43PM +0800, Zhou Wang wrote:
> On 2015/1/22 16:45, Brian Norris wrote:
> > Perhaps you can switch between ECC mode and non-ECC mode?
> 
> I also tried to swith to non-ECC mode to implement raw_write, and it is easy to do this.
> 
> But, event we do this, it will bring me little help. The reason to implement raw_write is to
> run mtd_nandbiterrs correctly as the discussion above. However, this NAND controller writes
> data and ECC code to flash using different layouts in different modes.

Ugh, that's no fun. GPMI seems to do a similarly silly thing.

> So we should also read data
> and ECC code from flash, change related bits, then rewrite the data and ECC code to flash in none-ECC
> mode to run mtd_nandbiterrs. It is not easy to do this.
> 
> So my plan is not to implement raw_write hook if this function is just used in test.

OK. There may eventually be good reasons to do this still, but it's not
important right now.

Brian
