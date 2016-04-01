Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1am6yt-0001Oh-Ih
 for linux-mtd@lists.infradead.org; Fri, 01 Apr 2016 21:51:52 +0000
Subject: Re: [PATCH 2/2] mtd: nand: Remove BUG() abuse in nand_scan_tail
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 linux-mtd@lists.infradead.org
References: <1459546164-6269-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 <1459546164-6269-3-git-send-email-ezequiel@vanguardiasur.com.ar>
Cc: Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>
From: Richard Weinberger <richard@nod.at>
Message-ID: <56FEED5E.9010400@nod.at>
Date: Fri, 1 Apr 2016 23:51:26 +0200
MIME-Version: 1.0
In-Reply-To: <1459546164-6269-3-git-send-email-ezequiel@vanguardiasur.com.ar>
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 01.04.2016 um 23:29 schrieb Ezequiel Garcia:
> There's no reason to BUG() when parameters are being
> validated. Drivers can get things wrong, and it's much nicer
> to just throw a noisy warn and fail gracefully, than calling
> BUG() and throwing the whole system down the drain.
> 
> Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
> ---
>  drivers/mtd/nand/nand_base.c | 52 ++++++++++++++++++++++++++++----------------
>  1 file changed, 33 insertions(+), 19 deletions(-)

This makes sense.

Reviewed-by: Richard Weinberger <richard@nod.at>

Thanks,
//richard
