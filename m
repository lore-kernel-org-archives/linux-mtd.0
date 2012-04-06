Received: from mail-iy0-f177.google.com ([209.85.210.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SG326-0004Sj-KJ
 for linux-mtd@lists.infradead.org; Fri, 06 Apr 2012 06:52:32 +0000
Received: by iaky10 with SMTP id y10so3432285iak.36
 for <linux-mtd@lists.infradead.org>; Thu, 05 Apr 2012 23:52:28 -0700 (PDT)
Date: Fri, 6 Apr 2012 14:53:05 +0800
From: Shawn Guo <shawn.guo@linaro.org>
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v8 4/4] ARM: mxs/mx28evk: add GPMI-NAND device
Message-ID: <20120406065302.GN7264@S2101-09.ap.freescale.net>
References: <1314169643-23425-1-git-send-email-b32955@freescale.com>
 <1314169643-23425-5-git-send-email-b32955@freescale.com>
 <CAOMZO5D_ACi73J0QfXoJmvyw6fBMrQfyoKLkK2P+-kMm5EzaDQ@mail.gmail.com>
 <20120405010829.GG7264@S2101-09.ap.freescale.net>
 <CAOMZO5ACk06aFWmmH0ZXCf6XoLaShwUaoAW0jHKmDTsJ0v027A@mail.gmail.com>
 <20120405012343.GH7264@S2101-09.ap.freescale.net>
 <CAOMZO5D2v4-ZoUXEhn7-Z7oSJ190egpkWGLkbaVzkjU5=HCNVA@mail.gmail.com>
 <20120406023121.GK7264@S2101-09.ap.freescale.net>
 <CAOMZO5Dr+qVMOpG6T03L-+i6qYkJRPUPT87hcJAs6DxHs+EcmA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOMZO5Dr+qVMOpG6T03L-+i6qYkJRPUPT87hcJAs6DxHs+EcmA@mail.gmail.com>
Cc: dedekind1@gmail.com, s.hauer@pengutronix.de, w.sang@pengutronix.de,
 Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org,
 Sam Gandhi <samgandhi9@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Apr 06, 2012 at 02:49:05AM -0300, Fabio Estevam wrote:
> On Thu, Apr 5, 2012 at 11:31 PM, Shawn Guo <shawn.guo@linaro.org> wrote:
> 
> > I have to do that to motivate people to add DT support for the drivers
> > they submit from the beginning.
> 
> Understand your point for new drivers.
> 
> If you take the GPMI driver for example: it has been available for a
> long time and there is no board using it in mainline.
> 
> So how can people easily test it and find bugs with this driver?
> Patching their own trees themselves? Sam Gandhi did extensive tests on
> NAND and found some DMA issues with it.
> 
Look, people can still test and find issue with no board in mainline
using it.

> If we could have mx28evk supporting GPMI driver today it would
> estimulate people to use it and more issues can be found and fixed.
> 
> Waiting for DT support to be in place is just blocking the progress for mx28.
> 
Please tell me what are exactly being blocked there.

> Please note that right now there is no dt support for mx28 in mainline.
> 
There are still no spi-mxs driver in mainline, why are you sending me
spi board file patches?

> If what blocks this patch "ARM: mxs/mx28evk: add GPMI-NAND device" to
> be accepted is the pin mux conflict, that would be easy to fix and
> Huang could do a v5 if you agree.
> 
We had the discussion and agreed that migrating to pinctrl subsystem is
the right solution.  I will be more than happy to accept if someone
send me mxs pinctrl support rather than any "easy" fix.

> > Also I do not see much point to keep patching board files which are
> > to be removed.
> 
> I understand your point, but again, right now there is no dt support,
> so the only mechanism we have to register driver is via board files
> for mx28.
> 
> So it would be nice if you could still accept patches for mx28 while
> mx28 dt does not show up in mainline.

I could accept your spi board file patch when spi-mxs driver hit
mainline while mx28 dt does not.

-- 
Regards,
Shawn
