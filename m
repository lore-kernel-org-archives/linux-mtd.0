Received: from smtp07.smtpout.orange.fr ([80.12.242.129]
 helo=smtp.smtpout.orange.fr)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V7vWI-0002Xn-DU
 for linux-mtd@lists.infradead.org; Fri, 09 Aug 2013 22:50:55 +0000
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Daniel Mack <zonque@gmail.com>
Subject: Re: [PATCH 00/20] ARM: pxa: move core and drivers to dmaengine
References: <1375889649-14638-1-git-send-email-zonque@gmail.com>
Date: Sat, 10 Aug 2013 00:50:15 +0200
In-Reply-To: <1375889649-14638-1-git-send-email-zonque@gmail.com> (Daniel
 Mack's message of "Wed, 7 Aug 2013 17:33:49 +0200")
Message-ID: <87zjsqzdg8.fsf@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: mark.rutland@arm.com, s.neumann@raumfeld.com, linux-mtd@lists.infradead.org,
 haojian.zhuang@linaro.org, cxie4@marvell.com, lars@metafoo.de, nico@linaro.org,
 vinod.koul@intel.com, marek.vasut@gmail.com,
 ezequiel.garcia@free-electrons.com, rmk+kernel@arm.linux.org.uk,
 devicetree@vger.kernel.org, samuel@sortiz.org, arnd@arndb.de,
 broonie@kernel.org, mika.westerberg@linux.intel.com,
 linux-arm-kernel@lists.infradead.org, thomas.petazzoni@free-electrons.com,
 eric.y.miao@gmail.com, gregkh@linuxfoundation.org, davem@davemloft.net,
 sachin.kamat@linaro.org, kernel@pengutronix.de, djbw@fb.com,
 g.liakhovetski@gmx.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Daniel Mack <zonque@gmail.com> writes:

>  * camera driver:
>      I started the transition, but I'm not sure how much sense that
>      makes without access to the hardware. I'd much appreciate if
>      anyone could volunteer for this piece; I'll happily share what
>      I got so far. Sascha, Sachin, Guennadi?
Hi Daniel,

Do you mean this driver ? :
drivers/media/platform/soc_camera/pxa_camera.c

In that case I might help. But before I can do that, I have to be convinced that
dmaengine can deal with this driver. I'm thinking in particular of :
 - "hot running DMA" queuing
 - multiple DMA channel synchronization (ie. 3 channel sync)

All that is described in there :
  Documentation/video4linux/pxa_camera.txt

If someone with dmaengine knowledge could have a look at pxa_camera.txt (maybe
Vinod ?) and tell me that dma_engine framework fullfills the 2 requirements,
then I'll be happy to help.

One minor point though is that I'm working on pxa27x. If the serie is not
compatible in a way with pxa27x, I won't be able to do anything.

Another point I'd like to know, is what is the performance penalty in using
dmaengine, and do you have any figures ?

Lastly, they was debug information to debug descriptors chaining, channel
statuses, requestors. I didn't see where these had gone, could you point me to
the right file ?

Cheers.

-- 
Robert
