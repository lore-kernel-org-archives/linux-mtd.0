Received: from e2.ny.us.ibm.com ([32.97.182.102])
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1C7umF-0006uy-33
	for linux-mtd@lists.infradead.org; Thu, 16 Sep 2004 07:50:18 -0400
From: Josh Boyer <jdub@us.ibm.com>
To: David Vrabel <dvrabel@arcom.com>
In-Reply-To: <41496FA5.5010901@arcom.com>
References: <41496FA5.5010901@arcom.com>
Content-Type: text/plain
Message-Id: <1095335409.23972.2.camel@weaponx.rchland.ibm.com>
Mime-Version: 1.0
Date: Thu, 16 Sep 2004 06:50:10 -0500
Content-Transfer-Encoding: 7bit
Cc: linux-mtd list <linux-mtd@lists.infradead.org>
Subject: Re: [patch] Only probe for device combinations that fit in map's
	bankwidth.
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2004-09-16 at 05:49, David Vrabel wrote:
> Hi,
> 
> Recent MTD changed how chip probing is done and it now probes for chips 
> of all bus widths.  On my board (IXP425 with 16-bit AMD AM29LV128 flash) 
> probing for 8-bit wide devices cannot work because 8-bit writes/reads to 
> 16-bit devices aren't allowed (they cause data aborts). So...
> 
> Make genprobe_new_chip() only probe for combinations that fit in the 
> map's bankwidth.

MTD CVS has this fixed already.  I noticed the same behavior right after
dwmw2 merged with Linus.  Can you try what's there and see if it fixes
your problem?

josh
