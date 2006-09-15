Received: from nat-132.atmel.no ([80.232.32.132] helo=relay.atmel.no)
	by pentafluge.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1GO8xm-0004eJ-0s
	for linux-mtd@lists.infradead.org; Fri, 15 Sep 2006 09:22:18 +0100
Date: Fri, 15 Sep 2006 10:22:32 +0200
From: Haavard Skinnemoen <hskinnemoen@atmel.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [-mm patch 3/4] AVR32 MTD: Mapping driver for theATSTK1000board
Message-ID: <20060915102232.29909340@cad-250-152.norway.atmel.com>
In-Reply-To: <1158307230.24527.36.camel@pmac.infradead.org>
References: <20060914162926.6c117b36@cad-250-152.norway.atmel.com>
	<20060914163026.49766346@cad-250-152.norway.atmel.com>
	<20060914163121.241dec3e@cad-250-152.norway.atmel.com>
	<20060914163259.068abe6d@cad-250-152.norway.atmel.com>
	<1158264688.4312.82.camel@pmac.infradead.org>
	<20060915095629.22cf01f4@cad-250-152.norway.atmel.com>
	<1158307230.24527.36.camel@pmac.infradead.org>
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

On Fri, 15 Sep 2006 09:00:30 +0100
David Woodhouse <dwmw2@infradead.org> wrote:

> I'm coming to the conclusion that if there are flash chips which
> inherit the Intel insanity of automatically locking themselves on
> every power cycle, thus rendering the 'locked' status meaningless, we
> should just automatically unlock the whole chip at boot time, from
> the _chip_ driver.

Yeah, there really is no reason to keep anything "soft locked". I'll
unlock the chip from the fixup I submitted earlier so that it comes up
unlocked by default.

> So it's trapped for moderation and I
> get to look at it and manually approve it.

I'll keep doing it, then. That way, I can be sure that you'll notice my
patches, too ;)

Thanks,

Haavard
