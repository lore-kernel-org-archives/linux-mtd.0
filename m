Received: from nat-132.atmel.no ([80.232.32.132] helo=relay.atmel.no)
	by pentafluge.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1GO8Yh-0003Te-5h
	for linux-mtd@lists.infradead.org; Fri, 15 Sep 2006 08:56:23 +0100
Date: Fri, 15 Sep 2006 09:56:29 +0200
From: Haavard Skinnemoen <hskinnemoen@atmel.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [-mm patch 3/4] AVR32 MTD: Mapping driver for the ATSTK1000board
Message-ID: <20060915095629.22cf01f4@cad-250-152.norway.atmel.com>
In-Reply-To: <1158264688.4312.82.camel@pmac.infradead.org>
References: <20060914162926.6c117b36@cad-250-152.norway.atmel.com>
	<20060914163026.49766346@cad-250-152.norway.atmel.com>
	<20060914163121.241dec3e@cad-250-152.norway.atmel.com>
	<20060914163259.068abe6d@cad-250-152.norway.atmel.com>
	<1158264688.4312.82.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: Andrew Morton <akpm@osdl.org>, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 14 Sep 2006 21:11:28 +0100
David Woodhouse <dwmw2@infradead.org> wrote:

> On Thu, 2006-09-14 at 16:32 +0200, Haavard Skinnemoen wrote:
> > Add mapping driver for the AT49BV6416 NOR flash chip on the
> > ATSTK1000 development board. 
> 
> Hm, can't you set it up in advance and just register a platform_device
> for physmap to drive?

Probably. I'll give it a try.

I have to find a way to unlock the flash at some point, though. Is it
okay if I add code to physmap to iterate over the partitions and unlock
the writable ones if info->mtd->unlock is non-null? Or is there a
better way to do it?

Andrew, please don't merge any of the patches in this series. I just
noticed that the SMC patch should be cleaned up a bit, so I'm
probably going to rework all the patches.

(btw, I got an "awaiting moderator approval" message from the linux-mtd
mailer because "Message has a suspicious header". Can someone tell me
more about this so I can fix my mailer?)

Thanks,

Haavard
