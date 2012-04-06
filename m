Received: from mail-gy0-f177.google.com ([209.85.160.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SG9U3-0005ry-Ix
 for linux-mtd@lists.infradead.org; Fri, 06 Apr 2012 13:45:48 +0000
Received: by ghbf11 with SMTP id f11so1450565ghb.36
 for <linux-mtd@lists.infradead.org>; Fri, 06 Apr 2012 06:45:46 -0700 (PDT)
Date: Fri, 6 Apr 2012 21:46:02 +0800
From: Shawn Guo <shawn.guo@linaro.org>
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v8 4/4] ARM: mxs/mx28evk: add GPMI-NAND device
Message-ID: <20120406134600.GQ7264@S2101-09.ap.freescale.net>
References: <1314169643-23425-5-git-send-email-b32955@freescale.com>
 <CAOMZO5D_ACi73J0QfXoJmvyw6fBMrQfyoKLkK2P+-kMm5EzaDQ@mail.gmail.com>
 <20120405010829.GG7264@S2101-09.ap.freescale.net>
 <CAOMZO5ACk06aFWmmH0ZXCf6XoLaShwUaoAW0jHKmDTsJ0v027A@mail.gmail.com>
 <20120405012343.GH7264@S2101-09.ap.freescale.net>
 <CAOMZO5D2v4-ZoUXEhn7-Z7oSJ190egpkWGLkbaVzkjU5=HCNVA@mail.gmail.com>
 <20120406023121.GK7264@S2101-09.ap.freescale.net>
 <CAOMZO5Dr+qVMOpG6T03L-+i6qYkJRPUPT87hcJAs6DxHs+EcmA@mail.gmail.com>
 <20120406065302.GN7264@S2101-09.ap.freescale.net>
 <CAOMZO5Ab=cdOevjBhEyQtxVo3mEuoq7xy0auGinUoyh-TddTDw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOMZO5Ab=cdOevjBhEyQtxVo3mEuoq7xy0auGinUoyh-TddTDw@mail.gmail.com>
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

On Fri, Apr 06, 2012 at 10:16:48AM -0300, Fabio Estevam wrote:
> On Fri, Apr 6, 2012 at 3:53 AM, Shawn Guo <shawn.guo@linaro.org> wrote:
...
> > I could accept your spi board file patch when spi-mxs driver hit
> > mainline while mx28 dt does not.
> 
> Excellent, that's good news and we come to an agreement  :-) Thanks!

I'm pretty sure that imx28 dt patch from Dong Aisheng will hit mainline
with v3.5-rc1, which could be the earliest time for spi-mxs to hit
mainline.  In that case, I do not have any reason to take your board
file patch from there, so what's point of the while argument?

-- 
Regards,
Shawn
