Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UHToM-0002Ly-QT
 for linux-mtd@lists.infradead.org; Mon, 18 Mar 2013 06:44:47 +0000
Message-ID: <1363589153.20738.5.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 1/2] mtd: remove the ppchameleonevb NAND driver
From: Artem Bityutskiy <dedekind1@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>
Date: Mon, 18 Mar 2013 08:45:53 +0200
In-Reply-To: <1363348775-24248-1-git-send-email-dedekind1@gmail.com>
References: <1363348775-24248-1-git-send-email-dedekind1@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: MTD Maling List <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2013-03-15 at 13:59 +0200, Artem Bityutskiy wrote:
> From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
> 
> This driver has been marked as broken for long time and it depends on a
> non-existing PPCHAMELEONEVB Kconfig symbol.
> 
> Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

Pushed both to l2-mtd.git, thanks!

-- 
Best Regards,
Artem Bityutskiy
