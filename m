Message-ID: <52035A81.6090903@metafoo.de>
Date: Thu, 08 Aug 2013 10:44:49 +0200
From: Lars-Peter Clausen <lars@metafoo.de>
MIME-Version: 1.0
To: Daniel Mack <zonque@gmail.com>
Subject: Re: [PATCH 17/20] ASoC: pxa: pxa-pcm-lib: switch over to
 snd-soc-dmaengine-pcm
References: <1375889649-14638-1-git-send-email-zonque@gmail.com>
 <1375889649-14638-18-git-send-email-zonque@gmail.com>
 <20130807160743.GI6427@sirena.org.uk> <5202718F.2050507@gmail.com>
 <20130807163258.GL6427@sirena.org.uk> <52035463.1030909@gmail.com>
In-Reply-To: <52035463.1030909@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: mark.rutland@arm.com, s.neumann@raumfeld.com, linux-mtd@lists.infradead.org,
 haojian.zhuang@linaro.org, cxie4@marvell.com, nico@linaro.org,
 vinod.koul@intel.com, marek.vasut@gmail.com,
 ezequiel.garcia@free-electrons.com, rmk+kernel@arm.linux.org.uk,
 devicetree@vger.kernel.org, samuel@sortiz.org, arnd@arndb.de,
 Mark Brown <broonie@kernel.org>, mika.westerberg@linux.intel.com,
 linux-arm-kernel@lists.infradead.org, thomas.petazzoni@free-electrons.com,
 eric.y.miao@gmail.com, gregkh@linuxfoundation.org, g.liakhovetski@gmx.de,
 sachin.kamat@linaro.org, kernel@pengutronix.de, djbw@fb.com,
 davem@davemloft.net
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 08/08/2013 10:18 AM, Daniel Mack wrote:
> On 07.08.2013 18:32, Mark Brown wrote:
>> On Wed, Aug 07, 2013 at 06:10:55PM +0200, Daniel Mack wrote:
>>> On 07.08.2013 18:07, Mark Brown wrote:
>>
>>>> Has this been tested with the standalone non-ASoC PXA AC'97 driver?
>>
>>> Nope. I have no such device.
>>
>> I guess the main test there will be making sure that it builds with ASoC
>> disabled.  I'm not sure anything later than PXA3xx ever actually used
>> AC'97.
>>
>
> Ah, I see it now.
>
> I guess we have two options: either duplicate code from
> soc-dmaengine-pcm, or move soc-dmaengine-pcm out of the ASoC context. I
> actually see no dependecy to ASoC from there anyway.

There is intentionally no dependency on ASoC for the soc-dmaengine-pcm code, 
though since I wasn't sure whether there was ever going to be a userside 
outside of ASoC the coded ended up in ASoC folder. It shouldn't be a problem to 
make it available to all of ALSA.

Not that the soc-generic-dmaengine-pcm code has a dependency on ASoC though.

- Lars
