Received: from mail-pz0-f49.google.com ([209.85.210.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SWHcY-0001lG-Lj
 for linux-mtd@lists.infradead.org; Mon, 21 May 2012 01:41:15 +0000
Received: by dadm1 with SMTP id m1so7038583dad.36
 for <linux-mtd@lists.infradead.org>; Sun, 20 May 2012 18:41:12 -0700 (PDT)
Date: Mon, 21 May 2012 09:41:23 +0800
From: Shawn Guo <shawn.guo@linaro.org>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH 1/4] GPMI-NAND: Define ecc.strength
Message-ID: <20120521014121.GO5427@S2101-09.ap.freescale.net>
References: <1337562140-5739-1-git-send-email-marex@denx.de>
 <20120521011455.GL5427@S2101-09.ap.freescale.net>
 <201205210336.41860.marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <201205210336.41860.marex@denx.de>
Cc: Fabio Estevam <fabio.estevam@freescale.com>,
 Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, May 21, 2012 at 03:36:41AM +0200, Marek Vasut wrote:
> Dear Shawn Guo,
> 
> > So non-DT probe has the same issue?  Or this is a DT probe only issue?
> 
> I started using DT, so I'm now fixing everything to work like it used to. Damn 
> this DT conversion broke about everything.
> 
So you are saying the issue is introduced by gpmi-nand DT conversion?

-- 
Regards,
Shawn
