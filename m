Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15KFxU-0007Rh-00
	for <linux-mtd@lists.infradead.org>; Wed, 11 Jul 2001 10:07:00 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3B49B4B2.87F7E8A5@ridgerun.com> 
References: <3B49B4B2.87F7E8A5@ridgerun.com> 
To: Steve Kranz <skranz@ridgerun.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: MTD/mtdblock.c uclinux 2.0.38? 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 11 Jul 2001 10:11:57 +0100
Message-ID: <18484.994842717@redhat.com>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

skranz@ridgerun.com said:
> 1. Anybody know if instruction exist for installing MTD and nftl into
> an uclinux 2.0.38 tree?

Should work. Probably doesn't. Give me individual instances of places I 
broke the 2.0 compile, preferably with patches, and we'll deal with it.

> 2. I'm interested in getting the SmartMedia slot of this arm7 board
> working for both read and write -- and I'd like the SmartMedia card to
> be readable/writable by a Windows machine too. Am I correct that this
> interoperability constraint will prevent me from using JFFS? I'm
> assuming that a vfat fs with MTD/nftl will do the trick for me. Yes,
> no?

You need to implement the SmartMedia translation layer format. It looks like
there's enough information on the Samsung web site to do that.

> 3. I've been glancing at MTD code and didn't think I saw any logic to
> deal with the bad (unusable) blocks of a NAND flash device. Did I just
> miss it? 

Done in the SmartMedia translation layer, not in the underlying device 
driver.

--
dwmw2
