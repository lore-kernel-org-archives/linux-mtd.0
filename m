Received: from mail-pa0-x230.google.com ([2607:f8b0:400e:c03::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aN63y-0007fZ-NR
 for linux-mtd@lists.infradead.org; Sat, 23 Jan 2016 21:49:43 +0000
Received: by mail-pa0-x230.google.com with SMTP id uo6so61181687pac.1
 for <linux-mtd@lists.infradead.org>; Sat, 23 Jan 2016 13:49:22 -0800 (PST)
Date: Sat, 23 Jan 2016 13:49:18 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: "Maciej W. Rozycki" <macro@linux-mips.org>,
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
Message-ID: <20160123214918.GC24744@localhost>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACna6rwAfXQxX8o0+DxroB6vOGZax70VVdPOAjeoGGUsDjdNhA@mail.gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Jan 16, 2016 at 01:38:11AM +0100, Rafał Miłecki wrote:
> So I wanted to stick to the cached mapping, [...]

I mentioned this earlier on, but I don't feel like I've gotten a clear
answer. Is a cached mapping actually safe here? From the looks of it,
the memory mapping is a read-only memory-mapped flash, and flash writes
/ erasures are done through a different bus (register writes vis BCMA
bus). So if we have a cached mapping of that memory, it doens't
naturally synchronize with any write/erase operations. Doesn't this mean
you might get stale data if you do a sequence of read / erase / read,
for instance, since the 2nd read will return cached data from the 1st
read?

IIUC, this could be solved by:
(a) using an uncached mapping or
(b) explicitly invalidating the relevant region after doing flash writes
or erasures

But I wonder why you haven't seen any problems if you've been using
KSEG0 (cached) this whole time. Maybe just luck? Or you don't actually
write to the flash that much?

Brian
