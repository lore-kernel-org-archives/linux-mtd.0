Received: from mail-pd0-f176.google.com ([209.85.192.176])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YrneI-0004y3-6d
 for linux-mtd@lists.infradead.org; Mon, 11 May 2015 13:21:34 +0000
Received: by pdbqd1 with SMTP id qd1so146326024pdb.2
 for <linux-mtd@lists.infradead.org>; Mon, 11 May 2015 06:21:12 -0700 (PDT)
Date: Mon, 11 May 2015 21:20:53 +0800
From: Shawn Guo <shawn.guo@linaro.org>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Subject: Re: [PATCH] ARM: dts: imx: add "nor-jedec" flash compatible binding
Message-ID: <20150511132052.GH9347@dragon>
References: <1431066065-19644-1-git-send-email-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1431066065-19644-1-git-send-email-zajec5@gmail.com>
Cc: linux-mtd@lists.infradead.org, Sascha Hauer <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, May 08, 2015 at 08:21:05AM +0200, Rafał Miłecki wrote:
> Starting with commits
> 8ff16cf ("Documentation: devicetree: m25p80: add "nor-jedec" binding")
> 1103b85 ("mtd: m25p80: bind to "nor-jedec" ID, for auto-detection")
> we have "nor-jedec" binding indicating support for JEDEC identification.
> 
> Signed-off-by: Rafał Miłecki <zajec5@gmail.com>

Applied, thanks.
