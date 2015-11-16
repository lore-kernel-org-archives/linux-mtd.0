Received: from lists.s-osg.org ([54.187.51.154])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZyO5B-0006b5-30
 for linux-mtd@lists.infradead.org; Mon, 16 Nov 2015 18:00:49 +0000
Subject: Re: spi: OF module autoloading is still broken
To: Mark Brown <broonie@kernel.org>
References: <56104E88.3040807@gmail.com> <20151112185926.GC8456@google.com>
 <20151113194031.GI8456@google.com> <20151113221228.GT12392@sirena.org.uk>
 <20151113225113.GJ8456@google.com> <20151113231410.GV12392@sirena.org.uk>
 <20151113234857.GK8456@google.com> <20151116135342.GD31303@sirena.org.uk>
 <564A11D9.80109@osg.samsung.com> <20151116175112.GH31303@sirena.org.uk>
Cc: Brian Norris <computersforpeace@gmail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>, linux-mtd@lists.infradead.org,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org
From: Javier Martinez Canillas <javier@osg.samsung.com>
Message-ID: <564A19B7.7000802@osg.samsung.com>
Date: Mon, 16 Nov 2015 15:00:23 -0300
MIME-Version: 1.0
In-Reply-To: <20151116175112.GH31303@sirena.org.uk>
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

On 11/16/2015 02:51 PM, Mark Brown wrote:
> On Mon, Nov 16, 2015 at 02:26:49PM -0300, Javier Martinez Canillas wrote:
>> On 11/16/2015 10:53 AM, Mark Brown wrote:
> 
>>> What I don't really understand here is why we've decided to push all
>>> this stuff into the subsystems, it seems like if we're managing to do
>>> the matching based on the compatible we really ought to be able to have
>>> the core figure out the uevents for us too.  I need to go have a look at
>>> that...
> 
>> There is already a set of generic OF uevents that are reported by the core
>> but IIUC those are not used by udev. Please take a look to of_device_uevent()
>> in drivers/of/device.c and dev_uevent() that calls it in drivers/base/core.c.
> 
> I know what the current situation is, my point is that I don't
> understand why we would choose to do that ("What I don't really
> understand here...").
> 

Got it, sorry for misunderstanding you. I also don't know the answer FWIW.

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
