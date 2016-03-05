Received: from mail-pf0-x22c.google.com ([2607:f8b0:400e:c00::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ac0c8-0003GS-SB
 for linux-mtd@lists.infradead.org; Sat, 05 Mar 2016 01:02:37 +0000
Received: by mail-pf0-x22c.google.com with SMTP id x188so20385028pfb.2
 for <linux-mtd@lists.infradead.org>; Fri, 04 Mar 2016 17:02:16 -0800 (PST)
Date: Fri, 4 Mar 2016 17:02:13 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: "Franklin S Cooper Jr." <fcooper@ti.com>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 linux-mtd@lists.infradead.org, daniel.thompson@linaro.org,
 xiaolei.li@mediatek.com,
 Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Subject: Re: [PATCH] mtd: nand: tests: fix regression introduced in
 mtd_nandectest
Message-ID: <20160305010213.GI55664@google.com>
References: <1456866240-26119-1-git-send-email-jorge.ramirez-ortiz@linaro.org>
 <20160301221755.093f5223@bbrezillon> <56D70BBB.1020004@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <56D70BBB.1020004@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Mar 02, 2016 at 09:50:19AM -0600, Franklin S Cooper Jr. wrote:
> On 03/01/2016 03:17 PM, Boris Brezillon wrote:
> > On Tue,  1 Mar 2016 16:04:00 -0500
> > Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org> wrote:
> >
> >> Offending Commit: 6e94119 "mtd: nand: return consistent error codes in
> >> ecc.correct() implementations"
> >>
> >> The new error code was not being handled properly in double bit error
> >> detection.
> >>
> >> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
> > Reviewed-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> >
> > Thanks,
> >
> > Boris
> 
> We just encountered this problem and this patch fixed it.
> Tested-by: Franklin S Cooper Jr <fcooper@ti.com>

Thanks! Pushed to linux-mtd.git. I'll see about sending this to Linus
for v4.5 still, since the regression is in v4.5-rc1.

Regards,
Brian
