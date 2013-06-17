Received: from mail.free-electrons.com ([94.23.35.102])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UoXDj-00043E-J7
 for linux-mtd@lists.infradead.org; Mon, 17 Jun 2013 11:03:36 +0000
Date: Mon, 17 Jun 2013 08:03:05 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Igor Grinberg <grinberg@compulab.co.il>
Subject: Re: [PATCH 0/5] mtd: nand: Fixes and improvements on pxa3xx
Message-ID: <20130617110304.GA2624@localhost>
References: <1368530125-12959-1-git-send-email-elezegarcia@gmail.com>
 <51BEA455.2020605@compulab.co.il>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <51BEA455.2020605@compulab.co.il>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Lior Amsalem <alior@marvell.com>, Ezequiel Garcia <elezegarcia@gmail.com>,
 Artem Bityutskiy <dedekind1@gmail.com>, Lei Wen <leiwen@marvell.com>,
 Haojian Zhuang <haojian.zhuang@gmail.com>, Maen Suleiman <maen@marvell.com>,
 linux-mtd@lists.infradead.org,
 Gregory Clement <gregory.clement@free-electrons.com>,
 Neil Zhang <zhangwm@marvell.com>, Chao Xie <cxie4@marvell.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Nikita, Igor:

On Mon, Jun 17, 2013 at 08:53:25AM +0300, Igor Grinberg wrote:
> On 05/14/13 14:15, Ezequiel Garcia wrote:
> > The Armada 370 and Armada XP SoC include a NAND controller (NFCv2) that
> > is similar to the one in PXA SoC. Therefore, it should be possible to support
> > Armada NAND using pxa3xx-nand driver.
> > 
> > While this effort is not ready yet, here is a set of patches that are needed
> > for such work.
> > 
> > A small summary of the patches:
> > 
> >   * 1/5 is a fix for a 2-year regression that removed DMA support.
> > 
> >   * 2/5 and 3/5 are needed to build the driver on platforms other PXA.
> > 
> >   * 4/5 and 5/5 add ONFI-compliant device detection and are needed
> >     to successfully probe newer flash devices.
> > 
> > Applies cleanly on top of l2-mtd.git.
> > 
> > Thanks!
> > 
> > Ezequiel Garcia (5):
> >   mtd: nand: pxa3xx: Set info->use_dma properly
> >   mtd: nand: pxa3xx: Use of_machine_is_compatible()
> >   mtd: nand: pxa3xx: Fix MODULE_DEVICE_TABLE declaration
> >   mtd: nand: pxa3xx: Add address support for READID command
> >   mtd: nand: pxa3xx: Add support for Read parameter page command
> 
> tested on cm-x300, upstream 3.10-rc5 and no regressions seen.
> 
> Tested-by: Nikita Kiryanov <nikita@compulab.co.il>
> Acked-by: Igor Grinberg <grinberg@compulab.co.il>
> 

Thanks a lot for the review and the test!

Artem, do you think this could be queued for v3.11?

-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
