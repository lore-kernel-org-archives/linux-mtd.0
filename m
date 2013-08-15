Message-ID: <520CF424.2060004@gmail.com>
Date: Thu, 15 Aug 2013 17:30:44 +0200
From: Daniel Mack <zonque@gmail.com>
MIME-Version: 1.0
To: Robert Jarzmik <robert.jarzmik@free.fr>
Subject: Re: [PATCH 00/20] ARM: pxa: move core and drivers to dmaengine
References: <1375889649-14638-1-git-send-email-zonque@gmail.com>
 <87zjsqzdg8.fsf@free.fr> <52061C53.4050905@gmail.com>
 <20130814100010.GO32147@intel.com> <8761v7nfmh.fsf@free.fr>
In-Reply-To: <8761v7nfmh.fsf@free.fr>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: mark.rutland@arm.com, s.neumann@raumfeld.com, linux-mtd@lists.infradead.org,
 haojian.zhuang@linaro.org, cxie4@marvell.com, lars@metafoo.de, nico@linaro.org,
 Vinod Koul <vinod.koul@intel.com>, marek.vasut@gmail.com,
 ezequiel.garcia@free-electrons.com, rmk+kernel@arm.linux.org.uk,
 devicetree@vger.kernel.org, samuel@sortiz.org, arnd@arndb.de,
 broonie@kernel.org, linux-arm-kernel@lists.infradead.org,
 thomas.petazzoni@free-electrons.com, eric.y.miao@gmail.com,
 mika.westerberg@linux.jf.intel.com, gregkh@linuxfoundation.org,
 davem@davemloft.net, sachin.kamat@linaro.org, kernel@pengutronix.de,
 djbw@fb.com, g.liakhovetski@gmx.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 15.08.2013 17:22, Robert Jarzmik wrote:
> Vinod Koul <vinod.koul@intel.com> writes:

>> If you submit C, and invoke dma_async_issue_pending(), C is queued
>> On B completetion, the DMA driver will start C and invoke callback for B.
>>
>> If B completes before C is submitted, after submit and invoking
>> dma_async_issue_pending(), the C buffer will be queued and started.
> OK, that settles it then. The API allows hot chaining, and if I understand
> Daniel's driver properly, he already thought about it (in
> append_pending_queue()).

Just for the records: it's not my driver :) I just added some functions
recently to make it work in DT and audio environments.

> I have some homework now Daniel, I'll send you my work to include into your
> patch serie for the review, and my tests of your patches.
> 
> I need a bit of time (1 or 2 weeks), because of holidays, for my patch.

Great, thanks a lot. I extracted some of the patches of my set to
individual trees so they can be merged for 3.12. I'll rebase my series
once 3.12-rc1 is released.


Many thanks for your help,
Daniel
