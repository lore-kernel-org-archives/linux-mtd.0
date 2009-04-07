Received: from az33egw02.freescale.net ([192.88.158.103])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LrEQb-0002vw-Dl
	for linux-mtd@lists.infradead.org; Tue, 07 Apr 2009 16:45:44 +0000
Message-ID: <49DB8271.8050501@freescale.com>
Date: Tue, 07 Apr 2009 11:42:25 -0500
From: Scott Wood <scottwood@freescale.com>
MIME-Version: 1.0
To: Stefan Roese <sr@denx.de>
Subject: Re: [PATCH 3/4 v2] mtd/powerpc: Remove unused "device-width" property
References: <1239093575-12147-1-git-send-email-sr@denx.de>
In-Reply-To: <1239093575-12147-1-git-send-email-sr@denx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Stefan Roese wrote:
> This property is unused. It's not handled as all by the physmap_of
> driver. So let's remove it from the documentation.
> 
> Signed-off-by: Stefan Roese <sr@denx.de>
> CC: Grant Likely <grant.likely@secretlab.ca>

The device tree describes the hardware, not what Linux happens to do 
with it at the moment.

I'd rather keep it.

-Scott
