Received: from mail-pa0-x236.google.com ([2607:f8b0:400e:c03::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y12TG-0006yo-52
 for linux-mtd@lists.infradead.org; Wed, 17 Dec 2014 00:28:06 +0000
Received: by mail-pa0-f54.google.com with SMTP id fb1so15111394pad.41
 for <linux-mtd@lists.infradead.org>; Tue, 16 Dec 2014 16:27:45 -0800 (PST)
Date: Tue, 16 Dec 2014 16:27:42 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Fabio Estevam <fabio.estevam@freescale.com>
Subject: Re: [PATCH] mtd: gpmi: Remove noisy error message
Message-ID: <20141217002742.GJ9759@ld-irv-0074>
References: <1415721691-14073-1-git-send-email-fabio.estevam@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1415721691-14073-1-git-send-email-fabio.estevam@freescale.com>
Cc: linux-mtd@lists.infradead.org, shijie8@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Nov 11, 2014 at 02:01:31PM -0200, Fabio Estevam wrote:
> mx28evk board has a socket for NAND flash that comes with no NAND flash
> populated, and then we get this message on every boot:
> 
> [    1.657603] gpmi-nand 8000c000.gpmi-nand: driver registration failed: -19
> 
> ,which is not very helpful, so get rid of this error message.
> 
> Signed-off-by: Fabio Estevam <fabio.estevam@freescale.com>

Enough pointless discussion has been had. There's enough other context
for most errors, I think.

Applied to l2-mtd.git/next.

Brian
