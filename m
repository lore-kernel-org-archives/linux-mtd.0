Received: from mail-by2lp0241.outbound.protection.outlook.com
 ([207.46.163.241] helo=na01-by2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WzAIy-0003QU-DC
 for linux-mtd@lists.infradead.org; Mon, 23 Jun 2014 19:53:29 +0000
Message-ID: <1403553015.9081.7.camel@linux-builds1>
Subject: Re: [PATCH V2] In the Denali NAND controller driver, use 8 bytes
 for READID command.
From: Dinh Nguyen <dinguyen@altera.com>
To: Graham Moore <grmoore@altera.com>
Date: Mon, 23 Jun 2014 14:50:15 -0500
In-Reply-To: <1403551270-31873-1-git-send-email-grmoore@altera.com>
References: <1403551270-31873-1-git-send-email-grmoore@altera.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Cc: ggrahammoore@gmail.com, linux-kernel@vger.kernel.org, Yves
 Vandervennet <rocket.yvanderv@gmail.com>, linux-mtd@lists.infradead.org,
 Alan Tull <atull@altera.com>, Brian
 Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Graham,

On Mon, 2014-06-23 at 14:21 -0500, Graham Moore wrote:
> The Denali NAND driver reads only 5 bytes of ID, but some Hynix and Samsung
> have size parameters in the 6th byte.  As a result, the page and oob size
> for a Hynix H27UAG8T2B were calculated incorrectly and the driver failed to
> load.
> 
> The solution is to read 8 bytes of ID, as expected by the nand framework.
> 
> Signed-off-by: Graham Moore <grmoore@altera.com>
> --
> V2: Increase size of id_bytes array to 8.
> ---
>  drivers/mtd/nand/denali.c |    6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Your commit header should have "mtd: denali:"

i.e: "mtd: denali: use 8 bytes for READID command"

Dinh
