Received: from eddie.linux-mips.org ([148.251.95.138] helo=cvs.linux-mips.org)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aHXbW-0008Ig-LT
 for linux-mtd@lists.infradead.org; Fri, 08 Jan 2016 14:01:23 +0000
Received: from localhost.localdomain ([127.0.0.1]:50666 "EHLO localhost"
 rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
 id S27008449AbcAHOBA5u6m1 (ORCPT
 <rfc822;linux-mtd@lists.infradead.org>);
 Fri, 8 Jan 2016 15:01:00 +0100
Date: Fri, 8 Jan 2016 14:01:00 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@linux-mips.org>
To: =?ISO-8859-2?Q?Rafa=B3_Mi=B3ecki?= <zajec5@gmail.com>
cc: Brian Norris <computersforpeace@gmail.com>,
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
In-Reply-To: <CACna6rw6Q=zaSo91ZK26zgjQ+0j+7=b6C_fPYngaKhnw0OmWeQ@mail.gmail.com>
Message-ID: <alpine.LFD.2.20.1601081358300.29879@eddie.linux-mips.org>
References: <1444813494-14985-1-git-send-email-javier@osg.samsung.com>
 <CACna6rwjMfTT4UgbyO=VmLaPic4xGcPxoMEL5yRmLW7hhvhXJQ@mail.gmail.com>
 <20151104185341.GN7274@google.com>
 <alpine.LFD.2.20.1601072006170.29879@eddie.linux-mips.org>
 <20160107230513.GL109450@google.com>
 <CACna6rw6Q=zaSo91ZK26zgjQ+0j+7=b6C_fPYngaKhnw0OmWeQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 8 Jan 2016, Rafał Miłecki wrote:

> > This removes some (implicit) MIPS dependencies and makes the code more
> > portable, whether we need it or not :)
> 
> So now we have following forwardtrace:
> devm_ioremap_nocache
> ioremap_nocache
> __ioremap_mode
> __ioremap
> CKSEG1ADDR
> 
> It results in different address than KSEG0ADDR:
> [    1.339752] [bcm47xxsflash_bcma_probe] KSEG0ADDR(BCMA_SOC_FLASH2):9c000000
> [    1.346848] [bcm47xxsflash_bcma_probe] devm_ioremap_nocache:bc000000
> 
> But it still works as expected! :)
> [    1.609426] 6 bcm47xxpart partitions found on MTD device bcm47xxsflash
> [    1.616169] Creating 6 MTD partitions on "bcm47xxsflash":

 It is a functional change though and I think the change from a cached to 
uncached mapping (i.e. from `ioremap' to `ioremap_nocache') has to be a 
separate patch, so that both changes can be reviewed independently.

  Maciej
