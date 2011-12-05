Received: from mail-lpp01m010-f49.google.com ([209.85.215.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RXSNn-00017d-KW
 for linux-mtd@lists.infradead.org; Mon, 05 Dec 2011 06:50:36 +0000
Received: by laai10 with SMTP id i10so1302111laa.36
 for <linux-mtd@lists.infradead.org>; Sun, 04 Dec 2011 22:50:33 -0800 (PST)
Subject: Re: [PATCH 1/3] mtd/nand : use elbc_fcm_ctrl->oob to set FPAR_MS
 bit of FPAR
From: Artem Bityutskiy <dedekind1@gmail.com>
To: shuo.liu@freescale.com
Date: Mon, 05 Dec 2011 08:50:29 +0200
In-Reply-To: <1322973098-2528-1-git-send-email-shuo.liu@freescale.com>
References: <1322973098-2528-1-git-send-email-shuo.liu@freescale.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1323067832.2316.31.camel@koala>
Mime-Version: 1.0
Cc: Artem.Bityutskiy@nokia.com, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 scottwood@freescale.com, akpm@linux-foundation.org, leoli@freescale.com,
 dwmw2@infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2011-12-04 at 12:31 +0800, shuo.liu@freescale.com wrote:
> From: Liu Shuo <b35362@freescale.com>
> 
> On both of large-page chip and small-page chip, we always should use
> 'elbc_fcm_ctrl->oob' to set the FPAR_LP_MS/FPAR_SP_MS bit of FPAR, don't
> use a overflowed 'column' to set it.
> 
> Signed-off-by: Liu Shuo <b35362@freescale.com>
> Signed-off-by: Li Yang <leoli@freescale.com>

Pushed patches 1 and 2 to l2-mtd-2.6.git, thanks!

Artem.
