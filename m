Received: from [94.23.35.102] (helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V49Ra-0005wS-PB
 for linux-mtd@lists.infradead.org; Tue, 30 Jul 2013 12:54:27 +0000
Date: Tue, 30 Jul 2013 09:53:55 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 10/13] mtd: nand: pxa3xx: Add inline keyword to
 enable_int()
Message-ID: <20130730125354.GA2375@localhost>
References: <1375140263-2028-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1375140263-2028-11-git-send-email-ezequiel.garcia@free-electrons.com>
 <CAN8TOE_F1Qu6XP54aVG_rmYn5wgBEZFYOzk+eYa_Fuxh9FYmFQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAN8TOE_F1Qu6XP54aVG_rmYn5wgBEZFYOzk+eYa_Fuxh9FYmFQ@mail.gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Lior Amsalem <alior@marvell.com>, Jason Cooper <jason@lakedaemon.net>,
 Artem Bityutskiy <dedekind1@gmail.com>, leiwen@marvell.com,
 haojian.zhuang@gmail.com, zonque@gmail.com, linux-mtd@lists.infradead.org,
 grinberg@compulab.co.il, Gregory Clement <gregory.clement@free-electrons.com>,
 eric.miao@marvell.com, David Woodhouse <dwmw2@infradead.org>,
 Willy Tarreau <w@1wt.eu>, nikita@compulab.co.il
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jul 30, 2013 at 12:47:33AM -0700, Brian Norris wrote:
> On Mon, Jul 29, 2013 at 4:24 PM, Ezequiel Garcia
> <ezequiel.garcia@free-electrons.com> wrote:
> > Now that we have added ARCH_HAS_DMA conditional the function
> > enable_int() may be unused. So we declare it as inline
> > in order to remove the following warning, when the function is not used:
> 
> I haven't reviewed the rest too well yet, but I think you want the
> '__maybe_unused' qualifier, not 'inline'.
> 
> > drivers/mtd/nand//pxa3xx_nand.c:343:24: warning: 'enable_int' defined
> > but not used [-Wunused-function]

Mmm, I guess you're right. I did this patch a long time ago, and now I'm
wondering if there is any reason why I haven't used that in the first place.

Anyway... I'll fix and re-post.

Thanks for the feedback!
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
