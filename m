Received: from mail-yi0-f49.google.com ([209.85.218.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1Qsyxf-0003oR-EF
	for linux-mtd@lists.infradead.org; Mon, 15 Aug 2011 15:20:20 +0000
Received: by yic13 with SMTP id 13so3417955yic.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 15 Aug 2011 08:20:18 -0700 (PDT)
Subject: Re: [PATCH] mtd: nand: davinci: Add cpufreq support
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "Rajashekhara, Sudhakar" <sudhakar.raj@ti.com>
Date: Mon, 15 Aug 2011 18:21:57 +0300
In-Reply-To: <1311241163-4576-1-git-send-email-sudhakar.raj@ti.com>
References: <1311241163-4576-1-git-send-email-sudhakar.raj@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1313421722.8691.5.camel@sauron>
Mime-Version: 1.0
Cc: dwmw2@infradead.org, davinci-linux-open-source@linux.davincidsp.com,
	linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2011-07-21 at 15:09 +0530, Rajashekhara, Sudhakar wrote:
> This patch adds cpufreq support for NAND driver. During cpufreq
> transition, 'davinci_aemif_setup_timing()' function will be called
> to reconfigure that AEMIF timings for the new frequency.
> 
> Tested on TI DA850/OMAP-L138 EVM.
> 
> Signed-off-by: Rajashekhara, Sudhakar <sudhakar.raj@ti.com>
> ---
>  drivers/mtd/nand/davinci_nand.c |   54 +++++++++++++++++++++++++++++++++++++++
>  1 files changed, 54 insertions(+), 0 deletions(-)

Please, include re-send the patch with linux-omap in CC.

-- 
Best Regards,
Artem Bityutskiy
