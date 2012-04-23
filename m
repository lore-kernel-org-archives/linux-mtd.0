Received: from mail-pz0-f43.google.com ([209.85.210.43])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SMIwl-00069k-PU
 for linux-mtd@lists.infradead.org; Mon, 23 Apr 2012 13:04:53 +0000
Received: by dadn15 with SMTP id n15so18947445dad.16
 for <linux-mtd@lists.infradead.org>; Mon, 23 Apr 2012 06:04:50 -0700 (PDT)
Date: Mon, 23 Apr 2012 21:05:42 +0800
From: Shawn Guo <shawn.guo@linaro.org>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH 3/3] mtd: gpmi: add device tree support for mx6q-arm2 and
 mx28evk
Message-ID: <20120423130539.GT26306@S2101-09.ap.freescale.net>
References: <1334913859-5314-1-git-send-email-b32955@freescale.com>
 <1334913859-5314-4-git-send-email-b32955@freescale.com>
 <20120423064334.GQ26306@S2101-09.ap.freescale.net>
 <4F950E81.8040706@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4F950E81.8040706@freescale.com>
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

On Mon, Apr 23, 2012 at 04:10:41PM +0800, Huang Shijie wrote:
> Do you mean I can merge the gpmi and bch into one device node such as :
> 
> gpmi-nand@xx {
> compatible = "fsl, mx28-gpmi-nand";
> reg = <xx>, <xx>;
> reg-names = "gpmi", "bch";
> 
> };
> 
Yes.  But you need to redefine GPMI_NAND_GPMI_REGS_ADDR_RES_NAME as
"gpmi" and GPMI_NAND_BCH_REGS_ADDR_RES_NAME as "bch".  That said,
the strings here must match the ones used in driver.

-- 
Regards,
Shawn
