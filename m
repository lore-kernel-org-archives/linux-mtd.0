Received: from mail.free-electrons.com ([94.23.35.102])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UePMN-0006zY-R8
 for linux-mtd@lists.infradead.org; Mon, 20 May 2013 12:38:41 +0000
Date: Mon, 20 May 2013 09:37:35 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Ezequiel Garcia <elezegarcia@gmail.com>
Subject: Re: [PATCH 0/5] mtd: nand: Fixes and improvements on pxa3xx
Message-ID: <20130520123733.GB2904@localhost>
References: <1368530125-12959-1-git-send-email-elezegarcia@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1368530125-12959-1-git-send-email-elezegarcia@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Lior Amsalem <alior@marvell.com>, Eric Miao <eric.y.miao@gmail.com>,
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

Hi,

(adding Eric Miao in Cc)

On Tue, May 14, 2013 at 08:15:20AM -0300, Ezequiel Garcia wrote:
> The Armada 370 and Armada XP SoC include a NAND controller (NFCv2) that
> is similar to the one in PXA SoC. Therefore, it should be possible to support
> Armada NAND using pxa3xx-nand driver.
> 
> While this effort is not ready yet, here is a set of patches that are needed
> for such work.
> 
> A small summary of the patches:
> 
>   * 1/5 is a fix for a 2-year regression that removed DMA support.
> 
>   * 2/5 and 3/5 are needed to build the driver on platforms other PXA.
> 
>   * 4/5 and 5/5 add ONFI-compliant device detection and are needed
>     to successfully probe newer flash devices.
> 

Since this patch affects directly the PXA hardware, I'd like to have some
response from PXA maintainers.

Guys, could you take a look at this?

Thanks a lot,
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
