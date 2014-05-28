Received: from mail-ig0-x232.google.com ([2607:f8b0:4001:c05::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WpmuT-00080T-J1
 for linux-mtd@lists.infradead.org; Wed, 28 May 2014 23:05:26 +0000
Received: by mail-ig0-f178.google.com with SMTP id hl10so3146478igb.11
 for <linux-mtd@lists.infradead.org>; Wed, 28 May 2014 16:05:04 -0700 (PDT)
Date: Wed, 28 May 2014 16:04:58 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH] mtd: gpmi: add gpmi support for imx6sx
Message-ID: <20140528230443.GG3599@ld-irv-0074>
References: <1395888202-24415-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1395888202-24415-1-git-send-email-b32955@freescale.com>
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Mar 27, 2014 at 10:43:22AM +0800, Huang Shijie wrote:
> The gpmi's IP for imx6sx is nearly the same as the gpmi's IP for imx6q,
> except the following two new features:
> 
>      (1) the new BCH contoller has 62-BIT correcting ECC strength
>             (The BCH for imx6q only has 40-BIT ECC strength).
> 
>      (2) add the hardware Randomizer support.
> 
> This patch does the follow changes:
> 
>      (1) add a new macro GPMI_IS_MX6SX to represent the imx6sx's gpmi.
> 
>      (2) add a new macro GPMI_IS_MX6.
>            We use this macro to initialize the same registers for both
>          imx6sx and imx6q, and so on.
> 
>      (3) add a new gpmi_devdata instance, the gpmi_devdata_imx6sx, for
>          imx6sx.
> 
> Signed-off-by: Huang Shijie <b32955@freescale.com>
> ---
> 
> This patch depends on the patch:
>    "mtd: gpmi: add gpmi_devdata{} to simplify the code"
>    http://lists.infradead.org/pipermail/linux-mtd/2014-March/052793.html

Pushed to l2-mtd.git. Thanks!

Brian
