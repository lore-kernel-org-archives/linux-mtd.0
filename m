Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1eot3G-0004Qg-Kw
 for linux-mtd@lists.infradead.org; Thu, 22 Feb 2018 15:44:56 +0000
Date: Thu, 22 Feb 2018 16:44:32 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Shreeya Patel <shreeya.patel23498@gmail.com>
Cc: boris.brezillon@free-electrons.com, richard@nod.at, dwmw2@infradead.org,
 computersforpeace@gmail.com, marek.vasut@gmail.com,
 cyrille.pitchen@wedev4u.fr, maximlevitsky@gmail.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 ezequiel@vanguardiasur.com.ar, outreachy-kernel@googlegroups.com
Subject: Re: [PATCH NAND v4] mtd: nand: Replace printk() with appropriate
 pr_*() macro
Message-ID: <20180222164432.0f2b1e56@bbrezillon>
In-Reply-To: <1519313367-3360-1-git-send-email-shreeya.patel23498@gmail.com>
References: <1519313367-3360-1-git-send-email-shreeya.patel23498@gmail.com>
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

On Thu, 22 Feb 2018 20:59:27 +0530
Shreeya Patel <shreeya.patel23498@gmail.com> wrote:

> The log levels embedded with the name are more concise than
> printk.

If you don't mind, I'll replace the above sentence by:

"
Using pr_<loglevel>() is more concise than printk(KERN_<LOGLEVEL>).
"

The patch looks good otherwise, so I should apply it soon.

If you're okay, and Julia and Ezequiel are okay too, I'd like to move
to the next step and have you work on an ->exec_op() conversion
(jz4780?).

Of course, that does not prevent you from continuing the
printk()/dev_xx() conversion.


-- 
Boris Brezillon, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
