Received: from mailapp01.imgtec.com ([195.59.15.196])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aNREe-000846-R6
 for linux-mtd@lists.infradead.org; Sun, 24 Jan 2016 20:26:12 +0000
Date: Sun, 24 Jan 2016 20:26:15 +0000
From: "Maciej W. Rozycki" <macro@imgtec.com>
To: Brian Norris <computersforpeace@gmail.com>
CC: =?ISO-8859-2?Q?Rafa=B3_Mi=B3ecki?= <zajec5@gmail.com>, Ralf Baechle
 <ralf@linux-mips.org>, Javier Martinez Canillas <javier@osg.samsung.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Fengguang Wu
 <fengguang.wu@intel.com>, Michael Ellerman <mpe@ellerman.id.au>, Luis de
 Bethencourt <luisbg@osg.samsung.com>, Jeremy Kerr <jk@ozlabs.org>, Neelesh
 Gupta <neelegup@linux.vnet.ibm.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, David Woodhouse <dwmw2@infradead.org>, Cyril
 Bur <cyrilbur@gmail.com>, "Maciej W. Rozycki" <macro@linux-mips.org>
Subject: Re: [PATCH] mtd: bcm47xxsflash: use devm_ioremap_nocache() instead
 of KSEG0ADDR()
In-Reply-To: <20160123214918.GC24744@localhost>
Message-ID: <alpine.DEB.2.00.1601242020330.5958@tp.orcam.me.uk>
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
 <20160123214918.GC24744@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 23 Jan 2016, Brian Norris wrote:

> IIUC, this could be solved by:
> (a) using an uncached mapping or
> (b) explicitly invalidating the relevant region after doing flash writes
> or erasures

 Flash writes are usually much, much less frequent than reads, so 
optimising for reads is IMO the right direction.  So a cached mapping is a 
good choice, however invalidation must then be done after a write.

> But I wonder why you haven't seen any problems if you've been using
> KSEG0 (cached) this whole time. Maybe just luck? Or you don't actually
> write to the flash that much?

 That depends on cache usage, any stale lines may well have usually gone 
in the course of regular cache line replacement, making the issue remain 
unnoticed.

  Maciej
