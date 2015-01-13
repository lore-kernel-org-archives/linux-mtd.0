Received: from mail-yh0-x236.google.com ([2607:f8b0:4002:c01::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YAsv1-0006Wc-EE
 for linux-mtd@lists.infradead.org; Tue, 13 Jan 2015 04:17:28 +0000
Received: by mail-yh0-f54.google.com with SMTP id c41so404228yho.13
 for <linux-mtd@lists.infradead.org>; Mon, 12 Jan 2015 20:17:05 -0800 (PST)
Date: Mon, 12 Jan 2015 20:17:01 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Zhou Wang <wangzhou.bry@gmail.com>
Subject: Re: [PATCH v4 0/2] mtd: hisilicon: add a new driver for NAND
 controller of hisilicon hip04 Soc
Message-ID: <20150113041701.GM9759@ld-irv-0074>
References: <1415105221-7732-1-git-send-email-wangzhou.bry@gmail.com>
 <20141130090853.GG3608@norris-Latitude-E6410>
 <548987D3.3060407@gmail.com> <20141217062333.GD7112@brian-ubuntu>
 <5491638B.5090403@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5491638B.5090403@gmail.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 Iwo Mergler <Iwo.Mergler@netcommwireless.com>, pawel.moll@arm.com,
 ijc+devicetree@hellion.org.uk, liguozhu@hisilicon.com,
 haojian.zhuang@gmail.com, wangzhou1@hisilicon.com, robh+dt@kernel.org,
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

Following up on this last comment from last year's thread:

On Wed, Dec 17, 2014 at 07:05:47PM +0800, Zhou Wang wrote:
> On 2014年12月17日 14:23, Brian Norris wrote:
[...]
> >>[  104.648056] mtd_nandbiterrs: ECC failure, read data is incorrect
> >>despite read success
> >>insmod: can't insert 'mtd_nandbiterrs.ko': Input/output error
> >>
> >>The reason for above failure is that:
> >>In ECC mode, when rewriting page data to NAND flash, the NAND
> >>controller will also produce ECC code and write them to NAND flash
> >>as well. So when we read data from NAND flash, there is no need to
> >>correct the error bit. We read what we write to the flash.
> >
> >BTW, your explanation doesn't seem quite right. The problem is that
> >even though mtd_read() didn't report errors, the data doesn't match
> >what's written. It's not that there was "no need to correct the error
> >bit".
> 
> Maybe I did not express clearly. In the nandbiterrs test, firstly
> write data to flash with ECC code in oob area, then change some bits
> and rewrite data to flash with old ECC code in oob area, at last read
> data out with ECC to test if the "error bits" can be corrected. My
> explanation is that in rewriting process NAND controller also produces
> new ECC code of the data and write both data and new ECC code to flash.
> So in next step we will get what was writen without "correction".

But we should at least get an -EBADMSG return status, right? If you're
"rewriting" the data, this should result in two sets of data written on
top of each other, which (depending on the flash layout charecteristics)
might turn up as a kind of logical AND of all the data+OOB. This is
"probably" not correctable.

But that last "probably" leaves room for the possibility you mentioned,
I guess; that the ECC code is just correcting the data to look like the
second set of (intentionally) erroneous data.

> >I'd recommend digging a little more to figure out what's wrong here. You
> >might need to instrument the nandbiterrs test. This is possibly
> 
> Thanks, I will do it.
> 
> >highlighting a driver bug [1].
> >
> >Brian
> >
> >[1] Besised simply that you didn't implement write_page_raw(). The
> >default nand_write_page_raw() implementation looks just like your
> >non-raw version.
> 
> Yes. In ECC mode, as the NAND controller must write page as a whole
> with ECC code, the default nand_write_page_raw() looks just like
> non-raw version.

Are you saying you cannot implement the raw() hooks for this IP? Or just
that you haven't yet? The latter is probably OK for now (I'd recommend
doing this, or at least mark a TODO in the code), but the former is a
little disturbing.

Brian
