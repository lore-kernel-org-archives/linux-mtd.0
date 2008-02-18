Received: from www.tglx.de ([62.245.132.106])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JR8VH-0005Cf-Ew
	for linux-mtd@lists.infradead.org; Mon, 18 Feb 2008 16:06:03 +0000
Date: Mon, 18 Feb 2008 17:01:28 +0100 (CET)
From: Thomas Gleixner <tglx@linutronix.de>
To: Frank Haverkamp <haver@vnet.ibm.com>
Subject: Re: ubi-utils: Moving mkpfi, pfiflash, ... to old-tools
In-Reply-To: <1203342580.8085.23.camel@august>
Message-ID: <alpine.LFD.1.00.0802181656260.7583@apollo.tec.linutronix.de>
References: <1203342580.8085.23.camel@august>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: "Artem B. Bityutskiy" <dedekind@oktetlabs.ru>,
	Andreas Arnez <arnez@de.ibm.com>, "Monte K. Copeland" <catboat@texas.net>,
	MTD Mailinglist <linux-mtd@lists.infradead.org>,
	Alexander Schmidt1 <ALEXSCHM@de.ibm.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 18 Feb 2008, Frank Haverkamp wrote:

> Hi Artem,
> 
> I saw that you moved the old ubi-toolchain to the old-tools directory
> with the comment "sort-me-out" in your git-commits.
> 
> We need the tool-chain to generate PFI files for the code-update
> process. Those pfi-files are suited to be used in streaming mode
> together with the pfiflash utility. We use the for NOR and NAND flash
> system the same pfi. Therefor the pfi format does not contain flash
> geometry information e.g. vid-hdr-offset, erase-block size.
> 
> I, and maybe some others on the CC list, would like to see those tools
> moved from the "sort-me-out" section again into the ubi-tools directory.
> Please let us know, what you think, needs to be done to get this done.

I really do not understand why this move was done anyway. We can move
stuff into retirement when we have a full replacement there.

Just shuffling functional tools around is useless and makes the life
of developers, users and package maintainers harder for no good
reason.

I did not update for some time, but did now and noticed that my
packaging scripts need a real overhaul for no benefit.

Yours grumpy,

	tglx
