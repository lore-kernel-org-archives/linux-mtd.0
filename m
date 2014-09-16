Received: from arroyo.ext.ti.com ([192.94.94.40])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XToMN-0006vm-UO
 for linux-mtd@lists.infradead.org; Tue, 16 Sep 2014 08:43:41 +0000
Message-ID: <5417F820.5000202@ti.com>
Date: Tue, 16 Sep 2014 11:43:12 +0300
From: Roger Quadros <rogerq@ti.com>
MIME-Version: 1.0
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Brian Norris
 <computersforpeace@gmail.com>
Subject: Re: [PATCH v3 1/3] nand: omap2: Add support for flash-based bad block
 table
References: <1410447730-16087-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 <1410447730-16087-2-git-send-email-ezequiel@vanguardiasur.com.ar>
In-Reply-To: <1410447730-16087-2-git-send-email-ezequiel@vanguardiasur.com.ar>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Cc: Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 09/11/2014 06:02 PM, Ezequiel Garcia wrote:
> This commit adds a new platform-data boolean property that enables use
> of a flash-based bad block table. This can also be enabled by setting
> the 'nand-on-flash-bbt' devicetree property.
> 
> If the flash BBT is not enabled, the driver falls back to use OOB
> bad block markers only, as before. If the flash BBT is enabled the
> kernel will keep track of bad blocks using a BBT, in addition to
> the OOB markers.
> 
> As explained by Brian Norris the reasons for using a BBT are:
> 
> ""
> The primary reason would be that NAND datasheets specify it these days.
> A better argument is that nobody guarantees that you can write a
> bad block marker to a worn out block; you may just get program failures.
> 
> This has been acknowledged by several developers over the last several
> years.
> 
> Additionally, you get a boot-time performance improvement if you only
> have to read a few pages, instead of a page or two from every block on
> the flash.
> ""
> 
> Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>

Acked-by: Roger Quadros <rogerq@ti.com>

cheers,
-roger
