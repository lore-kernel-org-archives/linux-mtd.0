Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cqoPT-0000nG-OZ
 for linux-mtd@lists.infradead.org; Wed, 22 Mar 2017 22:07:18 +0000
Date: Wed, 22 Mar 2017 23:06:54 +0100
From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Richard Weinberger
 <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Cyrille
 Pitchen <cyrille.pitchen@atmel.com>, linux-mtd@lists.infradead.org, Linus
 Walleij <linus.walleij@linaro.org>, Stefan Roese <sr@denx.de>,
 stable@vger.kernel.org
Subject: Re: [PATCH 01/13] mtd: nand: fsmc: fix NAND width handling
Message-ID: <20170322230654.36b47899@free-electrons.com>
In-Reply-To: <20170322224237.3cc00c7f@bbrezillon>
References: <1490090645-8576-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1490090645-8576-2-git-send-email-thomas.petazzoni@free-electrons.com>
 <20170322224237.3cc00c7f@bbrezillon>
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

Hello,

On Wed, 22 Mar 2017 22:42:37 +0100, Boris Brezillon wrote:

> > It is worth mentioning that if this commit gets backported to older
> > kernels, prior to the drop of non-DT probing, then non-DT probing will
> > be broken because nand->options will no longer be set to
> > NAND_BUSWIDTH_16.  
> 
> Then maybe we should the drop the Cc-stable tag, or put # vX.Y+ to
> prevent this patch from being applied to versions where it could break
> things.
> 
> Note that no-one complained about this bug so far, so I guess no-one
> cares about this fix (probably because 16-bits NANDs are not widely
> used) ;-).

It's really up to you. I didn't encounter the bug myself, I just found
out the mistake by reading the code and cooking this cleanup series.

Feel free to drop the Cc: to stable when applying, I don't particularly
care about this specific feature, and since no-one noticed so far, I
doubt anyone cares :)

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
