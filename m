Received: from webapps.arcom.com ([194.200.159.168])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DbKS1-0005oX-Dx
	for linux-mtd@lists.infradead.org; Thu, 26 May 2005 11:39:14 -0400
Message-ID: <4295ED9E.6000508@arcom.com>
Date: Thu, 26 May 2005 16:39:10 +0100
From: David Vrabel <dvrabel@arcom.com>
MIME-Version: 1.0
To: Robert Schwebel <robert@schwebel.de>
References: <20050526152256.GS6681@pengutronix.de>
In-Reply-To: <20050526152256.GS6681@pengutronix.de>
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Fast rollout process on jffs2?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Robert Schwebel wrote:
> 
> Is there a method for faster rollout of an embedded root filesystem on
> jffs2? I'm currently first erase the chip from u-boot, then copy the
> image created with mkfs.jffs2 into the empty flash. On first startup it
> seems to detect that the partition is larger than the actual image and
> it takes quite some time before the / mount is finished. 
> 
> Does anybody know a faster variant? 

You can pad the JFFS2 image with the --pad option to mkfs.jffs2.

David Vrabel
-- 
David Vrabel, Design Engineer

Arcom, Clifton Road           Tel: +44 (0)1223 411200 ext. 3233
Cambridge CB1 7EA, UK         Web: http://www.arcom.com/
