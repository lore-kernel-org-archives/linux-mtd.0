Received: from lists.s-osg.org ([54.187.51.154])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZyO2f-0004kJ-Eq
 for linux-mtd@lists.infradead.org; Mon, 16 Nov 2015 17:58:14 +0000
Subject: Re: spi: OF module autoloading is still broken
To: Mark Brown <broonie@kernel.org>
References: <56104E88.3040807@gmail.com> <20151112185926.GC8456@google.com>
 <20151113194031.GI8456@google.com> <20151113221228.GT12392@sirena.org.uk>
 <20151113225113.GJ8456@google.com> <20151113231410.GV12392@sirena.org.uk>
 <20151113234857.GK8456@google.com> <564A101F.9090807@osg.samsung.com>
 <20151116174942.GG31303@sirena.org.uk>
Cc: Brian Norris <computersforpeace@gmail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>, linux-mtd@lists.infradead.org,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org
From: Javier Martinez Canillas <javier@osg.samsung.com>
Message-ID: <564A191B.3040004@osg.samsung.com>
Date: Mon, 16 Nov 2015 14:57:47 -0300
MIME-Version: 1.0
In-Reply-To: <20151116174942.GG31303@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Mark,

On 11/16/2015 02:49 PM, Mark Brown wrote:
> On Mon, Nov 16, 2015 at 02:19:27PM -0300, Javier Martinez Canillas wrote:
>> On 11/13/2015 08:48 PM, Brian Norris wrote:
> 
>>> (I believe I avoided this in the first place for mostly-aesthetic
>>> reasons; technically this allows people to put garbage in their DT, like
>>> "garbage,spi-nor". It's unclear whether "garbage" becomes part of the
>>> mythical DT ABI [1].)
> 
>> I don't believe your examples are part of the mythical DT ABI. What I
>> understand is that an ABI is whatever is documented in the DT binding
>> docs but the only document that mentions the m25p80 is:
> 
>> Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt
> 
> Not really, in practice an ABI is something that people notice breaking.
> This means that if enough people ship an undocumented ABI (or it goes
> into important enough products) it's just as good as something that's
> documented, perhaps better than something that's documented and nobody
> ever uses as an ABI.
> 

I see, fair enough. Let's see what Brian say about the spi-nor case and
I'll also post my RFC patch but as a proper patch and adding the comments
you asked me later today.

It would be unfortunate if the SPI drivers would have as a requirement to
always have an SPI device ID table even for OF-only IPs but I don't think
that is that bad either.

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
