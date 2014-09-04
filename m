Received: from us2.outbound.mailhostbox.com ([208.91.198.232])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XPcEh-0004Rc-48
 for linux-mtd@lists.infradead.org; Thu, 04 Sep 2014 18:58:24 +0000
Message-ID: <5408B629.4030404@pek-sem.com>
Date: Fri, 05 Sep 2014 00:27:45 +0530
From: pekon <pekon@pek-sem.com>
MIME-Version: 1.0
To: Roger Quadros <rogerq@ti.com>
Subject: Re: [PATCH 3/6] ARM: dts: am437x-gp-evm: Don't use read/write wait
 monitoring
References: <1409666227-20622-1-git-send-email-rogerq@ti.com>
 <1409666227-20622-4-git-send-email-rogerq@ti.com>
 <54061439.1030909@pek-sem.com> <5406D213.6020603@ti.com>
 <54074FFA.2020406@pek-sem.com> <540834F9.8080902@ti.com>
In-Reply-To: <540834F9.8080902@ti.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: tony@atomide.com, linux-mtd <linux-mtd@lists.infradead.org>,
 linux-omap@vger.kernel.org, "Nori, Sekhar" <nsekhar@ti.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thursday 04 September 2014 03:16 PM, Roger Quadros wrote:

[...]

>
> This patch is for the 3.17 bug fix cycle. Implementing NAND device ready mechanism
> is a new feature (for DT case) and I will work on it for future versions.
>
> Also I'm not de-scoping wait-pin (or more correctly device ready) mechanism for NAND.
> The dts file still contains "wait-pin = <0>" property. This will be used to
> monitor the NAND device ready status via GPMC status or GPMC interrupt.
> But this is not for 3.17 bug fix cycle.
>

Ok Thanks, that good to know. So for this whole series

Reviewed-by: Pekon Gupta <pekon@pek-sem.com>


with regards, pekon

------------------------
Powered by BigRock.com
