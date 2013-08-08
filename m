Message-ID: <5203683C.2000904@gmail.com>
Date: Thu, 08 Aug 2013 11:43:24 +0200
From: Daniel Mack <zonque@gmail.com>
MIME-Version: 1.0
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 17/20] ASoC: pxa: pxa-pcm-lib: switch over to
 snd-soc-dmaengine-pcm
References: <1375889649-14638-1-git-send-email-zonque@gmail.com>
 <1375889649-14638-18-git-send-email-zonque@gmail.com>
 <20130807160743.GI6427@sirena.org.uk> <5202718F.2050507@gmail.com>
 <20130807163258.GL6427@sirena.org.uk> <52035463.1030909@gmail.com>
 <52035A81.6090903@metafoo.de> <52035EF0.1030208@gmail.com>
 <20130808093628.GS6427@sirena.org.uk>
In-Reply-To: <20130808093628.GS6427@sirena.org.uk>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
Cc: mark.rutland@arm.com, s.neumann@raumfeld.com, linux-mtd@lists.infradead.org,
 haojian.zhuang@linaro.org, cxie4@marvell.com,
 Lars-Peter Clausen <lars@metafoo.de>, nico@linaro.org, vinod.koul@intel.com,
 marek.vasut@gmail.com, ezequiel.garcia@free-electrons.com,
 rmk+kernel@arm.linux.org.uk, devicetree@vger.kernel.org, samuel@sortiz.org,
 arnd@arndb.de, mika.westerberg@linux.intel.com,
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

On 08.08.2013 11:36, Mark Brown wrote:
> On Thu, Aug 08, 2013 at 11:03:44AM +0200, Daniel Mack wrote:
>> On 08.08.2013 10:44, Lars-Peter Clausen wrote:
> 
>>> There is intentionally no dependency on ASoC for the soc-dmaengine-pcm code, 
>>> though since I wasn't sure whether there was ever going to be a userside 
>>> outside of ASoC the coded ended up in ASoC folder. It shouldn't be a problem to 
>>> make it available to all of ALSA.
> 
>> Ok, great. I queued a patch for that. Will be part of my next spin, or,
>> in case the series doesn't make it in time, I'll re-post all the patches
>> that can be applied independently up front.
> 
> You probably don't need to move it, just adding a select (which should
> ignore Kconfig dependencies) from the non-ASoC PXA stuff ought to do the
> trick.

Hmm. We have this big "if SND_SOC" in sound/soc/Kconfig which prevent
that symbol to be selected. In fact, SND_PXA2XX_LIB already selected
SND_SOC_DMAENGINE_PCM, but that didn't help.

And code that is not ASoC specific should live outside of sound/soc, no?


Daniel
