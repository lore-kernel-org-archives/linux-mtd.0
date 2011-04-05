Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q75XR-0003Sk-0z
	for linux-mtd@lists.infradead.org; Tue, 05 Apr 2011 12:39:17 +0000
Received: by wwb39 with SMTP id 39so285603wwb.18
	for <linux-mtd@lists.infradead.org>;
	Tue, 05 Apr 2011 05:39:15 -0700 (PDT)
Subject: Re: [PATCH V7] MIPS: lantiq: add NOR flash support
From: Artem Bityutskiy <dedekind1@gmail.com>
To: John Crispin <blogic@openwrt.org>
In-Reply-To: <1302006830-10345-1-git-send-email-blogic@openwrt.org>
References: <1302006830-10345-1-git-send-email-blogic@openwrt.org>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 05 Apr 2011 15:36:35 +0300
Message-ID: <1302006995.2760.120.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>,
	Ralph Hempel <ralph.hempel@lantiq.com>, linux-mtd@lists.infradead.org,
	Daniel Schwierzeck <daniel.schwierzeck@googlemail.com>,
	David Woodhouse <dwmw2@infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2011-04-05 at 14:33 +0200, John Crispin wrote:
> +#include <lantiq_soc.h>
> +#include <lantiq_platform.h>
> +
> +/* 
> + * The NOR flash is connected to the same external bus unit (EBU) as PCI.
> + * To make PCI work we need to enable the endianess swapping for the address
> + * written to the EBU. This endianess swapping works for PCI correctly but
> + * fails for attached NOR devices. To workaround this we need to use a complex
> + * map. The workaround involves swapping all addresses whilste probing the chip.
> + * Once probing is complete we stop swapping the addresses but swizzle the
> + * unlock addresses to ensure that access to the NOR device works correctly.
> + */
> +
> +static int ltq_mtd_probing;
Disclamer: I do not really understand the PCI/swapping issue, even
though you wrote a comment about this, but still....

... I'm worried about this global variable. If you have multiple
instances of such NOR flash, then you theoretically may have a situation
when one of them is being probed, while another is being used for real.
And this single global switch will break the one which is used for real.

IOW, the right solution would be to have per-chip flag, not a global
flag.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
