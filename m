Received: from lists.s-osg.org ([54.187.51.154])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZygTG-0006tf-UM
 for linux-mtd@lists.infradead.org; Tue, 17 Nov 2015 13:38:55 +0000
Subject: Re: spi: OF module autoloading is still broken
To: Mark Brown <broonie@kernel.org>
References: <56104E88.3040807@gmail.com> <20151112185926.GC8456@google.com>
 <20151113194031.GI8456@google.com> <20151113221228.GT12392@sirena.org.uk>
 <20151113225113.GJ8456@google.com> <20151113231410.GV12392@sirena.org.uk>
 <20151113234857.GK8456@google.com> <564A101F.9090807@osg.samsung.com>
 <20151116192434.GO8456@google.com> <564A35EB.5080008@osg.samsung.com>
 <20151117133455.GQ31303@sirena.org.uk>
Cc: Brian Norris <computersforpeace@gmail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>, linux-mtd@lists.infradead.org,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org
From: Javier Martinez Canillas <javier@osg.samsung.com>
Message-ID: <564B2DD5.2060502@osg.samsung.com>
Date: Tue, 17 Nov 2015 10:38:29 -0300
MIME-Version: 1.0
In-Reply-To: <20151117133455.GQ31303@sirena.org.uk>
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

On 11/17/2015 10:34 AM, Mark Brown wrote:
> On Mon, Nov 16, 2015 at 05:00:43PM -0300, Javier Martinez Canillas wrote:
> 
>> Now that I think about it, there is another issue and is that today spi:foo
>> defines a namespace while changing to of: will make the namespace flat so
>> a platform driver that has the same vendor and model will have the same
>> modalias.
> 
>> IOW, for board files will be platform:bar and i2c:bar while for OF will be
>> of:NfooT<NULL>Cfoo,bar in both cases. I wonder if we should reuse the type
>> for that and store the subsystem prefix there. What do you think?
> 
> I'm not sure that's a big issue - if we end up loading an extra module
> with a second bus glue it'll waste a little memory but it's not going to
> be a huge amount.  Obviously it'd be nice to fix but it doesn't seem
> super important compared to getting the modules loaded.
> 

Agreed, it has indeed lower priority. That's why I added it
to my TODO list so it can be fixed later as a follow up.

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
