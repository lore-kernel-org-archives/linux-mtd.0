Received: from moutng.kundenserver.de ([212.227.126.183])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1K9Yrj-0003a5-0w
	for linux-mtd@lists.infradead.org; Fri, 20 Jun 2008 05:08:51 +0000
From: Stefan Roese <sr@denx.de>
To: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] jedec_probe: Fix SST 16-bit chip detection
Date: Fri, 20 Jun 2008 07:08:37 +0200
References: <20080619.163648.262833678.nemoto@toshiba-tops.co.jp>
	<1213896113.26255.1434.camel@pmac.infradead.org>
In-Reply-To: <1213896113.26255.1434.camel@pmac.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200806200708.37974.sr@denx.de>
Cc: Atsushi Nemoto <anemo@mba.ocn.ne.jp>, David Woodhouse <dwmw2@infradead.org>,
	linux-kernel@vger.kernel.org, stable@kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thursday 19 June 2008, David Woodhouse wrote:
> On Thu, 2008-06-19 at 16:36 +0900, Atsushi Nemoto wrote:
> > -               .devtypes       = CFI_DEVICETYPE_X16|CFI_DEVICETYPE_X8,
> > +               .devtypes       = CFI_DEVICETYPE_X16,
>
> I believe you about the uaddr -- but can these devices really not be
> used in 8-bit mode?

No. They are 16-bit only.

Best regards,
Stefan
