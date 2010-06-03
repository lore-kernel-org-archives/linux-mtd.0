Received: from mail.gmx.net ([213.165.64.20])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1OKBeP-0004xf-CE
	for linux-mtd@lists.infradead.org; Thu, 03 Jun 2010 14:44:10 +0000
Message-ID: <4C07BFB0.2060107@gmx.net>
Date: Thu, 03 Jun 2010 16:44:00 +0200
From: Carl-Daniel Hailfinger <c-d.hailfinger.devel.2006@gmx.net>
MIME-Version: 1.0
To: Wolfram Sang <w.sang@pengutronix.de>
Subject: Re: Do we remove from jedec_probe.c?
References: <20100526175320.GD24167@pengutronix.de>
In-Reply-To: <20100526175320.GD24167@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On 26.05.2010 19:53, Wolfram Sang wrote:
> now that Guillaume introduced cfi-support for some SST-flashes, I wonder if
> those can be removed from jedec_probe.c? Or should they stay for
> backward-compatibility?
>   

The userspace flashrom utility is getting support for those big SST NOR
flashes soon, so depending on whether you want these chips to host a
file system, flashrom may be an option.

Regards,
Carl-Daniel

-- 
http://www.hailfinger.org/
