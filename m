Received: from mail-lpp01m010-f49.google.com ([209.85.215.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SQ8G9-00048Z-Ar
 for linux-mtd@lists.infradead.org; Fri, 04 May 2012 02:28:42 +0000
Received: by lagy4 with SMTP id y4so2150921lag.36
 for <linux-mtd@lists.infradead.org>; Thu, 03 May 2012 19:28:38 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <4FA33B7A.3040504@freescale.com>
References: <1335939209-15625-1-git-send-email-b32955@freescale.com>
 <20120502144008.GF2194@S2101-09.ap.freescale.net>
 <1336042485.13013.41.camel@sauron.fi.intel.com>
 <CAAQ0ZWSxNxtF6_1+5NDqR_ry++gKbbNLZHRSTXREG18P+kQL3w@mail.gmail.com>
 <CAMiH66EBO-MHXBb1eB4NMAJo6nPN47_42jYNGUGc=GC7oejPWQ@mail.gmail.com>
 <CAAQ0ZWSqF9x7PSqS_14CscdU+RvcYg8pCFZUqLtDAq8uS_k=yw@mail.gmail.com>
 <4FA33B7A.3040504@freescale.com>
Date: Fri, 4 May 2012 10:28:38 +0800
Message-ID: <CAAQ0ZWTPhXNaMyFHyDnB4ez+VYpP=O1z8w-sYQiVspZSDBHuUw@mail.gmail.com>
Subject: Re: [PATCH v3] mtd: gpmi: add device tree support for mx6q and mx28
From: Shawn Guo <shawn.guo@linaro.org>
To: Huang Shijie <b32955@freescale.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-mtd@lists.infradead.org, Huang Shijie <shijie8@gmail.com>,
 linux-arm-kernel@lists.infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 4 May 2012 10:14, Huang Shijie <b32955@freescale.com> wrote:
> The mxs-dma is another driver (just as the pinctrl driver). I think it's
> better to do the job in parallel.
>
The problem is if the patch gets applied on mtd tree as it is, the
gpmi-nand will stop functioning on mtd tree.  Or you are fine with
that, since no in-tree board support is using the driver so far?  If
you are fine with that, I'm fine too.

Regards,
Shawn
