Received: from mail-iy0-f177.google.com ([209.85.210.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QkAbv-00016e-KP
	for linux-mtd@lists.infradead.org; Fri, 22 Jul 2011 07:57:28 +0000
Received: by mail-iy0-f177.google.com with SMTP id 15so2064004iyn.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 22 Jul 2011 00:57:27 -0700 (PDT)
Subject: Re: [PATCH v2] MTD: Nand: use MTD_NAND_OMAP2 for OMAP4
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Jan Weitzel <j.weitzel@phytec.de>
Date: Fri, 22 Jul 2011 10:58:42 +0300
In-Reply-To: <1311146884-22255-1-git-send-email-j.weitzel@phytec.de>
References: <1311137590.20738.135.camel@sauron>
	<1311146884-22255-1-git-send-email-j.weitzel@phytec.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1311321527.20707.6.camel@sauron>
Mime-Version: 1.0
Cc: Artem.Bityutskiy@nokia.com, linux-omap@vger.kernel.org,
	linux-mtd@lists.infradead.org, vimalsingh@ti.com
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2011-07-20 at 09:28 +0200, Jan Weitzel wrote:
> use MTD_NAND_OMAP2 also for OMAP4 arch.
> testes wit omap4430
> 
> Signed-off-by: Jan Weitzel <j.weitzel@phytec.de>
> ---
> v2: add menuconfig description

Pushed to l2-mtd-2.6.git, thanks.

-- 
Best Regards,
Artem Bityutskiy
