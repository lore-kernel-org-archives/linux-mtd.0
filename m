Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VmNQr-0008Ju-CS
 for linux-mtd@lists.infradead.org; Fri, 29 Nov 2013 12:44:29 +0000
Date: Fri, 29 Nov 2013 09:44:07 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Alexander Shiyan <shc_work@mail.ru>
Subject: Re: [PATCH v5 1/3] mtd: nand: gpio: Add DT property to automatically
 determine bus width
Message-ID: <20131129124406.GD2815@localhost>
References: <1384343884-29622-1-git-send-email-shc_work@mail.ru>
 <20131127012338.GS9468@ld-irv-0074.broadcom.com>
 <20131129122551.GC2815@localhost>
 <1385728504.788280308@f403.i.mail.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1385728504.788280308@f403.i.mail.ru>
Cc: Eric Miao <eric.y.miao@gmail.com>, Artem Bityutskiy <dedekind1@gmail.com>,
 Haojian Zhuang <haojian.zhuang@gmail.com>, linux-mtd@lists.infradead.org,
 Pekon Gupta <pekon@ti.com>, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Nov 29, 2013 at 04:35:04PM +0400, Alexander Shiyan wrote:
> > Hi Brian,
> > 
> > On Tue, Nov 26, 2013 at 05:23:38PM -0800, Brian Norris wrote:
> > [..]
> > > > 
> > > > If we do resort to a new binding for auto-buswidth, it should be a
> > > > generic one that all NAND drivers can use.
> > 
> > Why do we need yet another binding to describe something that's
> > completely discoverable?
> > 
> > I'm working on *removing* any need to set the bus width, either from the
> > driver or from the DT, so I see this patch as step backwards.
> > 
> > Can anyone help me understand if there's *any* valid use case where we
> > want to specify a-priori the bus width, considering it's completely
> > discoverable at run-time?
> 
> Look at my previous attempt:
> http://permalink.gmane.org/gmane.linux.drivers.mtd/47411
> http://permalink.gmane.org/gmane.linux.drivers.mtd/47413
> 

I think we're mixing (again) the NAND device bus width with the controller bus
width. The former is discoverable and doesn't belong at DT (or anywhere), the
latter goes beyond NAND (as memory controller's can handle other kinds of flashes)
and is usually required to be specifiedat the DT.

Hence, I think only the latter needs a DT binding.
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
