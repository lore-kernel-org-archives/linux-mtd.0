Message-ID: <5203676F.6090708@gmail.com>
Date: Thu, 08 Aug 2013 11:39:59 +0200
From: Daniel Mack <zonque@gmail.com>
MIME-Version: 1.0
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 13/20] ASoC: pxa: pxa-ssp: add DT bindings
References: <1375889649-14638-1-git-send-email-zonque@gmail.com>
 <1375889649-14638-14-git-send-email-zonque@gmail.com>
 <20130807164039.GM6427@sirena.org.uk>
In-Reply-To: <20130807164039.GM6427@sirena.org.uk>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
Cc: mark.rutland@arm.com, s.neumann@raumfeld.com, linux-mtd@lists.infradead.org,
 haojian.zhuang@linaro.org, cxie4@marvell.com, lars@metafoo.de, nico@linaro.org,
 vinod.koul@intel.com, marek.vasut@gmail.com,
 ezequiel.garcia@free-electrons.com, rmk+kernel@arm.linux.org.uk,
 devicetree@vger.kernel.org, samuel@sortiz.org, arnd@arndb.de,
 mika.westerberg@linux.intel.com, linux-arm-kernel@lists.infradead.org,
 thomas.petazzoni@free-electrons.com, eric.y.miao@gmail.com,
 gregkh@linuxfoundation.org, g.liakhovetski@gmx.de, sachin.kamat@linaro.org,
 kernel@pengutronix.de, djbw@fb.com, davem@davemloft.net
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 07.08.2013 18:40, Mark Brown wrote:
> On Wed, Aug 07, 2013 at 05:34:02PM +0200, Daniel Mack wrote:
>> This patch contains a cruel hack for looking up the the DMA request
>> number. The problem here is that the implementation as it stands will
>> allocate the DMA channel from the user of the ssp port, and hence we
>> cannot allocate a real channel here.
>>
>> Signed-off-by: Daniel Mack <zonque@gmail.com>
>> ---
>>  Documentation/devicetree/bindings/sound/mrvl,pxa-ssp.txt |  7 +++++++
>>  sound/soc/pxa/pxa-ssp.c                                  | 12 ++++++++++--
>>  2 files changed, 17 insertions(+), 2 deletions(-)
> 
> So, really this should be part of a generic binding for the SSP device
> but obviously this is just a virtual device that binds to a generic bit
> of hardware that can be used for other applications like SPI.  For the
> ASoC case we could instantiate the DAI from the machine driver but that
> isn't going to work for things like SPI.  I'm not 100% sure what the
> best way to deal with that is.

Yes, I pondered over this for a while as well. I thought about having
the ssp port instantiated as real device just like we have it now, and
then just add a phandle reference in DT from the DAI to the upstream device.

Then, we should also allocate the DMA channel from the upstream device
and pass it down to the DAI. But then again, the pxa-pcm-lib needs some
rework, as it's currently in charge of obtaining and releasing the channel.

I wanted to postpone that issue until the rest of the series has settled
and limit changes to the bare minimum for now. Does that sound feasible?


Daniel
