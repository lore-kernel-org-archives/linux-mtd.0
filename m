Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VmN9E-0007Vx-9e
 for linux-mtd@lists.infradead.org; Fri, 29 Nov 2013 12:26:17 +0000
Date: Fri, 29 Nov 2013 09:25:52 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v5 1/3] mtd: nand: gpio: Add DT property to automatically
 determine bus width
Message-ID: <20131129122551.GC2815@localhost>
References: <1384343884-29622-1-git-send-email-shc_work@mail.ru>
 <20131127012158.GR9468@ld-irv-0074.broadcom.com>
 <20131127012338.GS9468@ld-irv-0074.broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20131127012338.GS9468@ld-irv-0074.broadcom.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>,
 Alexander Shiyan <shc_work@mail.ru>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Artem Bityutskiy <dedekind1@gmail.com>, Rob Herring <rob.herring@calxeda.com>,
 linux-mtd@lists.infradead.org, Haojian Zhuang <haojian.zhuang@gmail.com>,
 Stephen Warren <swarren@wwwdotorg.org>, Eric Miao <eric.y.miao@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Pekon Gupta <pekon@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Brian,

On Tue, Nov 26, 2013 at 05:23:38PM -0800, Brian Norris wrote:
[..]
> > 
> > If we do resort to a new binding for auto-buswidth, it should be a
> > generic one that all NAND drivers can use.

Why do we need yet another binding to describe something that's
completely discoverable?

I'm working on *removing* any need to set the bus width, either from the
driver or from the DT, so I see this patch as step backwards.

Can anyone help me understand if there's *any* valid use case where we
want to specify a-priori the bus width, considering it's completely
discoverable at run-time?
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
