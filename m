Received: from mail-pb0-f49.google.com ([209.85.160.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SPS0N-00033n-3C
 for linux-mtd@lists.infradead.org; Wed, 02 May 2012 05:21:36 +0000
Received: by pbbrq13 with SMTP id rq13so573902pbb.36
 for <linux-mtd@lists.infradead.org>; Tue, 01 May 2012 22:21:32 -0700 (PDT)
Date: Wed, 2 May 2012 13:21:26 +0800
From: Shawn Guo <shawn.guo@linaro.org>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH v2 1/3] mtd: gpmi: add device tree support for mx6q and
 mx28
Message-ID: <20120502052124.GX2194@S2101-09.ap.freescale.net>
References: <1335323184-11233-1-git-send-email-b32955@freescale.com>
 <1335323184-11233-2-git-send-email-b32955@freescale.com>
 <20120501074943.GB2194@S2101-09.ap.freescale.net>
 <4FA0A0ED.7070804@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4FA0A0ED.7070804@freescale.com>
Cc: linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, May 02, 2012 at 10:50:21AM +0800, Huang Shijie wrote:
> Hi Shawn:
> 
> thanks a lot for your review.
> >You are adding device tree support into a driver that is working fine
> >for non-DT probe.  So before all the users of this driver are converted
> >to DT, you have to ensure the driver works for both non-DT and DT users
> >in a single image when you add DT support for it.
> The current gpmi-nand driver can not work in the non-DT, as you
> known, there are
> several patches which are not accepted to you.
> 
> So, does it make sense to still maintain the support for non-DT?
> 
> So i prefer to convert the gpmi-nand to a pure DT driver. make the
> code clear and simple.
> 
Yeah, I'm fine with that.

-- 
Regards,
Shawn
