Received: from nat-132.atmel.no ([80.232.32.132] helo=relay.atmel.no)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JKCRH-0000nJ-95
	for linux-mtd@lists.infradead.org; Wed, 30 Jan 2008 12:53:21 +0000
Date: Wed, 30 Jan 2008 13:51:23 +0100
From: Haavard Skinnemoen <hskinnemoen@atmel.com>
To: "Jared Hulbert" <jaredeh@gmail.com>
Subject: Re: [PATCH] MTD: Intel StrataFlash P33 is locked on bootup
Message-ID: <20080130135123.3021109c@dhcp-252-066.norway.atmel.com>
In-Reply-To: <6934efce0801291813n68b796f5j5f3db1e90eb174a9@mail.gmail.com>
References: <1201631809-32193-1-git-send-email-hskinnemoen@atmel.com>
	<6934efce0801291813n68b796f5j5f3db1e90eb174a9@mail.gmail.com>
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

On Tue, 29 Jan 2008 18:13:43 -0800
"Jared Hulbert" <jaredeh@gmail.com> wrote:

> > Add appropriate fixups for all the devices listed in the Intel P33
> > data sheet.  
> 
> Please don't merge this patch.
> 
> We worked on a patch that will unlock _all_ intel parts that have this
> behavior in a more acceptable way.  It was discussed back in November.

Ok, sounds like a better approach. Please ignore my patch.

Haavard
