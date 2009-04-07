Received: from mo-p05-ob.rzone.de ([81.169.146.180])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LrEZ3-0006gt-Df
	for linux-mtd@lists.infradead.org; Tue, 07 Apr 2009 16:54:28 +0000
From: Stefan Roese <sr@denx.de>
To: Scott Wood <scottwood@freescale.com>
Subject: Re: [PATCH 3/4 v2] mtd/powerpc: Remove unused "device-width" property
Date: Tue, 7 Apr 2009 18:54:16 +0200
References: <1239093575-12147-1-git-send-email-sr@denx.de>
	<49DB8271.8050501@freescale.com>
In-Reply-To: <49DB8271.8050501@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200904071854.16818.sr@denx.de>
Cc: linuxppc-dev@ozlabs.org, devicetree-discuss@ozlabs.org,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tuesday 07 April 2009, Scott Wood wrote:
> Stefan Roese wrote:
> > This property is unused. It's not handled as all by the physmap_of
> > driver. So let's remove it from the documentation.
> >
> > Signed-off-by: Stefan Roese <sr@denx.de>
> > CC: Grant Likely <grant.likely@secretlab.ca>
>
> The device tree describes the hardware, not what Linux happens to do
> with it at the moment.
>
> I'd rather keep it.

I find it rather confusing to "see" such bindings that are not supported. One 
could expect something to happen/change after defining this property. So in 
general I think adding unsupported properties to the Documentation is a bad 
idea. But that's just my 2 cents. If the general opinion is to keep this 
property, I'll keep it in of course.

Best regards,
Stefan
