Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X9Yvz-0008P2-7V
 for linux-mtd@lists.infradead.org; Tue, 22 Jul 2014 12:12:47 +0000
Date: Tue, 22 Jul 2014 14:12:19 +0200
From: Boris BREZILLON <boris.brezillon@free-electrons.com>
To: Matthieu CASTET <matthieu.castet@parrot.com>
Subject: Re: [PATCH 1/2] mtd: nand: define struct nand_timings
Message-ID: <20140722141219.7f2c2890@bbrezillon>
In-Reply-To: <20140722120346.0f2d0e77@parrot.com>
References: <1405064982-11456-1-git-send-email-boris.brezillon@free-electrons.com>
 <1405064982-11456-2-git-send-email-boris.brezillon@free-electrons.com>
 <20140722120346.0f2d0e77@parrot.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Lee Jones <lee.jones@linaro.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Matthieu

On Tue, 22 Jul 2014 12:03:46 +0200
Matthieu CASTET <matthieu.castet@parrot.com> wrote:

> Hi,
> 
> 
> Do you know if all these timings will be used by the nand drivers ?

I don't know (it depends on each NAND controller), and this is exactly
why I decided to define all the timings described in the ONFI
specification [1]. 

> 
> I did a similar patch [1] (that wasn't merged :( ), and I used reduced
> timing info.

I'm sorry it didn't make it to mainline, do you know why ?
Could you point out where "reduced timing info" is defined in the ONFI
specification ?

> 
> I also have support for the omap driver
> (http://article.gmane.org/gmane.linux.ports.arm.omap/88606/match=) and
> a controller we use in our chip (not upstream).

It should be pretty easy to convert the full timings list into a
reduced one (actually, that's what your patch is doing), and you can
thus port your work on top of these patches.

Anyway, I'm not sure what you have in mind, but unless there is a strong
reason to drop full timings in favor of reduced ones I'd like to
keep them (even if this implies adding a new converter to get reduced
timings list).

Best Regards,

Boris

-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
