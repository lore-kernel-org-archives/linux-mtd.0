Received: from arroyo.ext.ti.com ([192.94.94.40])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XToN6-0006z9-5g
 for linux-mtd@lists.infradead.org; Tue, 16 Sep 2014 08:44:24 +0000
Message-ID: <5417F84F.1010602@ti.com>
Date: Tue, 16 Sep 2014 11:43:59 +0300
From: Roger Quadros <rogerq@ti.com>
MIME-Version: 1.0
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Brian Norris
 <computersforpeace@gmail.com>
Subject: Re: [PATCH v3 2/3] nand: omap2: Remove horrible ifdefs to fix module
 probe
References: <1410447730-16087-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 <1410447730-16087-3-git-send-email-ezequiel@vanguardiasur.com.ar>
In-Reply-To: <1410447730-16087-3-git-send-email-ezequiel@vanguardiasur.com.ar>
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
> The current code abuses ifdefs to determine if the selected ECC scheme
> is supported by the running kernel. As a result the code is hard to read,
> and it also fails to load as a module.
> 
> This commit removes all the ifdefs and instead introduces a function
> omap2_nand_ecc_check() to check if the ECC is supported by using
> IS_ENABLED(CONFIG_xxx).
> 
> Since IS_ENABLED() is true when a config is =y or =m, this change fixes the
> module so it can be loaded with no issues.
> 
> Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>

Acked-by: Roger Quadros <rogerq@ti.com>

cheers,
-roger
