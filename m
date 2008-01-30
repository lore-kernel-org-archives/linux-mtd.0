Received: from nat-132.atmel.no ([80.232.32.132] helo=relay.atmel.no)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JKGek-0004Vq-S6
	for linux-mtd@lists.infradead.org; Wed, 30 Jan 2008 17:23:33 +0000
Date: Wed, 30 Jan 2008 18:22:10 +0100
From: Haavard Skinnemoen <hskinnemoen@atmel.com>
To: "Jared Hulbert" <jaredeh@gmail.com>
Subject: Re: [PATCH] MTD: Intel StrataFlash P33 is locked on bootup
Message-ID: <20080130182210.2076ea38@siona>
In-Reply-To: <6934efce0801300919v6fdc21f8v68e857301b77ff2e@mail.gmail.com>
References: <1201631809-32193-1-git-send-email-hskinnemoen@atmel.com>
	<6934efce0801291813n68b796f5j5f3db1e90eb174a9@mail.gmail.com>
	<20080130135350.67e95e20@dhcp-252-066.norway.atmel.com>
	<6934efce0801300919v6fdc21f8v68e857301b77ff2e@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: David Woodhouse <dwmw2@infradead.org>, Paolo.Santos@devoteam.com,
	Nicolas Pitre <nico@cam.org>, Justin Treon <justin_treon@yahoo.com>,
	linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 30 Jan 2008 09:19:54 -0800
"Jared Hulbert" <jaredeh@gmail.com> wrote:

> > This will break cfi_cmdset_0002.c, which also uses MTD_STUPID_LOCK.  
> 
> Oh.  That should be fixed ;)  Thanks for catching this.  We need more
> inclusive tests.
> 
> So if I add this hunk, it should work right?

Yeah, that should do it.

Haavard
