Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by casper.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W3QVZ-0005PW-RV
 for linux-mtd@lists.infradead.org; Wed, 15 Jan 2014 13:27:50 +0000
Date: Wed, 15 Jan 2014 10:27:25 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Rodolfo Giometti <giometti@linux.it>
Subject: Re: [PATCH] mtd pxa3xx_nand.c: add support for 2048 bytes page size
 layout
Message-ID: <20140115132724.GB2534@localhost>
References: <1389623738-19585-1-git-send-email-giometti@linux.it>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1389623738-19585-1-git-send-email-giometti@linux.it>
Cc: Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Rodolfo,

On Mon, Jan 13, 2014 at 03:35:38PM +0100, Rodolfo Giometti wrote:
> Signed-off-by: Rodolfo Giometti <giometti@linux.it>
> ---
>  drivers/mtd/nand/pxa3xx_nand.c | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 

I know this is just a small nitpick, but can you re-submit this
with a subject similar to the other commits:

""mtd: nand: pxa3xx: Add support for 2048 bytes page size devices""

Also, I think you can add some details about the patch in the change
log. Something along these lines might be fine:

""
This commit adds support for devices with 2048B page sizes and
4-bit ECC strength requirements. This is achieved by enabling the BCH
ECC engine, which provides a higher strength: 16-bit over 2048 bytes.

Additionally, add a proper ECC layout to model the controller's view
of the device (where 'U' means unused and 'B' is the bad block marker):

 ----------------------------------------------------
 | 2048B data | B | B | 30B spare | 30B ECC | U | U |
 ----------------------------------------------------
""

With these modifications you can also add:

Acked-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>

Thanks a lot for the contribution!
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
