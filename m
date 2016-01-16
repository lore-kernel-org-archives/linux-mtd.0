Received: from eddie.linux-mips.org ([148.251.95.138] helo=cvs.linux-mips.org)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aKWeu-0008V1-7e
 for linux-mtd@lists.infradead.org; Sat, 16 Jan 2016 19:37:13 +0000
Received: from localhost.localdomain ([127.0.0.1]:56718 "EHLO localhost"
 rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
 id S27008872AbcAPTgpRG-Ek (ORCPT
 <rfc822;linux-mtd@lists.infradead.org>);
 Sat, 16 Jan 2016 20:36:45 +0100
Date: Sat, 16 Jan 2016 19:36:45 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@linux-mips.org>
To: =?ISO-8859-2?Q?Rafa=B3_Mi=B3ecki?= <zajec5@gmail.com>
cc: Brian Norris <computersforpeace@gmail.com>,
 Ralf Baechle <ralf@linux-mips.org>,
 Javier Martinez Canillas <javier@osg.samsung.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Fengguang Wu <fengguang.wu@intel.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Luis de Bethencourt <luisbg@osg.samsung.com>, Jeremy Kerr <jk@ozlabs.org>,
 Neelesh Gupta <neelegup@linux.vnet.ibm.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 David Woodhouse <dwmw2@infradead.org>, Cyril Bur <cyrilbur@gmail.com>
Subject: Re: [PATCH] mtd: bcm47xxsflash: use devm_ioremap_nocache() instead
 of KSEG0ADDR()
In-Reply-To: <CACna6rwAfXQxX8o0+DxroB6vOGZax70VVdPOAjeoGGUsDjdNhA@mail.gmail.com>
Message-ID: <alpine.LFD.2.20.1601161521520.26667@eddie.linux-mips.org>
References: <1444813494-14985-1-git-send-email-javier@osg.samsung.com>
 <CACna6rwjMfTT4UgbyO=VmLaPic4xGcPxoMEL5yRmLW7hhvhXJQ@mail.gmail.com>
 <20151104185341.GN7274@google.com>
 <alpine.LFD.2.20.1601072006170.29879@eddie.linux-mips.org>
 <20160107230513.GL109450@google.com>
 <CACna6rw6Q=zaSo91ZK26zgjQ+0j+7=b6C_fPYngaKhnw0OmWeQ@mail.gmail.com>
 <alpine.LFD.2.20.1601081358300.29879@eddie.linux-mips.org>
 <20160108185120.GQ109450@google.com>
 <alpine.LFD.2.20.1601090058430.29879@eddie.linux-mips.org>
 <CACna6rwAfXQxX8o0+DxroB6vOGZax70VVdPOAjeoGGUsDjdNhA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 8BIT
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 16 Jan 2016, Rafa³ Mi³ecki wrote:

> >  This code is in a function called `bcm47xxsflash_read' and reads from an
> > MMIO region, presumably flash memory which behaves like ordinary memory on
> > reads (i.e. no side effects).  Therefore using a cached mapping will in
> > most cases result in much better performance as the CPU will load
> > (prefetch) data in cacheline-sized quantities rather than hitting the
> > external bus every time with a word-sized quantity transferred only.
> 
> So I wanted to stick to the cached mapping, but it appears it's not
> possible with devm_*. We have two options:
> 1) devm_ioremap_nocache - it obviously won't be cached mapping
> 2) devm_ioremap_resource - it uses devm_ioremap which uses ioremap
> which is nocache on MIPS
> 
> Should I introduce a new
> devm_ioremap_resource_cache
> with some
> devm_ioremap_cache
> helper? And then use it in bcm47xxsflash?

 This sounds like a plan to me, except that with `devm_ioremap_wc' also in 
the view and all the three `devm_ioremap*' functions being identical -- 
except from the use of a different `ioremap_*' call -- it looks to me it 
really asks for a `mode' argument and all the code to be unified.  
Compatibility macros (or, perhaps better, static inline functions) could 
be provided to preserve the internal API for the existing code.

 I.e. there would be a new `devm_ioremap_resource_mode' entry point which 
calls `devm_ioremap_mode', which then selects, perhaps with `switch' on 
`mode', from the available `ioremap*' calls.

  Maciej
