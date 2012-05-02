Received: from mail-pb0-f49.google.com ([209.85.160.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SPaj6-0005i2-Pn
 for linux-mtd@lists.infradead.org; Wed, 02 May 2012 14:40:22 +0000
Received: by pbbrq13 with SMTP id rq13so1252424pbb.36
 for <linux-mtd@lists.infradead.org>; Wed, 02 May 2012 07:40:19 -0700 (PDT)
Date: Wed, 2 May 2012 22:40:12 +0800
From: Shawn Guo <shawn.guo@linaro.org>
To: Huang Shijie <b32955@freescale.com>, Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH v3] mtd: gpmi: add device tree support for mx6q and mx28
Message-ID: <20120502144008.GF2194@S2101-09.ap.freescale.net>
References: <1335939209-15625-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1335939209-15625-1-git-send-email-b32955@freescale.com>
Cc: linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, May 02, 2012 at 02:13:28PM +0800, Huang Shijie wrote:
> add gpmi support for mx6q.
> add DT support to mx6q and mx28.
> 
> Signed-off-by: Huang Shijie <b32955@freescale.com>

Hi Artem,

As the patch heavily depends on mxs device tree branch, I think it will
be easier to have it go through arm-soc tree.  If you agree, can you
please give your ack if the patch looks fine to you?

-- 
Regards,
Shawn
