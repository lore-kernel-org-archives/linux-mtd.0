Received: from mail-yh0-f46.google.com ([209.85.213.46])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X9vJY-0006aV-Kf
 for linux-mtd@lists.infradead.org; Wed, 23 Jul 2014 12:06:34 +0000
Received: by mail-yh0-f46.google.com with SMTP id a41so694410yho.19
 for <linux-mtd@lists.infradead.org>; Wed, 23 Jul 2014 05:06:09 -0700 (PDT)
Date: Wed, 23 Jul 2014 09:05:10 -0300
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: Pekon Gupta <pekon@ti.com>
Subject: Re: [PATCH] mtd: nand: omap: save Bad-Block-Table (BBT) on device
Message-ID: <20140723120510.GA19677@arch.cereza>
References: <1406116461-27089-1-git-send-email-pekon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1406116461-27089-1-git-send-email-pekon@ti.com>
Cc: Sekhar Nori <nsekhar@ti.com>, Brian Norris <computersforpeace@gmail.com>,
 linux-mtd <linux-mtd@lists.infradead.org>, Roger Quadros <rogerq@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Pekon,

On 23 Jul 05:24 PM, Pekon Gupta wrote:
> This patch makes OMAP NAND driver to
> - save Bad-Block-Table (BBT) on NAND Flash device
> - scan on device BBT during probe
> 

Doesn't this break backward compatibility? Please correct me if I'm wrong
here, but if I apply this patch, and boot with my current NAND flash
contents, the kernel won't have any place to store the BBT (assuming
there are no blocks reserved).
-- 
Ezequiel Garcia, VanguardiaSur
www.vanguardiasur.com.ar
