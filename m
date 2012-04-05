Received: from mail-iy0-f177.google.com ([209.85.210.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SFbBA-0005Vd-Nk
 for linux-mtd@lists.infradead.org; Thu, 05 Apr 2012 01:08:01 +0000
Received: by iaky10 with SMTP id y10so1342792iak.36
 for <linux-mtd@lists.infradead.org>; Wed, 04 Apr 2012 18:07:59 -0700 (PDT)
Date: Thu, 5 Apr 2012 09:08:32 +0800
From: Shawn Guo <shawn.guo@linaro.org>
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v8 4/4] ARM: mxs/mx28evk: add GPMI-NAND device
Message-ID: <20120405010829.GG7264@S2101-09.ap.freescale.net>
References: <1314169643-23425-1-git-send-email-b32955@freescale.com>
 <1314169643-23425-5-git-send-email-b32955@freescale.com>
 <CAOMZO5D_ACi73J0QfXoJmvyw6fBMrQfyoKLkK2P+-kMm5EzaDQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOMZO5D_ACi73J0QfXoJmvyw6fBMrQfyoKLkK2P+-kMm5EzaDQ@mail.gmail.com>
Cc: dedekind1@gmail.com, s.hauer@pengutronix.de, w.sang@pengutronix.de,
 Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Apr 04, 2012 at 09:44:52PM -0300, Fabio Estevam wrote:
> Hi Shawn,
> 
> On Wed, Aug 24, 2011 at 4:07 AM, Huang Shijie <b32955@freescale.com> wrote:
> > add GPMI-NAND device for mx28evk board.
> >
> > Signed-off-by: Huang Shijie <b32955@freescale.com>
> 
> Can this one be applied now?
> 
No.

1) The pin confliction between gpmi and lcdif remains.
2) I intend to freeze the board file updates, as we are on the way to
   device tree.

So instead of patching board file, please contribute to device tree
conversion.

-- 
Regards,
Shawn
