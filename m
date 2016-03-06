From: Arnd Bergmann <arnd@arndb.de>
To: Robert Jarzmik <robert.jarzmik@free.fr>
Subject: Re: [PATCH] mtd: only use __xipram annotation when XIP_KERNEL is set
Date: Sun, 6 Mar 2016 20:56:01 +0100
Cc: Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 linux-arm-kernel@lists.infradead.org, linux-arch@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 Haojian Zhuang <haojian.zhuang@gmail.com>, Daniel Mack <daniel@zonque.org>
References: <1453736525-1959191-2-git-send-email-arnd@arndb.de>
 <3582240.H8v1IXn8EB@wuerfel> <8737s5wbxa.fsf@belgarion.home>
In-Reply-To: <8737s5wbxa.fsf@belgarion.home>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Message-Id: <201603062056.01683.arnd@arndb.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Saturday 05 March 2016, Robert Jarzmik wrote:
> Arnd Bergmann <arnd@arndb.de> writes:
> 
> > I guess we can bring back the macros for the case that MTD_XIP and XIP_KERNEL
> > are both enabled.
> >
> > 	Arnd
> I wouldn't have ICMR and ICIP exposed to drivers, Eric's original move looks
> corect to me.

Yes, it's a reasonable cleanup that we have done in many places, except
this one introduced a regression for MTD_XIP.

> On the other hand, I'm wondering if xip_irqpending(), xip_currtime() and
> xip_cpu_idle() should be declared as functions in mtd-xip.h, and be part of
> something like arch/arm/mach-pxa/xip.c ...

They have to at least be marked __xipram and must not reference anything
in .text or .rodata, but there might be additional requirements.

	Arnd
