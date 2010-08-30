Received: from mail-vw0-f49.google.com ([209.85.212.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Oq4Bx-00062i-5w
	for linux-mtd@lists.infradead.org; Mon, 30 Aug 2010 13:14:34 +0000
Received: by vws11 with SMTP id 11so5551134vws.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 30 Aug 2010 06:14:02 -0700 (PDT)
Subject: Re: [PATCH 3/7] drivers/mtd/nand/mpc5121_nfc.c: Add of_node_put to
	avoid memory leak
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Julia Lawall <julia@diku.dk>
In-Reply-To: <1283075566-27441-4-git-send-email-julia@diku.dk>
References: <1283075566-27441-1-git-send-email-julia@diku.dk>
	<1283075566-27441-4-git-send-email-julia@diku.dk>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 30 Aug 2010 16:13:40 +0300
Message-ID: <1283174020.12995.77.camel@brekeke>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree-discuss@lists.ozlabs.org, kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org, Grant Likely <grant.likely@secretlab.ca>,
	linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2010-08-29 at 11:52 +0200, Julia Lawall wrote:
> Add a call to of_node_put in the error handling code following a call to
> of_find_compatible_node.
> 
> The semantic match that finds this problem is as follows:
> (http://coccinelle.lip6.fr/)

Pushed to l2-mtd-2.6.git / master, thanks.

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
