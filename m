Received: from mail-yi0-f49.google.com ([209.85.218.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1Qsyvv-0003ky-8I
	for linux-mtd@lists.infradead.org; Mon, 15 Aug 2011 15:18:31 +0000
Received: by yic13 with SMTP id 13so3416655yic.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 15 Aug 2011 08:18:28 -0700 (PDT)
Subject: RE: [PATCH] mtd: nand: davinci: Add cpufreq support
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "Rajashekhara, Sudhakar" <sudhakar.raj@ti.com>
Date: Mon, 15 Aug 2011 18:20:07 +0300
In-Reply-To: <B85A65D85D7EB246BE421B3FB0FBB593024DE782F8@dbde02.ent.ti.com>
References: <1311241163-4576-1-git-send-email-sudhakar.raj@ti.com>
	<B85A65D85D7EB246BE421B3FB0FBB593024DE782F8@dbde02.ent.ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1313421612.8691.3.camel@sauron>
Mime-Version: 1.0
Cc: "dwmw2@infradead.org" <dwmw2@infradead.org>,
	"davinci-linux-open-source@linux.davincidsp.com"
	<davinci-linux-open-source@linux.davincidsp.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2011-08-02 at 12:03 +0530, Rajashekhara, Sudhakar wrote:
> Hi David,
> 
> On Thu, Jul 21, 2011 at 15:09:23, Rajashekhara, Sudhakar wrote:
> > This patch adds cpufreq support for NAND driver. During cpufreq
> > transition, 'davinci_aemif_setup_timing()' function will be called
> > to reconfigure that AEMIF timings for the new frequency.
> > 
> > Tested on TI DA850/OMAP-L138 EVM.
> > 
> > Signed-off-by: Rajashekhara, Sudhakar <sudhakar.raj@ti.com>
> 
> I have not seen any comments on this patch. Can you pull it in into your tree?

Would be nice to get a Tested-by or Acked-by from someone.

-- 
Best Regards,
Artem Bityutskiy
