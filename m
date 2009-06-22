Received: from mail-fx0-f212.google.com ([209.85.220.212])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MIgbp-0000Ls-Pg
	for linux-mtd@lists.infradead.org; Mon, 22 Jun 2009 10:18:48 +0000
Received: by fxm8 with SMTP id 8so3399565fxm.18
	for <linux-mtd@lists.infradead.org>;
	Mon, 22 Jun 2009 03:18:37 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1245183797-11469-1-git-send-email-s-paulraj@ti.com>
References: <1245183797-11469-1-git-send-email-s-paulraj@ti.com>
Date: Mon, 22 Jun 2009 14:18:37 +0400
Message-ID: <acd2a5930906220318j56ff6ef5s2a145b7ca9eb6091@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] NAND: Add new ECC mode - ECC_HW_OOB_FIRST
From: Vitaly Wool <vitalywool@gmail.com>
To: s-paulraj@ti.com
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: davinci-linux-open-source@linux.davincidsp.com,
	Sneha Narnakaje <nsnehaprabha@ti.com>,
	linux-mtd@lists.infradead.org, tglx@linutronix.de,
	dwmw2@infradead.org, akpm@linux-foundation.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jun 17, 2009 at 12:23 AM, <s-paulraj@ti.com> wrote:
> From: Sandeep Paulraj <s-paulraj@ti.com>
>
> The patch applies to linux-mtd GIT tree
>
> This patch adds the new mode NAND_ECC_HW_OOB_FIRST in the nand code to
> support 4-bit ECC on TI DaVinci devices with large page (up to 4K) NAND
> chips. This ECC mode is similar to NAND_ECC_HW, with the exception of
> read_page API that first reads the OOB area, reads the data in chunks, feeds
> the ECC from OOB area to the ECC hw engine and perform any correction on the
> data as per the ECC status reported by the engine.
>
> "ECC_HW_OOB_FIRST" name suggested by Thomas Gleixner

What I'd like to state is that we're starting to have so many
HW_OOB_XXX variants that it gets ridiculous. I'm sure we've come to a
point where we need to reconsider the base method for handing data and
ECC. Especially given the DMA capabilities of the most modern NAND
controllers.

Thanks,
   Vitaly
