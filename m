Received: from 15.98.mail-out.ovh.net ([87.98.175.33] helo=98.mail-out.ovh.net)
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1Qc5wl-0008Fj-KK
	for linux-mtd@lists.infradead.org; Thu, 30 Jun 2011 01:21:36 +0000
Received: from mail31.ha.ovh.net (b7.ovh.net [213.186.33.57])
	by 98.mail-out.ovh.net (Postfix) with SMTP id BC2994B20D6
	for <linux-mtd@lists.infradead.org>;
	Thu, 30 Jun 2011 03:21:10 +0200 (CEST)
Date: Thu, 30 Jun 2011 03:06:28 +0200
From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
To: Nicolas Ferre <nicolas.ferre@atmel.com>
Subject: Re: [PATCH] MTD: atmel_nand: fix wrong use of 0 as NULL
Message-ID: <20110630010628.GI17355@game.jcrosoft.org>
References: <1309365676-19210-1-git-send-email-nicolas.ferre@atmel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1309365676-19210-1-git-send-email-nicolas.ferre@atmel.com>
Cc: hong.xu@atmel.com, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 18:41 Wed 29 Jun     , Nicolas Ferre wrote:
> Fixing this error:
> atmel_nand.c:718:20: warning: Using plain integer as NULL pointer
> 
> Signed-off-by: Nicolas Ferre <nicolas.ferre@atmel.com>
Acked-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>

Best Regards,
J.
