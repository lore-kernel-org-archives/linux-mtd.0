Received: from mail-pd0-x234.google.com ([2607:f8b0:400e:c02::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XuAgP-0002ZC-Lj
 for linux-mtd@lists.infradead.org; Fri, 28 Nov 2014 01:49:18 +0000
Received: by mail-pd0-f180.google.com with SMTP id p10so5734783pdj.39
 for <linux-mtd@lists.infradead.org>; Thu, 27 Nov 2014 17:48:56 -0800 (PST)
Date: Fri, 28 Nov 2014 09:48:35 +0800
From: Huang Shijie <shijie8@gmail.com>
To: Stefan Roese <sr@denx.de>
Subject: Re: [PATCH] mtd: gpmi: Remove "We support only one NAND chip" from
 bindings doc
Message-ID: <20141128014832.GA3113@localhost.localdomain>
References: <1417097929-17832-1-git-send-email-sr@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1417097929-17832-1-git-send-email-sr@denx.de>
Cc: devicetree@vger.kernel.org, Brian Norris <computersforpeace@gmail.com>,
 linux-mtd@lists.infradead.org, Huang Shijie <b32955@freescale.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Nov 27, 2014 at 03:18:49PM +0100, Stefan Roese wrote:
> This sentence "We support only one NAND chip now" is not true any more.
> Multiple chips are supported. So lets remove this sentence to not

The gpmi can only supports one chip. Of course, there are maybe two dies
in this single chip.

thanks
Huang Shijie
