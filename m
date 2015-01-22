Received: from mail-pd0-x22c.google.com ([2607:f8b0:400e:c02::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YEDOk-0002Ft-HA
 for linux-mtd@lists.infradead.org; Thu, 22 Jan 2015 08:45:55 +0000
Received: by mail-pd0-f172.google.com with SMTP id v10so444854pde.3
 for <linux-mtd@lists.infradead.org>; Thu, 22 Jan 2015 00:45:33 -0800 (PST)
Date: Thu, 22 Jan 2015 00:45:29 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Zhou Wang <wangzhou1@hisilicon.com>
Subject: Re: [PATCH v4 0/2] mtd: hisilicon: add a new driver for NAND
 controller of hisilicon hip04 Soc
Message-ID: <20150122084529.GC3268@brian-ubuntu>
References: <1415105221-7732-1-git-send-email-wangzhou.bry@gmail.com>
 <20141130090853.GG3608@norris-Latitude-E6410>
 <548987D3.3060407@gmail.com> <20141217062333.GD7112@brian-ubuntu>
 <5491638B.5090403@gmail.com> <20150113041701.GM9759@ld-irv-0074>
 <54C06E05.9050205@hisilicon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <54C06E05.9050205@hisilicon.com>
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

Hi Zhou,

On Thu, Jan 22, 2015 at 11:27:01AM +0800, Zhou Wang wrote:
> Very sorry for late, I made tests again and also had a talk with the
> NAND controller hardware colleague. Please find my reply below.

No problem. Glad to hear you followed through on this one, as the
results were curious.

> On 2015/1/13 12:17, Brian Norris wrote:
> > On Wed, Dec 17, 2014 at 07:05:47PM +0800, Zhou Wang wrote:
> >> On 2014年12月17日 14:23, Brian Norris wrote:
> > [...]
> >>>> [  104.648056] mtd_nandbiterrs: ECC failure, read data is incorrect
> >>>> despite read success
> >>>> insmod: can't insert 'mtd_nandbiterrs.ko': Input/output error
[...]
> I made testes again in 1bit/ECC and 16bit/ECC modes using 2K(page)+64B(oob)
> NAND flash. here are the logs, I also printed ECC code in OOB area.
> 
> Results are:
> 1. in 16bit/ECC, it will return -EBADMSG as the ECC codes have been broken.
> 2. in 1bit/ECC, it will not reture -EBADMSG because a hardware design problem.
>    I will explain the detail below.
> 
> Test logs:
> 1. in 16bit/ECC(print ECC codes):
> 
> /home # insmod mtd_nandbiterrs.ko dev=2 page_offset=1 seed=110 mode=0

...

> mtd_nandbiterrs: error: read failed at 0x800
> mtd_nandbiterrs: After 1 biterrors per subpage, read reported error -74

^^^ Ah, that's what I would expect from a driver that doesn't implement
the raw() functions.

> mtd_nandbiterrs: finished successfully.
> ==================================================
> insmod: can't insert 'mtd_nandbiterrs.ko': Input/output error
> 
> 2. in 1bit/ECC(print ECC codes):
> /home # insmod mtd_nandbiterrs.ko dev=2 page_offset=1 seed=110 mode=0

...

> mtd_nandbiterrs: ECC failure, read data is incorrect despite read success
> insmod: can't insert 'mtd_nandbiterrs.ko': Input/output error
> 
> Reason about above 1bit/ECC test result:

...

> It can not correct this kind of 2bit errors in 1bit/ECC mode in this NAND
> controller, however, it will trigger a correctable interrupt. As a result,
> software can not find this 1bit error in page data.

IOW, uncorrectable errors are getting reported as corrected bitflips?
That does sound bad.

> This is a hardware problem of this NAND controller.
> I plan to remove the 1bit/ECC mode support in patch of next version.

OK, sounds good. 1-bit HW ECC is not really very useful these days
anyway, if your higher-bit ECC can serve to replace it. Can the ECC
bytes still fit in the same spare area, though?

> > Are you saying you cannot implement the raw() hooks for this IP? Or just
> > that you haven't yet? The latter is probably OK for now (I'd recommend
> > doing this, or at least mark a TODO in the code), but the former is a
> > little disturbing.
> 
> The function of raw() hooks is just writing the page data to flash, is this right?

Right, just data (and OOB, if calling the _oob_ functions) without any
ECC parity bytes.

> In none ECC mode, it can write page date alone to flash. But in ECC mode, NAND
> controller will produce related ECC code automatically, write page data and ECC code
> to flash. In ECC mode, it can not write page date alone to flash for this NAND controller.

Perhaps you can switch between ECC mode and non-ECC mode?

At any rate, this isn't absolutely required.

> As a result, the nandbiterrs test can not pass.
> 
> I don't know if I have explained these two problems clearly. If still have something
> confused, please let me know.

Brian
