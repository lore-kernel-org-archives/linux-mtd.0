Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gX1tB-0001yw-9t
 for linux-mtd@lists.infradead.org; Wed, 12 Dec 2018 10:37:15 +0000
Date: Wed, 12 Dec 2018 11:36:49 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Schrempf Frieder <frieder.schrempf@kontron.de>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Miquel
 Raynal <miquel.raynal@bootlin.com>
Subject: Re: Raw NAND bad block marker positions
Message-ID: <20181212113649.3202f758@bbrezillon>
In-Reply-To: <e937e18d-5099-5969-3b17-1f2d9ffa3a44@kontron.de>
References: <e937e18d-5099-5969-3b17-1f2d9ffa3a44@kontron.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 12 Dec 2018 10:32:04 +0000
Schrempf Frieder <frieder.schrempf@kontron.de> wrote:

> Hi,
> 
> the current implementation for checking/setting the bad block markers in 
> raw NAND flash devices supports three setups for the position of the 
> markers within the bad block:
> 
> * BBM in first page only
> * BBM in last page only
> * BBM in first or second page
> 
> This is controlled by the flags NAND_BBT_SCANLASTPAGE and 
> NAND_BBT_SCAN2NDPAGE. It is not supported to set both flags to check 
> first, second and last page.
> 
> Though some devices seem to require this kind of setup. We know of some 
> ESMT SLC NANDs, that were accidentally shipped with BBM in the first or 
> last page, instead of first or second page as claimed in the datasheet.
> 
> Also the documents for Cypress/Spansion/AMD NANDs claim that the 
> software needs to check first, second and last page for BBMs (e.g. [1]).
> 
> It doesn't look like it would be difficult to make NAND_BBT_SCANLASTPAGE 
> and NAND_BBT_SCAN2NDPAGE work together, but I wanted to ask if someone 
> already stumbled upon this problem or if someone has any comments or 
> suggestions, before trying to patch this?

Your suggestion sounds reasonable.
