Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1U5c9b-00031c-8x
 for linux-mtd@lists.infradead.org; Wed, 13 Feb 2013 13:13:40 +0000
Message-ID: <1360761230.12703.150.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] mtd: davinci_nand: Use managed resources
From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
To: Mrugesh Katepallewar <mrugesh.mk@ti.com>
Date: Wed, 13 Feb 2013 15:13:50 +0200
In-Reply-To: <1360233195-8575-1-git-send-email-mrugesh.mk@ti.com>
References: <1360233195-8575-1-git-send-email-mrugesh.mk@ti.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: davinci-linux-open-source@linux.davincidsp.com, mturquette@linaro.org,
 nsekhar@ti.com, linux-kernel@vger.kernel.org, m-karicheri2@ti.com,
 linux-mtd@lists.infradead.org, dwmw2@infradead.org
Reply-To: artem.bityutskiy@linux.intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2013-02-07 at 16:03 +0530, Mrugesh Katepallewar wrote:
> davinci_nand driver currently uses normal kzalloc, ioremap and get_clk
> routines. This patch replaces these routines with devm_kzalloc,
> devm_request_and_ioremap and devm_clk_get resp.
> 
> Signed-off-by: Mrugesh Katepallewar <mrugesh.mk@ti.com>

Pushed to l2-mtd.git, thanks!

P.S. you could also kill the unneeded duplicated labels, but this is not
a big deal.

-- 
Best Regards,
Artem Bityutskiy
