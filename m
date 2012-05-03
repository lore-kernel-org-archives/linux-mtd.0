Received: from mail-lpp01m010-f49.google.com ([209.85.215.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SPwwO-000313-6u
 for linux-mtd@lists.infradead.org; Thu, 03 May 2012 14:23:32 +0000
Received: by lagy4 with SMTP id y4so1568740lag.36
 for <linux-mtd@lists.infradead.org>; Thu, 03 May 2012 07:23:30 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAMiH66EBO-MHXBb1eB4NMAJo6nPN47_42jYNGUGc=GC7oejPWQ@mail.gmail.com>
References: <1335939209-15625-1-git-send-email-b32955@freescale.com>
 <20120502144008.GF2194@S2101-09.ap.freescale.net>
 <1336042485.13013.41.camel@sauron.fi.intel.com>
 <CAAQ0ZWSxNxtF6_1+5NDqR_ry++gKbbNLZHRSTXREG18P+kQL3w@mail.gmail.com>
 <CAMiH66EBO-MHXBb1eB4NMAJo6nPN47_42jYNGUGc=GC7oejPWQ@mail.gmail.com>
Date: Thu, 3 May 2012 22:23:30 +0800
Message-ID: <CAAQ0ZWSqF9x7PSqS_14CscdU+RvcYg8pCFZUqLtDAq8uS_k=yw@mail.gmail.com>
Subject: Re: [PATCH v3] mtd: gpmi: add device tree support for mx6q and mx28
From: Shawn Guo <shawn.guo@linaro.org>
To: Huang Shijie <shijie8@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 3 May 2012 22:14, Huang Shijie <shijie8@gmail.com> wrote:
> It's better that this patch is merged by l2-mtd, because this patch
> depends on another patch which is
> on the l2-mtd now.
>
But you patch has to be based on mxs-dma DT support to function.
Maybe we should wait for the next merge window?

Regards,
Shawn
