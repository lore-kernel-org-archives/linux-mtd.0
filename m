Received: from webbox1416.server-home.net ([77.236.96.61])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZIIvw-0006Od-7B
 for linux-mtd@lists.infradead.org; Thu, 23 Jul 2015 16:01:21 +0000
From: Alexander Stein <alexander.stein@systec-electronic.com>
To: Han Xu <xhnjupt@gmail.com>
Cc: Cory Tusar <cory.tusar@pid1solutions.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Han Xu <han.xu@freescale.com>
Subject: Re: [PATCH 1/1] mtd: fsl-quadspi: Add mutex for accessing different
 SPI-NOR devices
Date: Thu, 23 Jul 2015 18:00:43 +0200
Message-ID: <1721136.reBpNMVAvj@ws-stein>
In-Reply-To: <CA+EcR22muPFsg_kRzAaAmhKm1=5xBRDeuke_i9UHvFQd_fgnzQ@mail.gmail.com>
References: <1437056014-16928-1-git-send-email-alexander.stein@systec-electronic.com>
 <2755588.WRnIZEyBVY@ws-stein>
 <CA+EcR22muPFsg_kRzAaAmhKm1=5xBRDeuke_i9UHvFQd_fgnzQ@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thursday 23 July 2015 10:48:33, Han Xu wrote:
> The link is the first version, please check the one pushed in l2-mtd
> repo. Thanks.

Thanks for the hint. Didn't know about that repo.
Found the commit at http://git.infradead.org/l2-mtd.git/commit/392d39cfcaa9bcfa202fb0fd3bc65f3c20de318f

Brian: When does this hit mainline? v4.3?

Best regards,
Alexander
-- 
Dipl.-Inf. Alexander Stein
SYS TEC electronic GmbH
alexander.stein@systec-electronic.com

Legal and Commercial Address:
Am Windrad 2
08468 Heinsdorfergrund
Germany

Office: +49 (0) 3765 38600-0
Fax:    +49 (0) 3765 38600-4100
 
Managing Directors:
	Director Technology/CEO: Dipl.-Phys. Siegmar Schmidt;
	Director Commercial Affairs/COO: Dipl. Ing. (FH) Armin von Collrepp
Commercial Registry:
	Amtsgericht Chemnitz, HRB 28082; USt.-Id Nr. DE150534010
