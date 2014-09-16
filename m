Received: from arroyo.ext.ti.com ([192.94.94.40])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XToRS-0001lY-Qk
 for linux-mtd@lists.infradead.org; Tue, 16 Sep 2014 08:48:55 +0000
Message-ID: <5417F94D.40902@ti.com>
Date: Tue, 16 Sep 2014 11:48:13 +0300
From: Roger Quadros <rogerq@ti.com>
MIME-Version: 1.0
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Brian Norris
 <computersforpeace@gmail.com>
Subject: Re: [PATCH v3 3/3] nand: omap2: Replace pr_err with dev_err
References: <1410447730-16087-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 <1410447730-16087-4-git-send-email-ezequiel@vanguardiasur.com.ar>
In-Reply-To: <1410447730-16087-4-git-send-email-ezequiel@vanguardiasur.com.ar>
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
> Usage of pr_err is frowned upon, so replace it with dev_err.
> Aditionally, the message on nand_bch_init() error is redundant,
> since proper error is showed if the function fails.

You could have omitted the details about nand_bch_init() in the commit
message.

> 
> Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>

Acked-by: Roger Quadros <rogerq@ti.com>

cheers,
-roger
