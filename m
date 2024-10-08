Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDD1BCEF147
	for <linux-mtd@archiver.kernel.org>; Tue,  8 Oct 2024 09:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qok7KpH4WqlCJ/rrO4Z7gvGucrgbKB5zWb8+pFRVNss=; b=d7ACK4RzhFmGSy
	sZZKEQkVoy9W8ubszJ/BtIi8VxVQlyecZnVuQDs2Q7bkTWI9VKc/cYFbr/FwwikygN6d8SRz7DzpW
	a6EAf0QcsYdtO57RhhipZW/mzlTABgC8nqu/9WqK7eouU/rVbSBeahkYryafJb9stPBcfgRUa23f0
	crEkK0n65svjCkfKTA6oBNoAkdO52T5S5Zv7LVqrpHEfedcR4KM6O3OkJ968LoRnekLVgMNpTcuTI
	35ogA88dk6FFo6rlR+iCtCCvV7++QhT76Iybptch3Ffb/dO5bLWe+mof9Is+SOmpzE9xGn2b2yaDl
	WPdL9o4o0kjEnLRrbmTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sy6a3-00000005Jx4-3Yrw;
	Tue, 08 Oct 2024 09:32:35 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.98 #2 (Red Hat Linux))
	id 1sy6ZW-00000005Jsk-3rIF;
	Tue, 08 Oct 2024 09:32:02 +0000
Date: Tue, 8 Oct 2024 02:32:02 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Julian Vetter <jvetter@kalrayinc.com>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, guoren <guoren@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Andrew Morton <akpm@linux-foundation.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
	Matt Turner <mattst88@gmail.com>,
	"James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
	Helge Deller <deller@gmx.de>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Niklas Schnelle <schnelle@linux.ibm.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	"linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
	linux-alpha@vger.kernel.org, linux-parisc@vger.kernel.org,
	linux-sh@vger.kernel.org, linux-um@lists.infradead.org,
	Linux-Arch <linux-arch@vger.kernel.org>,
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
	mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-sound@vger.kernel.org,
	Yann Sionneau <ysionneau@kalrayinc.com>
Subject: Re: [PATCH v8 01/14] Consolidate IO memcpy/memset into iomap_copy.c
Message-ID: <ZwT8EjvlknRYeDas@infradead.org>
References: <20241008075023.3052370-1-jvetter@kalrayinc.com>
 <20241008075023.3052370-2-jvetter@kalrayinc.com>
 <a9fa56b4-b00c-4941-8c8c-1d3b58b573e2@app.fastmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a9fa56b4-b00c-4941-8c8c-1d3b58b573e2@app.fastmail.com>
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, Oct 08, 2024 at 09:27:20AM +0000, Arnd Bergmann wrote:
> >  #endif /* CONFIG_TRACE_MMIO_ACCESS */
> > 
> > +extern void memcpy_fromio(void *to, const volatile void __iomem *from,
> > +			  size_t count);
> > +extern void memcpy_toio(volatile void __iomem *to, const void *from,
> > +			size_t count);
> > +extern void memset_io(volatile void __iomem *dst, int c, size_t count);
> > +
> 
> I think having this globally visible is the reason you are running
> into the mismatched prototypes.

Yes, especially as architectures sometimes actually implement this
as macro or inline function.

Please also drop the pointless externs while you're at it.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
