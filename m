Message-ID: <4FCBBFD4.9090401@antcom.de>
Date: Sun, 03 Jun 2012 21:49:40 +0200
From: Roland Stigge <stigge@antcom.de>
MIME-Version: 1.0
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH v4] MTD: LPC32xx SLC NAND driver
References: <1338748689-29645-1-git-send-email-stigge@antcom.de>
 <20120603190932.GB23368@n2100.arm.linux.org.uk>
In-Reply-To: <20120603190932.GB23368@n2100.arm.linux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: srinivas.bakki@nxp.com, lars@metafoo.de, linux-doc@vger.kernel.org,
 leiwen@marvell.com, devicetree-discuss@lists.ozlabs.org, dedekind1@gmail.com,
 linux-kernel@vger.kernel.org, kevin.wells@nxp.com, b32955@freescale.com,
 linux-mtd@lists.infradead.org, hechtb@googlemail.com, dwmw2@infradead.org,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi!

Thanks for the suggestions!

On 03/06/12 21:09, Russell King - ARM Linux wrote:
>> +	dma_async_issue_pending(host->dma_chan);
>> +
>> +	wait_for_completion_timeout(&host->comp, msecs_to_jiffies(1000));
> 
> What about unmapping the buffer upon completion?

OK - by not specifying DMA_COMPL_SKIP_*_UNMAP in flags, I was thinking
that this happens somehow magically. ;-) But maybe I was just confused.

Thanks,

Roland
